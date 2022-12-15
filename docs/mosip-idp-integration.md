# MOSIP IdP Integration 

Once a foundation ID is in place for a country, the next step is to allow the verification of the ID holders for both government and private agencies to provide various services. Using the current authentication module for verification requires the relying parties to build custom components specific to the MOSIP authentication module in various layers of their applications. It allows more flexibility for the relying parties like designing their own user interaction flow and request for very specific user details in KYC etc.
    
A few straightforward applications which enable unique login to their website, fetching some basic details like name, age etc. does not need above flexibilities, but needs a simple integration mechanism.

Hence, have developed a new module called MOSIP IdP (Identity Provider), which will be `OpenID Connect` and `Oauth2.0` compliant system, and can be used by a relying party to perform quick and simple integration to MOSIP for user verification.

## Advantages of using OpenID Connect

1. Since the interaction with the user for authentication is directly handled by the MOSIP system, we can ensure to imbibe the best security practices and as a result need it to be implemented only in one place.
2.	Also, the interaction between MOSIP system and relying party happens through end users system/ browser, avoiding the external requirements of secure connectivity to the MOSIP authentication server.
3.	Since OpenID Connect is a standard protocol and has been there for a few years, there are tons of libraries in multiple platforms to support a quick integration.
4.	SBI integration to collect secure biometrics for authentication can also be implemented only in the MOSIP IdP.

## Solution approach

* MOSIP IdP will be a wrapper layer around IDA module to provide OpenID Connect integration to relying parties.
* IDA module will treat IdP as a MISP partner.
* IDA module will allow MISP partner to build authentication request and sign them on behalf of the auth partner based on MISP policy.
* IDA module will expose KYC APIs that can respond in an OpenID Connect format.

## Relying party/ Auth partner onboarding

The existing partner management portal will be used for Client ID generation. Once the partner policy mapping is approved, multiple client IDs can be generated on a single mapping.

## OpenID Connect implementation considerations

*	User claims other than sub will not be available in ID token, it can be received only by invoking the userinfo API.
*	Offline_access will not be supported (no support to refresh token).
*	No support for SSO as it is dangerous in an assisted mode (user to login for each time authorize API is called).
*	Only private_key_jwt client authentication will be supported while invoking tokens API.
*	If private key used for client authentication is compromised, new client ID has to be generated and new user consents will be required.
*	Support will be provided only for the authorization code flow of OIDC since it is the most secure option.

## Supported Authorize API request parameters

1.	cope - profile, email, address, phone
2.	response_type - code
3.	client_id
4.	redirect_uri
5.	state
6.	nonce
7.	display - page, popup, touch, wap
8.	prompt - none, login, consent, select_account
9.	max_age
10.	ui_locales
11.	acr_values
12.	claims_locales
13.	claims

## Claims supported by userinfo API

* sub - partner-specific user token (PSUT)
*	name
*	address
*	gender
*	birthdate
*	profile photo
*	email
*	phone
*	locale
*	Custom
    * individual_id (What we share in this claim is a system-level config and it can be UIN, perceptual VID or temporary VID)

## Claims supported by ID Token

*	iss
*	sub - (PSUT)
*	aud
*	exp
*	iat
*	auth_time
*	nonce
*	acr
*	at_hash


