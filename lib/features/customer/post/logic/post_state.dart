part of 'post_cubit.dart';

@freezed
abstract class PostState with _$PostState {
  const factory PostState.initial() = _Initial;
  const factory PostState.loading() = Loading;
  const factory PostState.success() = Success;
  const factory PostState.error(String error) = Error;
}
