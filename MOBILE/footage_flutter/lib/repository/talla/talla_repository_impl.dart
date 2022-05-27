import 'dart:convert';

import 'package:footage_flutter/models/talla/talla_response.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import 'talla_repository.dart';

class TallaRepositoryImpl extends TallaRepository {

  final Client _client = Client();

  @override
  Future<List<TallaResponse>> fetchTallas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await _client.get(Uri.parse('${Constant.baseUrl}/talla/'), headers: {'Authorization': 'Bearer ${prefs.getString('token')}'});
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List).map((i) => TallaResponse.fromJson(i)).toList();
    } else {
      throw Exception('Fail to load posts');
    }
  }

}