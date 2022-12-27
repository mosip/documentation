# Overview

Once a foundation ID is in place for a country, the next step is to allow the **verification** of the ID holders for both government and private agencies to be able to provide them with various services. The current authentication module for verification requires the relying parties to build custom components that are specific to the authentication module in various layers of their applications. It allows more flexibility for the relying parties like designing their own user interaction flow and request for very specific user details in KYC etc.

But a few straightforward applications that enable unique login to their website, fetching some basic details like name, age etc. does not need the above flexibilities but it just requires a simple integration mechanism.

Hence, we have developed an identity provider solution called **e-Signet**, which will be [OpenID Connect](https://openid.net/connect/) and [OAuth 2.0](https://oauth.net/2/) compliant system and can be used by a relying party to perform quick and simple integration to any authentication system for user verification.

### Benefits

There are multiple benefits of using IdP for both the residents as well as the government and private agencies.

How are the residents benefitted?

* Easy login using a single credential (that’s the foundational ID)
* Providing their `consent` before allowing the relying party for accessing the personal information (inbuilt consent flow).
* Allows the user to identify themselves and reduces the efforts of remembering or storing multiple passwords and account details.

How is the government/ private agencies benefitted?

* Assurance of the identity based on biometrics or OTP&#x20;
* Ability to verify the residents with the same assurance given during registration
* Choices of the level of assurance and how identification is done
* Ease of integration (lower time to market)
* Trust level (convenience vs trust)



Note- need to add a line on what is that extraordinary thing that we are providing here vs already existing similar solutions in the market. why should relying parties adopt our developed solution against the existing ones?

