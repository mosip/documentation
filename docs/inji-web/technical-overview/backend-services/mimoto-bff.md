# Mimoto - BFF

Mimoto serves as a Backend for Frontend (BFF) for Inji Web, handling retrieval of default configurations and downloading VCs. It offers essential APIs to Inji Web, facilitates validations, and forwards requests to relevant services.

To support credential issuance from any issuer compatible with the **OpenID4VCI** protocol, Mimoto must be onboarded as an OIDC client. Refer here for more details on how to onboard Mimoto (BFF) as an OIDC client.

Detailed API documentation for Mimoto is accessible [here](https://mosip.stoplight.io/docs/mimoto).

{% hint style="info" %}
Configuration details to set up a new provider that can issue VC, can be found in the `mimoto-issuers-config.json` property file. Refer to [mimoto-issuers-config.json](https://github.com/mosip/mosip-config/blob/collab-old/mimoto-issuers-config.json) of Collab environment.

In `mimoto-issuers-config.json`, new providers can be added as per the well-known schema.
{% endhint %}


Issuers Listing
When the user lands on the home page of injiweb, he can see the list of issuers, with all the issuers supported, Below issuers list API gives out all the issuers list

user is also provided with the text box to search the issuers, which is passed as query param to filter the issuers

List Issuers : 
{% swagger src="../.gitbook/assets/mimoto (1).json" path="/issuers" method="get" %} mimoto (1).json {% endswagger %}


Fetch Issuers Specific Config : 
{% swagger src="../.gitbook/assets/mimoto (1).json" path="/issuers/{issuer-id}" method="get" %} mimoto (1).json {% endswagger %}

Credential Listing 
When the user clicks on any one of the issuer, he will be redirected to a new page , where he can see all the credentials supported by that specific issuer, Below credential list API gives out all the credentials supported by the issuer 

user is also provided with the text box to search the credentials, which is passed as query param to filter the credentials

List Credentials : 
{% swagger src="../.gitbook/assets/mimoto (1).json" path="/issuers/{issuer-id}/credentialTypes" method="get" %} mimoto (1).json {% endswagger %}


Download Credential as PDF : 
Once the user has authenticated himself, user can invoke the credential download endpoint, which will construct a pdf of the credential and downloads it.

{% swagger src="../.gitbook/assets/mimoto (1).json" path="/issuers/{issuer-id}/credentialTypes/{credentialType}/download" method="get" %} mimoto (1).json {% endswagger %}
