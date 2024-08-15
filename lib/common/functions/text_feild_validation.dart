import 'package:authentication_bloc_mvvm/common/functions/validation.dart';

import '../resources/app_strings.dart';

String? validateEmail(String value) {
  if (value.isEmpty) {
    return AppStrings.textfield_addEmail_emptyField_error;
  } else if (!isEmailValid(value)) {
    return AppStrings.textfield_addEmail_invalid_error;
  } else {
    return null;
  }
}

String? validatePassword(String value) {
  if (value.isEmpty) {
    return AppStrings.textfield_addPassword_emptyField_error;
  } else if (!isPasswordValid(value)) {
    return AppStrings.textfield_addPassword_more_than_3_error;
  } else {
    return null;
  }
}


String validateCredentials(String email, String password) {
  const String predefinedEmail = 'vitec@vitec.com';
  const String predefinedPassword = 'Vitec321Go';

  // Credential check
  if (email != predefinedEmail) {
    return AppStrings.textfield_onPress_error;
  }

  if (password != predefinedPassword) {
    return AppStrings.textfield_onPress_error;
  }

  return AppStrings.login_success_message;
}