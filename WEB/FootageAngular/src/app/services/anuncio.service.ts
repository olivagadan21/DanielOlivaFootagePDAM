import { HttpClient, HttpHeaders} from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { AnuncioDto } from '../model/dto/anuncio.dto';
import { AnuncioResponse } from '../model/interfaces/anuncio';

const anuncioUrl = `${environment.apiBaseUrl}anuncio/`;

const DEFAULT_HEADERS = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json',
    'Authorization': `Bearer ${localStorage.getItem('token')}`
  })
};

@Injectable({
  providedIn: 'root'
})
export class AnuncioService {

  constructor(private http: HttpClient) { }

  getAnuncios(): Observable<AnuncioResponse[]>{
    return this.http.get<AnuncioResponse[]>(anuncioUrl, DEFAULT_HEADERS);
  }

  getAnuncio(id: number) {
    return this.http.get<AnuncioResponse>(`${anuncioUrl}${id}`, DEFAULT_HEADERS);
  }

  postAnuncio(anuncio: AnuncioDto): Observable<AnuncioResponse> {
    return this.http.post<AnuncioResponse>(`${anuncioUrl}`, anuncio, DEFAULT_HEADERS);
  }

  editAnuncio(anuncio: AnuncioDto, id:number): Observable<AnuncioResponse> {
    return this.http.put<AnuncioResponse>(`${anuncioUrl}${id}`, anuncio, DEFAULT_HEADERS);
  }

  deleteAnuncio(id:number): Observable<AnuncioResponse[]>{
    return this.http.delete<AnuncioResponse[]>(`${anuncioUrl}${id}`, DEFAULT_HEADERS);
  }

}
