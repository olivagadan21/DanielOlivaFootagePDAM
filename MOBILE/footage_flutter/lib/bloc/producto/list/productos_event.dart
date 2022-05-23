part of 'productos_bloc.dart';

abstract class ProductosEvent extends Equatable {
  const ProductosEvent();

  @override
  List<Object> get props => [];
}

class FetchProducto extends ProductosEvent {

  const FetchProducto();

  @override
  List<Object> get props => [];
}