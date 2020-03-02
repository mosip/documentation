This section details about the service APIs in the Biometric types and biometric attributes modules


* [Biometric Types API](#biometric-types-master-api)

* [Biometrics Attributes API](#biometric-attributes-master-api)



# Biometric types Master API

* [POST /biometrictypes](#post-biometrictypes)
* [GET /biometrictypes](#get-biometrictypes)
* [GET /biometrictypes/{id}/{languagecode}](#get-biometrictypes-id-languagecode)

# POST /biometrictypes
Master data is required across the platform. 

This service will create the list of Biometric types which are used in the MOSIP platform. 

### Resource URL
### `POST /biometrictypes`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
biometrictype|Yes|Array of the biometric types| | 

### Example Request
```JSON

{
  "id": "string",
  "version": "string",
  "metadata": {},
  "requesttime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "request": {
	  "biometrictypes": [
				{"biometrictype":"string"},
				{"biometrictype":"string"}
				{"languagecode":"string"}
	                   ]
	             }
}
```
### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {
	"biometrictypes": [
			     {"biometrictype":"string"},
			     {"biometrictype":"string"}
			     {"languagecode":"string"}
	                 ]
             }
}
```
### Response codes
202

Description: Accepted

400

Description: Bad request

401

Description: Unauthorized

403

Description: Forbidden

# GET /biometrictypes

This service will provides the service for the List of Biometrics. 



### Resource URL
### `GET /biometrictypes`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
biometrictypeid|Yes|Code of the language| | 
biometrictype|Yes|Name of the language| | 

### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
   "response":{
                   "biometrictypes": [  { 
					"biometrictype": [
						         {"biometrictypeid":"string"},
						         {"biometrictype":"string"},
						         {"languagecode":"string"}						
					                ]
                                        }, 
				       { 
					"biometrictype": [
						{"biometrictypeid":"string"},
						{"biometrictype":"string"},
						{"languagecode":"string"}						
					]
				}
			]
}
```
200

Description: Success

400

Description: Bad request

401

Description: Unauthorized

404

Description: Not Found


# GET /biometrictypes/{id}/{languagecode}
Master data is required across the platform. 

This service will provides the service for the List of Biometrics. 



### Resource URL
### `GET /biometrictypes/{id}/{languagecode}`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
biometrictypeid|Yes|Code of the language| | 
biometrictype|Yes|Name of the language| | 

### Example Response
##### Success Response:
```JSON
{
"id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "biometrictypes": [
				{ 
					"biometrictype": [
						{"biometrictypeid":"string"},
						{"biometrictype":"string"},
						{"languagecode":"string"}						
					]
				}, 
				{ 
					"biometrictype": [
						{"biometrictypeid":"string"},
						{"biometrictype":"string"},
						{"languagecode":"string"}						
					]
				}
			]
}
```
200

Description: Success

400

Description: Bad request

401

Description: Unauthorized

404

Description: Not Found

##### Error Response:
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": [{
              "errorCode": "string",
              "message": "string"
           }],
   "response":null
}
```

#### Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
KER-MSD-005 | Error occurred while fetching Biometric Types	| Fetch Exception
KER-MSD-105 | Error occurred while inserting biometric type details | Insertion Exception
KER-MSD-006 | Biometric Type not found | Data not found

# Biometric attributes Master API

* [POST /biometricattributes](#post-biometricattributes)
* [GET /biometricattributes/{biometricatributeid}/{languagecode}](#get-biometricattributesbiometricatributeidlanguagecode)
* [GET /getbiometricattributesbyauthtype/{languagecode}/{biometrictypeid}](#get-getbiometricattributesbyauthtypelanguagecodebiometrictypeid)

# POST /biometricattributes

This service will create the list of Biometric attributes which are used in the MOSIP platform. 

### Resource URL
### `POST /biometricattributes`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
biometricattribute|Yes|Array of the biometric attributes| | 

### Example Request
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "requesttime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "request": {
	  "biometricattributes": [
				"biometricattribute",
				"languagecode":"string"
	                       ]
	    }
}
```
### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response":{
             "successfully_created_biometricattributes": [
		              {"biometricatributeid":"string"}
		              {"languagecode":"string"}
                          ]
             }
}
```
### Response codes
202

Description: Accepted

400

Description: Bad request

401

Description: Unauthorized

403

Description: Forbidden

# GET /biometricattributes/{biometricatributeid}/{languagecode}
Master data is required across the platform. 

This service will provides the service for the List of Biometrics. 



### Resource URL
### `GET /biometricattributes/{biometricatributeid}/{languagecode}`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
biometricatributeid|Yes|Code of the language| | 
biometricattribute|Yes|Name of the language| | 

### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response":{
              "biometricattributes": [
				      { 
					"biometricattribute": [
					                  	{"biometricatributeid":"string"},
						                {"biometricattribute":"string"},
						                {"languagecode":"string"}
					                     ]
				       }, 
				      { 
					"biometricattribute": [
					         	{"biometricatributeid":"string"},
						        {"biometricattribute":"string"},
						        {"languagecode":"string"}
					                  ]
				     }
			     ]
             }
     }
```
200

Description: Success

400

Description: Bad request

401

Description: Unauthorized

404

Description: Not Found

# GET /getbiometricattributesbyauthtype/{languagecode}/{biometrictypeid}

This service will provides the service for the List of Biometrics based on the biometric authentication type. 


### Resource URL
### `GET /getbiometricattributesbyauthtype/{languagecode}/{biometrictypeid}`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
biometrictypeid|Yes|Id of the biometric auth type| | 

### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response":{
  "biometricattributes": [
                         {  
                           "code": "string",
	                   "name": "string",
	                   "description": "string",
                           "active": true
                         },
	                {
	                   "code": "string",
	                   "name": "string",
	                   "description": "string",
                           "active": true
                        }
                    ]
          }
}
```
200

Description: Success

400

Description: Bad request

401

Description: Unauthorized

404

Description: Not Found

##### Failure Response:
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": [{
      "errorCode": "string",
      "message": "string"
    }],
  "response":null
}
```

#### Failure details
Error Code | Error Message | Error Description
------------|------------------------------|-------------
KER-MSD-004 | BiometricAttribute not found | Data Not Found
KER-MSD-003 | Error occurred while fetching BiometricAttributes | Fetch Issue
KER-APP-103 | Error occurred while inserting BiometricAttributes | Insertion Issues