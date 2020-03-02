* **UIN Generation** _(UIG_FR_1)_

MOSIP generates a pool of UINs before the registration process and stores them. 
The UIN generation policies can be defined\modified by country as per their requirement


The UINs generated follow the following policies:


1. UIN should not contain any alphanumeric characters
1. UIN should not contain any repeating numbers for 2 or more than 2 digits
1. UIN should not contain any sequential number for 3 or more than 3 digits
1. UIN should not be generated sequentially
1. UIN should not have repeated block of numbers for 2 or more than 2 digits
1. The last digit in the number should be reserved for a checksum
1. The number should not contain '0' or '1' as the first digit.
1. First 5 digits should be different from the last 5 digits (E.g. 4345643456)
1. First 5 digits should be different to the last 5 digits reversed (E.g. 4345665434)
1. UIN should not be a cyclic figure 
1. UIN should be different from the repetition of the first two digits 5 times (E.g. 3434343434)
1. UIN should not contain three even adjacent digits (E.g. 3948613752)
1. UIN should not contain admin defined restricted number.

Note:
The number of UINs to be generated in a pool depends on a configuration to be done by the country depending on the peak registration requirements. UIN generation service will receive a request by Registration Processor to get a UIN. The service responds with an un-allocated UIN from the generated pool. 
When the pool reaches a configured number of minimum UINs, MOSIP generates another pool of UIN.

* **VID Generation** _(DAT_FR_4.6)_

MOSIP will generate a pool of VIDs through a Batch Job. The no. of VIDs generated will be configurable by the country. All the VIDs generated will be assigned a status “Available” which means that the VID is available for allocation to a UIN. Any request for VID allocation will pick up VIDs which have this status. The Batch Job to generate the pool will run every time the no. of VIDs in the pool reduces to a configured number.

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

MOSIP has a **VID Generator service** which will receive a call to generate a VID. The Service will also support receiving an expiry period (optional Parameter). This service when called will pick up a VID from the pre-generated pool and respond it to the source. The Service will also mark that VID in the pool as “Assigned” and attach the expiry period to the VID if received. The Service will also make an asynchronous call to the batch job to check the remaining VIDs and generate the pool if needed.

MOSIP also has a **VID revoke Service** which will receive a VID and expire it. When received a request along with the VID, the service will change the status of the VID as “Expired”.

MOSIP also has a batch Job to auto-expire VIDs and mark expired VIDs as to be available to be allocated again.
1.	All the VIDs will be marked as ‘Expired’ through the batch job based on the expiry period assigned to them
2.	All the VIDs which are in expired state for a configured amount of days should be marked as ‘Available’ through a daily batch job thus enabling re-usability of them


### List of Configurable Parameters and Processes 

1. Configurable Parameters

   [**Link to Configurable Parameters of Kernel**](/mosip/mosip-config/blob/master/config/kernel.properties)

   [**Link to Kernel Application Properties**](/mosip/mosip-config/blob/master/config/application.properties)

2. Configurable Processes 
* (Work in Progress) 

### Kernel API
[**Refer to Wiki for more details on Kernel API**](Kernel-APIs)
