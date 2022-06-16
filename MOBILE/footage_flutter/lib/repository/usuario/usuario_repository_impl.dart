import 'dart:convert';

import 'package:footage_flutter/models/usuario/perfil_response.dart';
import 'package:footage_flutter/repository/usuario/usuario_repository.dart';
import 'package:footage_flutter/utils/preferences.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

class UsuarioRepositoryImpl extends UsuarioRepository {

  @override
  Future<ProfileResponse> fetchUsuario() async {
    final response = await http.get(Uri.parse('${Constant.baseUrl}profile/me'),
        headers: {'Authorization': 'Bearer ${PreferenceUtils.getString('token')}'});
    if (response.statusCode == 200) {
      return ProfileResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Fail to load users');
    }
  }

}