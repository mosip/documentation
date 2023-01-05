# Open ID

**What is OpenID Connect?**

OpenID Connect 1.0 is a simple identity layer on top of the OAuth 2.0 protocol. It allows relying party apps to verify the identity of the End-User based on the authentication performed by an Authorization Server, as well as to obtain basic profile information about the End-User in an interoperable and REST-like manner.

OpenID Connect allows clients of all types, including Web-based, mobile, and JavaScript clients, to request and receive information about authenticated sessions and end-users.

Currently, we support only the core functionalities of OpenId Connect to ensure performance at a country scale usage

In OpenID Connect we support only Authorization code flow, as it is most secure way of integration with relying party apps

**Authorization Code Flow**

The Authorization Code Flow returns an Authorization Code to the Client, which can then exchange it for an ID Token and an Access Token directly. This provides the benefit of not exposing any tokens to the User Agent and possibly other malicious applications with access to the User Agent. The Authorization Server can also authenticate the Client before exchanging the Authorization Code for an Access Token.

<OpenID flow diagram>

**Authorization Code Flow Steps**

* Client prepares an Authentication Request containing the desired request parameters.
* Client sends the request to the Authorization Server.
* Authorization Server Authenticates the End-User.
* Authorization Server obtains End-User Consent/Authorization.
* Authorization Server sends the End-User back to the Client with an Authorization Code.
* Client requests a response using the Authorization Code at the Token Endpoint.
* Client receives a response that contains an ID Token and Access Token in the response body.
* Client validates the ID token and retrieves the End-User's Subject Identifier.
<figure><img src="../.gitbook/assets/IdP Diagrams-Page-2 (1).png" alt=""><figcaption></figcaption></figure>
