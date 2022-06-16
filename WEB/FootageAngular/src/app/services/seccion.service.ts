import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { SeccionDto } from '../model/dto/seccion.dto';
import { SeccionResponse } from '../model/interfaces/seccion';

const seccionUrl = `${environment.apiBaseUrl}seccion/`;

const DEFAULT_HEADERS = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json',
    'Authorization': `Bearer ${localStorage.getItem('token')}`
  })
};

@Injectable({
  providedIn: 'root'
})
export class SeccionService {

  constructor(private http: HttpClient) { }

  getSecciones(): Observable<SeccionResponse[]>{
    return this.http.get<SeccionResponse[]>(seccionUrl, DEFAULT_HEADERS);
  }

  getSeccion(id: number) {
    return this.http.get<SeccionResponse>(`${seccionUrl}${id}`, DEFAULT_HEADERS);
  }

  postSeccion(seccion: SeccionDto): Observable<SeccionResponse> {
    return this.http.post<SeccionResponse>(seccionUrl, seccion, DEFAULT_HEADERS);
  }

  editSeccion(seccion: SeccionDto, id:number): Observable<SeccionResponse> {
    return this.http.put<SeccionResponse>(`${seccionUrl}${id}`, seccion, DEFAULT_HEADERS);
  }

  deleteSeccion(id:number): Observable<SeccionResponse[]>{
    return this.http.delete<SeccionResponse[]>(`${seccionUrl}${id}`, DEFAULT_HEADERS);
  }

}
