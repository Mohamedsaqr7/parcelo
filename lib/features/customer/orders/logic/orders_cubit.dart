import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Parcelo/core/constants/app_constants.dart';
import 'package:Parcelo/core/extensions/context_extension.dart';
import 'package:Parcelo/core/languages/lang_keys.dart';
import 'package:Parcelo/features/customer/post/data/post_order_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'orders_state.dart';
part 'orders_cubit.freezed.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersState.initial());
  static OrdersCubit get(context) => BlocProvider.of<OrdersCubit>(context);

  final userId = Supabase.instance.client.auth.currentUser!.id;
  SupabaseClient client = Supabase.instance.client;
  bool current = true, past = false;
  int currentState = 0;
  String getOrderStatus(int? index, BuildContext context) {
    switch (index) {
      case 0:
        return context.translate(LangKeys.state1);
      case 1:
        return context.translate(LangKeys.state2);
      case 2:
        return context.translate(LangKeys.state3);
      case 3:
        return context.translate(LangKeys.state4);
      case 4:
        return context.translate(LangKeys.state5);
      default:
        return context.translate(LangKeys.state0);
    }
  }

  void changeCurrentState() {
    current = !current;
    emit(OrdersState.currentChange());
    fetchUserOrders();
  }

  void changePastState() {
    past = !past;
    emit(OrdersState.pastChange());
    fetchUserOrders();
  }

  Future<void> fetchUserOrders() async {
    emit(OrdersState.currentloading());
    try {
      final response = await client
          .from(AppConstants.addOrder)
          .select()
          .eq('user_Id', userId)
          .order("created_at", ascending: false);

      final orders = (response as List<dynamic>)
          .map((json) => PostModel.fromJson(json as Map<String, dynamic>))
          .toList();

      final List<PostModel> current = orders.isNotEmpty ? [orders.first] : [];
      final List<PostModel> past = orders.length > 1 ? orders.sublist(1) : [];
      emit(
          OrdersState.currentSuccess(currentOrders: current, pastOrders: past));
      print('success2');
    } catch (e, stack) {
      if (e.toString().contains("JWT expired")) {
        final res = await Supabase.instance.client.auth.refreshSession();
        final session = res.session;
      }
      print(stack);
      emit(OrdersState.currentError(e.toString()));
    }
  }
}
