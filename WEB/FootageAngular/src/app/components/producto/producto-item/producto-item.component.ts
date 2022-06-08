import { Component, Input, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { ProductoDialogComponent } from 'src/app/dialogs/producto-dialog/producto-dialog.component';
import { ProductoResponse } from 'src/app/model/interfaces/producto';
import { ProductoService } from 'src/app/services/producto.service';
import { ProductoEditComponent } from '../producto-edit/producto-edit.component';

@Component({
  selector: 'app-producto-item',
  templateUrl: './producto-item.component.html',
  styleUrls: ['./producto-item.component.css']
})
export class ProductoItemComponent implements OnInit {

  @Input() productoInput!: ProductoResponse;
  productoList: ProductoResponse[] | undefined;

  constructor(private productoService: ProductoService, private dialog: MatDialog) { }

  ngOnInit(): void {
  }

  getAvatar(avatar: string) {
    return `background-image: url('${avatar}'); background-size: cover;`
  }

  getAvatar2(producto: ProductoResponse) {
    return `${producto.foto}`;
  }

  deleteProducto(){
    this.productoService.deleteProducto(this.productoInput.id).subscribe(res => {this.productoList = res})
    alert('Se ha eliminado correctamente.')
  }

  openDialog(id: number){
    this.dialog.open(ProductoDialogComponent, {height: '750px', width:'1100px', data: {id:id}})
  }

  openEditDialog(producto: ProductoResponse){
    this.dialog.open(ProductoEditComponent, {height: '850px', width:'1200px', data: {id:producto.id}})
  }

}
