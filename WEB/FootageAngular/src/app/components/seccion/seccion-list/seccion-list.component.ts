import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { SeccionResponse } from 'src/app/model/interfaces/seccion';
import { SeccionService } from 'src/app/services/seccion.service';

@Component({
  selector: 'app-seccion-list',
  templateUrl: './seccion-list.component.html',
  styleUrls: ['./seccion-list.component.css']
})
export class SeccionListComponent implements OnInit {

  secciones: SeccionResponse[] = [];

  constructor(private seccionService: SeccionService, private router: Router) { }

  ngOnInit(): void {
    this.seccionService.getSecciones().subscribe(results => {this.secciones = results})
  }

  create() {
    return this.router.navigate(['/seccion-formulario'])
  }

}
