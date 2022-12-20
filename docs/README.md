# Overview

Once a foundation ID is in place for a country, the next step is to allow the verification of the ID holders for both government and private agencies to provide various services. Using the current authentication module for verification requires the relying parties to build custom components specific to the authentication module in various layers of their applications. It allows more flexibility for the relying parties like designing their own user interaction flow and request for very specific user details in KYC etc.

But a few straightforward applications like enabling unique login to their website, and fetching some basic details like name, age etc. does not need the above flexibilities but need a simple integration mechanism.

Hence, we have developed a new module called IdP (Identity Provider), which will be [OpenID Connect](https://openid.net/connect/) and [OAuth 2.0](https://oauth.net/2/) compliant system and can be used by a relying party to perform quick and simple integration to any authentication system for user verification.

### Architecture Principles

### Source code
