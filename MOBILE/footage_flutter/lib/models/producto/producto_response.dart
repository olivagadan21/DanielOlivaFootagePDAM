class ProductoResponse {
  ProductoResponse({
    required this.id,
    required this.titulo,
    required this.descripcion,
    required this.precio,
    required this.intercambio,
    required this.original,
    required this.foto,
    required this.usuario,
    required this.seccion,
    required this.categoria,
    required this.marca,
    required this.talla,
    required this.estado,
    required this.anuncio,
    required this.meGustas,
  });
  late final int id;
  late final String titulo;
  late final String descripcion;
  late final int precio;
  late final bool intercambio;
  late final bool original;
  late final String foto;
  late final Usuario usuario;
  late final Seccion seccion;
  late final Categoria categoria;
  late final Marca marca;
  late final Talla talla;
  late final String estado;
  late final Anuncio anuncio;
  late final List<MeGustas> meGustas;
  
  ProductoResponse.fromJson(Map<String, dynamic> json){
    id = json['id'];
    titulo = json['titulo'];
    descripcion = json['descripcion'];
    precio = json['precio'];
    intercambio = json['intercambio'];
    original = json['original'];
    foto = json['foto'];
    usuario = Usuario.fromJson(json['usuario']);
    seccion = Seccion.fromJson(json['seccion']);
    categoria = Categoria.fromJson(json['categoria']);
    marca = Marca.fromJson(json['marca']);
    talla = Talla.fromJson(json['talla']);
    estado = json['estado'];
    anuncio = Anuncio.fromJson(json['anuncio']);
    meGustas = List.from(json['meGustas']).map((e)=>MeGustas.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['titulo'] = titulo;
    _data['descripcion'] = descripcion;
    _data['precio'] = precio;
    _data['intercambio'] = intercambio;
    _data['original'] = original;
    _data['foto'] = foto;
    _data['usuario'] = usuario.toJson();
    _data['seccion'] = seccion.toJson();
    _data['categoria'] = categoria.toJson();
    _data['marca'] = marca.toJson();
    _data['talla'] = talla.toJson();
    _data['estado'] = estado;
    _data['anuncio'] = anuncio.toJson();
    _data['meGustas'] = meGustas.map((e)=>e.toJson()).toList();
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
    required this.articulos,
  });
  late final int id;
  late final String nombre;
  late final String apellidos;
  late final String username;
  late final String email;
  late final String avatar;
  late final String localizacion;
  late final bool premium;
  late final List<Articulos> articulos;
  
  Usuario.fromJson(Map<String, dynamic> json){
    id = json['id'];
    nombre = json['nombre'];
    apellidos = json['apellidos'];
    username = json['username'];
    email = json['email'];
    avatar = json['avatar'];
    localizacion = json['localizacion'];
    premium = json['premium'];
    articulos = List.from(json['articulos']).map((e)=>Articulos.fromJson(e)).toList();
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
    _data['articulos'] = articulos.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Articulos {
  Articulos({
    required this.id,
    required this.titulo,
    required this.precio,
    required this.original,
    required this.foto,
    required this.marca,
    required this.talla,
    required this.estado,
  });
  late final int id;
  late final String titulo;
  late final int precio;
  late final bool original;
  late final String foto;
  late final Marca marca;
  late final Talla talla;
  late final String estado;
  
  Articulos.fromJson(Map<String, dynamic> json){
    id = json['id'];
    titulo = json['titulo'];
    precio = json['precio'];
    original = json['original'];
    foto = json['foto'];
    marca = Marca.fromJson(json['marca']);
    talla = Talla.fromJson(json['talla']);
    estado = json['estado'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['titulo'] = titulo;
    _data['precio'] = precio;
    _data['original'] = original;
    _data['foto'] = foto;
    _data['marca'] = marca.toJson();
    _data['talla'] = talla.toJson();
    _data['estado'] = estado;
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
  });
  late final int id;
  late final String nombre;
  
  Talla.fromJson(Map<String, dynamic> json){
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

class Anuncio {
  Anuncio({
    required this.id,
    required this.empresa,
    required this.url,
    required this.imagen,
  });
  late final int id;
  late final String empresa;
  late final String url;
  late final String imagen;
  
  Anuncio.fromJson(Map<String, dynamic> json){
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

class MeGustas {
  MeGustas({
    required this.id,
    required this.nombre,
    required this.apellidos,
    required this.username,
    required this.email,
    required this.avatar,
    required this.localizacion,
    required this.premium,
    required this.articulos,
  });
  late final int id;
  late final String nombre;
  late final String apellidos;
  late final String username;
  late final String email;
  late final String avatar;
  late final String localizacion;
  late final bool premium;
  late final List<Articulos> articulos;
  
  MeGustas.fromJson(Map<String, dynamic> json){
    id = json['id'];
    nombre = json['nombre'];
    apellidos = json['apellidos'];
    username = json['username'];
    email = json['email'];
    avatar = json['avatar'];
    localizacion = json['localizacion'];
    premium = json['premium'];
    articulos = List.from(json['articulos']).map((e)=>Articulos.fromJson(e)).toList();
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
    _data['articulos'] = articulos.map((e)=>e.toJson()).toList();
    return _data;
  }
}