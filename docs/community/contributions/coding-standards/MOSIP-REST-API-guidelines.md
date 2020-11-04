# 1	Introduction
## 1.1	Context
MOSIP is developed as an open source framework project. The code developed complies with the Java standards and best practices. 
## 1.2	Purpose of this document
This document gives various RESTful webservice standards which have to be followed during the MOSIP development. 
## 1.3	Scope of this document
This document covers the coding standards, which are followed by the RESTful webservice developers.
# 2	URL structure

## 2.1	General structure
The syntax of the URL of the RESTful webservice should be as follows for all the modules except Kernel, 

`https://<IP_ADDRESS>:<PORT>/<MODULE_NAME>/<VERSION>/<RESOURCE_NAME>/<PARAMETERS_AND_VALUES_IF_ANY>`

For example, 

`https://mosip.io/pre-registration/v1/document`


Only in case of Kernel modules, the <MODULE_NAME> is not included. The format is as follows, 

`https://<IP_ADDRESS>:<PORT>/<VERSION>/<RESOURCE_NAME>/<PARAMETERS_AND_VALUES_IF_ANY>`


Following URL is an example for Kernel,

`https://mosip.io/v1/emailnotifier`

The convention is, before <RESOURCE_NAME>, we should have the version number. 

The URL is the sentence, the resources are nouns and the HTTP methods are verbs. 
The URL, before the parameters, should contain only spinal case ( - ). The URL, before the parameters, should not contain snake case ( _ ) or camel case. 
NOTE: The parameters can contain snake case or camel case. 

# 3	Resources - Usage of nouns and verbs

Use nouns for CRUD operations.  
Resource	GET
read	POST
create	PUT
update	DELETE
delete
/preenrolments	Returns list of pre enrolments	Creates a new pre enrolment	Bulk updates	Delete all preenrolments
/preenrolments/123	Returns a particular pre enrolment	Updates a specific car	Deletes a specific car

For operations, wherever applicable the operations can be added as part of the URL itself. For example,  
/getAllPreenrolments
/createNewEnrolment
/deleteAllPreenrolments

# 4	Resources – Usage of plurals in nouns

Use the plural nouns in the resource names if there is CRUD operations. For example, 

`https://mosip.io/pre-registration/v1/individuals`		 Prefer 

`https://mosip.io/pre-registration/v1/individual`		 Avoid

In other cases, use singulars in the nouns. For example, 

`https://mosip.io/pre-registration/v1/OTP`

# 5	Resources – actions in the URL
The actions are added in the URL, wherever applicable. For example, 

`https://mosip.io/pre-registration/v1/OTP/generator`

`https://mosip.io/pre-registration/v1/OTP/validator`

# 6	Appropriate usage of the HTTP methods
Use only the intended purpose of the HTTP methods. For example, do not use POST to update a resource or PUT to create a resource. 

# 7	HTTP Status codes
In all the success cases and failure cases, 200 HTTP Status code is returned. Based on the "errors" JSON element in the response, the caller can decide whether the call is success or failure. 
 

# 8	Identifying a resource
When the caller want to identify the resource, the path param is used. For example, 

`https://mosip.io/pre-registration/v1/individuals/id1234`

# 9	Filtering
The filter has to be applied via the URL parameters. For example,

`https://mosip.io/pre-registration/v1/individuals/id1234?city=someCityName&pincode=473822`

# 10	Sorting
In case if the results have to be sorted, it can be mentioned in the URL parameter named sort. For example, 

`https://mosip.io/pre-registration/v1/individuals/1234?sort=firstName`

# 11	Pagination
In case of pagination, the page number can be mentioned in the parameter by the name “page”. For example, 

`https://mosip.io/pre-registration/v1/individuals/1234?page=15`

# 12	Always use SSL
Always use SSL for the services. No services should be exposed without SSL. 

# 13	Versioning
Always version the service. The version have to be mentioned in the URL of the service after the hostname (and port number, if any). For example,   

`https://mosip.io/pre-registration/v1/individuals/1234` --> Except Kernel module

`https://mosip.io/v1/individuals/1234` --> Kernel module

# 14	Design first approach
Always go with the design first approach. First, define the Swagger specification and publish to the Swagger UI after getting it reviewed. The coding should be started after the design is completed and the specification is completed in Swagger. 

# 15	Request format
There are 3 sections in the Request. 

15.1. Request headers:
This will contain 3 mandatory fields. They are "id", "version" and "requesttime". The "requesttime" have to be in UTC standard ISO8601 format

15.2. Request meta data:
This is an optional field. If the service is expecting any metadata, they can be passed here. 


15.3. Request payload: 
This is an optional field. The request payload goes here. 

For example, 

Request: 
```JSON
{
	/***** Following is the header information *****/
	"id":"mosip.kernel.otpservice",			
	"version":"1.0",	
	"requesttime":"2007-12-03T10:15:30Z",
	
	/***** Following is the metadata information *****/
	"metadata" : {
	},
	
	/***** Following is the request payload *****/
	"request" : {
		// payload
	}
}
```

# 16	Response format
There are 4 sections in the Response. 

16.1. Response headers:
This will contain 3 mandatory fields. They are "id", "version" and "requesttime". The "requesttime" have to be in UTC standard ISO8601 format

16.2. Response meta data:
This is an optional field. If the service is expecting any metadata, they can be passed here. 

16.3. Response payload: 
The response payload goes here. 

16.4. Errors: 
The Errors array goes here. Even, in case of single error, the error have to be in an array. This is an optional field. In case if the service doesn't contains error, this element will not be there in the response. 


For example, 

Response: 
```JSON
{

	/***** Following is the header information *****/
	"id":"mosip.kernel.otpservice",			
	"version":"1.0",	
	"responsetime":"2007-12-03T10:15:30Z",	

	/***** Following is the metadata information *****/
	"metadata" : {
		"status" : "error"
	},
	
	/***** Following is the response payload *****/
	"response" : {
		// payload
	}

	/***** Errors wrapped in an array *****/
	"errors":[
		"errorCode": "PRG_PAM_APP_001",
		"message": "Mobile or email not available"
	  },
  	  {
		"errorCode": "PRG_PAM_APP_001",
		"message": "Service vendor is not responding"
	  }		
	]
}
```

In case, there is no request payload or path params or URL params, only the version will be present in the URL. 

# References

```
https://en.wikipedia.org/wiki/List_of_HTTP_status_codes

https://blog.mwaysolutions.com/2014/06/05/10-best-practices-for-better-restful-api/

https://hackernoon.com/restful-api-designing-guidelines-the-best-practices-60e1d954e7c9

https://restfulapi.net/resource-naming/
```

