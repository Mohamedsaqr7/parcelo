part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
    const factory HomeState.singleOrderLoaded(PostModel order) = SingleOrderLoaded;
      const factory HomeState.loading() = Loading;
        const factory HomeState.tError(String error) = Error;



}
