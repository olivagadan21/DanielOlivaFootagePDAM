class AnuncioResponse {
  AnuncioResponse({
    required this.id,
    required this.empresa,
    required this.url,
    required this.imagen,
  });
  late final int id;
  late final String empresa;
  late final String url;
  late final String imagen;
  
  AnuncioResponse.fromJson(Map<String, dynamic> json){
    id = json['id'];
    empresa = json['empresa'];
    url = json['url'];
    imagen = json['imagen'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['empresa'] = empresa;
    _data['url'] = url;
    _data['imagen'] = imagen;
    return _data;
  }
}