# Local Setup

Mimoto can be deployed in local using Docker Compose setup. This service streamlines deployment and management, offering a seamless and efficient way to handle backend operations. 

Below sections details the docker-compose setup to run mimoto which act as BFF for Inji Wallet and backend for Inji web. This docker compose setup is intended only for local use and not for production deployment.

## What is in the docker-compose folder?

* The certs folder holds the p12 file which is created as part of OIDC client onboarding.
* "config" folder holds the mimoto system properties file, issuer configuration and credential template.
* "loader_path" this has mimoto mount volume from where all the runtime dependencies are loaded to classpath.
* "docker-compose.yml" file contains the mimoto setup.

## How to run this setup?

1. Create loader_path folder under the docker-compose directory and download the kernel auth adapter(kernel-auth-adapter-1.2.0.1.jar) from [here](https://repo1.maven.org/maven2/io/mosip/kernel/kernel-auth-adapter/1.2.0.1/).
2. Copy the downloaded jar under loader_path directory and rename it to kernel-auth-adapter.jar
3. Add ID providers as issuers in mimoto-issuers-config.json
4. Start esignet services and update esignet host references in mimoto-default.properties and mimoto-issuers-config.json
5. Create certs folder in the same directory and create OIDC client. Add key in oidckeystore.p12 and copy this file under certs folder. Refer [here](https://docs.mosip.io/inji/inji-mobile-wallet/customization-overview/credential_providers) to create client
6. Update client_id and client_alias in mimoto-issuers-config.json file.
7. Update p12 file password mosip.oidc.p12.password in mimoto-default.properties file.
8. To start the docker-compose file, run the command docker-compose up

## APIs

The mimoto APIs can be accessed as below:

http://localhost:8099/residentmobileapp/allProperties

http://localhost:8099/residentmobileapp/issuers

http://localhost:8099/residentmobileapp/issuers/Sunbird

http://localhost:8099/residentmobileapp/issuers/Sunbird/credentialTypes

## Note:

* For local env use ngrok.
* Replace http://localhost:8099 by [ngrok](https://ngrok.com/docs/getting-started/) public domain at following places
    * token_endpoint in mimoto-issuers-config.json
    * mosipbox.public.url, mosip.api.public.url in mimoto-default.properties


