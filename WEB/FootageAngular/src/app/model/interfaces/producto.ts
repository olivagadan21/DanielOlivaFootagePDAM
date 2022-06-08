export interface ProductoResponse {
    id:          number;
    titulo:      string;
    descripcion: string;
    precio:      number;
    intercambio: boolean;
    original:    boolean;
    foto:       string;
    usuario:     Usuario;
    seccion:     Categoria;
    categoria:   Categoria;
    marca:       Categoria;
    talla:       Talla;
    meGustas:    Usuario[];
}

export interface Categoria {
    id:     number;
    nombre: string;
    imagen: string;
}

export interface Usuario {
    id:           number;
    nombre:       string;
    apellidos:    string;
    username:     string;
    email:        string;
    avatar:       string;
    localizacion: string;
    premium:      boolean;
}

export interface Talla {
    id:        number;
    nombre:    string;
}
