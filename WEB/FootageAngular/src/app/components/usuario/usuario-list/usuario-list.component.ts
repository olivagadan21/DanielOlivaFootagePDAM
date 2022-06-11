import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UsuarioResponse } from 'src/app/model/interfaces/usuario';
import { UsuarioService } from 'src/app/services/usuario.service';

@Component({
  selector: 'app-usuario-list',
  templateUrl: './usuario-list.component.html',
  styleUrls: ['./usuario-list.component.css']
})
export class UsuarioListComponent implements OnInit {

  usuarios: UsuarioResponse[] = [];

  constructor(private usuarioService: UsuarioService, private router: Router) { }

  ngOnInit(): void {
    this.usuarioService.getUsuarios().subscribe(results => {this.usuarios = results})
  }

  create() {
    return this.router.navigate(['/register'])
  }

  user() {
    this.usuarioService.getUsuariosUser().subscribe(res=>{this.usuarios=res})
    window.location.reload
  }

  admin() {
    this.usuarioService.getUsuariosAdmin().subscribe(res=>{this.usuarios=res})
    window.location.reload
  }

  all() {
    this.usuarioService.getUsuarios().subscribe(results => {this.usuarios = results})
    window.location.reload
  }

}
