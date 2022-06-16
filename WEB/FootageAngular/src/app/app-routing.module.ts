import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AnuncioFormComponent } from './components/anuncio/anuncio-form/anuncio-form.component';
import { AnuncioListComponent } from './components/anuncio/anuncio-list/anuncio-list.component';
import { LoginComponent } from './components/auth/login/login.component';
import { RegisterComponent } from './components/auth/register/register.component';
import { CategoriaFormComponent } from './components/categoria/categoria-form/categoria-form.component';
import { CategoriaListComponent } from './components/categoria/categoria-list/categoria-list.component';
import { MarcaFormComponent } from './components/marca/marca-form/marca-form.component';
import { MarcaListComponent } from './components/marca/marca-list/marca-list.component';
import { ProductoFormComponent } from './components/producto/producto-form/producto-form.component';
import { ProductoListComponent } from './components/producto/producto-list/producto-list.component';
import { SeccionFormComponent } from './components/seccion/seccion-form/seccion-form.component';
import { SeccionListComponent } from './components/seccion/seccion-list/seccion-list.component';
import { TallaFormComponent } from './components/talla/talla-form/talla-form.component';
import { TallaListComponent } from './components/talla/talla-list/talla-list.component';
import { UsuarioListComponent } from './components/usuario/usuario-list/usuario-list.component';
import { SideMenuComponent } from './share/side-menu/side-menu.component';

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
  {path: 'usuario',component:UsuarioListComponent},
  {path: 'anuncio-formulario',component:AnuncioFormComponent},
  {path: 'categoria-formulario',component:CategoriaFormComponent},
  {path: 'marca-formulario',component:MarcaFormComponent},
  {path: 'producto-formulario',component:ProductoFormComponent},
  {path: 'seccion-formulario',component:SeccionFormComponent},
  {path: 'talla-formulario',component:TallaFormComponent},
  {path: 'side-menu', component:SideMenuComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
