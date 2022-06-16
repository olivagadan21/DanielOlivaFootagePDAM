import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { MarcaDto } from '../model/dto/marca.dto';
import { MarcaResponse } from '../model/interfaces/marca';

const marcaUrl = `${environment.apiBaseUrl}marca/`;

const DEFAULT_HEADERS = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json',
    'Authorization': `Bearer ${localStorage.getItem('token')}`
  })
};

@Injectable({
  providedIn: 'root'
})
export class MarcaService {

  constructor(private http: HttpClient) { }

  getMarcas(): Observable<MarcaResponse[]>{
    return this.http.get<MarcaResponse[]>(marcaUrl, DEFAULT_HEADERS);
  }

  getMarca(id: number) {
    return this.http.get<MarcaResponse>(`${marcaUrl}${id}`, DEFAULT_HEADERS);
  }

  postMarca(marca: MarcaDto): Observable<MarcaResponse> {
    return this.http.post<MarcaResponse>(marcaUrl, marca, DEFAULT_HEADERS);
  }

  editMarca(marca: MarcaDto, id:number): Observable<MarcaResponse> {
    return this.http.put<MarcaResponse>(`${marcaUrl}${id}`, marca, DEFAULT_HEADERS);
  }

  deleteMarca(id:number): Observable<MarcaResponse[]>{
    return this.http.delete<MarcaResponse[]>(`${marcaUrl}${id}`, DEFAULT_HEADERS);
  }

}
