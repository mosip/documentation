# Components

The image below is a block diagram of e-Signet comprising various components along with the different layers and external systems.

![](\_images/esignet-components-updated.png)

### Relying Party System

The relying party system is any application who would need the verified user information and a unique user login functionality to provide various services online. It depends on OpenID Connect libraries to integrate with e-Signet.

### Digital Wallet

The key bound credentials stored in the wallet app can be used to verify the user to avail the services provided by a Relying party system. 

To know more, refer [here](integration-guides/authentication-system-integration.md#keybinder).

### **e-Signet (OIDC) UI**

* This is the front-end application which is mainly responsible for the user interactions.
* Runs on the end user browser and invokes the REST API endpoints of the e-Signet Service component.
* It acts as a first level proxy and forwards the request details received through standard [OpenID connect](https://openid.net/connect/) endpoints to the esignet service.
* On completion of all user interactions, it redirects to the relying party's web application with relevant details.
* e-Signet UI also interacts with the [SBI (Secure Biometric Interface)](https://app.gitbook.com/s/-M1R77ZUwR6XwtPjJIVm/biometrics/mosip-device-service-specification) service running in the local machine to collect encrypted and signed biometric data.
* It is built using the `React` framework.

### **e-Signet Service**

* e-Signet service is the main backend application which has various layers and integrates with multiple components.
* It has a **Service layer** containing the business logic to serve the below API endpoints:
  * Standard `OpenID Connect API` endpoints for the relying party consumption
  * REST API endpoints for UI component consumption
  * REST API endpoints for OIDC client management
* The Service layer is also dependent on Cache layer, Data layer, Key Manager, Authentication Wrapper and esignet Core components.
* The e-Signet service also has a **Cache layer** which is responsible for:
  * Temporarily maintaining the current transaction details with a short expiry time
  * Providing faster access and update of transaction details
  * It relies on Spring cache to integrate with a distributed cache. Currently, `Redis` is configured to ensure data sharing across multiple instances of esignet service.
* The **Data layer** is used to store the relying party client or application details. `Postgres` is used as the current database.
* This is built using the `Spring Boot` framework.

### Plugins

* These library components acts like a proxy to the Authentication system.
* These plugins have [interface](integration-guides/authentication-system-integration.md) implementations required by the e-Signet service for loosely coupled integration to the Authentication System.
* Expected as runtime dependency to facilitate the use of officially released container images even in custom integrations.

### Key Manager

* Key Manager is used for secure key management and cryptography functionalities required by the e-Signet service component.
* It can be integrated with a HSM (Hardware Security Module) for the secure storage of keys.
* Typically, Key Manager is run as a service, but it is used as a library in the e-Signet Service to minimize the effort of managing extra containers.
* It depends upon the Data layer for maintaining the metadata on keys.

### **e-Signet Core**

* e-Signet core is a library component used to maintain the common interfaces, DTOs and utility methods.
* Used as a build-time dependency for e-Signet service.

### **Authentication System (ID system)**

* This system could be any functional or foundational ID system that contains the resident demographic and biometric information (optional).
* It facilitates the mechanism to perform identity verification and share the required user information.
