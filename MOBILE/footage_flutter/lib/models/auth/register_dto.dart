class RegisterDto {
  String? nombre;
  String? apellidos;
  String? username;
  String? avatar;
  String? localizacion;
  bool? premium;
  String? email;
  String? password;
  String? password2;

  RegisterDto(
      {
      this.nombre,
      this.apellidos,
      this.username,
      this.avatar,
      this.localizacion,
      this.premium,
      this.email,
      this.password,
      this.password2});

  RegisterDto.fromJson(Map<String, dynamic> json) {
    nombre = json['nombre'];
    apellidos = json['apellidos'];
    username = json['username'];
    avatar = json['avatar'];
    localizacion = json['localizacion'];
    premium = json['premium'];
    email = json['email'];
    password = json['password'];
    password2 = json['password2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nombre'] = nombre;
    data['apellidos'] = apellidos;
    data['username'] = username;
    data['avatar'] = avatar;
    data['localizacion'] = localizacion;
    data['premium'] = premium;
    data['email'] = email;
    data['password'] = password;
    data['password2'] = password2;
    return data;
  }
}