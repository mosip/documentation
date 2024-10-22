# eSignet - Authentication Layer

**eSignet** provides a user-friendly and efficient method for individuals to authenticate themselves and a access online services. Serving as a dependable identity provider for relying party applications, it grants access to services without requiring additional login credentials. eSignet also provides a secure means of verifying an individual's identity against trusted identity providers, such as national identity databases, driver's license systems, passport systems, or other trusted sources. The level of assurance here is determined by the authentication factor employed. To know more about eSignet, click [here](https://docs.esignet.io/).

Let's explore how eSignet integrates with Inji Web and provides authentication solutions for the download workflow as follows:

### Download VC

* The User navigates to the `Home page of the Inji web application` and selects an issuer and credential type
* Next, the authentication page is displayed which is the interface provided by eSignet.
* The user enters the required information, such as Policy Number, Name, and Date of Birth. Subsequently, the system gets redirected back to Mimoto to add a client\_id and generate a key pair, initiating the request to download the credential
* Once Mimoto provides the response with the client\_id and key, the credential endpoint of the issuer is invoked to get the credentials

### Credential endpoint

Once the access token is received via the token endpoint from eSignet, Mimoto invokes this endpoint to obtain the Verifiable Credential.

**Note**: The endpoint attribute is present in the issuer's well-known configuration.

{% swagger src="../../../../.gitbook/assets/Identity-Provider.yaml" path="/vci/credential" method="post" %}
[Identity-Provider.yaml](../../../../.gitbook/assets/Identity-Provider.yaml)
{% endswagger %}
