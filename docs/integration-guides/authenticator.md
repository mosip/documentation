# Authenticator Plugin

Authenticator plugin is the main interface for eSignet which provides methods to authenticate the end-user with control of the supported authentication factors.

For example, if OTP is one of the supported authentication factors, the interface provides a methods to,

* Define the supported OTP channels,
* Implement the send-OTP functionality and
* A method to share a list of certificates used for verifying user data published at [_/.well-known/jwks.json_](../build-and-deploy/configuration/.well-known/jwks.json.md), as per OIDC standards.

Below is the eSignet authenticator interface,

```java
public interface Authenticator {

    /**
     * Delegate request to authenticate the user, and get KYC token
     * @param relyingPartyId relying Party (RP) ID. This ID will be provided during partner self registration process
     * @param clientId OIDC client Id. Auto generated while creating OIDC client in PMS
     * @param kycAuthDto
     * @return KYC Token and Partner specific User Token (PSUT)
     * @throws KycAuthException
     */
    KycAuthResult doKycAuth(String relyingPartyId, String clientId, KycAuthDto kycAuthDto)
            throws KycAuthException;

    /**
     * Delegate request to exchange KYC token with encrypted user data
     * @param relyingPartyId relying Party (RP) ID. This ID will be provided during partner self registration process
     * @param clientId OIDC client Id. Auto generated while creating OIDC client in PMS
     * @param kycExchangeDto
     * @return signed and encrypted kyc data.
     * @throws KycExchangeException
     */
    KycExchangeResult doKycExchange(String relyingPartyId, String clientId, KycExchangeDto kycExchangeDto)
            throws KycExchangeException;

    /**
     * Delegate request to send out OTP to provided individual Id on the configured channel
     * @param relyingPartyId relying Party (RP) ID. This ID will be provided during partner self registration process
     * @param clientId OIDC client Id. Auto generated while creating OIDC client in PMS
     * @param sendOtpDto
     * @return status of send otp response.
     * @throws SendOtpException
     */
    SendOtpResult sendOtp(String relyingPartyId, String clientId, SendOtpDto sendOtpDto)
            throws SendOtpException;

    /**
     * supported OTP channel to validate in Send-otp request.
     * @return true if supported, otherwise false
     */
    boolean isSupportedOtpChannel(String channel);

    /**
     * Get list of KYC signing certificate and its details.
     * @return list of certificates
     */
    List<KycSigningCertificateData> getAllKycSigningCertificates() throws KycSigningCertificateException;
}
```

{% hint style="info" %}
For the latest version of the interface please check our code base - [Authenticator.java](https://github.com/mosip/esignet/blob/master/esignet-integration-api/src/main/java/io/mosip/esignet/api/spi/Authenticator.java)
{% endhint %}

## Who uses this plugin?

Authenticator plugin is implemented by [Identity Systems](../glossary.md#identity-systems) that want to integrate with eSignet and expose endpoints for the above interfaces.

## How to implement this plugin?

The Authenticator implementation class must be annotated with `ConditionalOnProperty` with `mosip.esignet.integration.authenticator` property.

Below is an example of how our [Mock Identity System](https://github.com/mosip/esignet-mock-services/tree/master/mock-identity-system) has implemented the eSignet Authenticator plugin.

```java
@ConditionalOnProperty(value = "mosip.esignet.integration.authenticator", havingValue = "mock-authentication-service")
@Component
@Slf4j
public class MockAuthenticationService implements Authenticator {
    //Implement authenticator methods
}
```

## Appendix - KYC Auth and Exchange

The two main functionalities of the authenticator interface, **KYC Auth** and **KYC Exchange,** are depicted in the diagram below:

<figure><img src="../.gitbook/assets/activity-diagrams-authenticator (1).png" alt=""><figcaption></figcaption></figure>
