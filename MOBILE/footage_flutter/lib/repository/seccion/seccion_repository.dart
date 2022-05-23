import 'package:footage_flutter/models/seccion/seccion_response.dart';

abstract class SeccionRepository {
  Future<List<SeccionResponse>> fetchSecciones();
}