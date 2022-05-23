import 'package:footage_flutter/models/categoria/categoria_response.dart';

abstract class CategoriaRepository {
  Future<List<CategoriaResponse>> fetchCategorias();
}