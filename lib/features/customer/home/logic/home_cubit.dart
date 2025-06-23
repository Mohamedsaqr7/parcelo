import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/constants/app_constants.dart';
import '../../post/data/post_order_model.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());
  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);
  // final PostModel postModel;
  final search = TextEditingController();
  SupabaseClient client = Supabase.instance.client;

  Future<PostModel?> fetchOrderById(String orderId) async {
    emit(HomeState.loading());
    try {
      final response = await client
          .from(AppConstants.addOrder)
          .select()
          .eq('order_id', orderId)
          .single(); // عشان يرجع عنصر واحد فقط

      final order = PostModel.fromJson(response as Map<String, dynamic>);
      emit(HomeState.singleOrderLoaded(order));
      return order;
    } catch (e, stack) {
      if (e.toString().contains("JWT expired")) {
        final res = await Supabase.instance.client.auth.refreshSession();
        final session = res.session;
        emit(HomeState.tError(e.toString()));
      }
      print('Error fetching order by ID: $e');
      print(stack);
      emit(HomeState.tError(e.toString()));
      return null;
    }
  }
}
