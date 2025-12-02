# Claims

## **What are Claims?**

In the context of authentication and authorization, **claims** are statements about an entity, such as a user, made by an **identity provider (IdP)**. Claims describe **attributes, characteristics, or other properties** associated with an entity.

## **How Claims are Used**

Claims are typically packaged into **security tokens**, such as SAML (Security Assertion Markup Language) tokens or JWTs (JSON Web Tokens). They convey information about the entity's **identity** and **associated permissions**.

## **Importance of Claims**

Claims are essential for implementing **authentication and authorization processes**. Relying parties (e.g., web applications) examine these claims to determine:

* Whether the user should be granted access
* The level of access the user should receive

Claims-based authentication and authorization provide a **flexible and standardized** approach to identity and access management across applications and services.

{% hint style="info" %}
The **assurance level** is shared with the relying party as one of the claims in the ID token. In summary, a claim is a **piece of asserted information about the authorized end-user**.
{% endhint %}

## Essential and Voluntary Claims <a href="#essential-and-voluntary-claims" id="essential-and-voluntary-claims"></a>

### **Essential Claims**

Necessary user information that the relying party **must collect** to fulfill service obligations to residents.

### **Voluntary Claims**

Additional user details that residents may choose to provide, enabling access to **supplementary features** offered by the relying party.

### Standard OIDC User Claims Supported <a href="#standard-oidc-user-claims-supported" id="standard-oidc-user-claims-supported"></a>

When eSignet is integrated with MOSIP IDA, the following standard OIDC user claims are supported:

* `name`
* `gender`
* `address`
* `birthdate`
* `email`
* `phone_number`
* `picture`

{% hint style="info" %}
**Note:** The list of supported claims is given out in the [_**openid-configuration .well-known**_](.well-known/openid-configuration.md) endpoint.
{% endhint %}

### Supported Values in Application Properties <a href="#supported-values-in-application-properties" id="supported-values-in-application-properties"></a>

The following properties in `application-default.properties` hold the supported values:

```properties
mosip.esignet.discovery.key-values=

mosip.esignet.openid.scope.claims=
```
