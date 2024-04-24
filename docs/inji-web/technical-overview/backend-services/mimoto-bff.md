# Mimoto - BFF

Mimoto serves as a Backend for Frontend (BFF) for Inji Web, handling retrieval of default configurations and downloading VCs. It offers essential APIs to Inji Web, facilitates validations, and forwards requests to relevant services.

To support credential issuance from any issuer compatible with the **OpenID4VCI** protocol, Mimoto must be onboarded as an OIDC client. Refer here for more details on how to onboard Mimoto (BFF) as an OIDC client.

Detailed API documentation for Mimoto is accessible [here](https://mosip.stoplight.io/docs/mimoto).

{% hint style="info" %}
Configuration details to set up a new provider that can issue VC, can be found in the `mimoto-issuers-config.json` property file. Refer to [mimoto-issuers-config.json](https://github.com/mosip/mosip-config/blob/collab-old/mimoto-issuers-config.json) of Collab environment.

In `mimoto-issuers-config.json`, new providers can be added as per the well-known schema.
{% endhint %}


