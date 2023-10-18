# VC Issuer

This system can create a VC in W3C formats (VC\_DATA [https://www.w3.org/TR/vc-data-model/)](https://www.w3.org/TR/vc-data-model/\)) of an entity. As part of this integration with e-Signet, the Verifiable Credential system should implement the below interface.

VCIssuancePlugin:\
This interface currently supports Linked data proof VC(JSON-LD) and VC as JWT. Type of the VC requested and the Format in which VC is expected is passed as input to the implementation. Authorization details about the holder as present in the bearer token is also one of the inputs to the VC plugin implementation. e-Signet currently mandates the cryptographic binding of the VC to the holder. The public key proved to be possessed by the holder is used to generate "did:jwk" and the same is passed as holderId. It is expected that the implementation adds the holderId as the credentialSubject Id.

\
**Note**: Cryptographic binding of VC to the holder, proves that the VC was issued to the key holder and also enables VC verifier to guarantee that the presenter is indeed the holder of the VC.

The VCIssuancePlugin implementation class must be annotated with ConditionalOnProperty with mosip.esignet.integration.vci-plugin property.

```java
@ConditionalOnProperty(value = "mosip.esignet.integration.vci-plugin", havingValue = "TestVCIPluginImpl")
@Component
@Slf4j
public class TestVCIPluginImpl implements VCIssuancePlugin {
	//Implement methods
}
```
