import 'dart:convert';

import 'package:authentication_bloc_mvvm/data/data_service/data_service.dart';
import 'package:authentication_bloc_mvvm/data/models/api_request_model/sign_in_model.dart';
import 'package:authentication_bloc_mvvm/data/models/api_response_model/api_response_model.dart';

class AuthRepository {
  static Future<LoginResponseModel?> login({
    required SignInModel signInModel,
  }) async {
    try {
      final response = await AuthDataService.login(
        signInModel: signInModel,
      );
      final responseJson = jsonDecode(response.body) as Map<String, dynamic>;
      final loginResponseModel = LoginResponseModel.fromJson(responseJson);

      if (response.statusCode == 200) {
        return loginResponseModel;
      }
    } catch (error) {
      print("error called- $error)}");
      return null;
    }
    return null;
  }
}
