import 'dart:convert';
import 'package:footage_flutter/models/producto/producto_response.dart';
import 'package:footage_flutter/models/producto/producto_dto.dart';
import 'package:footage_flutter/repository/producto/producto_repository.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class ProductoRepositoryImpl extends ProductoRepository {

  final Client _client = Client();

  @override
  Future<ProductoResponse> createProducto(ProductoDto productoDto, String image) async {
    
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, String> auth = {
      'Authorization': 'Bearer ${prefs.getString('token')}',
    };
    var uri = Uri.parse('${Constant.baseUrl}/producto/');
    var request = http.MultipartRequest('POST', uri);
    request.fields['titulo'] = productoDto.titulo.toString();
    request.fields['descripcion'] = productoDto.descripcion.toString();
    request.fields['precio'] = productoDto.precio.toString();
    request.fields['intercambio'] = productoDto.intercambio.toString();
    request.fields['original'] = productoDto.original.toString();
    request.fields['usuario'] = productoDto.usuario.toString();
    request.fields['seccion'] = productoDto.seccion.toString();
    request.fields['categoria'] = productoDto.categoria.toString();
    request.fields['marca'] = productoDto.marca.toString();
    request.fields['talla'] = productoDto.talla.toString();
    request.files.add(await http.MultipartFile.fromPath(
        'file', prefs.getString('file').toString()));
    request.headers.addAll(auth);
    var response = await request.send();
    if (response.statusCode == 201) print('Uploaded!');

    if (response.statusCode == 201) {
      return ProductoResponse.fromJson(
          jsonDecode(await response.stream.bytesToString()));
    } else {
      print(response.statusCode);
      throw Exception('Ojo cuidao que te has equivocado');
    }
  }

  @override
  Future<List<ProductoResponse>> fetchProductos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await _client.get(
        Uri.parse('${Constant.baseUrl}/producto/'),
        headers: {
          'Authorization': 'Bearer ${prefs.getString('token')}',
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        });
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((i) => ProductoResponse.fromJson(i))
          .toList();
    } else {
      throw Exception('Fail to load posts');
    }
  }

}