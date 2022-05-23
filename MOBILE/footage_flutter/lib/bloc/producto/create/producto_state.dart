part of 'producto_bloc.dart';

abstract class ProductoState extends Equatable {
  const ProductoState();
  
  @override
  List<Object> get props => [];
}

class ProductoInitial extends ProductoState {}

class ProductoLoadingState extends ProductoState {}

class ProductoSuccessState extends ProductoState {
  final ProductoResponse producto;

  const ProductoSuccessState(this.producto);

  @override
  List<Object> get props => [producto];
}

class ProductoCreateError extends ProductoState {
  final String message;

  const ProductoCreateError(this.message);

  @override
  List<Object> get props => [message];
}