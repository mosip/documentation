# Authenticator Plugin

The Authenticator plugin is the main interface for eSignet, which provides methods to authenticate the end-user with control of the supported authentication factors and a method to fetch consented user information from the Identity system.

The two main functionalities of the authenticator interface, **KYC Auth** and **KYC Exchange,** are depicted in the below diagram

<figure><img src="../../../.gitbook/assets/activity-diagrams-authenticator (1).png" alt=""><figcaption></figcaption></figure>

For eSignet Authentication Interface refer to the [Link](https://github.com/mosip/esignet/blob/master/esignet-integration-api/src/main/java/io/mosip/esignet/api/spi/Authenticator.java)

## Who should implement the Authenticator plugin interface?

The authenticator plugin is implemented by any organization - public or private, that wishes to integrate its identity system with eSignet to enable digital identity usage

An Identity system can be as simple as a table in a database or an Excel file storing user identity data or it can be a complex Identity System.

## How to implement this plugin?

Any organization intending to integrate eSignet with an [identity system](https://docs.esignet.io/general/glossary) of its choice must make necessary customizations to the authenticator plugin. These modifications ensure that the plugin can seamlessly interface with the target identity system and support its specific authentication and verification workflows. This approach enables eSignet to integrate efficiently with a wide range of identity systems. Please keep reading for further details.

In the eSignet architecture, the Authenticator acts as the bridge between eSignet and the Identity Registry. All protocol-related responsibilities are handled entirely within eSignet, while all identity-related logic is implemented within the Authenticator interface. This separation ensures a clean, modular design and clear ownership of responsibilities.

**eSignet responsibilities**

* OAuth / OIDC / FAPI specification adherence
* Consent handling
* Token issuance

**Authenticator responsibilities**

* Authenticate user
* Fetch verified user attributes (KYC)
* Return data to eSignet in agreed structure

#### **Before You Implement**

Consider the authentication scenario and the type of identity system you are using.\
For example, Lets assume your identity system supports **only OTP based login**.

**Sample Pseudocode: Authenticator Implementation**

```java
package sample;


public class SampleAuthenticator implements Authenticator {


    /**
     * Step 1: Validate requested OTP channel
     * Called during the OIDC Authorization flow
     */
    public boolean isSupportedOtpChannel(String channel) {
         // 1. Define ALLOWED_CHANNELS and check if the 
         // requested channel is allowed.
         return ALLOWED_CHANNELS.contains(channel);
    }

    /**
     * Step 2: Send OTP to the user
     * Called during the OIDC Authorization flow
     */
    public SendOtpResult sendOtp(String relyingPartyId, String clientId, SendOtpDto sendOtpDto)
            throws SendOtpException {
            
         // 1. Generate OTP 
         // 2. Fetch email / mobile from ID system.
         // 3. trigger OTP notification
         // Note: You may use kernel-otpmanager and kernel-notification-service are MOSIP 
         // modules that provides this functionality.
         // Set and return the result, if failed throw SendOtpException
         
         SendOtpResult sendOtpResult = new SendOtpResult();
         sendOtpResult.setMaskedEmail(****);
         sendOtpResult.setMaskedMobile(****);
         return sendOtpResult;
    }

    /**
     * Step 3: Authenticate the user
     * Called during the OIDC Authorization flow
     */
    @Override
    public KycAuthResult doKycAuth(String relyingPartyId, String clientId, KycAuthDto kycAuthDto)
            throws KycAuthException {

        // 1. Extract authentication parameters
        String userId = kycAuthDto.getIndividualId();
        AuthChallenge authChallenge = request.getChallengeList().get(0);

        // 2. Validate credentials against Identity System
        // Note: It may be a endpoint call, direct DB access from this method.
        boolean authenticated = identitySystem.verify(
            userId,
            "OTP",
            authChallenge.getChallenge()
        );

        if (!authenticated) {
            throw new KycAuthException("AUTH_FAILED", "Invalid credentials");
        }

        // 3. Generate a KYC token for the input transactionId,
        // This token should be used to affirm that kyc-exchange is invoked only after
        // successful kyc-auth for the given transaction
        // For simplicity, using uuid as kyc token
        String kycToken = UUID.toString();

        // 4. Cache / store the transcation and kyc-token

        // 5. Build authentication success response
        KycAuthResult kycAuthResult = new KycAuthResult();
        kycAuthResult.setKycToken(kycToken);

        // 6. To support pairwise pseudorandom ID
        kycAuthResult.setPartnerSpecificUserToken(<hash(userId, relyingPartyId)>);
        
        return kycAuthResult;
    }

    /**
     * Step 4: Exchange KYC / Identity attributes
     * Called AFTER successful authentication & user consent
     */
    @Override
    public KycExchangeResult doKycExchange(String relyingPartyId, String clientId, KycExchangeDto kycExchangeDto)
            throws KycExchangeException {

        // 1. Validate request.getKycToken()
        // if invalid or expired throw KycExchangeException
        
        // 2. Fetch user identity for the given request.getIndividualId()
        // Throw exception if unable to find user or not allowed to as per relying party mapped policy.

        JWT userJWT = new JWT();

        // 3. 'sub' claim must hold the same value as value returned in the partnerSpecificUserToken
        userJWT.put("sub", "<hash(userId, relyingPartyId)>");

        for(String userClaim : requestedAttributes) {
          // 4. Add user claims to the JWT ONLY in the requested request.getClaimsLocales()
        }

        // 5. Sign the user JWT
        String signedJWT = ""

        String finalKyc = ""
        if(request.getUserInfoResponseType().equals("JWE")) {
          // 6. Additionally encrypt user JWS, using Relying party specific encryption public key.
          finalKyc = encrypt(signedJWT)
        }

        KycExchangeResult exchangeResult = new KycExchangeResult();
        exchangeResult.setEncryptedKyc(finalKyc);
        return exchangeResult;
    }

    /**
     * Step 5: Provide signing certificates (optional but common)
     * These keys are published in the eSignet .well-known/jwks.json
     */
    @Override
    public List<X509Certificate> getAllCertificates()
            throws CertificateException {

        // Return certificates corresponding to keys used
        // to sign KYC
        return keyStore.loadSigningCertificates();
    }
}
```

####

{% hint style="warning" %}
**Note**:

* OTP and password are the only supported auth factors in this scenario
* For unsupported factors, return an error.
* Token generation and signing depend on your implementation strategy.
* Certificates must be managed securely (SoftHSM or custom keystore).
{% endhint %}

{% hint style="success" %}
**Important**:

Reference implementations of the Authenticator Plugin for MOCK ID and MOSIP ID are available. Please see the details below.

1. Please refer to how our [mock-plugin](https://github.com/mosip/esignet-plugins/blob/master/mock-plugin/src/main/java/io/mosip/esignet/plugin/mock/service/MockAuthenticationService.java) implements the eSignet Authenticator plugin to integrate eSignet with the mock identity system.
2. Also, look at the [MOSIP plugin](https://github.com/mosip/esignet-plugins/blob/master/mosip-identity-plugin/src/main/java/io/mosip/esignet/plugin/mosipid/service/IdaAuthenticatorImpl.java) reference implementation enabling the eSignet integration with the MOSIP identity system.
{% endhint %}
