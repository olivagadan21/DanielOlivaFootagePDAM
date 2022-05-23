class MarcaResponse {
  MarcaResponse({
    required this.id,
    required this.nombre,
    required this.imagen,
  });
  late final int id;
  late final String nombre;
  late final String imagen;
  
  MarcaResponse.fromJson(Map<String, dynamic> json){
    id = json['id'];
    nombre = json['nombre'];
    imagen = json['imagen'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['nombre'] = nombre;
    _data['imagen'] = imagen;
    return _data;
  }
}