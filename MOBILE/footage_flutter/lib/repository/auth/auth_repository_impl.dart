import 'dart:convert';

import 'package:footage_flutter/models/auth/login_dto.dart';
import 'package:footage_flutter/models/auth/login_response.dart';
import 'package:footage_flutter/models/auth/register_dto.dart';
import 'package:footage_flutter/models/auth/register_response.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_repository.dart';
import 'package:http/http.dart' as http;

class AuthRepositoryImpl extends AuthRepository {
  final Client _client = Client();

  @override
  Future<LoginResponse> login(LoginDto loginDto) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final response = await _client.post(
        Uri.parse('http://10.0.2.2:8080/auth/login'),
        headers: headers,
        body: jsonEncode(loginDto.toJson()));
    if (response.statusCode == 201) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception(prefs.getString('username').toString());
    }
  }

  @override
  Future<RegisterResponse> registerUser(RegisterDto registerDto) async {
    var uri = Uri.parse('http://10.0.2.2:8080/auth/register/user');
    var request = http.MultipartRequest('POST', uri);
    request.fields['nombre'] = registerDto.nombre.toString();
    request.fields['apellidos'] = registerDto.apellidos.toString();
    request.fields['username'] = registerDto.username.toString();
    request.fields['email'] = registerDto.email.toString();
    request.fields['password'] = registerDto.password.toString();
    request.fields['password2'] = registerDto.password2.toString();

    var response = await request.send();
    if (response.statusCode == 201) {
      return RegisterResponse.fromJson(
          jsonDecode(await response.stream.bytesToString()));
    } else {
      print(response.statusCode);
      throw Exception('Vuelva intentarlo. Se ha equivocado en algo.');
    }
  }

}
