import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { CategoriaResponse } from 'src/app/model/interfaces/categoria';
import { CategoriaService } from 'src/app/services/categoria.service';

@Component({
  selector: 'app-categoria-list',
  templateUrl: './categoria-list.component.html',
  styleUrls: ['./categoria-list.component.css']
})
export class CategoriaListComponent implements OnInit {

  categorias: CategoriaResponse[] = [];

  constructor(private categoriaService: CategoriaService, private router: Router) { }

  ngOnInit(): void {
    this.categoriaService.getCategorias().subscribe(results => {this.categorias = results})
  }

  create() {
    return this.router.navigate(['/categoria-formulario'])
  }

}
