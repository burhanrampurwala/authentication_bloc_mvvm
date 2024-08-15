import 'package:authentication_bloc_mvvm/common/resources/app_strings.dart';
import 'package:authentication_bloc_mvvm/presentation/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/functions/text_feild_validation.dart';

void handlePasswordVisibility({
  required TriggerPasswordVisibility event,
  required Emitter<AuthenticationState> emit,
  required AuthenticationState state,
}) {
  emit(state.copyWith(message: '', isFailure: false, isLoading: false));

  if (event.isPassword) {
    _togglePasswordVisibility(
        emit: emit, state: state, isPasswordVisible: event.isPasswordVisible);
  }
}

void _togglePasswordVisibility({
  required Emitter<AuthenticationState> emit,
  required AuthenticationState state,
  required bool isPasswordVisible,
}) {
  isPasswordVisible = !isPasswordVisible;
  emit(state.copyWith(
    isPasswordVisible: isPasswordVisible,
  ));
}

void handleTextFieldValidation({
  required TriggerTextFieldValidation event,
  required Emitter<AuthenticationState> emit,
  required AuthenticationState state,
}) {
  if (event.isPassword == false) {
    _handleEmailValidation(event: event, emit: emit, state: state);
  } else if (event.isPassword == true) {
    _handlePasswordValidation(event: event, emit: emit, state: state);
  }
}

void _handleEmailValidation({
  required TriggerTextFieldValidation event,
  required Emitter<AuthenticationState> emit,
  required AuthenticationState state,
}) {
  String? validationResult =
      validateEmail(event.inputText.trim().toLowerCase());
  emit(state.copyWith(
    isEmailInvalid: validationResult != null,
  ));
}

void _handlePasswordValidation({
  required TriggerTextFieldValidation event,
  required Emitter<AuthenticationState> emit,
  required AuthenticationState state,
}) {
  String? validationResult =
      validatePassword(event.inputText.trim().toLowerCase());
  emit(state.copyWith(
    isPasswordInvalid: validationResult != null,
  ));
}

Future<void> handleSignInEvent({
  required TriggerOnPressedButton event,
  required Emitter<AuthenticationState> emit,
  required AuthenticationState state,
}) async {
  final String email = event.signInModel.email;
  final String password = event.signInModel.password;
  emit(state.copyWith(isLoading: true));
  await Future.delayed(const Duration(seconds: 5));
  String validationMessage = validateCredentials(email, password);
  if (validationMessage == AppStrings.login_success_message) {
    emit(state.copyWith(
        isLoading: false, isFailure: false, message: validationMessage));
  } else {
    emit(state.copyWith(
        isLoading: false, isFailure: true, message: validationMessage));
  }
}
