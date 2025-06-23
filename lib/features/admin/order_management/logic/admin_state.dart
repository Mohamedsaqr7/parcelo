part of 'admin_cubit.dart';

@freezed
abstract class AdminState with _$AdminState {
  const factory AdminState.initial() = _Initial;
  const factory AdminState.loading() = Loading;
  const factory AdminState.change() = changeStepIndex;
  const factory AdminState.success({required List<PostModel> orders}) = Success;
  const factory AdminState.error(String error) = Error;
  const factory AdminState.updateSuccess() = USuccess;
  const factory AdminState.updatEerror(String error) = UError;
}
