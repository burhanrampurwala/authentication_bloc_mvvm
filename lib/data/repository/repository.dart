import 'package:authentication_bloc_mvvm/data/data_service/data_service.dart';

import '../models/api_response_model/api_response_model.dart';


class AuthRepository {
  final AutDataService _authService;

  AuthRepository(this._authService);

  Future<LoginResponseModel> login(String email, String password) {
    return _authService.login(email, password);
  }
}
