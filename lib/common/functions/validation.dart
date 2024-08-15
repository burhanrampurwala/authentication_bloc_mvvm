

import '../resources/validation_regex.dart';

bool isEmailValid(String email) {
  return emailRegex.hasMatch(email);
}

bool isPasswordValid(String password) {
  return passwordRegex.hasMatch(password);
}
