import 'dart:convert';
import 'package:authentication_bloc_mvvm/common/resources/urls.dart';
import 'package:http/http.dart' as http;

import '../models/api_response_model/api_response_model.dart';

abstract class AutDataService {
  Future<LoginResponseModel> login(String email, String password);
}


class AuthService implements AutDataService {
  final http.Client client;

  AuthService({
    http.Client? client,
  }) : client = client ?? http.Client();

  @override
  Future<LoginResponseModel> login(String email, String password) async {
    String baseUrl = '${Urls.baseUrl}${Urls.login}';
    final response = await client.post(
      Uri.parse(baseUrl),
      headers: {'default_language': 'en','Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return LoginResponseModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to login');
    }
  }
}
