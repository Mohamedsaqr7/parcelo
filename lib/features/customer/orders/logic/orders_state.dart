part of 'orders_cubit.dart';

@freezed
abstract class OrdersState with _$OrdersState {
  const factory OrdersState.initial() = _Initial;
  const factory OrdersState.currentloading() = Loading;
  const factory OrdersState.currentSuccess({
    required List<PostModel> currentOrders,
    required List<PostModel> pastOrders,
  }) = Success;
  const factory OrdersState.currentError(String error) = Error;
  const factory OrdersState.currentChange() = Current;
  const factory OrdersState.pastChange() = past;

}
