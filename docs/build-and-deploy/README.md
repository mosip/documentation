---
description: >-
  Effortlessly deploy and configure eSignet with comprehensive guides,
  architecture insights, and mock environments.
icon: list-tree
---

# Deploy

The eSignet solution is designed to be easily deployed and tested locally. The latest stable codebase is available under the **master** branch of the **eSignet repository**.  All feature development or bug fixes are typically carried out on specific feature or development branches.

{% hint style="info" %}
**Note:** It is recommended to either use the **master** or the released tags for local deployment and testing.
{% endhint %}

## Build backend services

Modules under [eSignet](https://github.com/mosip/esignet/tree/master) use Maven as the build tool.

[eSignet-service](https://github.com/mosip/esignet/tree/master/esignet-service) is a spring-boot application that hosts all the REST endpoints.

**Prerequisites**

* Java 11
* Apache Maven 3.8.6

**Build Steps**

Run the below command to build eSignet backend services.

```sh
mvn clean install -Dgpg.skip=true
```

{% hint style="info" %}
**Note:** If you want to skip test case execution during the build process, you can add `-DskipTests=true`
{% endhint %}

## Build UI

[eSignet UI](https://github.com/mosip/esignet/tree/master/oidc-ui) is a react application that is built with npm, offering a dynamic user interface to interact with the backend services.

**Prerequisites**

* npm 8.1.2 or higher
* node v16.13.2 or higher

**Build**

* Run the below command to install all the required dependencies

```sh
npm install
```

* Run the below command to build the UI application

```sh
npm run build
```
