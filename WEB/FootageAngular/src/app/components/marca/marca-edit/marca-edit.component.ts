import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { DialogData } from 'src/app/dialogs/usuario-dialog/usuario-dialog.component';
import { MarcaDto } from 'src/app/model/dto/marca.dto';
import { MarcaResponse } from 'src/app/model/interfaces/marca';
import { MarcaService } from 'src/app/services/marca.service';

@Component({
  selector: 'app-marca-edit',
  templateUrl: './marca-edit.component.html',
  styleUrls: ['./marca-edit.component.css']
})
export class MarcaEditComponent implements OnInit {

  marca = new MarcaDto()
  marcaResponse!: MarcaResponse

  constructor(private marcaService: MarcaService, @Inject(MAT_DIALOG_DATA) private data: DialogData) { }

  ngOnInit(): void {
    this.marcaService.getMarca(this.data.id).subscribe(a=>{
      this.marca.nombre = a.nombre
    })
  }

  onSubmit() {
    this.marcaService.editMarca(this.marca, this.data.id).subscribe(res=>{this.marcaResponse=res})
    window.location.reload()
  }

}
