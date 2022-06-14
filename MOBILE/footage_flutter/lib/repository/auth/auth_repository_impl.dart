import 'dart:convert';

import 'package:footage_flutter/models/auth/login_dto.dart';
import 'package:footage_flutter/models/auth/login_response.dart';
import 'package:footage_flutter/models/auth/register_dto.dart';
import 'package:footage_flutter/models/auth/register_response.dart';
import 'package:footage_flutter/repository/constants.dart';
import 'package:http/http.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final Client _client = Client();

  @override
  Future<LoginResponse> login(LoginDto loginDto) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final response = await _client.post(
        Uri.parse('${Constant.baseUrl}auth/login'),
        headers: headers,
        body: jsonEncode(loginDto.toJson()));
    if (response.statusCode == 201) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Fail to login');
    }
  }

  @override
  Future<RegisterResponse> registerUser(RegisterDto registerDto) async {
    
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final response = await _client.post(
        Uri.parse('${Constant.baseUrl}register/user'),
        headers: headers,
        body: jsonEncode(registerDto.toJson()));
    if (response.statusCode == 201) {
      return RegisterResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Fail to login');
    }
  }

}
