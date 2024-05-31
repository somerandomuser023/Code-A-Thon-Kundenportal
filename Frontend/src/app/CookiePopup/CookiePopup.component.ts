import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-CookiePopup',
  templateUrl: './CookiePopup.component.html',
  styleUrls: ['./CookiePopup.component.scss'],
})
export class CookiePopupComponent implements OnInit {
  constructor() {
    var myModal = document.getElementById('myModal');
    var myInput = document.getElementById('myInput');

    myModal?.addEventListener('shown.bs.modal', function () {
      myInput?.focus();
    });
  }

  ngOnInit() {}
}
