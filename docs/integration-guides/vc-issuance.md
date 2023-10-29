# VC Issuance Plugin

VC Issuance plugin interface provides methods to return Verifiable Credentials (VCs) of an individual (here, the holder of the credential) when authorized. Today, this interface supports methods for returning linked data-proof VC (as JSON-LD) and VC as JWT.

## How to implement this Plugin?

Here, are some important points for the implementers,

* The type of VC requested and the format in which VC is expected is passed as input to the implementation.
* Authorization details about the holder present in a bearer token are also one of the inputs to the VC plugin implementation.
* eSignet currently mandates the cryptographic binding of the VC to the holder. Cryptographic binding of the VC to the holder proves that the VC was issued to the key holder and also enables the VC verifier to guarantee that the presenter is indeed the holder of the VC.

The public key proved to be possessed by the holder is used to generate "`did:jwk`" and the same is passed to the "_**holderId**_". It is expected that the implementation will add the "_**holderId**_" as the "_**credentialSubjectID**_".

During implementation, the `VCIssuancePlugin` implementation class must be annotated with `ConditionalOnProperty` with `mosip.esignet.integration.vci-plugin` property.

```java
@ConditionalOnProperty(value = "mosip.esignet.integration.vci-plugin", havingValue = "TestVCIPluginImpl")
@Component
@Slf4j
public class TestVCIPluginImpl implements VCIssuancePlugin {
	//Implement methods
}
```

## Appendix - VC Issuance Flow

The below diagram shows how a holder is authenticating himself/herself and requesting for his/her credentials using a digital wallet.

<figure><img src="../.gitbook/assets/activity-diagrams-vc-issuer (1).png" alt=""><figcaption></figcaption></figure>
