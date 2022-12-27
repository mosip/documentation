# ARCHITECTURE

## Component Diagram

![](_images/e-signet-component-diagram-Page-3.png)

1. **IDP UI**

* Responsible to do the following:
    * All user interactions
    * Forward few request details from relying party received through standard OpenID connect endpoints
    * Redirect to relying party web app with relevant details
    * Interact with SBI service running in the local machine to collect encrypted and signed biometric data
* Runs on the end user browser and invokes the REST API endpoints of the IDP service component to send and receive details required for user interaction
* Built using React framework

2. **IDP Service**

* Responsible to do the following
    * Expose standard OpenID Connect API endpoints for relying party consumption
    * Expose REST API endpoints for UI component consumption
    * Expose REST API endpoints for OIDC client management
* Authentication wrapper library component will be provided as a run time dependency by including in the class path
* IDP core and Keymanager components are used as build time dependencies for various common and crypto functionalities
* Built using spring boot framework

3. **Keymanager**

* Responsible for secure key management and expose API for all the cryptography functionalities required by the IDP service component
* It depends on HSM (Hardware Security Module) for the secure storage of keys
* Typically keymanager is run as a service, but it is used as a library in the IDP service to minimize the effort for managing extra containers

4. **IDP Core**

Library component used to maintain the common interfaces, DTOs and utility methods

Used as a build time dependency for IDP service

Used as a compile time dependency for Authentication Wrapper library since this library contains the common interfaces and DTOs

Authentication Wrapper

Library component which has interface implementations required by the IDP service for loose coupled integration to Authentication System

Contains all the integration logic to connect to an Authentication System and proxy the authentication process and user claims collection

Expected as runtime dependency to facilitate use of officially released container images even in custom integrations

Authentication System

System responsible to contain resident demographic and optionally biometric information to perform authentication and provide user information

In case of integration with MOSIP based ID system, this could IDA module

In case of integration with non-MOSIP ID system, this could be any functional or foundational ID system which can facilitate mechanism to do verification and share user information.

Cache Server

Responsible to temporarily maintain the current transaction details with a short expiry time

Used for faster access and update of transaction details

Redis is currently used and integrated behind spring cache, so can be switched easily with minor changes to configurations

Database

Contains the tables required for keymanager component and stores the OIDC client details

Postgres is used as current database, but can be switched easily with minor changes to configuration and database layers in IDP service and keymanager components

HSM

Hardware Security Module is responsible for secure maintenance of the keys

First level key decryption happens inside this component

SBI Service

Software application that runs in an end user machine from where IDP solution is accessed

Allows interaction to a biometric device through a well defined interface over HTTP

Returns a encrypted and signed biometric that can be passed on to the Authentication System for verification
