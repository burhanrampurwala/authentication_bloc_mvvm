import 'package:authentication_bloc_mvvm/common/resources/urls.dart';
import 'package:authentication_bloc_mvvm/services/http_services.dart';

import '../models/api_request_model/sign_in_model.dart';

class AuthDataService {
  static Future login({required SignInModel signInModel}) async {
    final DataService dataService = DataService(Urls.baseUrl);

    final Map<String, dynamic> data = <String, dynamic>{
      'email': signInModel.email,
      'password': signInModel.password,
    };

    var headers = {
      'default_language': 'en',
      'Content-Type': 'application/json',
    };

    final response =
        await dataService.post(Urls.login, body: data, headers: headers);
    return response;
  }
}
