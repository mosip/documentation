## What is .well-known folder?

The ".well-known" folder is a convention used in web development to provide a standardized location for certain files or resources that need to be publicly accessible and discoverable. It typically resides at the root level of a website or web server. The purpose of this folder is to make it easy for web clients (browsers, applications, or services) to find important files or resources related to web services and security.

## Why should we use ".well-know" directory in MOSIP?

MOSIP can use the ".well-known" directory to serve the following purposes:

* **Standardization**: To provide a standardized location for specific public files and resources related to web services and security. It makes it easier for developers and web clients using MOSIP to know where to look for important information.
* **Security**: Security-related files and resources can be placed in the ".well-known" directory, such as the public certificate for encryption and signature verification can be placed here. 
* **Interoperability**: By following the ".well-known" convention, web developers using MOSIP can ensure interoperability with various web standards and protocols. For example, MOISP shares the context file which contains the structure of its Verifiable Credentials.
* **Ease of Configuration**: Web servers can be configured to serve files from the ".well-known" directory without needing custom configurations for each specific resource. This simplifies the server setup and maintenance process.
* **Transparency**: For matters related to security policies and contact information, such as in the "security.txt" file, placing them in a well-known location makes it transparent and easily accessible to anyone interested in the website's security practices.

## How is ".well-known" directory used in MOISP?

MOSIP's ".well-know" directory contains three files,
* controller.json
* mosip-context.json
* public-key.json

### controller.json

The "controller.json" file is used in MOSIP to share the details of the public key using which a MOSIP-issued verifiable credential can be asserted.

```
{
  "@context": "https://w3id.org/security/v2",
  "id": "https://api.collab.mosip.net/.well-known/controller.json",
  "assertionMethod": [
    "https://api.collab.mosip.net/.well-known/public-key.json"
  ]
}
```

### mosip-context.json

The "mosip-context.json" file contains the schema of the subject in the MOSIP-issued verifiable credential.

```
{
  "@context": [{
       "@version": 1.1
    },"https://www.w3.org/ns/odrl.jsonld", {
    "mosip": "https://api.collab.mosip.net/mosip#",
    "schema": "http://schema.org/",
    "rdf": "http://www.w3.org/1999/02/22-rdf-syntax-ns#",
    "vcVer": "mosip:vcVer",
    "UIN": "mosip:UIN",
    "addressLine1": {
        "@id": "https://api.collab.mosip.net/mosip#addressLine1",
        "@context": {"value": "rdf:value", "lang": "@language"}
    },
    "addressLine2": {
        "@id": "https://api.collab.mosip.net/mosip#addressLine2",
        "@context": {"value": "rdf:value", "lang": "@language"}
    },
    "addressLine3": {
        "@id": "https://api.collab.mosip.net/mosip#addressLine3",
        "@context": {"value": "rdf:value", "lang": "@language"}
    },
    "city": {
        "@id": "https://api.collab.mosip.net/mosip#city",
        "@context": {"value": "rdf:value", "lang": "@language"}
    },
     "gender": {
        "@id": "https://api.collab.mosip.net/mosip#gender",
        "@context": {"value": "rdf:value", "lang": "@language"}
    },
     "residenceStatus": {
        "@id": "https://api.collab.mosip.net/mosip#residenceStatus",
        "@context": {"value": "rdf:value", "lang": "@language"}
    },

    "dateOfBirth": "mosip:dateOfBirth",
    "email": "mosip:email",
    "fullName": {

        "@id": "https://api.collab.mosip.net/mosip#fullName",

        "@context": {"value": "rdf:value", "lang": "@language"}
    },
  "phone": "mosip:phone",
    "postalCode": "mosip:postalCode",
    "province": {

        "@id": "https://api.collab.mosip.net/mosip#province",
        "@context": {"value": "rdf:value", "lang": "@language"}
    },
    "region": {
        "@id": "https://api.collab.mosip.net/mosip#region",

        "@context": {"value": "rdf:value", "lang": "@language"}
    },
    "biometrics": "mosip:biometrics"
  }]
}
```

### public-key.json

The "public-key.json" file contains the public key using which the signature of the MOSIP-issued verifiable credential can be asserted.

```
{
  "@context": "https://w3id.org/security/v2",
  "type": "RsaVerificationKey2018",
  "id": "https://api.collab.mosip.net/.well-known/public-key.json",
  "controller": "https://api.collab.mosip.net/.well-known/controller.json",
  "publicKeyPem": "-----BEGIN PUBLIC KEY-----\r\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA07+Esb/PSV2e5p/afi4O\r\n6ICRD699POqCWzt9obGBPHdmPTD3QYU3c/CnEPNHBzvQKWcaIWRmwTi8yGAwyUU9\r\n5ESU9/o78ACHrcFRIdluuiQuhDP4ojQLDpX/dPULPc/dt96b5t1uPhELnySq/EPr\r\n6hcqGuMyLl/yfKr/vQdaTqKmmrm8gTTnzsQ4jvpeucrDEBqm5LtSzYQb4PRMQe0u\r\nhrnZjbVmoUKCNpXXrKMfswqLhz2gInkN7+SJToCEcEj1f2tJYUsL0LufceEQQFy0\r\nKaq+Xu1Jx1OwnRP1HhS8aepLct8O1H3e0DrMCLgSZ89HiSpWQ+0DMKDMdROCm7uU\r\noQIDAQAB\r\n-----END PUBLIC KEY-----"
}
```
