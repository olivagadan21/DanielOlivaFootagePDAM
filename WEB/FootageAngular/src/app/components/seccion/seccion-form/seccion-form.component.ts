import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { SeccionDto } from 'src/app/model/dto/seccion.dto';
import { SeccionService } from 'src/app/services/seccion.service';

@Component({
  selector: 'app-seccion-form',
  templateUrl: './seccion-form.component.html',
  styleUrls: ['./seccion-form.component.css']
})
export class SeccionFormComponent implements OnInit {

  seccion = new SeccionDto();

  constructor(private seccionService: SeccionService, private router: Router) { }

  ngOnInit(): void {
  }

  list() {
    return this.router.navigate(['/seccion'])
  }

  onSubmit(){
    this.seccionService.postSeccion(this.seccion).subscribe(res => {this.router.navigate(['/seccion'])})
  }

}
