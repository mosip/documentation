# Local Deployment

e-Signet can be setup locally with mock ID system. Follow below guide or watch the video to setup e-Signet service locally.

{% embed url="https://www.youtube.com/watch?v=nmIZl6Tmt68" %}


## Mock ID System

Mock ID system is a simple spring boot application with endpoints to manage identities and verify identity with the stored identities.

Refer the below readme to setup and run mock ID system
https://github.com/mosip/esignet-mock-services/blob/release-0.9.X/mock-identity-system/README.md#local-setup-of-mock-identity-system


## Build mock plugins

Plugins are the connectors between esignet-service and mock ID system. We have mock implementation of all the plugin interfaces [here](https://github.com/mosip/esignet-mock-services/tree/release-0.9.X/mock-esignet-integration-impl).

This is a maven library, and can be built using below maven command.

`mvn clean install -Dgpg.skip=true`

On successful building, the mock plugin jar can be found under current target directory.

## e-Signet Service

This is spring boot application built with maven. 

Repository: https://github.com/mosip/esignet/blob/release-1.2.x

1. Create and setup database with ddl and dml scripts under db_scripts folder.
2. Update database properties in application-local.properties.
3. Build the complete repository using maven command.
4. Run the e-Signet service application with executable jar under esignet-service/target directory. Use the below command:

	`java -jar -Dloader.path=/opt/plugins/mock-esignet-integration-impl.jar esignet-service.jar`

	Note: 
		1. loader.path is set to the mock plugin jar file path
		2. esignet-service is by default set to `local` profile

Once the service is UP, esignet service swagger should be accessible with this URL

	http://localhost:8088/v1/esignet/swagger-ui.html

## e-Signet UI

e-Signet UI React app is under the same esignet repository with folder name "oidc-ui". To run e-Signet UI locally follow below steps:

1. Update ".env.development" file, add REACT_APP_ESIGNET_API_URL=<'Complete URL of Esignet Services'>
2. Go to oidc-ui folder and Start UI application with below command. 
	`npm start`
3. Run the browser with web-security disabled. For Google chrome the command is
	`chrome.exe --user-data-dir="C://Chrome dev session" --disable-web-security`

Now with http://localhost:3000/authorize you should be able to start and test OIDC flow. To know about the query parameters that are required to test the OIDC flow refer our stoplight API documentation.

https://mosip.stoplight.io/docs/identity-provider/85f761d237115-authorization-endpoint


Note: We also have postman scripts available under docs/postman-collections folder in the esignet github repository

https://github.com/mosip/esignet/blob/release-1.2.x/docs/postman-collections/esignet-OIDC-flow-with-mock.postman_collection.json

https://github.com/mosip/esignet/blob/release-1.2.x/docs/postman-collections/esignet-OIDC-flow-with-mock.postman_environment.json

