import { Component, Input, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MarcaResponse } from 'src/app/model/interfaces/marca';
import { MarcaService } from 'src/app/services/marca.service';
import { MarcaEditComponent } from '../marca-edit/marca-edit.component';

@Component({
  selector: 'app-marca-item',
  templateUrl: './marca-item.component.html',
  styleUrls: ['./marca-item.component.css']
})
export class MarcaItemComponent implements OnInit {

  @Input() marcaInput!: MarcaResponse;
  marcaList: MarcaResponse[] | undefined;

  constructor(private marcaService: MarcaService, private dialog: MatDialog) { }

  ngOnInit(): void {
  }

  getAvatar(marca: MarcaResponse) {
    return `${marca.imagen}`;
  }

  deleteMarca() {
    this.marcaService.deleteMarca(this.marcaInput.id).subscribe(res => {this.marcaList = res})
    alert('Se ha eliminado correctamente.')
    window.location.reload()
  }

  openEditDialog(marca: MarcaResponse){
    this.dialog.open(MarcaEditComponent, {height: '350px', width:'600px', data: {id:marca.id}})
  }


}
