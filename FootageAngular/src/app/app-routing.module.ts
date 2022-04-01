import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AnuncioListComponent } from './components/anuncio/anuncio-list/anuncio-list.component';
import { LoginComponent } from './components/auth/login/login.component';
import { RegisterComponent } from './components/auth/register/register.component';
import { CategoriaListComponent } from './components/categoria/categoria-list/categoria-list.component';
import { MarcaListComponent } from './components/marca/marca-list/marca-list.component';
import { ProductoListComponent } from './components/producto/producto-list/producto-list.component';
import { SeccionListComponent } from './components/seccion/seccion-list/seccion-list.component';
import { TallaListComponent } from './components/talla/talla-list/talla-list.component';
import { UsuarioListComponent } from './components/usuario/usuario-list/usuario-list.component';

const routes: Routes = [
  {path: '',pathMatch: 'full', redirectTo: '/login'},
  {path: 'login',component:LoginComponent},
  {path: 'register',component:RegisterComponent},
  {path: 'anuncio',component:AnuncioListComponent},
  {path: 'categoria',component:CategoriaListComponent},
  {path: 'marca',component:MarcaListComponent},
  {path: 'producto',component:ProductoListComponent},
  {path: 'seccion',component:SeccionListComponent},
  {path: 'talla',component:TallaListComponent},
  {path: 'usuario',component:UsuarioListComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
