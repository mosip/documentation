# VID Services

## Concept of VID
* During the allocation of the Unique Identification Number (UIN), the system also allocates a Virtual Identification Number (VID) to the individual. VID is an alternative to UIN and is a temporary number that can be used for authentications of an individual. The individual can provide the VID instead of UIN to authenticate themselves and protect their UIN from being accessed by someone else.

## Generate VID
* MOSIP will generate a pool of VIDs through a Batch Job. The number of VIDs generated will be configurable by the country. All the VIDs generated will be assigned a status “Available” which means that the VID is available for allocation to a UIN. Any request for VID allocation will pick up VIDs which have this status. The Batch Job to generate the pool will run every time the number of VIDs in the pool reduces to a configured number.

    VID generation will happen according to the below logic:

* VID generated should contain the number of digits as configured.
A generated VID should follow the below logic a. The number should not contain any alphanumeric characters b. The number should not contain any repeating numbers for 2 or more than 2 digits c. The number should not contain any sequential number for 3 or more than 3 digits d. The numbers should not be generated sequentially e. The number should not have repeated block of numbers for 2 or more than 2 digits f. The number should not contain the restricted numbers defined by the ADMIN g. The last digit in the number should be reserved for a checksum h. The number should not contain '0' or '1' as the first digit.

* MOSIP has a VID generator service which will receive a call to generate a VID. The service will also support receiving an expiry period (optional Parameter). This service when called will pick up a VID from the pre-generated pool and respond it to the source. The Service will also mark that VID in the pool as “Assigned” and attach the expiry period to the VID if received. The service will also make an asynchronous call to the batch job to check the remaining VIDs and generate the pool if needed.

## Revoke VID
* MOSIP also has a VID revoke service which will receive a VID and expire it. When received a request along with the VID, the service will change the status of the VID as “Expired”.

## To Do
## Privacy Features

## To Do
## API Details
 * [API Documentation](https://nayakrounak.gitbook.io/mosip-docs/v/1.2.0/modules/id-repository/Credential-Service-API-Documentation.md)

* Configuration Parameters
    * List of parameters and how they alter the behaviour of the API

## Links to related content
* Links to design documentation
* Links to How To articles

