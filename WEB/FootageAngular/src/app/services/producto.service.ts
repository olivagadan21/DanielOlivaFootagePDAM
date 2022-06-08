import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { ProductoDto } from '../model/dto/producto.dto';
import { ProductoResponse } from '../model/interfaces/producto';

const productoUrl = `${environment.apiBaseUrl}producto/`;

const DEFAULT_HEADERS = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json',
    'Authorization': `Bearer ${localStorage.getItem('token')}`
  })
};

@Injectable({
  providedIn: 'root'
})
export class ProductoService {

  constructor(private http: HttpClient) { }

  getProductos(): Observable<ProductoResponse[]>{
    return this.http.get<ProductoResponse[]>(productoUrl, DEFAULT_HEADERS);
  }

  getProducto(id: number) {
    return this.http.get<ProductoResponse>(`${productoUrl}${id}`, DEFAULT_HEADERS);
  }

  getProductosSeccion(id: number): Observable<ProductoResponse[]>{
    return this.http.get<ProductoResponse[]>(`${productoUrl}seccion/${id}`, DEFAULT_HEADERS);
  }

  getProductosMarca(id: number): Observable<ProductoResponse[]>{
    return this.http.get<ProductoResponse[]>(`${productoUrl}marca/${id}`, DEFAULT_HEADERS);
  }

  getProductosCategoria(id: number): Observable<ProductoResponse[]>{
    return this.http.get<ProductoResponse[]>(`${productoUrl}categoria/${id}`, DEFAULT_HEADERS);
  }

  getProductosOriginal(): Observable<ProductoResponse[]>{
    return this.http.get<ProductoResponse[]>(`${productoUrl}original`, DEFAULT_HEADERS);
  }

  getProductosIntercambio(): Observable<ProductoResponse[]>{
    return this.http.get<ProductoResponse[]>(`${productoUrl}intercambio`, DEFAULT_HEADERS);
  }

  postProducto(producto: ProductoDto): Observable<ProductoResponse> {
    return this.http.post<ProductoResponse>(productoUrl, producto, DEFAULT_HEADERS);
  }

  editProducto(producto: ProductoDto, id:number): Observable<ProductoResponse> {
    return this.http.put<ProductoResponse>(`${productoUrl}${id}`, producto, DEFAULT_HEADERS);
  }

  deleteProducto(id:number): Observable<ProductoResponse[]>{
    return this.http.delete<ProductoResponse[]>(`${productoUrl}${id}`, DEFAULT_HEADERS);
  }

}
