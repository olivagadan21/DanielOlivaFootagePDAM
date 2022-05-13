import 'dart:ffi';

class ProductoDto {
  ProductoDto({
    required this.titulo,
    required this.descripcion,
  });
  late final String titulo;
  late final String descripcion;
  late final Double precio;
  late final Bool intercambio;
  late final Bool original;
  late final int usuario;

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['titulo'] = titulo;
    _data['descripcion'] = descripcion;
    return _data;
  }
}