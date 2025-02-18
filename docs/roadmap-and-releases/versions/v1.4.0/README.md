# v1.4.0

**Release Number**: v.1.4.0

**Release Date**: 23rd April, 2024

### Overview

Version 1.4.0 of eSignet introduces a new authentication mode and addresses known issues.

1.  **Knowledge Based Identification (KBI)**

    We are excited to share that eSignet has expanded its authentication options to include Knowledge Based Identification (KBI) as one of its factors. With eSignet's integration capabilities, existing ID repositories storing user specific details can now be easily integrated with eSignet. This integration enables OpenID based login, allowing users to access relying party services seamlessly.

To learn more about Knowledge Based Identification, click [here](https://docs.esignet.io/overview/features#knowledge-based-authentication).

1. **Fixes for known issues from v1.3.0**

{% hint style="info" %}
**Note:**

1. The authentication factor can be referred to as either Knowledge Based Authentication (KBA) or Knowledge Based Identification (KBI). However, from the eSignet’s perspective, we will specifically refer to the authentication method as Knowledge Based Identification (KBI).
2. Given the relatively low level of assurance provided by Knowledge Based Identification  (KBI), we recommend that Knowledge Based Authentication (KBA) / Knowledge Based Identification (KBI) should be used for the issuance of Verifiable Credentials (VC) or certificates rather than serving as a primary method of authentication.&#x20;
{% endhint %}

## Repositories Released

| Repository Released        | Tags                                                          |
| -------------------------- | ------------------------------------------------------------- |
| esignet                    | [v1.4.0](https://github.com/mosip/esignet)                    |
| mosip-config               | [v1.4.0-ES](https://github.com/mosip/mosip-config)            |
| artifactory-ref-impl       | [v1.4.0-ES](https://github.com/mosip/artifactory-ref-impl)    |
| digital-credential-plugins | [v0.1.0](https://github.com/mosip/digital-credential-plugins) |

For details on deployment, refer to the [helm charts](https://github.com/mosip/esignet/tree/v1.4.0/helm) in the eSignet repository.

## Documentation

* [Feature Documentation](https://docs.esignet.io/overview/features#knowledge-based-authentication)
* [Integration Guides](https://docs.esignet.io/integration)
* [End User Guide](https://docs.esignet.io/end-user-guide)
* [API Documentation](https://github.com/mosip/esignet/blob/v1.4.0/docs/esignet-openapi.yaml)
* [QA Report](test-report.md)
