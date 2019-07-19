# Static Token generator

#### Background

The partners have to store the individual information in their database. The partner cannot store the UIN or VID. Hence, there should be a service in MOSIP which will generate a Static Token for the requested UIN and Partner ID combination.  

#### Solution



**The key solution considerations are**

- Following are the steps to digitally sign the services in the system, 

1. There should be a RESTful web service which will accept the request input as UIN and Partner ID. 

2. The service will apply the following algorithm to calculate the Token ID and return back. 
	
	- SHA256( SHA256(UIN + SALT_1) + partner code + SALT_2).

3. The SALT_1 and SALT_2 values are retrieved from the config server. 

4. The response will contain only the Static Token generated. 

5. The same Static Token will be returned for every request for the same UIN and Partner ID combination. 

NOTE: This requirement and design have to be reviewed properly, since this was done in a hurry. Questions are, 1. Where this service will be hosted? Currently, this is in Kernel. But, this might have to be moved to the UIN Repository service space. Otherwise, the user have to pass a VID to this service and UIN is fetched to calculate the static token 2. Will the Salts be rotated. If this is rotated, we might need a database to track these changes. 3. Do we need to really have a static algorithm for this? If UIN is used and if the Salts are compromised, the PII data can be compromised. However, the risk can be minimized by rotating the Salts. 4. Roles who can access this service have to be defined. 5. Do we need to audit the requests? 6. From which system, the UIN is passed to this service? How come that system gets the UIN? Has that system guarantees the data privacy of an individual? 


## Implementation


**kernel-tokenidgenerator-service** [README](../../../kernel/kernel-tokenidgenerator-service/README.md)


