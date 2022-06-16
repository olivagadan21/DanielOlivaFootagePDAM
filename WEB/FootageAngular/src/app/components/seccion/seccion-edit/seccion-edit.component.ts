import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { DialogData } from 'src/app/dialogs/usuario-dialog/usuario-dialog.component';
import { SeccionDto } from 'src/app/model/dto/seccion.dto';
import { SeccionResponse } from 'src/app/model/interfaces/seccion';
import { SeccionService } from 'src/app/services/seccion.service';

@Component({
  selector: 'app-seccion-edit',
  templateUrl: './seccion-edit.component.html',
  styleUrls: ['./seccion-edit.component.css']
})
export class SeccionEditComponent implements OnInit {

  seccion = new SeccionDto()
  seccionResponse!: SeccionResponse

  constructor(private seccionService: SeccionService, @Inject(MAT_DIALOG_DATA) private data: DialogData) { }

  ngOnInit(): void {
    this.seccionService.getSeccion(this.data.id).subscribe(a=>{
      this.seccion.nombre = a.nombre
    })
  }

  onSubmit() {
    this.seccionService.editSeccion(this.seccion, this.data.id).subscribe(res=>{this.seccionResponse=res})
    window.location.reload()
  }

}
