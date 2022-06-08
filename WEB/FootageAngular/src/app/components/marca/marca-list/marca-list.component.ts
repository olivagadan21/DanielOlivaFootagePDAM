import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { MarcaResponse } from 'src/app/model/interfaces/marca';
import { MarcaService } from 'src/app/services/marca.service';

@Component({
  selector: 'app-marca-list',
  templateUrl: './marca-list.component.html',
  styleUrls: ['./marca-list.component.css']
})
export class MarcaListComponent implements OnInit {

  marcas: MarcaResponse[] = [];

  constructor(private marcaService: MarcaService, private router: Router) { }

  ngOnInit(): void {
    this.marcaService.getMarcas().subscribe(results => {this.marcas = results})
  }

  create() {
    return this.router.navigate(['/marca-formulario'])
  }

}
