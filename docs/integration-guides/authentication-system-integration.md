# Authentication System

## Overview

This system is an identity repository that stores the individual's demographic and biometric information to perform authentication and provide user information.

As part of this integration with e-Signet, the authentication system should have the below interfaces,

* **doKycAuth:** to authenticate the individual and get back a KYC token. This interface should support multiple types of authentication as well as multi-modal authentication.
* **doKycExchange:** to share user information based on the KYC token.
* **sendOTP:** to request an OTP before the OTP authentication.
* **isSupportedOtpChannel:** to check if the request channel to share OTP is supported.
* **getAllKycSigningCertificates:** to retrieve all the details of KYC signing certificates

<figure><img src="../.gitbook/assets/IdP Diagrams-Page-3.png" alt=""><figcaption></figcaption></figure>

## Interface

The authentication system must implement the below authentication wrapper interface.

```java
public interface AuthenticationWrapper {

    /**
     * Delegate request to authenticate the user, and get KYC token
     * @param relyingPartyId Relying Party (RP) ID. This ID will be provided during partner self registration process
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
     * Delegate request to send out OTP to provided individual Id on the configured channel
     * @param relyingPartyId Relying Party (RP) ID. This ID will be provided during partner self registration process
     * @param clientId OIDC client Id. Auto-generated while creating OIDC client in PMS
     * @param sendOtpDto
     * @return status of send OTP response.
     * @throws SendOtpException
     */
    SendOtpResult sendOtp(String relyingPartyId, String clientId, SendOtpDto sendOtpDto)
            throws SendOtpException;

    /**
     * supported OTP channel to validate in Send-OTP request.
     * @return true if supported, otherwise false
     */
    boolean isSupportedOtpChannel(String channel);

    /**
     * Get the list of KYC signing certificates and their details.
     * @return list
     */
    List<KycSigningCertificateData> getAllKycSigningCertificates();

}
```

The Authentication Wrapper implementation class must be annotated with `ConditionalOnProperty` based on `mosip.idp.authn.wrapper.impl` property as below:

```java
@ConditionalOnProperty(value = "mosip.idp.authn.wrapper.impl", havingValue = "mock-authentication-service")
@Component
@Slf4j
public class MockAuthenticationService implements AuthenticationWrapper {
...
}
```
