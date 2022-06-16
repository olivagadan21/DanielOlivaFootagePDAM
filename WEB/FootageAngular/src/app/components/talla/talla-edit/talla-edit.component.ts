import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { DialogData } from 'src/app/dialogs/usuario-dialog/usuario-dialog.component';
import { TallaDto } from 'src/app/model/dto/talla.dto';
import { TallaResponse } from 'src/app/model/interfaces/talla';
import { TallaService } from 'src/app/services/talla.service';

@Component({
  selector: 'app-talla-edit',
  templateUrl: './talla-edit.component.html',
  styleUrls: ['./talla-edit.component.css']
})
export class TallaEditComponent implements OnInit {

  talla = new TallaDto()
  tallaResponse!:TallaResponse
  
  constructor(private tallaService:TallaService, @Inject(MAT_DIALOG_DATA) private data: DialogData) { }

  ngOnInit(): void {
    this.tallaService.getTalla(this.data.id).subscribe(a=>{
      this.talla.nombre = a.nombre
    })
  }

  onSubmit(){
    this.tallaService.editTalla(this.talla, this.data.id).subscribe(res=>{this.tallaResponse=res})
    window.location.reload()
  }

}
