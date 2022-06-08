import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { DialogData } from 'src/app/dialogs/usuario-dialog/usuario-dialog.component';
import { ProductoDto } from 'src/app/model/dto/producto.dto';
import { CategoriaResponse } from 'src/app/model/interfaces/categoria';
import { MarcaResponse } from 'src/app/model/interfaces/marca';
import { ProductoResponse } from 'src/app/model/interfaces/producto';
import { SeccionResponse } from 'src/app/model/interfaces/seccion';
import { TallaResponse } from 'src/app/model/interfaces/talla';
import { UsuarioResponse } from 'src/app/model/interfaces/usuario';
import { CategoriaService } from 'src/app/services/categoria.service';
import { MarcaService } from 'src/app/services/marca.service';
import { ProductoService } from 'src/app/services/producto.service';
import { SeccionService } from 'src/app/services/seccion.service';
import { TallaService } from 'src/app/services/talla.service';
import { UsuarioService } from 'src/app/services/usuario.service';

@Component({
  selector: 'app-producto-edit',
  templateUrl: './producto-edit.component.html',
  styleUrls: ['./producto-edit.component.css']
})
export class ProductoEditComponent implements OnInit {

  producto = new ProductoDto()
  productoResponse!: ProductoResponse
  usuarios: UsuarioResponse[] = [];
  secciones: SeccionResponse[] = [];
  categorias: CategoriaResponse[] = [];
  marcas: MarcaResponse[] = [];
  tallas: TallaResponse[] = [];

  constructor(private productoService: ProductoService, @Inject(MAT_DIALOG_DATA) private data: DialogData, private usuarioService: UsuarioService,
  private seccionService: SeccionService, private categoriaService: CategoriaService, private marcaService: MarcaService, private tallaService: TallaService) { }

  ngOnInit(): void {
    this.usuarioService.getUsuarios().subscribe(results => {this.usuarios = results})
    this.seccionService.getSecciones().subscribe(results => {this.secciones = results})
    this.categoriaService.getCategorias().subscribe(results => {this.categorias = results})
    this.marcaService.getMarcas().subscribe(results => {this.marcas = results})
    this.tallaService.getTallas().subscribe(results => {this.tallas = results})
    this.productoService.getProducto(this.data.id).subscribe(a=>{
      this.producto.titulo = a.titulo,
      this.producto.categoria = a.categoria.id,
      this.producto.descripcion = a.descripcion,
      this.producto.intercambio = a.intercambio,
      this.producto.marca = a.marca.id,
      this.producto.original = a.original,
      this.producto.precio = a.precio,
      this.producto.seccion = a.seccion.id,
      this.producto.talla = a.talla.id,
      this.producto.usuario = a.usuario.id
    })
  }

  onSubmit(){
    this.productoService.editProducto(this.producto, this.data.id).subscribe(res => {this.productoResponse = res})
    window.location.reload()
  }

}
