# Authenticator Plugin

The Authenticator plugin is the main interface for eSignet, which provides methods to authenticate the end-user with control of the supported authentication factors.

The two main functionalities of the authenticator interface, **KYC Auth** and **KYC Exchange,** are depicted in the below diagram

<figure><img src="../.gitbook/assets/activity-diagrams-authenticator (1).png" alt=""><figcaption></figcaption></figure>

Below is the eSignet authenticator interface,

```java
public interface Authenticator {

    /**
     * Delegate request to authenticate the user, and get KYC token
     * @param relyingPartyId Relying Party (RP) ID. This ID will be provided during the partner self registration process
     * @param clientId OIDC client Id. Auto-generated while creating OIDC client in PMS
     * @param kycAuthDto
     * @return KYC Token and Partner-specific User Token (PSUT)
     * @throws KycAuthException
     */
    KycAuthResult doKycAuth(String relyingPartyId, String clientId, KycAuthDto kycAuthDto)
            throws KycAuthException;

    /**
     * Delegate request to exchange KYC token with encrypted user data
     * @param relyingPartyId Relying Party (RP) ID. This ID will be provided during partner self registration process
     * @param clientId OIDC client Id. Auto-generated while creating OIDC client in PMS
     * @param kycExchangeDto
     * @return signed and encrypted KYC data.
     * @throws KycExchangeException
     */
    KycExchangeResult doKycExchange(String relyingPartyId, String clientId, KycExchangeDto kycExchangeDto)
            throws KycExchangeException;

    /**
     * Delegate request to send out OTP to provided individual ID on the configured channel
     * @param relyingPartyId Relying Party (RP) ID. This ID will be provided during partner self registration process
     * @param clientId OIDC client Id. Auto-generated while creating OIDC client in PMS
     * @param sendOtpDto
     * @return status of send OTP response.
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
     * Get the list of KYC signing certificates and their details.
     * List of certificates used for verifying KYC JWT will be published in /.well-known/jwks.json, as per OIDC standards
     * @return list of certificates
     */
    List<KycSigningCertificateData> getAllKycSigningCertificates() throws KycSigningCertificateException;
}
```

{% hint style="info" %}
For the latest version of the interface please check our code base - [Authenticator.java](https://github.com/mosip/esignet/blob/master/esignet-integration-api/src/main/java/io/mosip/esignet/api/spi/Authenticator.java)
{% endhint %}


## Who should implement Authenticator plugin interface?

The authenticator plugin is implemented by [Identity Systems](../glossary.md#identity-systems) that wish to integrate with eSignet to leverage the digital usage of identities.

An Identity system can be as simple as a table in a database or an Excel file storing user identity data, or can be a complex Identity System.


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

For example, if OTP is one of the supported authentication factors in your identity system, authenticator interface provides method to,

* Define the supported OTP channels,
* Implement the send-OTP functionality

If the identity system does not support OTP based authentication then you could throw exception with appropriate error code.

```java    
    SendOtpResult sendOtp(String relyingPartyId, String clientId, SendOtpDto sendOtpDto) {
        throw new SendOtpException("not_supported");
    }

    boolean isSupportedOtpChannel(String channel) {
        return false;
    }
```

And also configure eSignet to expose only supported auth factors in the well-known endpoint.





