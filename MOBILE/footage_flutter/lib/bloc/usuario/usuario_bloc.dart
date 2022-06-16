import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:footage_flutter/models/usuario/perfil_response.dart';
import 'package:footage_flutter/repository/usuario/usuario_repository.dart';

part 'usuario_event.dart';
part 'usuario_state.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  
  final UsuarioRepository public;

  UsuarioBloc(this.public) : super(UsuarioInitial()) {
    on<GetUsuario>(_usuarioFetched);
  }

  void _usuarioFetched(GetUsuario event, Emitter<UsuarioState> emit) async {
    try {
      final usuario = await public.fetchUsuario();
      emit(UsuarioFetched(usuario));
    } on Exception catch (e) {
      emit(UsuarioFetchError(e.toString()));
    }
  }

}
