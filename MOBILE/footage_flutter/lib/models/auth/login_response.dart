class LoginResponse {
  LoginResponse({
    required this.id,
    required this.email,
    required this.nombre,
    required this.apellidos,
    required this.avatar,
    required this.rol,
    required this.token,
    required this.username,
    required this.localizacion,
    required this.premium,
  });
  late final int id;
  late final String email;
  late final String nombre;
  late final String apellidos;
  late final String avatar;
  late final String rol;
  late final String token;
  late final String username;
  late final String localizacion;
  late final bool premium;
  
  LoginResponse.fromJson(Map<String, dynamic> json){
    id = json['id'];
    email = json['email'];
    nombre = json['nombre'];
    apellidos = json['apellidos'];
    avatar = json['avatar'];
    rol = json['rol'];
    token = json['token'];
    username = json['username'];
    localizacion = json['localizacion'];
    premium = json['premium'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['email'] = email;
    _data['nombre'] = nombre;
    _data['apellidos'] = apellidos;
    _data['avatar'] = avatar;
    _data['rol'] = rol;
    _data['token'] = token;
    _data['username'] = username;
    _data['localizacion'] = localizacion;
    _data['premium'] = premium;
    return _data;
  }
}