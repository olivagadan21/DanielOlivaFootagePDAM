import 'dart:convert';
import 'package:footage_flutter/models/seccion/seccion_response.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
import 'seccion_repository.dart';

class SeccionRepositoryImpl extends SeccionRepository {

  final Client _client = Client();

  @override
  Future<List<SeccionResponse>> fetchSecciones() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await _client.get(
        Uri.parse('${Constant.baseUrl}/seccion/'),
        headers: {'Authorization': 'Bearer ${prefs.getString('token')}'});
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((i) => SeccionResponse.fromJson(i))
          .toList();
    } else {
      throw Exception('Fail to load posts');
    }
  }

}