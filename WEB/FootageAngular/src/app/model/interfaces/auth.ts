export interface LoginResponse {
  id:           number;
  email:        string;
  nombre:       string;
  apellidos:    string;
  avatar:       string;
  rol:          string;
  token:        string;
  username:     string;
  localizacion: string;
  premium:      boolean;
}
