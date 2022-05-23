part of 'producto_bloc.dart';

abstract class ProductoEvent extends Equatable {
  const ProductoEvent();

  @override
  List<Object> get props => [];
}

class CreateProducto extends ProductoEvent {
  final ProductoDto productoDto;
  final String imagePath1;
  final String imagePath2;

  const CreateProducto(this.productoDto, this.imagePath1, this.imagePath2);

  @override
  List<Object> get props => [];
}