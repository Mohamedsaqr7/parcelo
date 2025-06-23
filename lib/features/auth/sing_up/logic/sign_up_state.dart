part of 'sign_up_cubit.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.initial() = Initial;
  const factory SignUpState.loading() = Loading;
  const factory SignUpState.success() = Success;
  const factory SignUpState.TogglePassword(  final bool isSecured) = _TogglePassword;
  
  const factory SignUpState.adduserloading() = addLoading;
  const factory SignUpState.addusersuccess() = addSuccess;
  const factory SignUpState.addusererror(String error) = addError;
  const factory SignUpState.error(String?error) = failure;
}
