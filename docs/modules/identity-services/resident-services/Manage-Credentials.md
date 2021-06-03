# Credential Management

## What is a credential
* Credentials are user's data or user attributes which can be shared with credential partner for printing, issuing cards and to verify their identity through authentication.

##  Types of credentials
* Sharing of biometric data to ABIS systems 
* Sharing of biometric and demographic credentials to authentication instances during issuance or update of Identity
* Sharing of credentials to print partners when a resident requests for an ID

## Requesting a credential
* User requests for credentials via resident service with VID, provider(subscriber/partner), pin(password), Authentication request(biometric or OTP based authentication request)

## Cancelling the crendetial request
* Users can cancel the requested credentials by providing the request Id received from the response

## Checking status of a credential request
* Users can get the credential status by providing the request Id.The credential status could be Requested,Issued,Stored,failed,Printing etc

## Revoking Credentials
* An individual can request to revoke his/her credentials using credential Service if the individual feels his/her credentials has been compromised. The individual provides the request Id as input

## To Do

## API Details
* [API Documentation](Resident-Service-API-Documentation.md)

* Configuration Parameters
    * List of parameters and how they alter the behaviour of the API

## Links to related content
* Link to design documentation,
* Links to How To articles
    * Setting up credential types in the system

