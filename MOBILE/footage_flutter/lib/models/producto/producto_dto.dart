class ProductoDto {
  ProductoDto({
    required this.titulo,
    required this.descripcion,
    required this.precio,
    required this.intercambio,
    required this.original,
    required this.usuario,
    required this.seccion,
    required this.categoria,
    required this.marca,
    required this.talla,
  });
  late final String titulo;
  late final String descripcion;
  late final int precio;
  late final bool intercambio;
  late final bool original;
  late final int usuario;
  late final int seccion;
  late final int categoria;
  late final int marca;
  late final int talla;
  
  ProductoDto.fromJson(Map<String, dynamic> json){
    titulo = json['titulo'];
    descripcion = json['descripcion'];
    precio = json['precio'];
    intercambio = json['intercambio'];
    original = json['original'];
    usuario = json['usuario'];
    seccion = json['seccion'];
    categoria = json['categoria'];
    marca = json['marca'];
    talla = json['talla'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['titulo'] = titulo;
    _data['descripcion'] = descripcion;
    _data['precio'] = precio;
    _data['intercambio'] = intercambio;
    _data['original'] = original;
    _data['usuario'] = usuario;
    _data['seccion'] = seccion;
    _data['categoria'] = categoria;
    _data['marca'] = marca;
    _data['talla'] = talla;
    return _data;
  }
}