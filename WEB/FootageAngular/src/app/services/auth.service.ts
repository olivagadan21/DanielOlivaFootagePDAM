import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { AuthLoginDto } from '../model/dto/auth.dto';
import { LoginResponse } from '../model/interfaces/auth';

const DEFAULT_HEADERS = {
  headers:new HttpHeaders({
    'Content-Type': 'application/json',
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'Content-Type',
    "Access-Control-Max-Age": "3600",
    'Access-Control-Allow-Methods': 'GET,POST,OPTIONS,DELETE,PUT',
  })
}

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  constructor(private http: HttpClient) {}

  login(loginDto: AuthLoginDto): Observable<LoginResponse> {
    let requestUrl = `${environment.apiBaseUrl}auth/login/admin`;
    return this.http.post<LoginResponse>(requestUrl, loginDto, DEFAULT_HEADERS);
  }
}