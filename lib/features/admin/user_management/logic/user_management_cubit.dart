import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Parcelo/core/constants/app_constants.dart';
import 'package:Parcelo/features/admin/order_management/logic/admin_cubit.dart';
import 'package:Parcelo/features/customer/post/data/post_order_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../auth/login/data/user_model.dart';

part 'user_management_state.dart';
part 'user_management_cubit.freezed.dart';

class UserManagementCubit extends Cubit<UserManagementState> {
  UserManagementCubit() : super(UserManagementState.initial());
  SupabaseClient client = Supabase.instance.client;
  static UserManagementCubit get(context) =>
      BlocProvider.of<UserManagementCubit>(context);

  Future<void> fetchAllUsers() async {
    try {
      emit(UserManagementState.loading());
      final currentUserId = client.auth.currentUser?.id;

      final response = await client
          .from(AppConstants.users)
          .select()
          .neq('user_id', currentUserId ?? '')
          .order("created_at", ascending: false);
      print("${'respone : ${response}'}");
      final users = (response as List<dynamic>)
          .map((json) => UserModel.fromJson(json as Map<String, dynamic>))
          .toList();
      print("userLength: ");
      emit(UserManagementState.success(
          users: users)); // حالة جديدة لعرض كل الأوردرات
      print('success');
    } catch (e) {
      if (e.toString().contains("JWT expired")) {
        final res = await Supabase.instance.client.auth.refreshSession();
        final session = res.session;
        // أعد المحاولة بعد تجديد الجلسة
        fetchAllUsers(); // استدعاء الدالة من جديد
      }
      print(e);
      emit(UserManagementState.error(e.toString()));
    }
  }

  Future<void> deleteUser(String userId) async {
    try {
      await client.from(AppConstants.users).delete().eq('user_id', userId);

      // ✅ حذف كل الجلسات الخاصة بالمستخدم (لو عامل sign in)
      await client.rpc('delete_user_sessions',
          params: {'uid': userId}); // تحتاج Function من Supabase

      fetchAllUsers(); // إعادة تحميل قائمة المستخدمين
    } catch (e) {
      print("❌ Error while deleting user: $e");
    }
  }
}
