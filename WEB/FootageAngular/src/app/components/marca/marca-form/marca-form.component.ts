import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { MarcaDto } from 'src/app/model/dto/marca.dto';
import { MarcaService } from 'src/app/services/marca.service';

@Component({
  selector: 'app-marca-form',
  templateUrl: './marca-form.component.html',
  styleUrls: ['./marca-form.component.css']
})
export class MarcaFormComponent implements OnInit {

  marca = new MarcaDto();

  constructor(private marcaService: MarcaService, private router: Router) { }

  ngOnInit(): void {
  }

  list() {
    return this.router.navigate(['/marca'])
  }

  onSubmit(){
    this.marcaService.postMarca(this.marca).subscribe(res => {this.router.navigate(['/marca'])})
  }

}
