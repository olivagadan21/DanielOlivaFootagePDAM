import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AnuncioResponse } from 'src/app/model/interfaces/anuncio';
import { AnuncioService } from 'src/app/services/anuncio.service';

@Component({
  selector: 'app-anuncio-list',
  templateUrl: './anuncio-list.component.html',
  styleUrls: ['./anuncio-list.component.css']
})
export class AnuncioListComponent implements OnInit {

  anuncios: AnuncioResponse[] = [];

  constructor(private anuncioService: AnuncioService, private router: Router) { }

  ngOnInit(): void {
    this.anuncioService.getAnuncios().subscribe(results => {this.anuncios = results})
  }

  create() {
    return this.router.navigate(['/anuncio-formulario'])
  }

}
