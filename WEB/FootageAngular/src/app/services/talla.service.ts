import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { TallaDto } from '../model/dto/talla.dto';
import { TallaResponse } from '../model/interfaces/talla';

const tallaUrl = `${environment.apiBaseUrl}talla/`;

const DEFAULT_HEADERS = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json',
    'Authorization': `Bearer ${localStorage.getItem('token')}`,
  })
};

@Injectable({
  providedIn: 'root'
})
export class TallaService {

  constructor(private http: HttpClient) { }

  getTallas(): Observable<TallaResponse[]>{
    return this.http.get<TallaResponse[]>(tallaUrl, DEFAULT_HEADERS);
  }

  getTalla(id: number) {
    return this.http.get<TallaResponse>(`${tallaUrl}${id}`, DEFAULT_HEADERS);
  }

  postTalla(talla: TallaDto): Observable<TallaResponse> {
    return this.http.post<TallaResponse>(tallaUrl, talla, DEFAULT_HEADERS);
  }

  editTalla(talla: TallaDto, id:number): Observable<TallaResponse> {
    return this.http.put<TallaResponse>(`${tallaUrl}${id}`, talla, DEFAULT_HEADERS);
  }

  deleteTalla(id:number): Observable<TallaResponse[]>{
    return this.http.delete<TallaResponse[]>(`${tallaUrl}${id}`, DEFAULT_HEADERS);
  }

}
