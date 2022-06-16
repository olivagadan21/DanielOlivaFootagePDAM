import { Component, Inject, OnInit } from '@angular/core';
import { MatDialog, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { UsuarioResponse } from 'src/app/model/interfaces/usuario';
import { UsuarioService } from 'src/app/services/usuario.service';

export interface DialogData{
  id: number
}

@Component({
  selector: 'app-usuario-dialog',
  templateUrl: './usuario-dialog.component.html',
  styleUrls: ['./usuario-dialog.component.css']
})
export class UsuarioDialogComponent implements OnInit {

  usuario!: UsuarioResponse

  constructor(@Inject(MAT_DIALOG_DATA) private data: DialogData, private usuarioService: UsuarioService, private dialog: MatDialog) { }

  ngOnInit(): void {
    this.usuarioService.getUsuario(this.data.id).subscribe(res => {this.usuario = res})
  }

}
