import 'package:footage_flutter/models/producto/producto_dto.dart';
import 'package:footage_flutter/models/producto/producto_response.dart';

abstract class ProductoRepository {
  Future<List<ProductoResponse>> fetchProductos();
  Future<ProductoResponse> createProducto(ProductoDto productoDto, String image1, String image2);
}