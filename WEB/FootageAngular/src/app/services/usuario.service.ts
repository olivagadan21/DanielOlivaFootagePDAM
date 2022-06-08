import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { UsuarioDto } from '../model/dto/usuario.dto';
import { UsuarioResponse } from '../model/interfaces/usuario';

const usuarioUrl = `${environment.apiBaseUrl}usuarios/`
const authUrl = `${environment.apiBaseUrl}auth/register/`

const DEFAULT_HEADERS = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json',
    'Authorization': `Bearer ${localStorage.getItem('token')}`
  })
};

@Injectable({
  providedIn: 'root'
})
export class UsuarioService {

  constructor(private http: HttpClient) { }

  getUsuarios(): Observable<UsuarioResponse[]>{
    return this.http.get<UsuarioResponse[]>(usuarioUrl, DEFAULT_HEADERS)
  }
  
  getUsuario(id:number) {
    return this.http.get<UsuarioResponse>(`${usuarioUrl}${id}`, DEFAULT_HEADERS)
  }

  getUsuariosUser(): Observable<UsuarioResponse[]>{
    return this.http.get<UsuarioResponse[]>(`${usuarioUrl}user`, DEFAULT_HEADERS)
  }

  getUsuariosAdmin(): Observable<UsuarioResponse[]>{
    return this.http.get<UsuarioResponse[]>(`${usuarioUrl}admin`, DEFAULT_HEADERS)
  }

  getUsuariosPremium(): Observable<UsuarioResponse[]>{
    return this.http.get<UsuarioResponse[]>(`${usuarioUrl}premium`, DEFAULT_HEADERS)
  }
  

  postusuarioUser(usuario:UsuarioDto): Observable<UsuarioResponse> {
    return this.http.post<UsuarioResponse>(`${authUrl}user`, usuario, DEFAULT_HEADERS)
  }

  postusuarioAdmin(usuario:UsuarioDto): Observable<UsuarioResponse> {
    return this.http.post<UsuarioResponse>(`${authUrl}admin`, usuario, DEFAULT_HEADERS)
  }

  editUsuario(usuario:UsuarioDto, id:number): Observable<UsuarioResponse> {
    return this.http.put<UsuarioResponse>(`${usuarioUrl}${id}`, usuario, DEFAULT_HEADERS)
  }

  deleteUsuario(id:number): Observable<UsuarioResponse[]>{
    return this.http.delete<UsuarioResponse[]>(`${usuarioUrl}${id}`, DEFAULT_HEADERS)
  }

}
