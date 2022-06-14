import 'package:footage_flutter/models/usuario/perfil_response.dart';
import 'package:footage_flutter/models/usuario/usuario_response.dart';

abstract class UsuarioRepository {
  Future<ProfileResponse> fetchUsuario ();
}