# Build & Deployment

The latest stable released codebase can be found under the **master** branch of the eSignet codebase. All the ongoing bug fixes or feature development are usually on the **development** or on a specific feature branch.

{% hint style="info" %}
It is recommended to either use the **master** or the released tags for local deployment and testing.
{% endhint %}

## Build backend services

Modules under [eSignet](https://github.com/mosip/esignet/tree/master) use Maven as the build tool.

[eSignet-service](https://github.com/mosip/esignet/tree/master/esignet-service) is a spring-boot application that hosts all the REST endpoints.

**Prerequisite**

* Java 11
* Apache Maven 3.8.6

**Build**

Run the below command to build eSignet backend services.

```
mvn clean install -Dgpg.skip=true
```

{% hint style="info" %}
Use -DskipTests=true to skip test case execution
{% endhint %}

## Build UI

[eSignet UI](https://github.com/mosip/esignet/tree/master/oidc-ui) is a react application that is built using npm.

**Prerequisite**

* npm 8.1.2 or higher
* node v16.13.2 or higher

**Build**

* Run the below command to install all the required dependencies

```
npm install
```

* Run the below command to build the UI application

```
npm run build
```
