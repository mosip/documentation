# Guidelines

Guidelines to implement Authorization and Authentication techniques in the Angular application are detailed in this document.

Before going in to the components let us discuss the following flows of Authorization and Authentication.

### Authentication flow:

1. Initially a login request is made passing user credentials to a REST API as specified in the SPECS of that API.
2. In the response of a successful authentication you will receive user details and an auth_token as the value of the header **"Authorization"**.
3. Now the received auth token has to be stored and re-used. For example let us use sessionStorage to store the auth_token under the key "TOKEN".
4. Now any kind of HTTP/HTTPS requests we make from the application has to be sent by adding a header **"Authorization"** and value of auth_token stored in sessionStorage with key by name "Token" for the purpose of authentication.
5. If the response comes back with a new token which might be because of previous token getting expired or refresh token mechanisms that happen in the backend, we need to replace the old token with the new one in the session storage.

### Authorization flow:

1. After successful login the user details are sent to the client(Angular application/ Browser).
2. Now store the userDetails in the sessionStorage for example under the key "UserDetails".
3. Now we need to hide some pages/components/user action elements etc. based on the roles that the user possess.

### Implementation of above flows:

To implement the Authentication and Authorization flows mentioned above, all we need to do is implement an Interceptor and a Directive which were mentioned above and detailed below.

## Http Interceptor

Tasks to be implemented in a Client/UI Http interceptor are:

1. Append **"Authorization"** header to the request using the token value stored in the session storage.
2. Replace/Add the session storage token value with the one received in the response **"Authorization"** headers.

Below code implements the requirements mentioned above:

```JS
import { Injectable } from '@angular/core';
import { HttpInterceptor, HttpRequest, HttpHandler, HttpResponse, HttpEvent, HttpEventType } from '@angular/common/http';
import { Observable } from 'rxjs';
import { map, catchError, tap } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})

export class InterceptService implements HttpInterceptor {
  constructor() { }

  intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    const token = sessionStorage.getItem('TOKEN');
    if (token) {
      request = request.clone({
        setHeaders: {
          'Authorization': token
        }
      });
    }

    return next.handle(request).pipe(tap(event => {
      if (event instanceof HttpResponse) {
        const receivedToken = event.headers.get('Authorization');
        if (receivedToken) {
          sessionStorage.setItem('TOKEN', receivedToken);
        }
      }
    }, err => {
      console.log(err);
    }));
  }
}
```

## Roles Directive

Role of the Roles directive is to fetch roles from UserDetails stored in the session storage and verify if the user has required roles to perform some action or read some details and restrict access accordingly.

Below code implements the requirements mentioned above:

```JS
import { Directive, TemplateRef, ViewContainerRef, Input, ElementRef } from '@angular/core';

@Directive({
  selector: '[appRole]'
})

export class RoleDirective {
  userRolesString: any;
  userRoles: Array<string>;
  shouldDisplay = false;
  requiredRoles: Array<string>;

  constructor(private element: ElementRef) { }

  @Input() set appRole(roles: string) {
    this.element.nativeElement.hidden = true;
    const userSessionData = sessionStorage.getItem('UserDetails');
    this.userRolesString = JSON.parse(userSessionData).role;
    this.userRoles = this.userRolesString.split(',');
    this.requiredRoles = roles.split(',');
    this.shouldDisplay = this.userRoles.some(v => this.requiredRoles.indexOf(v) !== -1);
    if (this.shouldDisplay) {
      this.element.nativeElement.hidden = false;
    }
  }
}

```

Now inject the above interceptor and directive in the app.module.ts as follows

```JS
@NgModule({
  declarations: [ RoleDirective, ...],
  imports: [...],
  providers: [{
    provide: HTTP_INTERCEPTORS,
    useClass: InterceptService,
    multi: true
  }, ...],
  bootstrap: [AppComponent]
})
```

To activate/deactivate => show/hide element all we need to do is add the appRole attribute to the HTML element as shown below:

```HTML
<button class="btn btn-success" appRole="DIVISION_ADMIN,SUPERVISOR">Add</button>
```

In the above sample, the add button will only be visible for users with DIVISION_ADMIN or SUPERVISOR role.

**Note:** Above mentioned code snippets are not the final implementations. Based on the API spec's and few other factors the method implementations might change a bit. But the component structures remain the same.