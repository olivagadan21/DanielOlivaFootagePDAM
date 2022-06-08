import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { DialogData } from 'src/app/dialogs/usuario-dialog/usuario-dialog.component';
import { AnuncioDto } from 'src/app/model/dto/anuncio.dto';
import { AnuncioResponse } from 'src/app/model/interfaces/anuncio';
import { AnuncioService } from 'src/app/services/anuncio.service';

@Component({
  selector: 'app-anuncio-edit',
  templateUrl: './anuncio-edit.component.html',
  styleUrls: ['./anuncio-edit.component.css']
})
export class AnuncioEditComponent implements OnInit {

  anuncio = new AnuncioDto();
  anuncioResponse!: AnuncioResponse;

  constructor(private anuncioService: AnuncioService, @Inject(MAT_DIALOG_DATA) private data: DialogData) { }

  ngOnInit(): void {
    this.anuncioService.getAnuncio(this.data.id).subscribe(a => {
      this.anuncio.empresa = a.empresa,
      this.anuncio.url = a.url
    })
  }

  onSubmit() {
    this.anuncioService.editAnuncio(this.anuncio, this.data.id).subscribe(res => {this.anuncioResponse = res})
    window.location.reload();
  }

}
