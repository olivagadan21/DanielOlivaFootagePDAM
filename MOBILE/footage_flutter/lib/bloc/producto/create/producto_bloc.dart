import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:footage_flutter/models/producto/producto_dto.dart';
import 'package:footage_flutter/models/producto/producto_response.dart';
import 'package:footage_flutter/repository/producto/producto_repository.dart';
part 'producto_event.dart';
part 'producto_state.dart';

class ProductoBloc extends Bloc<ProductoEvent, ProductoState> {

  final ProductoRepository public;

  ProductoBloc(this.public) : super(ProductoInitial()) {
    on<CreateProducto>(_createProductoEvent);
  }

  void _createProductoEvent(CreateProducto event, Emitter<ProductoState> emit) async {
    try {
      final productoResponse =
          await public.createProducto(event.productoDto, event.imagePath);
      emit(ProductoSuccessState(productoResponse));
      return;
    } on Exception catch (e) {
      emit(ProductoCreateError(e.toString()));
    }
  }

}
