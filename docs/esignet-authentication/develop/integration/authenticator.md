# Authenticator Plugin

The Authenticator plugin is the main interface for eSignet, which provides methods to authenticate the end-user with control of the supported authentication factors and a method to fetch consented user information from the Identity system.

The two main functionalities of the authenticator interface, **KYC Auth** and **KYC Exchange,** are depicted in the below diagram

<figure><img src="../../../.gitbook/assets/activity-diagrams-authenticator (1).png" alt=""><figcaption></figcaption></figure>

For eSignet Authentication Interface refer to the [Link](https://github.com/mosip/esignet/blob/v1.5.1/esignet-integration-api/src/main/java/io/mosip/esignet/api/spi/Authenticator.java)

## Who should implement the Authenticator plugin interface?

The authenticator plugin is implemented by [Identity Systems](../../../general/glossary.md#identity-systems), which wishes to integrate with eSignet to leverage the digital usage of identities.

An Identity system can be as simple as a table in a database or an Excel file storing user identity data or it can be a complex Identity System.

Below is an example of how our [mock-plugin](https://github.com/mosip/esignet-plugins/blob/master/mock-plugin/src/main/java/io/mosip/esignet/plugin/mock/service/MockAuthenticationService.java) has implemented the eSignet Authenticator plugin to integrate eSignet with mock-identity-system.

Also, look at the [MOSIP plugin](https://github.com/mosip/esignet-plugins/blob/master/mosip-identity-plugin/src/main/java/io/mosip/esignet/plugin/mosipid/service/IdaAuthenticatorImpl.java) implemented to integrate eSignet with the MOSIP identity system.

It is expected to throw either KycAuthException or KycExchangeException with an appropriate error code, instead of returning null or empty responses.

Method to fetch KYC signing certificates: KYC data returned in the KYCExchange method can either be a simple signed JWT or a JWE.

In case of a signed JWT, the keys used to sign the KYC JWT should be published through the eSignet jwks.json well-known endpoint for the replying parties to verify the signed JWT.

List\<KycSigningCertificateData> getAllKycSigningCertificates() throws KycSigningCertificateException;

```
```java
/**
 * Retrieves all KYC signing certificates.
 *
 * @return a list of KycSigningCertificateData objects representing the signing certificates.
 * @throws KycSigningCertificateException if there is an error fetching the certificates.
 */
List<KycSigningCertificateData> getAllKycSigningCertificates() throws KycSigningCertificateException;
```
```
