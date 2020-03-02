# Overview

ID Repository (ID Repo) contains the record of identity for an individual, and provides API based mechanism to store, retrieve and update identity details by other MOSIP modules. ID Repo is used by: 
* Registration Processor
* ID Authentication
* Resident services

#  Key Features 

* Store identity information for a given UIN.
* Update identity information partially or status of UIN.
* Read identity Information associated with a valid UIN.
* Read identity Information for a given RID.
* Check status of UIN for validating a UIN.

The identity data stored inside the ID Repo is encrypted. This is the most critical storage repository and is configured keeping the following non-functional aspects in mind:

* Scalability 
* Performance
* High availability

#  ID Repository functionality

## Store identity data and documents 

Upon receiving the request to store identity details of individual, the system validates input ID attributes in the request against MOSIP ID defined for the country
1. Stores ID Json, biometric documents, proof documents of an individual generated during registration.
1. On successful storage of identity for an individual, status of UIN of the individual is marked as 'ACTIVATED'.

##  Retrieve stored identity details by UIN or RID 

Upon receiving a request to retrieve identity details of an individual based on input UIN or RID and type as an optional parameter, the system performs the following steps:
1. Validates if input UIN is 'ACTIVATED'.
1. Retrieves latest ID of individual.
1. The system retrieves and sends demographic or biometric details or both. 

## Update identity data and documents 

Upon receiving a request to update identity details of an individual, the system performs the following steps:
1. Validates if input UIN is 'ACTIVATED'
1. Updates input ID attributes of individual.
1. Updates demographic/biometric/both 
1. Updates status of UIN as 'DEACTIVATED' or 'BLOCKED' if requested.
1. Sends the response with updated ID details of individual.

## De-activate/re-activate UIN and its associated VIDs 

An individual's UIN/VIDS can be de-activated or re-activated.  

# Process flow

## Identity service
![](_images/id_repo/id_repo_identity_service_flow.pg) 

## VID service
![](_images/id_repo/id_repo_vid_service_flow.pg) 

# Logical view
![](_images/id_repo/id_repo_logical_view.jpg)

# Services

The services, code, design and documentation are available in [commons repo/id-repository](https://github.com/mosip/commons/tree/master/id-repository)

# Build and Deploy

Refer to build and deploy instructions in [commons repo/id-repository](https://github.com/mosip/commons/tree/master/id-repository)

# APIs

[ID Repository APIs](ID-Repository-APIs.md)
