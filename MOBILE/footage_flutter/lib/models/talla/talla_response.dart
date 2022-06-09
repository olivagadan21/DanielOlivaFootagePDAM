class TallaResponse {
  TallaResponse({
    required this.id,
    required this.nombre,
  });
  late final int id;
  late final String nombre;
  
  TallaResponse.fromJson(Map<String, dynamic> json){
    id = json['id'];
    nombre = json['nombre'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['nombre'] = nombre;
    return _data;
  }
}