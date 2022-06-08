import { Component, Input, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { AnuncioResponse } from 'src/app/model/interfaces/anuncio';
import { AnuncioService } from 'src/app/services/anuncio.service';
import { AnuncioEditComponent } from '../anuncio-edit/anuncio-edit.component';

@Component({
  selector: 'app-anuncio-item',
  templateUrl: './anuncio-item.component.html',
  styleUrls: ['./anuncio-item.component.css']
})
export class AnuncioItemComponent implements OnInit {

  @Input() anuncioInput!: AnuncioResponse;
  anuncioList: AnuncioResponse[] | undefined;

  constructor(private anuncioService: AnuncioService, private dialog: MatDialog) { }

  ngOnInit(): void {
  }

  getAvatar(anuncio: AnuncioResponse) {
    return `${anuncio.imagen}`;
  }

  deleteAnuncio() {
    this.anuncioService.deleteAnuncio(this.anuncioInput.id).subscribe(res => {this.anuncioList = res})
    alert('Se ha eliminado correctamente.')
  }

  openEditDialog(anuncio: AnuncioResponse){
    this.dialog.open(AnuncioEditComponent, {height: '400px', width:'800px', data: {id:anuncio.id}})
  }

}
