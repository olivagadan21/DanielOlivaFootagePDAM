import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthLoginDto } from 'src/app/model/dto/auth.dto';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  loginDto = new AuthLoginDto();

  constructor(private authService: AuthService, private router: Router) { }

  ngOnInit(): void {
  }

  doLogin() {
    this.authService.login(this.loginDto).subscribe(loginResult => {
      localStorage.setItem('token', loginResult.token);
      this.router.navigate(['usuario']);
    });
  }

}
