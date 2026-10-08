# Mock Identity System

### What It Is

The Mock Identity System is a mock implementation of an identity system, provided so developers can use it for local development and testing of eSignet. It exposes endpoints to:

* Create an individual
* Get an individual's data
* Authenticate an individual
* Send an OTP
* Share KYC data about the individual, post-authentication

It supports the same authentication factors a real identity system would: PIN-based authentication, OTP authentication, and biometric authentication.

### Why It's Used

eSignet is designed to connect to an identity system via an [Authn Provider](../../develop/integration/authenticator.md) built specifically for that purpose, but a real government or enterprise identity system usually isn't something a developer has, or should have, access to in a local environment. The Mock Identity System stands in for that real system, so eSignet's full authentication flow can run end to end on a local machine, without any external dependency or access to production identity data.

It's brought up automatically as part of both Docker Compose files described under [Local Setup](./).

### Repository and Setup

{% hint style="info" icon="github" %}
**Codebase**: [esignet-mock-services](https://github.com/mosip/esignet-mock-services/tree/master)
{% endhint %}

{% hint style="info" icon="github" %}
**Setup guide (README)**: [mock-identity-system README ](https://github.com/mosip/esignet-mock-services/blob/master/README.md)
{% endhint %}

