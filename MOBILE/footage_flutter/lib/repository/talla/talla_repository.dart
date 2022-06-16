import 'package:footage_flutter/models/talla/talla_response.dart';

abstract class TallaRepository {
  Future<List<TallaResponse>> fetchTallas ();
}