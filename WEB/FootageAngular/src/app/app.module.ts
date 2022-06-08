import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { LoginComponent } from './components/auth/login/login.component';
import { RegisterComponent } from './components/auth/register/register.component';
import { UsuarioItemComponent } from './components/usuario/usuario-item/usuario-item.component';
import { UsuarioListComponent } from './components/usuario/usuario-list/usuario-list.component';
import { ProductoItemComponent } from './components/producto/producto-item/producto-item.component';
import { ProductoListComponent } from './components/producto/producto-list/producto-list.component';
import { SeccionItemComponent } from './components/seccion/seccion-item/seccion-item.component';
import { SeccionListComponent } from './components/seccion/seccion-list/seccion-list.component';
import { CategoriaItemComponent } from './components/categoria/categoria-item/categoria-item.component';
import { CategoriaListComponent } from './components/categoria/categoria-list/categoria-list.component';
import { TallaItemComponent } from './components/talla/talla-item/talla-item.component';
import { TallaListComponent } from './components/talla/talla-list/talla-list.component';
import { MarcaItemComponent } from './components/marca/marca-item/marca-item.component';
import { MarcaListComponent } from './components/marca/marca-list/marca-list.component';
import { AnuncioItemComponent } from './components/anuncio/anuncio-item/anuncio-item.component';
import { AnuncioListComponent } from './components/anuncio/anuncio-list/anuncio-list.component';
import { MaterialImportsModule } from './modules/material-imports.module';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { SideMenuComponent } from './share/side-menu/side-menu.component';
import { AnuncioFormComponent } from './components/anuncio/anuncio-form/anuncio-form.component';
import { CategoriaFormComponent } from './components/categoria/categoria-form/categoria-form.component';
import { MarcaFormComponent } from './components/marca/marca-form/marca-form.component';
import { ProductoFormComponent } from './components/producto/producto-form/producto-form.component';
import { SeccionFormComponent } from './components/seccion/seccion-form/seccion-form.component';
import { TallaFormComponent } from './components/talla/talla-form/talla-form.component';
import { AnuncioEditComponent } from './components/anuncio/anuncio-edit/anuncio-edit.component';
import { CategoriaEditComponent } from './components/categoria/categoria-edit/categoria-edit.component';
import { MarcaEditComponent } from './components/marca/marca-edit/marca-edit.component';
import { ProductoEditComponent } from './components/producto/producto-edit/producto-edit.component';
import { SeccionEditComponent } from './components/seccion/seccion-edit/seccion-edit.component';
import { TallaEditComponent } from './components/talla/talla-edit/talla-edit.component';
import { UsuarioEditComponent } from './components/usuario/usuario-edit/usuario-edit.component';
import { ProductoDialogComponent } from './dialogs/producto-dialog/producto-dialog.component';
import { UsuarioDialogComponent } from './dialogs/usuario-dialog/usuario-dialog.component';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    RegisterComponent,
    UsuarioItemComponent,
    UsuarioListComponent,
    ProductoItemComponent,
    ProductoListComponent,
    SeccionItemComponent,
    SeccionListComponent,
    CategoriaItemComponent,
    CategoriaListComponent,
    TallaItemComponent,
    TallaListComponent,
    MarcaItemComponent,
    MarcaListComponent,
    AnuncioItemComponent,
    AnuncioListComponent,
    SideMenuComponent,
    AnuncioFormComponent,
    CategoriaFormComponent,
    MarcaFormComponent,
    ProductoFormComponent,
    SeccionFormComponent,
    TallaFormComponent,
    AnuncioEditComponent,
    CategoriaEditComponent,
    MarcaEditComponent,
    ProductoEditComponent,
    SeccionEditComponent,
    TallaEditComponent,
    UsuarioEditComponent,
    ProductoDialogComponent,
    UsuarioDialogComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MaterialImportsModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
