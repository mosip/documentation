# Authentication System

## Overview

This system is an identity repository that stores the individual's demographic and biometric information to perform authentication and provide user information.
As part of this integration with e-Signet, the authentication system should implement below interfaces,

## Authenticator
This is the main interface of e-Signet. Provides methods to authenticate the end-user with control on the supported authentication factors. 
If the OTP is one of the supported authentication factors, interface provides method to define the supported OTP channels and implement the send-otp functionality.

As per OIDC standards, all the certificates used to verify the user data must be published in /.well-known/jwks.json endpoint. 
This interface provides a method to return list of X509 certificate(both active and expired). 

Refer this [link](https://github.com/mosip/esignet/blob/1.0.0/esignet-integration-api/src/main/java/io/mosip/esignet/api/spi/Authenticator.java#L22-L69) 
to check the interface in detail.

### Two main functionalities of this interface, KYC Auth and KYC Exchange are depicted in the below diagram:
<figure><img src="../.gitbook/assets/IdP Diagrams-Page-3.png" alt=""><figcaption></figcaption></figure>

The Authenticator implementation class must be annotated with `ConditionalOnProperty` with `mosip.esignet.integration.authenticator` property.
Ex:
```java
@ConditionalOnProperty(value = "mosip.esignet.integration.authenticator", havingValue = "mock-authentication-service")
@Component
@Slf4j
public class MockAuthenticationService implements Authenticator {
    //Implement authenticator methods
}
```

## KeyBinder

This interface provides method to bind an individualId with a public-key. On successful binding, returns a signed 
certificate which uniquely identifies a user. 
Binding key request requires auth-challenge to do the binding. It is structured to accept any type of auth-challenge, 
namely OTP / PIN / BIO. 

Bound certificate will then be usable to do token based authentication like WLA (Wallet Local Authentication).

Refer this [link](https://github.com/mosip/esignet/blob/1.0.0/esignet-integration-api/src/main/java/io/mosip/esignet/api/spi/KeyBinder.java#L17-L45) 
to check the interface in detail.

The KeyBinder implementation class must be annotated with `ConditionalOnProperty` with `mosip.esignet.integration.key-binder` property.
Ex:
```java
@ConditionalOnProperty(value = "mosip.esignet.integration.key-binder", havingValue = "mock-keybinder-service")
@Component
@Slf4j
public class MockKeyBindingWrapperService implements KeyBinder {
    //Implement keybinder methods
}
```

## AuditPlugin

This interface provide 2 methods to audit any action in e-Signet. Instance of this auditPlugin is injected in all the services of e-Signet, 
almost all the events are audited.

Refer this [link](https://github.com/mosip/esignet/blob/1.0.0/esignet-integration-api/src/main/java/io/mosip/esignet/api/spi/AuditPlugin.java#L12-L34) 
to check the interface in detail.

The Audit plugin implementation class must be annotated with `ConditionalOnProperty` with `mosip.esignet.integration.audit-plugin` property.
Ex:
```java
@ConditionalOnProperty(value = "mosip.esignet.integration.audit-plugin", havingValue = "mock-audit-service")
@Component
@Slf4j
public class LoggerAuditService implements AuditPlugin {
    //Implement audit plugin methods
}
```
