# Mock Authentication System

This guide helps with the steps to mock the authentication server integration in the IdP service. 

{% hint style="info" %}
Note: It is for development purpose only.
{% endhint %}

{% hint style="info" %}
Note: Mock authentication system only supports PIN and OTP. For PIN based login, PIN must be provided in the persona json file. For OTP based login, OTP is always set to 111111.
{% endhint %}

## Setup

1. Set the auth wrapper implementation to mock in properties
    ```
    mosip.idp.authn.wrapper.impl=MockAuthenticationService
    ```
   
2. Add Persona files. This is the JSON file used to store the mock data of the individuals.
     * Set the folder path to look for persona json files in properties.
    ```
    mosip.idp.authn.mock.impl.persona-repo=/home/mosip/mockida
    ```   
     * The file should be named after the individual's ID.
         For example, filename - 34578673456.json where 34578673456 is the individual's ID.
     * To support PIN based login, pin key must be added at the root level of the persona json.
     * maskedEmailId & maskedMobile are required for OTP based login.

     ```JSON
                 {      "pin" : "34789",
                        "maskedEmailId" : "l*******371@mailinator.com",
                        "maskedMobile" : "9*******34",
                        "identity": {
                            "gender": [{
                                "language": "fra",
                                "value": "Mâle"
                            }, {
                                "language": "ara",
                                "value": "ذكر"
                            }],
                            "postalCode": "45009",
                            "fullName": [{
                                "language": "fra",
                                "value": "lnrxoivlb4371"
                            }, {
                                "language": "ara",
                                "value": "تتگلدكنسَزقهِقِفل"
                            }, {
                                "language": "eng",
                                "value": "lnrxoivlb4371"
                            }],
                            "dateOfBirth": "1930/11/25",
                            "province": [{
                                "language": "fra",
                                "value": "Kénitra"
                            }, {
                                "language": "ara",
                                "value": "كِ́نِترَ"
                            }, {
                                "language": "eng",
                                "value": "Kénitra"
                            }],
                            "addressLine1": [{
                                "language": "fra",
                                "value": "én tra block"
                            }, {
                                "language": "ara",
                                "value": "كِ́نِترَ"
                            }, {
                                "language": "eng",
                                "value": "en torch block"
                            }],
                            "phone": "+9427357934",
                            "region": [{
                                "language": "fra",
                                "value": "melh$pèng"
                            }, {
                                "language": "ara",
                                "value": "مِله$پِ̀نگ"
                            }, {
                                "language": "eng",
                                "value": "melhspeng"
                            }],
                            "email": "lnrxoivlb4371@mailinator.com",
                            "encodedPhoto": "data:image/jpeg;base64,encodedjpegdata"
                         }
                     } 
     ```
       
3. Set the OIDC claims and persona attributes mapping file
        ```
        mosip.idp.authn.mock.impl.claims-mapping-file=/home/mosip/mockida/claims_attributes_mapping.json
        ```
    * Sample mapping file:
        ```JSON
               {
                   "locales": {"en" :  "eng", "fr":  "fra", "ar":  "ara" },
                   "attributes" : {
                               "fullName" : { "path": "$.identity.fullName[?(@.language=='_LOCALE_')].value", "defaultLocale" : "en" },
                               "dateOfBirth" : { "path": "$.identity.dateOfBirth"},
                               "gender" : { "path": "$.identity.gender[?(@.language=='_LOCALE_')].value", "defaultLocale" : "en" },
                               "email" : { "path": "$.identity.email"},
                               "phone" : { "path": "$.identity.phone"},
                               "addressLine1" : { "path": "$.identity.addressLine1[?(@.language=='_LOCALE_')].value", "defaultLocale" : "en" },
                               "province" : { "path": "$.identity.province[?(@.language=='_LOCALE_')].value", "defaultLocale" : "en" },
                               "region" : { "path": "$.identity.region[?(@.language=='_LOCALE_')].value", "defaultLocale" : "en" },
                               "postal_code" : { "path": "$.identity.postalCode" },
                               "encodedPhoto" : { "path": "$.identity.encodedPhoto"}
                               },
                   "claims" : {
                               "name" : "fullName",
                               "gender" : "gender",
                               "birthdate" : "dateOfBirth",			
                               "email" : "email",
                               "phone_number" : "phone",
                               "locale" : "",
                               "picture": "encodedPhoto",
                               "address" : { 
                                             "street_address" : "",  
                                             "locality" : "province", 
                                             "region" : "region",
                                             "postal_code": "postalCode", 
                                             "country" : "",
                                             "formatted" : ["addressLine1", "province", "region", "postalCode"]
                                          }
                               }
               }
      ```
   
4. Set Relying party policy
   * Mock authentication service assumes that every relying party will be mapped to a policy (defines kyc attributes & auth types).
   * Before building the user info based on consented claims, the mock-authentication-service validates if the consented claims are part of the policy.
   * Relying party policy json must be defined as below and must be named after the relying party id (input in Create OIDC client endpoint).
    ```JSON
           {
	         "allowedKycAttributes": [
                   { "attributeName": "fullName" }, 
                   { "attributeName": "gender" },
                   { "attributeName": "dateOfBirth" }, 
                   { "attributeName": "encodedPhoto"}, 
                   { "attributeName": "email"},
                   { "attributeName": "phone" }, 
                   { "attributeName": "province" }],
	         "allowedAuthTypes": [{ "authType": "pin" }],
             "publicKey" : {
		             "kty": "RSA",
		             "e": "AQAB",
		             "use": "sig",
		             "kid": "1bbdc9de-c24f-4801-b6b3-691ac07641af",
		             "alg": "RS256",
		             "n": "wXGQA574CU-WTWPILd4S3_1sJf0Yof0kwMeNctXc1thQo70Ljfn9f4igpRe7f8qNs_W6dLuLWemFhGJBQBQ7vvickECKNJfo_EzSD_yyPCg7k_AGbTWTkuoObHrpilwJGyKVSkOIujH_FqHIVkwkVXjWc25Lsb8Gq4nAHNQEqqgaYPLEi5evCR6S0FzcXTPuRh9zH-cM0Onjv4orrfYpEr61HcRp5MXL55b7yBoIYlXD8NfalcgdrWzp4VZHvQ8yT9G5eaf27XUn6ZBeBf7VnELcKFTyw1pK2wqoOxRBc8Y1wO6rEy8PlCU6wD-mbIzcjG1wUfnbgvJOM4A5G41quQ"
	           }
           }
   ```
   
   * Also, relying party policy JSON has the public key which will be used to encrypt KYC. Mock implementation encrypts KYC only if the below property is set to true.  
     ```
      mosip.idp.authn.mock.impl.encrypt-kyc=true
     ```
   * The below path sets the path to look for the relying party policy JSON. Policy json file is named after the relying party ID 
     Ex: filename - partner1_policy.json. Here, `partner1` is the relying party ID
     ```mosip.idp.authn.mock.impl.policy-repo=/home/mosip/mockida```
