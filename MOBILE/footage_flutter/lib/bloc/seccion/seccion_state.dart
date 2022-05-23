part of 'seccion_bloc.dart';

abstract class SeccionState extends Equatable {
  const SeccionState();
  
  @override
  List<Object> get props => [];
}

class SeccionInitial extends SeccionState {}

class SeccionesFetched extends SeccionState {
  final List<SeccionResponse> secciones;

  const SeccionesFetched(this.secciones);

  @override
  List<Object> get props => [secciones];
}

class SeccionFetchError extends SeccionState {
  final String message;
  const SeccionFetchError(this.message);

  @override
  List<Object> get props => [message];
}