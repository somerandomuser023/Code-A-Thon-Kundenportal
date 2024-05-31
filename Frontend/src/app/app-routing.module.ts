import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AccountComponent } from './Account/Account.component';
import { LoginComponent } from './Login/Login.component';
import { MessagesComponent } from './Messages/Messages.component';
import { AssetsComponent } from './Assets/Assets.component';
import { AuthGuard } from '../app/auth.guard';
import { CookiePopupComponent } from './CookiePopup/CookiePopup.component';

const routes: Routes = [
  { path: '', redirectTo: '/login', pathMatch: 'full' },
  {
    path: 'login',
    component: LoginComponent,
  },
  {
    path: 'account',
    component: AccountComponent,
  },
  {
    path: 'messages',
    component: MessagesComponent,
  },
  {
    path: 'assets',
    component: AssetsComponent,
    canActivate: [AuthGuard],
  },
  {
    path: 'cookiePopup',
    component: CookiePopupComponent,
  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
