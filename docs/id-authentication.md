# ID Authentication

## Overview
Once a UIN is issued, a resident may be authenticated using MOSIP's ID Authentication (IDA) module. As MOSIP is a foundational ID system, different services (govt or private) may use the "single source of truth" to validate identity of a resident rather than implement multiple different authentication systems.  A typical authentication flow is illustrated below:

![](_images/ida-process.png)

* Federated auth
* Authentication_Partner
* Multi factor auth

ID Authentication (ID Auth) provides an API based authentication mechanism for entities to validate individuals. ID Authentication is the primary model for entities to validate an individual before providing any service.

* Main functions:  Authentication and KYC

Authentication may be biometric, demographic or OTP.

* Auth partners


-* Identity verification services
-    * Yes/No API confirms identity claimed
-    * Works with virtual ID
-* Supports multiple levels of confidence and trust  
-    * Single, as well as multi-factor authentication, is possible
-    * Supports OTP, demographic, biometric factors based authentication
-* e-KYC based authentication
-    * Selected non-biometric attributes excluding ID is returned
-    * Data is shared based on policy
-* Authorization/Consent
-    * OTP based consent mechanism linked to the transaction being authorized or consented to
-* Tokenization: random, partner or policy specific tokens are returned based on the policy after successful authentication


