import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AnuncioDto } from 'src/app/model/dto/anuncio.dto';
import { AnuncioService } from 'src/app/services/anuncio.service';

@Component({
  selector: 'app-anuncio-form',
  templateUrl: './anuncio-form.component.html',
  styleUrls: ['./anuncio-form.component.css']
})
export class AnuncioFormComponent implements OnInit {

  anuncio = new AnuncioDto();

  constructor(private anuncioService: AnuncioService, private router: Router) { }

  ngOnInit(): void {
  }

  list() {
    return this.router.navigate(['/anuncio'])
  }

  onSubmit() {
    this.anuncioService.postAnuncio(this.anuncio).subscribe(res => {this.router.navigate(['/anuncio'])})
  }

}
