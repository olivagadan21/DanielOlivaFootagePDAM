import { Component, Input, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { TallaResponse } from 'src/app/model/interfaces/talla';
import { TallaService } from 'src/app/services/talla.service';
import { TallaEditComponent } from '../talla-edit/talla-edit.component';

@Component({
  selector: 'app-talla-item',
  templateUrl: './talla-item.component.html',
  styleUrls: ['./talla-item.component.css']
})
export class TallaItemComponent implements OnInit {

  @Input() tallaInput!: TallaResponse;
  tallaList: TallaResponse[] | undefined;

  constructor(private tallaService: TallaService, private dialog: MatDialog) { }

  ngOnInit(): void {
  }

  getAvatar(avatar: string) {
    return `background-image: url('${avatar}'); background-size: cover;`
  }

  deleteTalla() {
    this.tallaService.deleteTalla(this.tallaInput.id).subscribe(res => {this.tallaList = res})
    alert('Se ha eliminado correctamente.')
  }

  openEditDialog(talla: TallaResponse){
    this.dialog.open(TallaEditComponent, {height: '350px', width:'600px', data: {id:talla.id}})
  }

}
