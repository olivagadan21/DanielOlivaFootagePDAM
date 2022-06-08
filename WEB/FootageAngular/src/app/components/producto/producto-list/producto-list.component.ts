import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ProductoResponse } from 'src/app/model/interfaces/producto';
import { ProductoService } from 'src/app/services/producto.service';

@Component({
  selector: 'app-producto-list',
  templateUrl: './producto-list.component.html',
  styleUrls: ['./producto-list.component.css']
})
export class ProductoListComponent implements OnInit {

  productos: ProductoResponse[] = [];

  constructor(private productoService: ProductoService, private router: Router) { }

  ngOnInit(): void {
    this.productoService.getProductos().subscribe(results => {this.productos = results})
  }

  create() {
    return this.router.navigate(['/producto-formulario'])
  }

}
