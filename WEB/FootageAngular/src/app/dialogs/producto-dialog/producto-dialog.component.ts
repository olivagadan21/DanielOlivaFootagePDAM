import { Component, Inject, OnInit } from '@angular/core';
import { MatDialog, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { ProductoResponse } from 'src/app/model/interfaces/producto';
import { ProductoService } from 'src/app/services/producto.service';
import { UsuarioDialogComponent } from '../usuario-dialog/usuario-dialog.component';

export interface DialogData{
  id: number
}

@Component({
  selector: 'app-producto-dialog',
  templateUrl: './producto-dialog.component.html',
  styleUrls: ['./producto-dialog.component.css']
})
export class ProductoDialogComponent implements OnInit {

  producto!: ProductoResponse;

  constructor(@Inject(MAT_DIALOG_DATA) private data: DialogData, private productoService: ProductoService, private dialog: MatDialog) { }

  ngOnInit(): void {
    this.productoService.getProducto(this.data.id).subscribe(res => {this.producto = res})
  }

  openDialog(id: number){
    this.dialog.open(UsuarioDialogComponent, {height: '750px', width:'1100px', data: {id:id}})
  }

}
