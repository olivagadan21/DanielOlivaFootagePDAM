import 'dart:convert';
import 'package:footage_flutter/models/categoria/categoria_response.dart';
import 'package:footage_flutter/repository/categoria/categoria_repository.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class CategoriaRepositoryImpl extends CategoriaRepository {

  final Client _client = Client();

  @override
  Future<List<CategoriaResponse>> fetchCategorias() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await _client.get(
        Uri.parse('${Constant.baseUrl}categoria/'),
        headers: {'Authorization': 'Bearer ${prefs.getString('token')}'});
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((i) => CategoriaResponse.fromJson(i))
          .toList();
    } else {
      throw Exception('Fail to load posts');
    }
  }

}