part of 'producto_bloc.dart';

abstract class ProductoEvent extends Equatable {
  const ProductoEvent();

  @override
  List<Object> get props => [];
}

class CreateProducto extends ProductoEvent {
  final ProductoDto productoDto;
  final String imagePath;

  const CreateProducto(this.productoDto, this.imagePath);

  @override
  List<Object> get props => [];
}