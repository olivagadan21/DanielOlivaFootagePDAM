part of 'productos_bloc.dart';

abstract class ProductosState extends Equatable {
  const ProductosState();
  
  @override
  List<Object> get props => [];
}

class ProductosInitial extends ProductosState {}

class ProductosFetched extends ProductosState {
  final List<ProductoResponse> productos;

  const ProductosFetched(this.productos);

  @override
  List<Object> get props => [productos];
}

class ProductoFetchError extends ProductosState {
  final String message;
  const ProductoFetchError(this.message);

  @override
  List<Object> get props => [message];
}