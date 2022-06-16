import { Component, Input, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { SeccionResponse } from 'src/app/model/interfaces/seccion';
import { SeccionService } from 'src/app/services/seccion.service';
import { SeccionEditComponent } from '../seccion-edit/seccion-edit.component';

@Component({
  selector: 'app-seccion-item',
  templateUrl: './seccion-item.component.html',
  styleUrls: ['./seccion-item.component.css']
})
export class SeccionItemComponent implements OnInit {

  @Input() seccionInput!: SeccionResponse;
  seccionList: SeccionResponse[] | undefined;

  constructor(private seccionService: SeccionService, private dialog: MatDialog) { }

  ngOnInit(): void {
  }

  getAvatar(seccion: SeccionResponse) {
    return `${seccion.imagen}`;
  }

  deleteSeccion(){
    this.seccionService.deleteSeccion(this.seccionInput.id).subscribe(res => {this.seccionList = res})
    alert('Se ha eliminado correctamente.')
    window.location.reload()
  }

  openEditDialog(seccion: SeccionResponse){
    this.dialog.open(SeccionEditComponent, {height: '350px', width:'600px', data: {id:seccion.id}})
  }

}
