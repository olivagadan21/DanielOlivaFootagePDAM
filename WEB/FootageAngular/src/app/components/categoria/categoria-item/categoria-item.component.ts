import { Component, Input, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { CategoriaResponse } from 'src/app/model/interfaces/categoria';
import { CategoriaService } from 'src/app/services/categoria.service';
import { CategoriaEditComponent } from '../categoria-edit/categoria-edit.component';

@Component({
  selector: 'app-categoria-item',
  templateUrl: './categoria-item.component.html',
  styleUrls: ['./categoria-item.component.css']
})
export class CategoriaItemComponent implements OnInit {

  @Input() categoriaInput!: CategoriaResponse;
  categoriaList: CategoriaResponse[] | undefined;

  constructor(private categoriaService: CategoriaService, private router: Router, private dialog: MatDialog) { }

  ngOnInit(): void {
  }

  getAvatar(categoria: CategoriaResponse) {
    return `${categoria.imagen}`;
  }

  deleteCategoria() {
    this.categoriaService.deleteCategoria(this.categoriaInput.id).subscribe(res => {this.categoriaList = res})
    alert('Se ha eliminado correctamente.')
    window.location.reload()
  }

  openEditDialog(categoria: CategoriaResponse){
    this.dialog.open(CategoriaEditComponent, {height: '350px', width:'600px', data: {id:categoria.id}})
  }

}
