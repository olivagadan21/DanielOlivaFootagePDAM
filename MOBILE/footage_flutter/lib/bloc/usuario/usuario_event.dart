part of 'usuario_bloc.dart';

abstract class UsuarioEvent extends Equatable {
  const UsuarioEvent();

  @override
  List<Object> get props => [];
}

class GetUsuario extends UsuarioEvent {
  const GetUsuario();

  @override
  List<Object> get props => [];
}