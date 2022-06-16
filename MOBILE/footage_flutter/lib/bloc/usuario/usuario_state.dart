part of 'usuario_bloc.dart';

abstract class UsuarioState extends Equatable {
  const UsuarioState();
  
  @override
  List<Object> get props => [];
}

class UsuarioInitial extends UsuarioState {}

class UsuarioFetched extends UsuarioState {
  final ProfileResponse profileResponse;

  const UsuarioFetched(this.profileResponse);

  @override
  List<Object> get props => [profileResponse];
}

class UsuarioFetchError extends UsuarioState {
  final String message;
  const UsuarioFetchError(this.message);

  @override
  List<Object> get props => [message];
}