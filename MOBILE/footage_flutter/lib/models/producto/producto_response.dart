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
    required this.talla,
  });
  late final int id;
  late final String titulo;
  late final String descripcion;
  late final int precio;
  late final bool intercambio;
  late final bool original;
  late final String foto1;
  late final String foto2;
  late final Usuario usuario;
  late final Seccion seccion;
  late final Categoria categoria;
  late final Marca marca;
  late final Talla talla;
  
  ProductoResponse.fromJson(Map<String, dynamic> json){
    id = json['id'];
    titulo = json['titulo'];
    descripcion = json['descripcion'];
    precio = json['precio'];
    intercambio = json['intercambio'];
    original = json['original'];
    foto1 = json['foto1'];
    foto2 = json['foto2'];
    usuario = Usuario.fromJson(json['usuario']);
    seccion = Seccion.fromJson(json['seccion']);
    categoria = Categoria.fromJson(json['categoria']);
    marca = Marca.fromJson(json['marca']);
    talla = Talla.fromJson(json['talla']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['titulo'] = titulo;
    _data['descripcion'] = descripcion;
    _data['precio'] = precio;
    _data['intercambio'] = intercambio;
    _data['original'] = original;
    _data['foto1'] = foto1;
    _data['foto2'] = foto2;
    _data['usuario'] = usuario.toJson();
    _data['seccion'] = seccion.toJson();
    _data['categoria'] = categoria.toJson();
    _data['marca'] = marca.toJson();
    _data['talla'] = talla.toJson();
    return _data;
  }
}

class Usuario {
  Usuario({
    required this.id,
    required this.nombre,
    required this.apellidos,
    required this.username,
    required this.email,
    required this.avatar,
    required this.localizacion,
    required this.premium,
  });
  late final int id;
  late final String nombre;
  late final String apellidos;
  late final String username;
  late final String email;
  late final String avatar;
  late final String localizacion;
  late final bool premium;
  
  Usuario.fromJson(Map<String, dynamic> json){
    id = json['id'];
    nombre = json['nombre'];
    apellidos = json['apellidos'];
    username = json['username'];
    email = json['email'];
    avatar = json['avatar'];
    localizacion = json['localizacion'];
    premium = json['premium'];
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
    return _data;
  }
}

class Seccion {
  Seccion({
    required this.id,
    required this.nombre,
    required this.imagen,
  });
  late final int id;
  late final String nombre;
  late final String imagen;
  
  Seccion.fromJson(Map<String, dynamic> json){
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

class Categoria {
  Categoria({
    required this.id,
    required this.nombre,
    required this.imagen,
  });
  late final int id;
  late final String nombre;
  late final String imagen;
  
  Categoria.fromJson(Map<String, dynamic> json){
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

class Marca {
  Marca({
    required this.id,
    required this.nombre,
    required this.imagen,
  });
  late final int id;
  late final String nombre;
  late final String imagen;
  
  Marca.fromJson(Map<String, dynamic> json){
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

class Talla {
  Talla({
    required this.id,
    required this.nombre,
    required this.categoria,
  });
  late final int id;
  late final String nombre;
  late final Categoria categoria;
  
  Talla.fromJson(Map<String, dynamic> json){
    id = json['id'];
    nombre = json['nombre'];
    categoria = Categoria.fromJson(json['categoria']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['nombre'] = nombre;
    _data['categoria'] = categoria.toJson();
    return _data;
  }
}