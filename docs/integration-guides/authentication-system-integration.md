# Authentication System Integration

# Overview

System to authenticate an individual and provide consented details of the authenticated individual. Adhering to this principle we have the integration with authentication system divided into 2 APIs:

1. kyc-auth : Authenticate enduser and return kyc-token
```mermaid
sequenceDiagram
    autonumber
    actor Individual
    Individual->>+IdP: Credentials
    rect rgb(0,0,128)
    IdP->>IDA: Credentials
    IDA->>IdP: kyc-token
    end
    IdP-->>-Individual: Success
    Individual->>+IdP: Consent
    Note over IdP: Store consent
    IdP->>-Individual: Success
    Note left of IdP:Redirect to client portal with auth-code
```
2. kyc-exchange: Exchange kyc-token for the user KYC
```mermaid
sequenceDiagram
    autonumber
    OIDC Client->>+IdP: auth-code
    rect rgb(0,0,128)
    IdP->>IDA: Consent & kyc-token
    IDA->>IdP: KYC (JWT/JWE)
    end
    Note over IdP: Store KYC
    IdP-->>-OIDC Client: id-token & access-token
    OIDC Client->>+IdP: access-token
    IdP->>-OIDC Client: KYC (JWT/JWE)
```

# Interface

Authentication System Provider must implement the below Authentication Wrapper interface.

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


Authentication wrapper implementation class must be annotated with ConditionalOnProperty based on "mosip.idp.authn.wrapper.impl" property;

```
@ConditionalOnProperty(value = "mosip.idp.authn.wrapper.impl", havingValue = "mock-authentication-service")
@Component
@Slf4j
public class MockAuthenticationService implements AuthenticationWrapper {
...
}
```

# Plan

Case 1: Authentication system has single endpoint ( authenticate and returns kyc )
case 2: Authentication system has endpoint only to authenticate.


