import 'package:footage_flutter/models/anuncio/anuncio_response.dart';

abstract class AnuncioRepository {
  Future<AnuncioResponse> fetchAnuncioAleatory();
}