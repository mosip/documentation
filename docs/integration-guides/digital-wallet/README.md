## Digital Wallet Integration

e-Signet provides endpoints to bind a public key to an individual.

{% swagger src=".gitbook/assets/e-Signet.yml" path="/binding/wallet-binding" method="post" %}
[e-Signet.yml](.gitbook/assets/e-Signet.yml)
{% endswagger %}

```mermaid
sequenceDiagram
autonumber
Note over MimotoServer: Binding partner
Wallet-app->>+Wallet-app: Capture auth-challenge (OTP), Generate RSA Key-pair 
Wallet-app->>+MimotoServer: auth-challenge + public-key + individualId 
MimotoServer->>+e-Signet: auth-challenge + public-key + individualId with Bearer token
e-Signet-->>+KeyBinder: auth-challenge + public-key + individualId
KeyBinder-->>-e-Signet: Signed Certificate
e-Signet->>-MimotoServer: Signed Certificate
MimotoServer->>-Wallet-app: Signed Certificate
Wallet-app->>-Wallet-app: Store Signed Certificate with individualId
```

Once the public key is successfully bound to an `individualId`, the server-signed certificate and it's `walletUserId` is returned back to the wallet-app.
Wallet-app should store the certificate in a secure storage mapped with `walletUserId`.

_Note_: Binding multiple VIDs with a public key through a particular binding partner will always return the same `walletUserId`. However, only the latest server-signed certificate is valid.

## How to use a Server-signed certificate?

Server-signed certificate is used in the QR-code login flow of e-Signet.
1. The end user scans the QR code on e-Signet UI using the digital wallet app.
2. Digital wallet app reads the link-code in the scanned QR code.
3. Digital wallet sends request to e-Signet server to start a transaction with the link-code.
   {% swagger src=".gitbook/assets/e-Signet.yml" path="/linked-authorization/link-transaction" method="post" %}
   [e-Signet.yml](.gitbook/assets/e-Signet.yml)
   {% endswagger %}
4. On successful link, e-Signet server responds back with supported list of authentication factors namely WLA(Wallet Local Auth).
5. Digital wallet app, locally authenticates the end user. (Ex: selfie authentication)
6. On successful local verification of end-user, wallet app creates a JWT signed with Certificate bound to the end-user. This signed JWT is sent to the e-Signet server.
   {% swagger src=".gitbook/assets/e-Signet.yml" path="/linked-authorization/authenticate" method="post" %}
   [e-Signet.yml](.gitbook/assets/e-Signet.yml)
   {% endswagger %}
7. Digital wallet captures the end-user consent on sharing his/her data with the relying party.
   {% swagger src=".gitbook/assets/e-Signet.yml" path="/linked-authorization/consent" method="post" %}
   [e-Signet.yml](.gitbook/assets/e-Signet.yml)
   {% endswagger %}
8. e-Signet UI now automatically detects the successful consent on the link-code and redirects the end-user to relying party portal with a authorization code.

_Note_: With 1.0.0, WLA is the only digital wallet supported authentication factor.





