import 'dart:convert';

import 'package:footage_flutter/models/marca/marca_response.dart';
import 'package:footage_flutter/repository/marca/marca_repository.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class MarcaRepositoryImpl extends MarcaRepository {

  final Client _client = Client();

  @override
  Future<List<MarcaResponse>> fetchMarca() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await _client.get(
        Uri.parse('${Constant.baseUrl}marca/'),
        headers: {'Authorization': 'Bearer ${prefs.getString('token')}'});
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((i) => MarcaResponse.fromJson(i))
          .toList();
    } else {
      throw Exception('Fail to load posts');
    }
  }
  
}