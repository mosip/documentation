# Mock Relying Party

## Mock Relying Party

### What It Is

The Mock Relying Party is a sample OIDC relying party (RP) portal, a stand-in for a real service provider's application, built with React JS. It's made up of two components:

* [**mock-relying-party-ui**](https://github.com/mosip/esignet-mock-services/tree/master/mock-relying-party-ui): the front end, consisting of a login page and a user profile page.
* [**mock-relying-party-service**](https://github.com/mosip/esignet-mock-services/tree/master/mock-relying-party-service): a backend service that hosts a single endpoint to fetch user info

The portal uses the authorization code flow with private key JWT client authentication to fetch the logged-in user's profile — the same flow a real relying party would use in production, not a simplified stand-in for it.

### Why It's Used

Docker Compose and the Postman collection can each exercise pieces of the OIDC flow, but neither shows what it actually looks like from a relying party's side of the exchange — including the private-key-JWT client authentication step, which is one of the more security-sensitive parts of integrating with eSignet. The Mock Relying Party gives you a real, clickable "Log in with eSignet" experience end to end, so you can see exactly what a relying party sends, receives, and does with each token along the way.

### Repository and Setup

{% hint style="info" icon="github" %}
**Codebase**: [esignet-mock-services](https://github.com/mosip/esignet-mock-services/tree/master)
{% endhint %}

{% hint style="info" icon="github" %}
**Setup guide (README)**: [mock-identity-system README ](https://github.com/mosip/esignet-mock-services/blob/master/README.md)
{% endhint %}
