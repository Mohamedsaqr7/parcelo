part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = Loading;
  const factory LoginState.TogglePassword(final bool isSecured) =
      _TogglePassword;
const factory LoginState.logoutLoading() = Loglo;
  const factory LoginState.logoutSuccess() = LogSuccess;
  const factory LoginState.success() = Success;
  const factory LoginState.error(String? error) = Failure;
  const factory LoginState.getUserDataLoading() = GLoading;
  const factory LoginState.getUserDataSuccess() = GSuccess;
  const factory LoginState.getUserDataError() = GFailure;
}
