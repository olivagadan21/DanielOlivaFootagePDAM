import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ProductoDto } from 'src/app/model/dto/producto.dto';
import { CategoriaResponse } from 'src/app/model/interfaces/categoria';
import { MarcaResponse } from 'src/app/model/interfaces/marca';
import { SeccionResponse } from 'src/app/model/interfaces/seccion';
import { TallaResponse } from 'src/app/model/interfaces/talla';
import { UsuarioResponse } from 'src/app/model/interfaces/usuario';
import { CategoriaService } from 'src/app/services/categoria.service';
import { MarcaService } from 'src/app/services/marca.service';
import { ProductoService } from 'src/app/services/producto.service';
import { SeccionService } from 'src/app/services/seccion.service';
import { TallaService } from 'src/app/services/talla.service';
import { UsuarioService } from 'src/app/services/usuario.service';
import { UsuarioListComponent } from '../../usuario/usuario-list/usuario-list.component';

@Component({
  selector: 'app-producto-form',
  templateUrl: './producto-form.component.html',
  styleUrls: ['./producto-form.component.css']
})
export class ProductoFormComponent implements OnInit {

  producto = new ProductoDto();
  usuarios: UsuarioResponse[] = [];
  secciones: SeccionResponse[] = [];
  categorias: CategoriaResponse[] = [];
  marcas: MarcaResponse[] = [];
  tallas: TallaResponse[] = [];

  constructor(private router: Router, private productoService: ProductoService, private usuarioService: UsuarioService,
    private seccionService: SeccionService, private categoriaService: CategoriaService, private marcaService: MarcaService, private tallaService: TallaService) { }

  ngOnInit(): void {
    this.usuarioService.getUsuarios().subscribe(results => {this.usuarios = results})
    this.seccionService.getSecciones().subscribe(results => {this.secciones = results})
    this.categoriaService.getCategorias().subscribe(results => {this.categorias = results})
    this.marcaService.getMarcas().subscribe(results => {this.marcas = results})
    this.tallaService.getTallas().subscribe(results => {this.tallas = results})
  }

  list() {
    return this.router.navigate(['/producto'])
  }

  onSubmit(){
    this.productoService.postProducto(this.producto).subscribe(res => {this.router.navigate(['/producto'])})
  }

}
