part of 'authentication_bloc.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState({
    required String message,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required FocusNode emailFocusNode,
    required FocusNode passwordFocusNode,
    required bool isPasswordInvalid,
    required bool isPasswordVisible,
    required bool isFailure,
    required bool isLoading,
    required bool isEmailInvalid,
  }) = _AuthenticationState;

  factory AuthenticationState.initial() => AuthenticationState(
    message: AppStrings.global_empty_string,
    emailController: TextEditingController(),
    emailFocusNode: FocusNode(),
    passwordController: TextEditingController(),
    passwordFocusNode: FocusNode(),
    isPasswordInvalid: false,
    isPasswordVisible: false,
    isFailure: false,
    isLoading: false,
    isEmailInvalid: false,
  );
}