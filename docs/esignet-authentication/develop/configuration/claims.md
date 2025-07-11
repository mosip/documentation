# Claims

In the context of authentication and authorization, **claims** are statements about an entity, such as a user, that are made by an identity provider (IdP). Claims are pieces of information that describe attributes, characteristics, or other properties associated with an entity.

These claims are typically packaged into security tokens, such as SAML (Security Assertion Markup Language) tokens or JWTs (JSON Web Tokens) and are used to convey information about the entity's identity and associated permissions.

Claims are essential for implementing authentication and authorization processes. Relying parties (e.g., web applications) can examine these claims to determine whether the user should be granted access and what level of access they should receive. Claims-based authentication and authorization provide a flexible and standardized way to handle identity and access management in a wide range of applications and services.

The assurance level is then shared with the relying party as one of the claims in the ID token. To summarize, it is a piece of asserted information about the authorized end-user.

Let us understand the terms essential and voluntary claims.

**Essential claims:** These refer to the necessary user information that the relying party must collect in order to fulfill their service obligations to the residents.

**Voluntary claims:** These are additional user details that residents have the option to provide, in order to access supplementary features offered by the relying party.

Below is the list of standard OIDC user claims supported when eSignet is integrated with MOSIP IDA:

* name
* gender
* address
* birthdate
* email
* phone\_number
* picture

{% hint style="info" %}
**Note:** The list of supported claims is given out in the _**openid-configuration .well-known**_ endpoint.
{% endhint %}

The below properties in the _**application-default.properties**_ hold the supported values:

```properties
mosip.esignet.discovery.key-values=

mosip.esignet.openid.scope.claims=
```
