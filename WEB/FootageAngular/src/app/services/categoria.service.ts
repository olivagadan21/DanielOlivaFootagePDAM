import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { CategoriaDto } from '../model/dto/categoria.dto';
import { CategoriaResponse } from '../model/interfaces/categoria';

const categoriaUrl = `${environment.apiBaseUrl}categoria/`;

const DEFAULT_HEADERS = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json',
    'Authorization': `Bearer ${localStorage.getItem('token')}`
  })
};

@Injectable({
  providedIn: 'root'
})
export class CategoriaService {

  constructor(private http: HttpClient) { }

  getCategorias(): Observable<CategoriaResponse[]>{
    return this.http.get<CategoriaResponse[]>(categoriaUrl, DEFAULT_HEADERS);
  }

  getCategoria(id: number) {
    return this.http.get<CategoriaResponse>(`${categoriaUrl}${id}`, DEFAULT_HEADERS);
  }

  postCategoria(categoria: CategoriaDto): Observable<CategoriaResponse> {
    return this.http.post<CategoriaResponse>(categoriaUrl, categoria, DEFAULT_HEADERS);
  }

  editCategoria(categoria: CategoriaDto, id:number): Observable<CategoriaResponse> {
    return this.http.put<CategoriaResponse>(`${categoriaUrl}${id}`, categoria, DEFAULT_HEADERS);
  }

  deleteCategoria(id:number): Observable<CategoriaResponse[]>{
    return this.http.delete<CategoriaResponse[]>(`${categoriaUrl}${id}`, DEFAULT_HEADERS);
  }

}
