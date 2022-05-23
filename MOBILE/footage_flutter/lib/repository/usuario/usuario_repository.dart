import 'package:footage_flutter/models/usuario/usuario_response.dart';

abstract class UsuarioRepository {
  Future<UsuarioResponse> fetchUsuario ();
}