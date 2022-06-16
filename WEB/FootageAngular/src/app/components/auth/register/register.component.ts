import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UsuarioDto } from 'src/app/model/dto/usuario.dto';
import { UsuarioService } from 'src/app/services/usuario.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {

  usuarioA = new UsuarioDto();
  usuarioU = new UsuarioDto();

  constructor(private usuarioService: UsuarioService, private router: Router) { }

  ngOnInit(): void {
  }

  onSubmitA(){
    this.usuarioService.postusuarioAdmin(this.usuarioA).subscribe(res => {this.router.navigate(['/usuario'])})
  }

  list() {
    return this.router.navigate(['/usuario'])
  }

  onSubmitU(){
    this.usuarioService.postusuarioUser(this.usuarioU).subscribe(res => {this.router.navigate(['/usuario'])})
  }

}
