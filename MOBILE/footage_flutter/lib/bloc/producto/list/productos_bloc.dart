import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:footage_flutter/models/producto/producto_dto.dart';
import 'package:footage_flutter/models/producto/producto_response.dart';
import 'package:footage_flutter/repository/producto/producto_repository.dart';

part 'productos_event.dart';
part 'productos_state.dart';

class ProductosBloc extends Bloc<ProductosEvent, ProductosState> {

  final ProductoRepository public;

  ProductosBloc(this.public) : super(ProductosInitial()) {
    on<FetchProducto>(_productosFetched);
  }

  void _productosFetched(FetchProducto event, Emitter<ProductosState> emit) async {
    try {
      final posts = await public.fetchProductos();
      emit(ProductosFetched(posts));
    } on Exception catch (e) {
      emit(ProductoFetchError(e.toString()));
    }
  }

}
