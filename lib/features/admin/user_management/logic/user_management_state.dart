part of 'user_management_cubit.dart';

@freezed
class UserManagementState with _$UserManagementState {
  const factory UserManagementState.initial() = _Initial;
  const factory UserManagementState.loading() = loading;
  const factory UserManagementState.success({required List<UserModel> users}) = success;
  const factory UserManagementState.error(String error) = Error;
}
