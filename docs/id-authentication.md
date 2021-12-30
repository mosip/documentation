# Overview
ID Authentication (ID Auth) provides an API based authentication mechanism for entities to validate individuals. ID Authentication is the primary model for entities to validate an individual before providing any service.
Below are some of the features associated with ID authentication,

### Functional features 
* Identity verification services
    * Yes/No API confirms identity claimed
    * Works with virtual ID
* Supports multiple levels of confidence and trust  
    * Single, as well as multi-factor authentication, is possible
    * Supports OTP, demographic, biometric factors based authentication
* e-KYC based authentication
    * Selected non-biometric attributes excluding ID is returned
    * Data is shared based on policy
* Authorization/Consent
    * OTP based consent mechanism linked to the transaction being authorized or consented to
* Tokenization: random, partner or policy specific tokens are returned based on the policy after successful authentication

### Technical features
* Trust and security validations are performed on the request
    * Registered Devices, Authorized Partners
* Uses a third-party SDK for biometrics comparison
* Call to authentication is a single request, OTP generation is a prior step
* UIN/VID based authentication requests can be made
    * Recommended configuration is VID only
* Easy to plug in validations such as liveness detection
* Supports SBI 2.0 SBI Specifications for clients
* Domain feature and transaction feature for inter-op and authorization support
