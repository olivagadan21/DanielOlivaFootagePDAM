class UsuarioResponse {
  UsuarioResponse({
    required this.id,
    required this.nombre,
    required this.apellidos,
    required this.username,
    required this.email,
    required this.avatar,
    required this.localizacion,
    required this.premium,
    required this.rol,
    required this.articulos,
    required this.meGustas
  });
  late final int id;
  late final String nombre;
  late final String apellidos;
  late final String username;
  late final String email;
  late final String avatar;
  late final String localizacion;
  late final bool premium;
  late final String rol;
  late final List<dynamic> articulos;
  late final List<dynamic> meGustas;
  
  UsuarioResponse.fromJson(Map<String, dynamic> json){
    id = json['id'];
    nombre = json['nombre'];
    apellidos = json['apellidos'];
    username = json['username'];
    email = json['email'];
    avatar = json['avatar'];
    localizacion = json['localizacion'];
    premium = json['premium'];
    rol = json['rol'];
    articulos = List.castFrom<dynamic, dynamic>(json['articulos']);
    meGustas = List.castFrom<dynamic, dynamic>(json['meGustas']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['nombre'] = nombre;
    _data['apellidos'] = apellidos;
    _data['username'] = username;
    _data['email'] = email;
    _data['avatar'] = avatar;
    _data['localizacion'] = localizacion;
    _data['premium'] = premium;
    _data['rol'] = rol;
    _data['articulos'] = articulos;
    _data['meGustas'] = meGustas;
    return _data;
  }
}