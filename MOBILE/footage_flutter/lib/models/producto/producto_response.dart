class ProductoResponse {
  ProductoResponse({
    required this.id,
    required this.titulo,
    required this.descripcion,
    required this.precio,
    required this.intercambio,
    required this.original,
    required this.foto1,
    required this.foto2,
    required this.usuario,
    required this.seccion,
    required this.categoria,
    required this.marca,
  });
  late final int id;
  late final String titulo;
  late final String descripcion;
  late final String precio;
  late final bool intercambio;
  late final bool original;
  late final String foto1;
  late final String foto2;
  late final String usuario;
  late final String seccion;
  late final String categoria;
  late final String marca;
}