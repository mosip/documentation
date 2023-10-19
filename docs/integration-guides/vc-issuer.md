# VC Issuer

VC Issuer is a system that can create a Verifiable Credential (VC) in [W3C formats](https://www.w3.org/TR/vc-data-model/) of an entity. As part of this integration with e-Signet, the Verifiable Credential system should implement the below interface.

## VC Issuance Plugin

This interface currently supports linked data-proof VC (as JSON-LD) and VC as JWT. The type of VC requested and the format in which VC is expected is passed as input to the implementation. Authorization details about the holder as present in the bearer token are also one of the inputs to the VC plugin implementation. e-Signet currently mandates the cryptographic binding of the VC to the holder. The public key proved to be possessed by the holder is used to generate "`did:jwk`" and the same is passed to the `holderId`. It is expected that the implementation will add the `holderId` as the `credentialSubjectId`.

{% hint style="info" %}
Cryptographic binding of the VC to the holder proves that the VC was issued to the key holder and also enables the VC verifier to guarantee that the presenter is indeed the holder of the VC.
{% endhint %}

The `VCIssuancePlugin` implementation class must be annotated with `ConditionalOnProperty` with `mosip.esignet.integration.vci-plugin` property.

```java
@ConditionalOnProperty(value = "mosip.esignet.integration.vci-plugin", havingValue = "TestVCIPluginImpl")
@Component
@Slf4j
public class TestVCIPluginImpl implements VCIssuancePlugin {
	//Implement methods
}
```