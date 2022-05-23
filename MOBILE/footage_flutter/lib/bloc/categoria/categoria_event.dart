part of 'categoria_bloc.dart';

abstract class CategoriaEvent extends Equatable {
  const CategoriaEvent();

  @override
  List<Object> get props => [];
}

class FetchCategoria extends CategoriaEvent {

  const FetchCategoria();

  @override
  List<Object> get props => [];
}