import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { CategoriaDto } from 'src/app/model/dto/categoria.dto';
import { CategoriaService } from 'src/app/services/categoria.service';

@Component({
  selector: 'app-categoria-form',
  templateUrl: './categoria-form.component.html',
  styleUrls: ['./categoria-form.component.css']
})
export class CategoriaFormComponent implements OnInit {

  categoria = new CategoriaDto();

  constructor(private categoriaService: CategoriaService, private router: Router) { }

  ngOnInit(): void {
  }

  list() {
    return this.router.navigate(['/categoria'])
  }

  onSubmit(){
    this.categoriaService.postCategoria(this.categoria).subscribe(res => {this.router.navigate(['/categoria'])})
  }

}
