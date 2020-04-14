# UIN Generation
MOSIP generates a pool of UINs before the registration process and stores them. The UIN generation policies can be defined or modified by country as per their requirement.

The UINs generated for the current implementation, follow the following policies:

1. UIN should not contain any alphanumeric characters
1. UIN should not contain any repeating numbers for 2 or more than 2 digits
1. UIN should not contain any sequential number for 3 or more than 3 digits
1. UIN should not be generated sequentially
1. UIN should not have repeated block of numbers for 2 or more than 2 digits
1. The last digit in the number should be reserved for a checksum
1. The number should not contain '0' or '1' as the first digit.
1. First 5 digits should be different from the last 5 digits (example - 4345643456)
1. First 5 digits should be different to the last 5 digits reversed (example - 4345665434)
1. UIN should not be a cyclic figure (example - 4567890123, 6543210987) 
1. UIN should be different from the repetition of the first two digits 5 times (example - 3434343434)
1. UIN should not contain three even adjacent digits (example - 3948613752)
1. UIN should not contain admin defined restricted number

**_Note:_**
The number of UINs to be generated in a pool depends on a configuration to be done by the country depending on the peak registration requirements. UIN generation service will receive a request by Registration Processor to get a UIN. The service responds with an un-allocated UIN from the generated pool. When the pool reaches a configured number of minimum UINs, MOSIP generates another pool of UIN.

# VID Generation
MOSIP will generate a pool of VIDs through a Batch Job. The number of VIDs generated will be configurable by the country. All the VIDs generated will be assigned a status _“Available”_ which means that the VID is available for allocation to a UIN. Any request for VID allocation will pick up VIDs which have this status. The Batch Job to generate the pool will run every time the number of VIDs in the pool reduces to a configured number.

VID generation will happen according to the below logic.
1.  VID generated should contain the number of digits as configured.
2.  A generated VID should follow the below logic
    a.	The number should not contain any alphanumeric characters
    b.	The number should not contain any repeating numbers for 2 or more than 2 digits
    c.	The number should not contain any sequential number for 3 or more than 3 digits
    d.	The numbers should not be generated sequentially
    e.	The number should not have repeated block of numbers for 2 or more than 2 digits
    f.	The number should not contain the restricted numbers defined by the ADMIN
    g.	The last digit in the number should be reserved for a checksum
    h.	The number should not contain '0' or '1' as the first digit.

MOSIP has a VID generator service which will receive a call to generate a VID. The service will also support receiving an expiry period (optional Parameter). This service when called will pick up a VID from the pre-generated pool and respond it to the source. The Service will also mark that VID in the pool as _“Assigned”_ and attach the expiry period to the VID if received. The service will also make an asynchronous call to the batch job to check the remaining VIDs and generate the pool if needed.

MOSIP also has a VID revoke service which will receive a VID and expire it. When received a request along with the VID, the service will change the status of the VID as _“Expired”_.

MOSIP also has a batch Job to auto-expire VIDs and mark expired VIDs as to be available to be allocated again.

1.	All the VIDs will be marked as ‘Expired’ through the batch job based on the expiry period assigned to them
2.	All the VIDs which are in expired state for a configured amount of days should be marked as ‘Available’ through a daily batch job thus enabling re-usability of them


# List of Configurable Parameters
* [**Link to Configurable Parameters of Kernel**](https://github.com/mosip/mosip-config/blob/master/config-templates/kernel-env.properties)
* [**Link to Kernel Application Properties**](https://github.com/mosip/mosip-config/blob/master/config-templates/application-env.properties)
