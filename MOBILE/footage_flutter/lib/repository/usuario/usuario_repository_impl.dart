import 'dart:convert';

import 'package:footage_flutter/models/usuario/usuario_response.dart';
import 'package:footage_flutter/repository/usuario/usuario_repository.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class UsuarioRepositoryImpl extends UsuarioRepository {

  final Client _client = Client();

  @override
  Future<UsuarioResponse> fetchUsuario() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final response = await _client.get(Uri.parse('${Constant.baseUrl}/me'),
        headers: {'Authorization': 'Bearer ${prefs.getString('token')}'});
    if (response.statusCode == 200) {
      return UsuarioResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Fail to load users');
    }
  }

}