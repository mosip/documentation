# Local Deployment

This document details the steps for running eSignet locally on your system for local development and integration.

In order to achieve this, you need to use our mock ID system.

Follow the guide below or watch the video to set up the local eSignet service.

{% embed url="https://www.youtube.com/watch?v=nmIZl6Tmt68" %}

## Mock ID System

The mock identity system is a simple spring boot application with endpoints to manage identities and verify identities with the stored identities. It basically mimics an authentication system that has the capability to perform authentication.

Refer to the below page to set up and run the mock ID system.

{% content-ref url="mock-id-system/" %}
[mock-id-system](mock-id-system/)
{% endcontent-ref %}

## Build mock plugins

Plugins are the connectors between the eSignet service and the mock ID system. We have the mock implementation of all the plugin interfaces [here](https://github.com/mosip/esignet-mock-services/tree/master/mock-esignet-integration-impl).

This is a maven library and can be built using the below maven command.

`mvn clean install -Dgpg.skip=true`

The mock plugin jar can be found on a successful building under the current target directory.

## eSignet Service

This is a spring boot application built with Maven.

**Repository**

{% embed url="https://github.com/mosip/esignet/blob/master" %}

1. Create and set up the database with [ddl](https://github.com/mosip/esignet/tree/master/db\_scripts/mosip\_esignet/ddl) and [dml](https://github.com/mosip/esignet/tree/master/db\_scripts/mosip\_esignet/dml) scripts under the [db\_scripts](https://github.com/mosip/esignet/tree/master/db\_scripts) folder.
2. Update database configurations in application-local.properties.
3. Build the complete repository using the maven command.\
   `mvn clean install -Dgpg.skip=true`
4.  Run the eSignet service application with an executable jar under `esignet-service/target` directory. Use the below command:\`

    `java -jar -Dloader.path=/opt/plugins/mock-esignet-integration-impl.jar esignet-service.jar`

{% hint style="info" %}
* loader.path is set to the mock plugin jar file path&#x20;
* esignet-service is by default set to `local` profile
{% endhint %}

Once the service is up, the esignet service swagger should be accessible with the below URL.

```
http://localhost:8088/v1/esignet/swagger-ui.html
```

## eSignet UI

THE eSignet UI React app is under the same esignet repository with the folder "oidc-ui". To run eSignet UI locally follow the below steps:

1. Update ".env.development" file, add\
   `REACT_APP_ESIGNET_API_URL=<'Complete URL of Esignet Services'>`
2. Go to the oidc-ui folder and start the UI application with the below command.\
   `npm start`
3. Run the browser with web security disabled. For Google Chrome the command is\
   `chrome.exe --user-data-dir="C://Chrome dev session" --disable-web-security`

Now with `http://localhost:3000/authorize` you should be able to start and test the OIDC flow.

## API Documentation

To know about the query parameters that are required to test the OIDC flow refer to our stoplight API documentation.

{% embed url="https://mosip.stoplight.io/docs/identity-provider/85f761d237115-authorization-endpoint" %}

## Postman Collection

We also have Postman scripts available under `docs/postman-collections` folder in the eSignet GitHub repository

**Collection**

{% embed url="https://github.com/mosip/esignet/blob/release-1.2.x/docs/postman-collections/esignet-OIDC-flow-with-mock.postman_collection.json" %}

**Environment Configuration**

{% embed url="https://github.com/mosip/esignet/blob/release-1.2.x/docs/postman-collections/esignet-OIDC-flow-with-mock.postman_environment.json" %}
