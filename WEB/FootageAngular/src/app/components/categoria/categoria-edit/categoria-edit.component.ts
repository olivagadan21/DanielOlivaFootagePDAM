import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { DialogData } from 'src/app/dialogs/usuario-dialog/usuario-dialog.component';
import { CategoriaDto } from 'src/app/model/dto/categoria.dto';
import { CategoriaResponse } from 'src/app/model/interfaces/categoria';
import { CategoriaService } from 'src/app/services/categoria.service';

@Component({
  selector: 'app-categoria-edit',
  templateUrl: './categoria-edit.component.html',
  styleUrls: ['./categoria-edit.component.css']
})
export class CategoriaEditComponent implements OnInit {

  categoria = new CategoriaDto
  categoriaResponse!: CategoriaResponse

  constructor(private categoriaService: CategoriaService, private router: Router, @Inject(MAT_DIALOG_DATA) private data: DialogData) { }

  ngOnInit(): void {
    this.categoriaService.getCategoria(this.data.id).subscribe(res=>{
      this.categoria.nombre = res.nombre
    })
  }

  onSubmit(){
    this.categoriaService.editCategoria(this.categoria, this.data.id).subscribe(res=>{this.categoriaResponse=res})
    window.location.reload()
  }

}
