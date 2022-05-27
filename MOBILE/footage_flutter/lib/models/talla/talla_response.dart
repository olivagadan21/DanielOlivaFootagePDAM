class TallaResponse {
  TallaResponse({
    required this.id,
    required this.nombre,
    required this.categoria,
  });
  late final int id;
  late final String nombre;
  late final String categoria;
  
  TallaResponse.fromJson(Map<String, dynamic> json){
    id = json['id'];
    nombre = json['nombre'];
    categoria = json['categoria'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['nombre'] = nombre;
    _data['categoria'] = categoria;
    return _data;
  }
}