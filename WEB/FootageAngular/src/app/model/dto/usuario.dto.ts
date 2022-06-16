export class UsuarioDto {
    nombre:       string;
    apellidos:    string;
    username:     string;
    avatar:       string;
    localizacion: string;
    premium:      boolean;
    email:        string;
    password:     string;
    password2:    string;
    constructor() {
        this.nombre = '';
        this.apellidos = '';
        this.username = '';
        this.avatar = '';
        this.localizacion = '';
        this.premium = false;
        this.email = '';
        this.password = '';
        this.password2 = '';
    }
}
