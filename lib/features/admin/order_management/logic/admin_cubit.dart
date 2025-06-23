import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Parcelo/core/constants/app_constants.dart';
import 'package:Parcelo/features/customer/post/data/post_order_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'admin_state.dart';
part 'admin_cubit.freezed.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit() : super(AdminState.initial());
  static AdminCubit get(context) => BlocProvider.of<AdminCubit>(context);

  SupabaseClient client = Supabase.instance.client;
  int currentStepIndex = -1;

  Future<void> updateOrderState(int stateIndex, String orderId) async {
    try {
      await client
          .from(AppConstants.addOrder)
          .update({'current_state': stateIndex}).eq('order_id', orderId);
      emit(AdminState.updateSuccess());
      fetchAllOrders(); // إعادة تحميل الطلبات بعد التحديث
      print('✅ Order state updated to $stateIndex');
    } catch (e) {
      print('❌ Failed to update state: $e');
      emit(AdminState.updatEerror(e.toString()));
    }
  }

  getCurrentorderIndex() {
    final orderId = client.from(AppConstants.addOrder).select('order_id');
  }

  Future<void> fetchAllOrders() async {
    try {
      emit(AdminState.loading());
      print('loading');
      print("🚀 Trying to fetch data");
      print("User is: ${client.auth.currentUser?.id}");
      final response = await client
          .from(AppConstants.addOrder)
          .select()
          .order("created_at", ascending: false);
      print("${'respone : ${response}'}");
      final orders = (response as List<dynamic>)
          .map((json) => PostModel.fromJson(json as Map<String, dynamic>))
          .toList();

      emit(AdminState.success(orders: orders)); // حالة جديدة لعرض كل الأوردرات
      print('success');
    } catch (e, stack) {
      if (e.toString().contains("JWT expired")) {
        final res = await Supabase.instance.client.auth.refreshSession();
        final session = res.session;
        // أعد المحاولة بعد تجديد الجلسة
        // fetchAllOrders(); // استدعاء الدالة من جديد
      }
      print("🔥 ERROR:");
      print(e);
      print("🔥 STACK:");

      print('object');
      emit(AdminState.error(e.toString()));
    }
  }
}
