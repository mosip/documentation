# Key Binder Plugin

The Key Binder plugin interface provides a method to bind an individual's ID with a public key. On successful binding, it returns a signed certificate called Wallet User ID which uniquely identifies the user and the wallet.

When a new binding request is received, it is expected that the key binder implementation takes care of overriding previously bound certificates with the newly generated signed certificate for a user.

The individual needs to be authenticated before binding the key. The interface is structured to accept any type of authentication challenge, namely OTP or biometrics.

The bound certificate will then be usable to do token-based authentication like **WLA** (Wallet Local Authentication) from any digital wallet app.

Below is the key binder interface.

```java
public interface KeyBinder {

    /**
     * Delegate request to send out OTP to provided individual ID on the configured channel
     * during Key binding process.
     * @param individualId
     * @param otpChannels
     * @param requestHeaders
     * @return
     * @throws SendOtpException
     */
    SendOtpResult sendBindingOtp(String individualId, List<String> otpChannels,
                                 Map<String, String> requestHeaders) throws SendOtpException;

    /**
     * Delegate request check the given challenge. Binds the key only if the given challenge is valid
     * returns back the new signed certificate and a partner specific user token.
     * @param individualId
     * @param challengeList
     * @param publicKeyJWK
     * @param requestHeaders
     * @return
     * @throws KeyBindingException
     */
    KeyBindingResult doKeyBinding(String individualId, List<AuthChallenge> challengeList, Map<String, Object> publicKeyJWK,
                                  String bindAuthFactorType, Map<String, String> requestHeaders) throws KeyBindingException;
    
    List<String> getSupportedChallengeFormats(String authFactorType);
}
```

{% hint style="info" %}
Not&#x65;**:** For the latest version of the interface please check our code base - [KeyBinder.java](https://github.com/mosip/esignet/blob/master/esignet-integration-api/src/main/java/io/mosip/esignet/api/spi/KeyBinder.java)
{% endhint %}

## Who uses this interface?

The APIs exposed by this interface are used by [Digital Wallets](../../../general/glossary.md#digital-id-wallet) to perform wallet binding while it is implemented by [Identity Systems](../../../general/glossary.md#identity-systems).

## How to implement this plugin?

The Key Binder implementation class must be annotated with `ConditionalOnProperty` with `mosip.esignet.integration.key-binder` property.

Below is an example of how our [Mock Identity System](https://github.com/mosip/esignet-mock-services/blob/master/mock-esignet-integration-impl/src/main/java/io/mosip/esignet/mock/integration/service/MockKeyBindingWrapperService.java) has implemented the eSignet KeyBinder plugin.

```java
@ConditionalOnProperty(value = "mosip.esignet.integration.key-binder", havingValue = "mock-keybinder-service")
@Component
@Slf4j
public class MockKeyBindingWrapperService implements KeyBinder {
    //Implement keybinder methods
}
```

## Appendix - Key Binding

The **Key Binding** functionality is depicted in the diagram below:

<figure><img src="../../../.gitbook/assets/activity-diagrams-wallet-binding (1).png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
Here, the Binding Partner is nothing but the wallet backend service.
{% endhint %}
