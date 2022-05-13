class RegisterDto {
  String? nombre;
  String? apellidos;
  String? username;
  String? email;
  String? password;
  String? password2;

  RegisterDto(
      {this.username,
      this.email,
      this.nombre,
      this.apellidos,
      this.password,
      this.password2});

  RegisterDto.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    nombre = json['nombre'];
    apellidos = json['apellidos'];
    password = json['password'];
    password2 = json['password2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['nombre'] = nombre;
    data['apellidos'] = apellidos;
    data['password'] = password;
    data['password2'] = password2;
    return data;
  }
}