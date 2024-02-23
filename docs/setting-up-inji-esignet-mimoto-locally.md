This document details the steps for setting up Inji, eSignet and Mimoto locally. This guide will help developers easily configure these three modules and test all functionalities of Inji.

## 1. Setting up the Inji App

* **Step a**: The installation guide for Inji is [here](https://docs.mosip.io/inji/sandbox-details/inji-setup-guide).
* **Step b**: Download the Inji app on your phone and install it. 
* **Step c**: When you open the app, you will land on a home page from there you can click on the + button. 
* **Step d**: You can select from which issuer you want to download the VC. You can download either via UIN/VIOD/AID or using eSignet.
* **Step e**: Once you enter the UIN, it will prompt you for an OTP (the default OTP is 111111). It will download the credentials to the Inji wallet. 

## 2. Setting up Mimoto in your local
* **Step a**: You can follow the steps given [here](https://github.com/mosip/mimoto) to set up Mimoto in our local.
* **Step b**: You need to have Java 11 installed for setting up Mimoto.
* **Step c**: Clone the repo from the this link: `https://github.com/mosip/mimoto.git`
* **Step d**: In the utilities file, uncomment the below code for running mimoto Locally.

```Java
public Utilities(@Value("classpath:mimoto-issuers-config.json") Resource resource) throws IOException {
 issuersConfigJsonString = (Files.readString(resource.getFile().toPath()));
}
```

* **Step e**: In the mimoto-issuers-config.json update the right configs of issuers.
* **Step f**: Add the following properties to the application-local.properties file.

```properties  
# Inji properties
mosip.inji.allowedAuthType=demo,otp,bio-Finger,bio-Iris,bio-Face
mosip.inji.allowedEkycAuthType=demo,otp,bio-Finger,bio-Iris,bio-Face
mosip.inji.allowedInternalAuthType=otp,bio-Finger,bio-Iris,bio-Face
mosip.inji.faceSdkModelUrl=null
# model download maximum retry
mosip.inji.modelDownloadMaxRetry=10
# maximum number of retry for downloading vc
mosip.inji.vcDownloadMaxRetry=10
# pool interval in milli seconds
mosip.inji.vcDownloadPoolInterval=6000
# validate binding audience url to be sent in token
mosip.inji.audience=ida-binding
# issuer to be sent in token
mosip.inji.issuer=residentapp
# warning screen domain name -- mimoto host
mosip.inji.warningDomainName=http://10.0.2.2:8089
# inji documentation url
mosip.inji.aboutInjiUrl=https://docs.mosip.io/inji
# minimum storage space required for making audit entry in MB
mosip.inji.minStorageRequiredForAuditEntry=2
# minimum storage space required for downloading/receiving vc in MB
mosip.inji.minStorageRequired=5
#timeout for vc download api via openid4vci flow in milliseconds
mosip.inji.openId4VCIDownloadVCTimeout=30000
```

* **Step g**: Update the `application-local.properties` with the right openId configs.
* **Step h**: Alternatively, instead of performing step d, e, f, g we can also add the below patch to the repo.

* **Step i**: After that we can run, `mvn spring-boot:run -Dspring.profiles.active=local`
* **Step j**: Mimoto will be up on 8088 as per `bootstrap.properties`.
* **Step k**: You can confirm with this URL: `http://localhost:8088/v1/mimoto/issuers`


## 3. Setting up eSignet in local

* * **Step a**: Download the docker-compose containing the eSignet and relevant docker images from [here](https://github.com/mosip/esignet/tree/develop/docs/docker-compose).
* * **Step b**: Run the docker-compose with the below command.
`docker compose up -d`
* * **Step c**: Check if all the services are up and running.

## 4. Test VCI flow via Esignet
* Download and import the postman collections for eSignet from [here](
https://github.com/mosip/esignet/tree/master/docs/postman-collections).
* Export the public and private keys from the OIDC keystore as mentioned in Step 7.
* Update the below environment variables in the Postman collection. 
```
clientId 
redirectionUrl <call back URL>
individual_id <Individual for  whom the credential will be issued>
url <esignet host URL>
aud <recipient server of the token>
mock-identity-system-url <identity system URL in which the identity is created>
privateKey_jwk <private key in a JWK format will be used for signing the token request for client assertion>
publicKey_jwk <public key in a JWK format will be used for verifying the signature of the token request. Will be sent to the auth server during the OIDC client creation request>
resourceUrl <credential url>
```
* Call the below APIs in the order given below.
  * Create OIDC client
  * Create mock identity
  * Get CSRF token
  * Authorize
  * Send OTP
  * Authenticate User v2
  * Authorization code
  * Get Tokens V2
  * Get Credential
* If you can get the VC at the end of this, you are good with the eSignet setup.

## 5. Test VCI flow via Esignet and Mimoto
	
* Call the below APIs in the order given below.
  * Create OIDC client
  * Create mock identity
  * Get CSRF token
  * Authorize
  * Send OTP
  * Authenticate User v2
  * Authorization code
  * Get Token from Mimoto 
    ```
    curl --location 'http://localhost:8089/residentmobileapp/get-token' \
    --header 'Content-Type: application/x-www-form-urlencoded' \
    --data-urlencode 'client_id=cred-flow2' \
    --data-urlencode 'redirect_uri=io.mosip.residentapp.inji://oauthredirect' \
    --data-urlencode 'grant_type=authorization_code' \
    --data-urlencode 'code_verifier=ov9YEErTHL3L51WKopkEZAxvZtTdEXxbcqO5Ez3gU-M' \
    --data-urlencode 'code=pDC01kiS82YmOkqSzv0FyyMMlf6OhThBZ5lMqXgelww'
    ```
  * Get Credential
* The only difference here is we get the token from Mimoto instead of eSignet. Mimoto internally makes a call to esignet to get the token.
* If you can get the VC at the end of this, you are good with the Mimoto setup.

## 6. Setting up the Inji development environment

* Download the [Inji repo](https://github.com/mosip/inji) from MOSIP (Tag: vDP2-INJI)
* Refer to the [Inji build & deploy](https://docs.mosip.io/inji/build-and-deployment) document for downloading the dependencies.
* Make the changes in the `.env` file to point to the right eSignet and mimoto hosts.
* Sometimes the configuration doesn’t get reflected on the app even if we update the `.env` file. In that case, we will need to hardcode these properties in the constants.ts file.
* Start the emulator using the below command.
`npm run android:mosip --reset-cache`
* If mimoto or esignet is not running behind https, we will have to enable the http connections explicitly. We must add the flag below while constructing the authorization configuration in the `Utils.ts` file.
* Flag to be added -> `dangerouslyAllowInsecureHttpRequests: true`
* Code after adding the above flag -> 
```Java
export const constructAuthorizationConfiguration = (
  selectedIssuer: issuerType,
) => {
  return {
    clientId: selectedIssuer.client_id,
    scopes: selectedIssuer.scopes_supported,
    additionalHeaders: selectedIssuer.additional_headers,
    wellKnownEndpoint: selectedIssuer['.well-known'],
    dangerouslyAllowInsecureHttpRequests: true,
    redirectUrl: selectedIssuer.redirect_uri,
    serviceConfiguration: {
      authorizationEndpoint: selectedIssuer.authorization_endpoint,
      tokenEndpoint: selectedIssuer.token_endpoint,
    },
  };
};
```

## 7. Exporting the keys from the Keystore

* Download and install the keystore explorer from the internet.
* Import the OIDC keystore file and export the public and private keys in PEM formats without encryption.
* Using the [this tool](https://russelldavies.github.io/jwk-creator/) convert them to public key JWK and private key JWK. 



