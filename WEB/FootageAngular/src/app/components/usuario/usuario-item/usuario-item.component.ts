import { Component, Input, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { UsuarioDialogComponent } from 'src/app/dialogs/usuario-dialog/usuario-dialog.component';
import { UsuarioResponse } from 'src/app/model/interfaces/usuario';
import { UsuarioService } from 'src/app/services/usuario.service';
import { UsuarioEditComponent } from '../usuario-edit/usuario-edit.component';

@Component({
  selector: 'app-usuario-item',
  templateUrl: './usuario-item.component.html',
  styleUrls: ['./usuario-item.component.css']
})
export class UsuarioItemComponent implements OnInit {

  @Input() usuarioInput!: UsuarioResponse;
  usuarioList: UsuarioResponse[] | undefined;

  constructor(private usuarioService: UsuarioService, private router: Router, private dialog: MatDialog) { }

  ngOnInit(): void {
  }

  getAvatar(usuario: UsuarioResponse) {
    return `${usuario.avatar}`;
  }

  deleteUsuario() {
    this.usuarioService.deleteUsuario(this.usuarioInput.id).subscribe(res => {this.usuarioList = res})
    alert('Se ha eliminado correctamente.')
  }

  openDialog(id: number){
    this.dialog.open(UsuarioDialogComponent, {height: '750px', width:'1100px', data: {id:id}})
  }

  openEditDialog(usuario: UsuarioResponse){
    this.dialog.open(UsuarioEditComponent, {height: '800px', width:'1000px', data: {id:usuario.id}})
  }

}
