import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { TallaDto } from 'src/app/model/dto/talla.dto';
import { CategoriaResponse } from 'src/app/model/interfaces/categoria';
import { CategoriaService } from 'src/app/services/categoria.service';
import { TallaService } from 'src/app/services/talla.service';

@Component({
  selector: 'app-talla-form',
  templateUrl: './talla-form.component.html',
  styleUrls: ['./talla-form.component.css']
})
export class TallaFormComponent implements OnInit {

  talla = new TallaDto();
  categorias: CategoriaResponse[] = [];

  constructor(private tallaService: TallaService, private router: Router, private categoriaService: CategoriaService) { }

  ngOnInit(): void {
    this.categoriaService.getCategorias().subscribe(results => {this.categorias = results})
  }

  list() {
    return this.router.navigate(['/talla'])
  }

  onSubmit(){
    this.tallaService.postTalla(this.talla).subscribe(res => {this.router.navigate(['/talla'])})
  }

}
