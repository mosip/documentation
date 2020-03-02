* [Sync master data - generic approach](#sync)


# Sync master data - generic approach

* [GET /sync](#get-sync)

### GET /sync

This service fetches the master data details. The list of master data entities and their properties, to be fetched, are configured in the Config server. The response structure doesn't contains any nested structure. All the propertyValue returned are of string type. 

#### Resource URL
<div>https://mosip.io/v1/kernel/masterdata/sync/{registrationCenterID}</div>

#### Resource details

Resource Details | Description
------------ | -------------
Response format | The response will be sent in the Response Header and also a JSON message will be returned. 
Requires Authentication | yes

#### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
registrationCenterID|Yes|The id of the registered registration center|-NA-|JDUY283
lastUpdated|Yes|Date in UTC ISO format|-NA-|-NA-

#### Example Request
```
{
	"id": "mosip.kernel.masterdata.sync",
	"ver": "1.0",
	"responsetime": "2007-12-03T10:15:30Z",
	"reqeust": {
		"registrationCenterID":"JDUY283",
		"lastUpdated":"2019-03-04T12:34:15.477Z"
	}
```

#### Response Structure
```
JSON:
{
	"id": "mosip.kernel.masterdata.sync",
	"ver": "1.0",
	"responsetime": "2007-12-03T10:15:30Z",
	"response": {
		"entity_m": [{
			"propertyName_m": "propertyValue_m",
			"propertyName_n": "propertyValue_n"
		}],
		"entity_n": [{
			"propertyName_m": "propertyValue_m",
			"propertyName_n": "propertyValue_n"
		}]
	}
}
```

#### Example Response

Success Response 

```
JSON:
{
	"id": "mosip.kernel.masterdata.sync",
	"ver": "1.0",
	"responsetime": "2007-12-03T10:15:30Z",
	"response": {
		"registrationCenterTypes": [{
			"isDeleted": null,
			"langCode": "fra",
			"isActive": true,
			"code": "REG",
			"name": "Ordinaire",
			"descr": "Centre dinscription "
		}],
		"machineType": [{
			"code": "DKS",
			"name": "ISAHUS",
			"description": "This machine is used for",
			"isDeleted": null,
			"langCode": "ara",
			"isActive": true
		}],
		"devices": [{
			"id": "3000027",
			"name": "Finger Print Scanner 7",
			"serialNum": "CX8481464983",
			"deviceSpecId": "165",
			"macAddress": "d4:98:44:dd:aa:f1",
			"ipAddress": null,
			"validityDateTime": null,
			"isDeleted": null,
			"langCode": "eng",
			"isActive": true
		}],
		"deviceTypes": [{
			"code": "FRS",
			"name": "Finger Print Scanner",
			"description": "For scanning fingerprints",
			"isDeleted": null,
			"langCode": "eng",
			"isActive": true
		}]
	}
}

```


Error Responses

1. Invalid credentials: If the passed credentials is not correct. 
```JSON

{
	"id": "mosip.kernel.masterdata.sync",
	"ver": "1.0",
	"responsetime": "2007-12-03T10:15:30Z",
	"errors":[
			{
				"errorCode": "MST_GNRC_FTCH_AUTH_ERR_INVALIDCREDENTIALS",
				"message": "The passed in credentials is not correct"
		  }	
		]
}

```

2. Invalid registration center id: If the passed in registration center id is not correct. 
```JSON

{
	"id": "mosip.kernel.masterdata.sync",
	"ver": "1.0",
	"responsetime": "2007-12-03T10:15:30Z",
	"errors":[
			{
				"errorCode": "MST_GNRC_RGCNTRID_INVALID",
				"message": "The passed in registration center ID is not correct"
		  }	
		]
}

```