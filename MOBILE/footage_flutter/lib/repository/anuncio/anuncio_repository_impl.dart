import 'dart:convert';
import 'package:footage_flutter/models/anuncio/anuncio_response.dart';
import 'package:footage_flutter/repository/anuncio/anuncio_repository.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';

class AnuncioRepositoryImpl extends AnuncioRepository {

  final Client _client = Client();

  @override
  Future<AnuncioResponse> fetchAnuncio() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final response = await _client.get(
      Uri.parse('${Constant.baseUrl}/anuncio/'),
        headers: {'Authorization': 'Bearer ${prefs.getString('token')}'});
    if (response.statusCode == 200) {
      return AnuncioResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Fail to load users');
    }
  }
  
}