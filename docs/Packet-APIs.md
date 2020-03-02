This section details about the service APIs in the Packet modules

* [Packet Rejection Reasons API](#packet-rejection-reasons-master-api)

* [Packet On Hold Reasons API](#packet-on-hold-reasons-master-api)

# Packet Rejection Reasons Master API

* [POST /packetrejectionreasons/reasoncategory](#post-packetrejectionreasonsreasoncategory)
* [POST /packetrejectionreasons/reasonlist](#post-packetrejectionreasonsreasonlist)
* [GET /packetrejectionreasons](#get-packetrejectionreasons)
* [GET /packetrejectionreasons/{reasoncategorycode}/{languagecode}](#get-packetrejectionreasonsreasoncategorycodelanguagecode)
* [GET /packetrejectionreasons/{id}/{languagecode}/{locationcode}](#get-packetrejectionreasonsidlanguagecodelocationcode)

# POST /packetrejectionreasons/reasoncategory

This service will create the list of Packet Rejection Reasons which are used in the MOSIP platform. 

### Resource URL
### `POST /packetrejectionreasons/reasoncategory`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
code|Yes|Code of the reason category| | 
name|Yes|Name of the reason category| | 
description|Yes|description for the reason category| | 
isActive|Yes|whether the reason category is in use| | 
langCode|Yes|language code of the reason category| | 


### Example Request
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "requesttime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "request": {
		"code":"string",
		"name":"string",
		"description":"string",
		"lang_code":"string",
                "isActive":true
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
	"code":"string",
	"lang_code":"string" 
           }
}
			
	
```
### Response codes

201

Description : Created

400

Description: Bad request

401

Description: Unauthorized

403

Description: Forbidden


# POST /packetrejectionreasons/reasonlist

This service will create the list of Packet Rejection Reasons which are used in the MOSIP platform. 

### Resource URL
### `POST /packetrejectionreasons/reasonlist`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
code|Yes|Code of the reason category| | 
name|Yes|Name of the reason category| | 
description|Yes|description for the reason category| |
rsnCatCode|Yes|foreign key reference from reason category code| | 
isActive|Yes|whether the reason category is in use| | 
langCode|Yes|language code of the reason category| | 


### Example Request
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "requesttime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "request": {
			{
				"code":"string",
				"name":"string",
				"description":"string",
                                "rsnCatCode":"string",
				"lang_code":"string",
                                "isActive":true
				
			}
			
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
  "response":  {
                "code":"string",
                "lang_code":"string",
                "rsnCatCode":"string"
              }
}
			
	
```
### Response codes

201

Description : Created

400

Description: Bad request

401

Description: Unauthorized

403

Description: Forbidden


# GET /packetrejectionreasons
Master data is required across the platform. 

This service will provides the service for the List of Packet Rejection Reasons.



### Resource URL
### `GET /packetrejectionreasons`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
NA


### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response":{
	"reasonCategories" : [
		{
			"code":"string",
			"name":"string",
			"desc":"string",
			"lang_code":"string", 
                        "isActive":"string",
			"reasonLists" : [
				{
					"code":"string",
					"name":"string",
					"desc":"string",
                                        "rsnCatCode":"string",
                                        "isActive":true,
					"lang_code":"string"
				},
				{
					"code":"string",
					"name":"string",
					"desc":"string",
                                        "rsnCatCode":"string",
                                        "isActive":true,
					"lang_code":"string"
				}
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


# GET /packetrejectionreasons/{reasoncategorycode}/{languagecode}

This service will provides the service for the List of Packet Rejection Reasons. 


### Resource URL
### `GET /packetrejectionreasons/{reasoncategorycode}/{languagecode}`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
NA


### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response":{
	"reasonCategories" : {
		"code":"string",
		"name":"string",
		"desc":"string",
		"lang_code":"string", 
                "isActive":true,
		"reason_lists" : [
			{
				"code":"string",
				"name":"string",
				"desc":"string",
                                "rsnCatCode":"string",
                                "isActive":true,
				"lang_code":"string"
			},
			{
				"code":"string",
				"name":"string",
				"desc":"string",
                                "rsnCatCode":"string",
                                "isActive":true,
				"lang_code":"string"
			}
		]
	}
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


# GET /packetrejectionreasons/{id}/{languagecode}/{locationcode}

This service will provides the service for the List of Packet Rejection Reasons based on id, language and location code. 


### Resource URL
### `GET /packetrejectionreasons/{id}/{languagecode}/{locationcode}`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
packetrejectionreasonid|Yes|Code of the language| | 
packetrejectionreasondesc|Yes|Name of the language| | 


### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response":  {
  "packetrejectionreasons": [
				{ 
						"packetrejectionreasonid":"string",
						"packetrejectionreasondesc":"string",
						"languagecode":"string",
						"locationcode":"string"
				}, 
				{ 
						"packetrejectionreasonid":"string",
						"packetrejectionreasondesc":"string",
						"languagecode":"string"
						"locationcode":"string"
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

### Failure Response
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
  "response":  null
}
```

#### Failure details
Error Code | Error Message | Error Description
------------|------------------------------|-------------
KER-MSD-035 | Error occurred while fetching Reasons | Fetch Issue
KER-MSD-057 | Error occurred while inserting reason details | Insertion Issue
KER-MSD-036 | Reason not found | Data Not Found
KER-MSD-058 | Error occurred while inserting reason details | List Insertion Issue


# Packet On-hold Reasons Master API

* [POST /packetonholdreasons](#post-packetonholdreasons)
* [GET /packetonholdreasons](#get-packetonholdreasons)
* [GET /packetonholdreasons/{id}/{languagecode}](#get-packetonholdreasonsidlanguagecode)

# POST /packetonholdreasons

This service will create the list of Packet On-hold Reasons which are used in the MOSIP platform. 

### Resource URL
### `POST /packetonholdreasons`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
packetonholdreasondesc|Yes|Name of the packet rejection reason| | 

### Example Request
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "requesttime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "request": {
	  "packetonholdreasons": [
			{ 
				"packetonholdreasondesc":"string",
				"languagecode":"string"
			}, 
			{ 
				"packetonholdreasondesc":"string",
				"languagecode":"string"
			}
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
      "successfully_created_packetonholdreasons": [
			{ 
				"packetonholdreasonid":"string"
			}, 
			{ 
				"packetonholdreasonid":"string"
			}
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

# GET /packetonholdreasons
Master data is required across the platform. 

This service will provides the service for the List of Packet On-hold Reasons.



### Resource URL
### `GET /packetonholdreasons`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
packetonholdreasonid|Yes|Code of the language| | 
packetonholdreasondesc|Yes|Name of the language| | 


### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response":{
            "packetonholdreasons": [
				{ 
					"packetonholdreasonid":"string",
					"packetonholdreasondesc":"string",
					"languagecode":"string"
				}, 
				{ 
					"packetonholdreasonid":"string",
					"packetonholdreasondesc":"string",
					"languagecode":"string"
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


# GET /packetonholdreasons/{id}/{languagecode}

This service will provides the service for the List of Packet On-hold Reasons. 


### Resource URL
### `GET /packetonholdreasons/{id}/{languagecode}`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
packetonholdreasonid|Yes|Code of the language| | 
packetonholdreasondesc|Yes|Name of the language| | 


### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response":    {
        "packetonholdreasons": [
				{ 
						"packetonholdreasonid":"string",
						"packetonholdreasondesc":"string",
						"languagecode":"string"
				}, 
				{ 
						"packetonholdreasonid":"string",
						"packetonholdreasondesc":"string",
						"languagecode":"string"
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

### Failure Response
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
  "response": null
  }
```