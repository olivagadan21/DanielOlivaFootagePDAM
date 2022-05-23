import 'package:footage_flutter/models/marca/marca_response.dart';

abstract class MarcaRepository {
  Future<List<MarcaResponse>> fetchMarca();
}