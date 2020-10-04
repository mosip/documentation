Data share service is used to share data across the MOSIP platform. The share understands the sensitivity of the information and applied for necessary protection and manages the roles. The roles decide who can access the data in what way.

## Functionality

The basic functionality for data share is to construct and share objects. This functionality can be used by anyone to share random data. Every data that the system receives will be treated as an object. 

Below are the basic features for the Data Share service:

* Ability to create an object 
* Ability to write an object
* Ability to add metadata to an object
* Ability to close an object
* Ability to share a tokenised secure URL
* Ability to encrypt the data with the given public key or credentials.
* Ability to set TTL on data
* Ability to set roles that can access the given URL
* Ability to delete an object
* Delete upon first access
* Delete upon TTL (default defined by policy)
* Delete upon the creator's request (revoke)

## Use cases 

### ABIS Data Share
Biometric data of individuals are shared to ABIS systems using data share for storing biometrics of individuals and performing deduplication on it. When we share data with ABIS systems using data share URL we need various rules which are driven by a policy which is allocated to each ABIS systems.

### Credential Share for Printing


### Credential Share for Authentication Instance

