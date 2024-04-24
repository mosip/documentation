# Mimoto - BFF

Mimoto serves as a Backend for Frontend (BFF) for Inji Web, handling retrieval of default configurations and downloading VCs. It offers essential APIs to Inji Web, facilitates validations, and forwards requests to relevant services.

To support credential issuance from any issuer compatible with the **OpenID4VCI** protocol, Mimoto must be onboarded as an OIDC client. Refer here for more details on how to onboard Mimoto (BFF) as an OIDC client.

Detailed API documentation for Mimoto is accessible [here](https://mosip.stoplight.io/docs/mimoto).

{% hint style="info" %}
Configuration details to set up a new provider that can issue VC, can be found in the `mimoto-issuers-config.json` property file. Refer to [mimoto-issuers-config.json](https://github.com/mosip/mosip-config/blob/collab-old/mimoto-issuers-config.json) of Collab environment.

In `mimoto-issuers-config.json`, new providers can be added as per the well-known schema.
{% endhint %}

### Mimoto endpoints used by Inji Web

Inji Web utilizes the following APIs exposed by Mimoto to fetch issuers, configurations, credential types, and to facilitate downloads.

1. Fetch Issuers:

This API provides data to populate the list of supported issuers in Inji Web, which is then displayed under the "List of Issuers" section on the Home page of Inji Web.

**Note:** Upon passing search issuer, API returns filtered list.

2.  Fetch Issuer's Configuration:

    This API provides issuer configurations such as well-known, token, and authorization endpoints of the issuer.

3\. Search Issuer:

This API filters the issuers based on the search criteria entered in the search bar on the Home page of Inji Web.

4. Fetch Credential Types:

This API fetches the list of Credential Types offered by the issuer, sourced from the well-known configuration of the issuer.\
5\. Search Credential types:

This API filters Credential Types based on the search criteria entered on the Credential Type page in Inji Web. 6. Download PDF:

This API is responsible for generating PDFs for the received VC content. It fetches display properties from the well-known configuration of the issuer and incorporates them into the predefined template of the PDF file.
