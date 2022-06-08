import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { TallaResponse } from 'src/app/model/interfaces/talla';
import { TallaService } from 'src/app/services/talla.service';

@Component({
  selector: 'app-talla-list',
  templateUrl: './talla-list.component.html',
  styleUrls: ['./talla-list.component.css']
})
export class TallaListComponent implements OnInit {

  tallas: TallaResponse[] = [];

  constructor(private tallaService: TallaService, private router: Router) { }

  ngOnInit(): void {
    this.tallaService.getTallas().subscribe(results => {this.tallas = results})
  }

  create() {
    return this.router.navigate(['/talla-formulario'])
  }

}
