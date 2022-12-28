# Architecture Overview

## Principles

TBD

## Components

![](\_images/e-signet-component-diagram.png)

### **IdP UI**

* Responsible for the following:
  * User interactions
  * Forwarding request details received from the relying party through standard OpenID connect endpoints
  * Redirect to the relying party's web application with relevant details
  * Interact with the [SBI (Secure Biometric Interface)](https://app.gitbook.com/s/-M1R77ZUwR6XwtPjJIVm/biometrics/mosip-device-service-specification) service running in the local machine to collect encrypted and signed biometric data
* Runs on the end user browser and invokes the REST API endpoints of the [IdP service](architecture.md#idp-service) component to send and receive details required for user interaction
* Built using React framework

### **IdP Service**

* Responsible for the following
  * Expose standard OpenID Connect API endpoints for the relying party consumption
  * Expose REST API endpoints for UI component consumption
  * Expose REST API endpoints for OIDC client management
* The authentication wrapper library component is provided as a run time dependency by including it in the classpath
* [IdP core](architecture.md#idp-core) and [Key Manager](architecture.md#key-manager) components are used as build-time dependencies for various common and crypto functionalities
* Built using spring boot framework

### **Key Manager**

* Responsible for secure key management and exposing API for all the cryptography functionalities required by the IdP service component
* It depends on [HSM (Hardware Security Module)](architecture.md#hsm) for the secure storage of keys
* Typically key manager is run as a service, but it is used as a library in the [IdP service](architecture.md#idp-service) to minimize the effort of managing extra containers

### **IdP Core**

* Library component used to maintain the common interfaces, DTOs and utility methods
* Used as a build-time dependency for IdP service
* Used as a compile-time dependency for the [Authentication Wrapper](architecture.md#authentication-wrapper) library since this library contains the common interfaces and DTOs

### **Authentication Wrapper**

* Library component which has interface implementations required by the IdP service for loosely coupled integration to the [Authentication System](architecture.md#authentication-system)
* It contains all the integration logic to connect to an [Authentication System](architecture.md#authentication-system) and proxy the authentication process and user claims collection
* Expected as runtime dependency to facilitate the use of officially released container images even in custom integrations

### **Authentication System**

* This system is responsible to contain resident demographic and optionally biometric information to perform authentication and provide user information
* In case of integration with an ID system, this could be any functional or foundational ID system which can facilitate the mechanism to do verification and share user information.

### **Cache Server**

* Responsible for temporarily maintaining the current transaction details with a short expiry time
* Used for faster access and update of transaction details
* Redis is currently used and integrated behind the spring cache, so can be switched easily with minor changes to configurations

### **Database**

* Contains the tables required for the key manager component and stores the OIDC client details
* Postgres is used as the current database but can be switched easily with minor changes to configuration and database layers in [IdP service](architecture.md#idp-service) and key manager components

### **HSM**

* Hardware Security Module is responsible for the secure maintenance of the keys
* First-level key decryption happens inside this component

### **SBI Service**

* A software application that runs in an end-user machine from where the IdP solution is accessed
* Allows interaction with a biometric device through a well-defined interface over HTTP
* Returns an encrypted and signed biometric that can be passed on to the [Authentication System](architecture.md#authentication-system) for verification
