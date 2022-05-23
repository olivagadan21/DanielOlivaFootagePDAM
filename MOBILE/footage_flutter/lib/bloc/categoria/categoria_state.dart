part of 'categoria_bloc.dart';

abstract class CategoriaState extends Equatable {
  const CategoriaState();
  
  @override
  List<Object> get props => [];
}

class CategoriaInitial extends CategoriaState {}

class CategoriasFetched extends CategoriaState {
  final List<CategoriaResponse> Categorias;

  const CategoriasFetched(this.Categorias);

  @override
  List<Object> get props => [Categorias];
}

class CategoriaFetchError extends CategoriaState {
  final String message;
  const CategoriaFetchError(this.message);

  @override
  List<Object> get props => [message];
}