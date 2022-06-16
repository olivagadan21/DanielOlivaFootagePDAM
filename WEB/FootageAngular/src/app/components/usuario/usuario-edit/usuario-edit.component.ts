import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { DialogData } from 'src/app/dialogs/usuario-dialog/usuario-dialog.component';
import { UsuarioDto } from 'src/app/model/dto/usuario.dto';
import { UsuarioResponse } from 'src/app/model/interfaces/usuario';
import { UsuarioService } from 'src/app/services/usuario.service';

@Component({
  selector: 'app-usuario-edit',
  templateUrl: './usuario-edit.component.html',
  styleUrls: ['./usuario-edit.component.css']
})
export class UsuarioEditComponent implements OnInit {

  usuario = new UsuarioDto()
  usuarioResponse!: UsuarioResponse

  constructor(private usuarioService:UsuarioService, @Inject(MAT_DIALOG_DATA) private data: DialogData) { }

  ngOnInit(): void {
    this.usuarioService.getUsuario(this.data.id).subscribe(a=>{
      this.usuario.nombre = a.nombre
      this.usuario.apellidos = a.apellidos
      this.usuario.username = a.username
      this.usuario.localizacion = a.localizacion
      this.usuario.avatar = a.avatar
      this.usuario.premium = a.premium
    })
  }

  onSubmit(){
    this.usuarioService.editUsuario(this.usuario, this.data.id).subscribe(res=>{this.usuarioResponse=res})
    window.location.reload()
  }

}
