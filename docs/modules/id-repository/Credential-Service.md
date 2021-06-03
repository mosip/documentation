
# Credential Services

## Create Credential Based on Policy
* Credential share is responsible to share the user's data to a credential partner for printing, issuing cards, verifying data, etc.
The credential share is a functional service that interacts with the id repository and collects the user attributes as per policy defined for the credential partner. The service responsibilities are as follows.

    Retrieve an individual's details from ID repository as per policy.
    If required collect the biometrics of the individual; based on policy the extracted biometrics are collected from ID repository.
    Encrypt the data as per the policy.
    Construct a simple map and store the details of the individual.
    All shared data is signed before encryption and shared as a Data Share URL (configurable as per policy).

## Credential Formatters
* Credential formatters are part of credential services.The job of the credential formatter is to take the input such as (name,age,DOB) and create the output such as QR Code by the way of policy.The policy will define what the output or the QR code will contain.

## To Do
## Verifiable Credential Support


## To Do
## API Details
 * [API Documentation](Credential-Service-API-Documentation.md)

* Configuration Parameters
    * List of parameters and how they alter the behaviour of the API

## Links to related content
* Links to design documentation
* Links to How To articles
   * Setting up credential types in the system

