part of 'buscar_bloc.dart';

abstract class BuscarState extends Equatable {
  const BuscarState();
  
  @override
  List<Object> get props => [];
}

class BuscarInitial extends BuscarState {}

class BuscarFetched extends BuscarState {
  final List<CategoriaResponse> categorias;
  final List<SeccionResponse> secciones;
  final List<MarcaResponse> marcas;

  const BuscarFetched(this.categorias, this.secciones, this.marcas);

  @override
  List<Object> get props => [categorias, secciones, marcas];
}

class BuscarFetchError extends BuscarState {
  final String message;
  const BuscarFetchError(this.message);

  @override
  List<Object> get props => [message];
}