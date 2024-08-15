part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object?> get props => [];
}

class TriggerPasswordVisibility extends AuthenticationEvent {
  final bool isPassword;
  final bool isPasswordVisible;

  const TriggerPasswordVisibility(
      {required this.isPassword, required this.isPasswordVisible});

  @override
  List<Object?> get props => [isPassword, isPasswordVisible];
}

class TriggerTextFieldValidation extends AuthenticationEvent {
  final String inputText;
  final bool isPassword;

  const TriggerTextFieldValidation(
      {required this.inputText, required this.isPassword});

  @override
  List<Object?> get props => [inputText, isPassword];
}


class TriggerOnPressedButton extends AuthenticationEvent {
  final SignInModel signInModel;

  const TriggerOnPressedButton({required this.signInModel});

  @override
  List<Object?> get props => [signInModel];
}
