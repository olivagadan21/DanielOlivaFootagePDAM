export class ProductoDto {
    titulo:      string;
    descripcion: string;
    precio:      number;
    intercambio: boolean;
    original:    boolean;
    usuario:     number;
    seccion:     number;
    categoria:   number;
    marca:       number;
    talla:       number;
    constructor () {
        this.titulo = '';
        this.descripcion = '';
        this.precio = 0;
        this.intercambio = false;
        this.original = false;
        this.usuario = 0;
        this.seccion = 0;
        this.categoria = 0;
        this.marca = 0;
        this.talla = 0;
    }
}
