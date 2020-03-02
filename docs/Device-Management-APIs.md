## Device Management
* [Device Providers](#device-providers)
* [Foundational Trust Providers](#foundational-trust-providers)
* [Devices](#devices)
* [MDS API](#mds-api)

# Device Providers

* [POST /deviceprovider](#post-deviceprovider)
* [PUT /deviceprovider](#put-deviceprovider)

### POST /deviceprovider

This service creates a service provider. The history is persisted

### Resource URL
### `POST /deviceprovider`
`https://mosip.io/v1/masterdata/deviceprovider`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
vendorName|yes|This is the name of the vendor|-NA|-NA-
address|yes|This is the address of the vendor|-NA|-NA-
email|yes|This is the email of the vendor|-NA|-NA-
contactNumber|yes|This is the contact number of the vendor|-NA|-NA-
certificateAlias|yes|This is the certificate alias of the vendor|-NA|-NA-
isActive|yes|This field represents whether this entity is active or not|-NA|-NA-
id|yes|This is the id of the vendor|-NA|-NA-

### Example Request
```JSON
{
	"id": "string",
	"metadata": {},
	"request": {
		"address": "test1",
		"certificateAlias": "test",
		"contactNumber": "9663175928",
		"email": "test@mosip.io",
		"isActive": true,
		"vendorName": "test vendor1"
	},
	"requesttime": "2018-12-10T06:12:52.994Z",
	"version": "string"
}
```

### Example success response
```JSON
{
	"id": null,
	"version": null,
	"responsetime": "2020-02-06T09:13:59.522Z",
	"metadata": null,
	"response": {
		"id": "0e90bb45-cc9b-4521-9644-72755f6aa1e9",
		"vendorName": "test vendor1",
		"address": "test1",
		"email": "test@mosip.io",
		"contactNumber": "9663175928",
		"certificateAlias": "test",
		"isActive": true,
		"createdBy": "110006",
		"createdDateTime": "2020-02-06T09:13:59.533Z",
		"updatedBy": null,
		"updatedDateTime": null,
		"isDeleted": null,
		"deletedDateTime": null
	},
	"errors": []
}

```
### Example failure response
```JSON
{
	"id": "io.mosip.masterdata.deviceprovider.create",
	"version": "1.0",
	"metadata": {},
	"responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
	"errors": [{
		"errorCode": "string",
		"message": "string"
	}],
	"response" : null
}
```

#### Failure details
Error Code  | Error Message | Error Description
-----|----------|-------------
KER-ATH-401 |Authentication Failed|If no role/invalid token is detected
ADM-DPM-010 |Mandatory input parameter is missing|If any mandatory input parameter is missing
ADM-DPM-011 |Device Provider already exist|If the Device provider details already exist
ADM-DPM-012 |Error occurred while registering a Device Provider|If there an error from DB while storing details of Device Provider

### PUT /deviceprovider

This service updates a service provider. The history is persisted

### Resource URL
### `PUT /deviceprovider`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
vendorName|yes|This is the name of the vendor|-NA|-NA-
address|yes|This is the address of the vendor|-NA|-NA-
email|yes|This is the email of the vendor|-NA|-NA-
contactNumber|yes|This is the contact number of the vendor|-NA|-NA-
certificateAlias|yes|This is the certificate alias of the vendor|-NA|-NA-
isActive|yes|This field represents whether this entity is active or not|-NA|-NA-
id|yes|This is the id of the vendor|-NA|-NA-

### Example Request
```JSON
{
  "id": "string",
  "metadata": {},
  "request": {
    "address": "test",
    "certificateAlias": "added",
    "contactNumber": "9000000000",
    "email": "test@mosip.io",
    "id": "11123",
    "isActive": true,
    "vendorName": "vendor1"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```

### Example success response
```JSON
{
  "id": null,
  "version": null,
  "responsetime": "2019-11-19T07:00:13.333Z",
  "metadata": null,
 "response": {
    "id": "11123",
    "vendorName": "vendor1",
    "address": "test",
    "email": "test@mosip.io",
    "contactNumber": "9663175928",
    "certificateAlias": "added",
    "isActive": true,
    "createdBy": "110005",
    "createdDateTime": "2019-11-19T07:00:13.375Z",
    "updatedBy": "110005",
    "updatedDateTime": "2019-11-19T07:00:13.375Z",
    "isDeleted": null,
    "deletedDateTime": null
  },
  "errors": []
}

```
### Example failure response
```JSON
{
	"id": "io.mosip.masterdata.deviceprovider.create",
	"version": "1.0",
	"metadata": {},
	"responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
	"errors": [{
		"errorCode": "string",
		"message": "string"
	}],
	"response" : null
}
```

### Response codes
200

### Example failure response
```JSON
{
	"id": "io.mosip.masterdata.deviceprovider.update",
	"version": "1.0",
	"metadata": {},
	"responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
	"errors": [{
		"errorCode": "string",
		"message": "string"
	}],
	"response" : null
}
```

### Response codes
200

#### Failure details
Error Code  | Error Message | Error Description
-----|----------|-------------
KER-ATH-401 |Authentication Failed|If no role/invalid token is detected
ADM-DPM-013|Mandatory input parameter is missing|If any mandatory input parameter is missing
ADM-DPM-014 |Error occurred while registering a Device Provider|If there an error from DB while storing details of Device Provider

# Foundational Trust Providers

* [POST /foundationaltrustprovider](#post-foundationaltrustprovider)
* [PUT /foundationaltrustprovider](#put-foundationaltrustprovider)

### POST /foundationaltrustprovider

This service creates a service provider. 

### Resource URL
### `POST /foundationaltrustprovider`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
vendor_name|yes|This is the name of the vendor|-NA|-NA-
address|yes|This is the address of the vendor|-NA|-NA-
email|yes|This is the email of the vendor|-NA|-NA-
contactNo|yes|This is the contact number of the vendor|-NA|-NA-
active|yes|This field represents whether this entity is active or not|-NA|-NA-

### Example Request
```JSON
{
  "id": "string",
  "metadata": {},
  "request": {
    "active": true,
    "id": "12345",
    "name": "Foundational1",
    "address": "test address",
    "email": "test@mosip.io",
    "contactNo": "9876543210",
    "certAlias": "test",
    "isActive": true
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```

### Example success response
```JSON
{
  "id": "string",
  "version": "string",
  "responsetime": "2019-12-03T04:52:07.133Z",
  "metadata": null,
  "response": {
    "id": "12345",
    "name": "Foundational1",
    "address": "test address",
    "email": "test@mosip.io",
    "contactNo": "9876543210",
    "certAlias": "test",
    "isActive": true,
    "createdBy": "110006",
    "createdDateTime": "2019-12-03T04:52:07.133Z",
    "updatedBy": null,
    "updatedDateTime": null,
    "isDeleted": null,
    "deletedDateTime": null
  },
  "errors": null
}
```

### Response codes
200

### Example failure response
```JSON
{
	"id": "io.mosip.masterdata.foundationaltrustprovider.create",
	"version": "1.0",
	"metadata": {},
	"responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
	"errors": [{
		"errorCode": "string",
		"message": "string"
	}],
	"response" : null
}
```

### Response codes
200

#### Failure details
Error Code  | Error Message | Error Description
-----|----------|-------------
KER-ATH-401|Authentication Failed|If no role/invalid token is detected
ADM-DPM-015|Mandatory input parameter is missing|If any mandatory input parameter is missing
ADM-DPM-016|Foundational Trust Provider already exist|If the Foundational Trust provider details already exist
ADM-DPM-017|Error occurred while registering a Foundational Trust Provider|If there an error from DB while storing details of Foundational Trust Provider


### PUT /foundationaltrustprovider

This service updates a service provider. 

### Resource URL
### `PUT /foundationaltrustprovider`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
vendor_name|yes|This is the name of the vendor|-NA|-NA-
address|yes|This is the address of the vendor|-NA|-NA-
email|yes|This is the email of the vendor|-NA|-NA-
contact_number|yes|This is the contact number of the vendor|-NA|-NA-
is_active|yes|This field represents whether this entity is active or not|-NA|-NA-

### Example Request
```JSON
{
  "id": "string",
  "metadata": {},
  "request": {
    "active": true,
    "id": "12345",
    "name": "Foundational2",
    "address": "test address",
    "email": "test@mosip.io",
    "contactNo": "9876543210",
    "certAlias": "test",
    "isActive": true
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```

### Example success response
```JSON
{
  "id": "string",
  "version": "string",
  "responsetime": "2019-12-03T04:58:34.491Z",
  "metadata": null,
  "response": {
    "id": "12345",
    "name": "Foundational2",
    "address": "test address",
    "email": "test@mosip.io",
    "contactNo": "9876543210",
    "certAlias": "test",
    "isActive": true,
    "createdBy": "110006",
    "createdDateTime": "2019-12-03T04:58:34.491Z",
    "updatedBy": "110006",
    "updatedDateTime": "2019-12-03T04:58:34.488Z",
    "isDeleted": null,
    "deletedDateTime": null
  },
  "errors": null
}
```

### Response codes
200

### Example failure response
```JSON
{
	"id": "io.mosip.masterdata.foundationaltrustprovider.update",
	"version": "1.0",
	"metadata": {},
	"responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
	"errors": [{
		"errorCode": "string",
		"message": "string"
	}],
	"response" : null
}
```

### Response codes
200

#### Failure details
Error Code  | Error Message | Error Description
-----|----------|-------------
KER-ATH-401|Authentication Failed|If no role/invalid token is detected
ADM-DPM-018|Mandatory input parameter is missing|If any mandatory input parameter is missing
ADM-DPM-019|Error occurred while registering a Foundational Trust Provider|If there an error from DB while storing details of Foundational Trust Provider



# Devices

* [POST /registereddevices](#post-registereddevices)
* [DELETE /deregister/{deviceCode}](#delete-deregister)
* [PUT /registereddevices/status](#put-registereddevices-status)
* [POST/deviceprovidermanagement/validate](#post-deviceprovidermanagementvalidate)
* [POST/deviceprovidermanagement/validate/history](#post-deviceprovidermanagementvalidatehistory)


### POST /registereddevices

This service creates a device in the platform. The history is persisted

### Resource URL
### `POST /registereddevices`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

1) Device data contains the device details in Base64 encoded format.

Request : 
```JSON
{
  "id": "string",
  "metadata": {},
  "request": {
    "deviceData": "eyJkZXZpY2VJZCI6IjcwOTU5ZGQ1LWU0NWYtNDM4YS05ZmY4LTliMjYzOTA4ZTU3MiIsInB1cnBvc2UiOiJBVVRIIiwiZGV2aWNlSW5mbyI6eyJkZXZpY2VTdWJJZCI6IjEiLCJjZXJ0aWZpY2F0aW9uIjoiTDAiLCJkaWdpdGFsSWQiOiJleUp6WlhKcFlXeE9ieUk2SWpFNE1ERXhOakE1T1RJaUxDSmtaWFpwWTJWUWNtOTJhV1JsY2lJNklsTlpUa05DV1ZSRklpd2laR1YyYVdObFVISnZkbWxrWlhKSlpDSTZJbE5aVGtOQ1dWUkZMazFETURGQklpd2liV0ZyWlNJNklrMURNREZCSWl3aWJXOWtaV3dpT2lKVFRVbEVRMHdpTENKa1lYUmxWR2x0WlNJNklqSXdNakF0TURFdE1UTlVNRGM2TWpBNk5ESXVNVGsxV2lJc0luUjVjR1VpT2lKR2FXNW5aWEp3Y21sdWRDSXNJbk4xWWxSNWNHVWlPaUpUYVc1bmJHVWlmUT09IiwiZmlybXdhcmUiOiJmaXJtd2FyZSIsImRldmljZUV4cGlyeSI6IjIwMjAtMDEtMTNUMTI6NTA6NDIuMTk2WiIsInRpbWVTdGFtcCI6IjIwMjAtMDEtMTNUMTI6NTA6NDIuMjA4WiJ9LCJmb3VuZGF0aW9uYWxUcnVzdFByb3ZpZGVySWQiOiIifQ=="
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
deviceData|yes|This contains the encrypted device data|-NA|-NA-

2) Device data : 

Device data contains the device id, device info 

Decoded Json :
```JSON
{
              "deviceId": "70959dd5-e45f-438a-9ff8-9b263908e572",
              "purpose": "AUTH",
              "deviceInfo": {
                             "deviceSubId": "1",
                             "certification": "L0",
                             "digitalId": "eyJzZXJpYWxObyI6IjE4MDExNjA5OTIiLCJkZXZpY2VQcm92aWRlciI6IlNZTkNCWVRFIiwiZGV2aWNlUHJvdmlkZXJJZCI6IlNZTkNCWVRFLk1DMDFBIiwibWFrZSI6Ik1DMDFBIiwibW9kZWwiOiJTTUlEQ0wiLCJkYXRlVGltZSI6IjIwMjAtMDEtMTNUMDc6MjA6NDIuMTk1WiIsInR5cGUiOiJGaW5nZXJwcmludCIsInN1YlR5cGUiOiJTaW5nbGUifQ==",
                             "firmware": "firmware",
                             "deviceExpiry": "2020-01-13T12:50:42.196Z",
                             "timeStamp": "2020-01-13T12:50:42.208Z"
              },
              "foundationalTrustProviderId": ""
}
```

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
deviceId|yes|This is the id of the device|-NA|-NA-
foundationalTrustProviderId|no|This is the id of the foundational trust provider|-NA|-NA-
purpose|yes|This is the purpose of the device|-NA|-AUTH or REGISTRATION

If purpose is AUTH , we are generation the autogenerating the code.
If purpose is REGISTRATION, device id will be populated as device code.

Device Info : 

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
certificationLevel|yes|This is the certification level of the device|-NA|-NA-
deviceSubId|yes|This is the sub type id of the device|-NA|1,2,3
firmware|yes|This is the firmware of the device|-NA|-NA-
timestamp|yes|This is the timestamp of the record|-NA|-NA-
expiryDate|no|This is the expiry date of the device|current timestamp|-NA-


Digital Id will be encoded , Please find the decoded json : 
```JSON
{
              "serialNo": "1801160992",
              "deviceProvider": "SYNCBYTE",
              "deviceProviderId": "SYNCBYTE.MC01A",
              "make": "MC01A",
              "model": "SMIDCL",
              "dateTime": "2020-01-13T07:20:42.195Z",
              "type": "Fingerprint",
              "subType": "Single"
}
```
DigitalIdDTO Object

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
deviceProvider|yes|This is the name of the device provider|-NA|-NA-
deviceProviderId|yes|This is the id of the device provider|-NA|-NA-
type|yes|This is the type of the device|-NA|-NA-
type|yes|This is the sub type of the device|-NA|-NA-
serialNo|yes|This is the serial number of the device|-NA|-NA-
make|yes|This is the make of the device|-NA|-NA-
model|yes|This is the model of the device|-NA|-NA-
dateTime|yes|This is the dateTime of the device|-NA|-NA-

Validations : 

We have added a configurable time value +timevalue , which will accept the request within configured time in timestamp of Device Info.

Property : masterdata.registerdevice.timestamp.validate=+5

Currently we have kept the time to be 5 min. If a request comes more than 5 min then we are throwing an exception.

Response : 
```JSON
{
    "id": "string",
    "version": "string",
    "responsetime": "2020-01-13T07:25:29.764Z",
    "metadata": null,
    "response": "eyJhbGciOiJSUzI1NiIsInR5cGUiOiJKV1MifQ==.eyJzdGF0dXMiOiJSRUdJU1RFUkVEIiwiZGlnaXRhbElkIjoiZXlKelpYSnBZV3hPYnlJNklqRTRNREV4TmpBNU9USWlMQ0prWlhacFkyVlFjbTkyYVdSbGNpSTZJbE5aVGtOQ1dWUkZJaXdpWkdWMmFXTmxVSEp2ZG1sa1pYSkpaQ0k2SWxOWlRrTkNXVlJGTGsxRE1ERkJJaXdpYldGclpTSTZJazFETURGQklpd2liVzlrWld3aU9pSlRUVWxFUTB3aUxDSmtZWFJsVkdsdFpTSTZJakl3TWpBdE1ERXRNVE5VTURjNk1qQTZOREl1TVRrMVdpSXNJblI1Y0dVaU9pSkdhVzVuWlhKd2NtbHVkQ0lzSW5OMVlsUjVjR1VpT2lKVGFXNW5iR1VpZlEiLCJkZXZpY2VDb2RlIjoiOGNkNDI4NjQtMmNkYy00MDY3LThkMTEtNDBiMjVmZjhjNzYwIiwiZW52IjoibG9jYWwiLCJ0aW1lU3RhbXAiOiIyMDIwLTAxLTEzVDEyOjU1OjI5LjkxOFoifQ==.dkd3Mlo2TStDT2JpM1lHY2Q1OFNJRkJ6T0E5bFZ6dUFlZnN3NHhQZzEzWE42LzAvWVZ6Qm0yNnpmZXFPRXdmWHNKQUN4aC9QNExuM2RHcjhSR2diZjEvRXgwNktCOEhhbEM1VjhPMFh4VGxmK3ZSZFlJeTZhbFh0cS8rY0s0VjRSYUpHYjVDL2kweHdzMFF3bHh0UEo4cFIvbnVrb1d5dzNNTmRDSkNZaVlGSkxVUUpKbnhyaEtYR3dvM1ZlcVNkaEYrMStjS1ZpSzFWSlQ5OHFsMjFhTUp0MGd4Wko1Rzg5V0lSbi9yTnU1Slg1N0c0dnNya1JhN3JEUURsNDI5dEdkT3RYYVJYK3dOb0FESmI5V0psOFlLOW5hUFkyNExkZ3FkOXRydEw2VUoyaTc5ek1Qclk0cjhIQWFQaXlxc0REQmRPVFdhanN5VmhOODFuU0JCQ0tBPT0=",
    "errors": null
}
```
3) Signed Response :

Response follows the JWT format :

1)           Header : 

eyJhbGciOiJSUzI1NiIsInR5cGUiOiJKV1MifQ==.

Decoded : 
```JSON
{
              "alg": "RS256",
              "type": "JWS"
}
```

2)           Pay load : 

eyJzdGF0dXMiOiJSRUdJU1RFUkVEIiwiZGlnaXRhbElkIjoiZXlKelpYSnBZV3hPYnlJNklqRTRNREV4TmpBNU9USWlMQ0prWlhacFkyVlFjbTkyYVdSbGNpSTZJbE5aVGtOQ1dWUkZJaXdpWkdWMmFXTmxVSEp2ZG1sa1pYSkpaQ0k2SWxOWlRrTkNXVlJGTGsxRE1ERkJJaXdpYldGclpTSTZJazFETURGQklpd2liVzlrWld3aU9pSlRUVWxFUTB3aUxDSmtZWFJsVkdsdFpTSTZJakl3TWpBdE1ERXRNVE5VTURjNk1qQTZOREl1TVRrMVdpSXNJblI1Y0dVaU9pSkdhVzVuWlhKd2NtbHVkQ0lzSW5OMVlsUjVjR1VpT2lKVGFXNW5iR1VpZlEiLCJkZXZpY2VDb2RlIjoiOGNkNDI4NjQtMmNkYy00MDY3LThkMTEtNDBiMjVmZjhjNzYwIiwiZW52IjoibG9jYWwiLCJ0aW1lU3RhbXAiOiIyMDIwLTAxLTEzVDEyOjU1OjI5LjkxOFoifQ==

Decoded : 
```JSON
{
  "status": "REGISTERED",
  "digitalId": "eyJzZXJpYWxObyI6IjE4MDExNjA5OTIiLCJkZXZpY2VQcm92aWRlciI6IlNZTkNCWVRFIiwiZGV2aWNlUHJvdmlkZXJJZCI6IlNZTkNCWVRFLk1DMDFBIiwibWFrZSI6Ik1DMDFBIiwibW9kZWwiOiJTTUlEQ0wiLCJkYXRlVGltZSI6IjIwMjAtMDEtMTNUMDc6MjA6NDIuMTk1WiIsInR5cGUiOiJGaW5nZXJwcmludCIsInN1YlR5cGUiOiJTaW5nbGUifQ",
  "deviceCode": "8cd42864-2cdc-4067-8d11-40b25ff8c760",
  "env": "local",
  "timeStamp": "2020-01-13T12:55:29.918Z"
}
```

2a)Digital Id: 

  Digital Id will be unsigned and will be base64 encoded.

eyJzZXJpYWxObyI6IjE4MDExNjA5OTIiLCJkZXZpY2VQcm92aWRlciI6IlNZTkNCWVRFIiwiZGV2aWNlUHJvdmlkZXJJZCI6IlNZTkNCWVRFLk1DMDFBIiwibWFrZSI6Ik1DMDFBIiwibW9kZWwiOiJTTUlEQ0wiLCJkYXRlVGltZSI6IjIwMjAtMDEtMTNUMDc6MjA6NDIuMTk1WiIsInR5cGUiOiJGaW5nZXJwcmludCIsInN1YlR5cGUiOiJTaW5nbGUifQ

 Decoded : 
```JSON   
{
              "serialNo": "1801160992",
              "deviceProvider": "SYNCBYTE",
              "deviceProviderId": "SYNCBYTE.MC01A",
              "make": "MC01A",
              "model": "SMIDCL",
              "dateTime": "2020-01-13T07:20:42.195Z",
              "type": "Fingerprint",
              "subType": "Single"
   }
   ```

3) Signed Response : 
Signed response from signature api 
dkd3Mlo2TStDT2JpM1lHY2Q1OFNJRkJ6T0E5bFZ6dUFlZnN3NHhQZzEzWE42LzAvWVZ6Qm0yNnpmZXFPRXdmWHNKQUN4aC9QNExuM2RHcjhSR2diZjEvRXgwNktCOEhhbEM1VjhPMFh4VGxmK3ZSZFlJeTZhbFh0cS8rY0s0VjRSYUpHYjVDL2kweHdzMFF3bHh0UEo4cFIvbnVrb1d5dzNNTmRDSkNZaVlGSkxVUUpKbnhyaEtYR3dvM1ZlcVNkaEYrMStjS1ZpSzFWSlQ5OHFsMjFhTUp0MGd4Wko1Rzg5V0lSbi9yTnU1Slg1N0c0dnNya1JhN3JEUURsNDI5dEdkT3RYYVJYK3dOb0FESmI5V0psOFlLOW5hUFkyNExkZ3FkOXRydEw2VUoyaTc5ek1Qclk0cjhIQWFQaXlxc0REQmRPVFdhanN5VmhOODFuU0JCQ0tBPT0=


### Response codes
200

### Example failure response
```JSON
{
	"id": "io.mosip.masterdata.device.l0.create",
	"version": "1.0",
	"metadata": {},
	"responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
	"errors": [{
		"errorCode": "string",
		"message": "string"
	}],
	"response" : null
}
```

### Response codes
200

#### Failure details
Error Code  | Error Message | Error Description
-----|----------|-------------
KER-ATH-401|Authentication Failed|If no role/invalid token is detected
ADM-DPM-025|Mandatory input parameter is missing|If any mandatory input parameter is missing
ADM-DPM-026|Device Type does not exist|If Device Type received does not exist
ADM-DPM-027|Device Sub-Type does not exist|If Device Sub-Type received does not exist
ADM-DPM-028|Invalid Status received|If in Status, standard values are not received
ADM-DPM-029|For Device ID, Json value expected for a L0 Device|If in Device, a singed Json is not received if certification level is L0
ADM-DPM-030|Make/Model inside the Json does not match with the input|If Make/Model inside the digital ID does not match with details received in input
ADM-DPM-031|Device Provider details inside the Json does not match with the input|If Device Provider ID/Device Provider name inside the digital ID does not match with details received in input
ADM-DPM-032|Device Provider ID/Name does not exist in the list of Registered Device Providers|If Device Provider ID/Name does not exist against the Device Provider Details
ADM-DPM-034|Invalid Purpose received|If in purpose, standard values are not received
ADM-DPM-036|Error occurred while storing MDS Details|If there an error from DB while registering the Device

### DELETE deregister

This service deregisters a device in the platform. The history is persisted

### Resource URL
### `DELETE /registereddevices/deregister/{deviceCode}`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
deviceCode|yes|This is the code of the device|-NA|-NA-

### Example success response
```JSON
{
	"id": "io.mosip.masterdata.device.l0.delete",
	"version": "1.0",
	"metadata": {},
	"responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
	"errors": null,
	"response" : {
		"status": "success",
		"message": "Device de-register successfully"
	}
}
```

### Response codes
200

### Example failure response
```JSON
{
	"id": "io.mosip.masterdata.device.l0.create",
	"version": "1.0",
	"metadata": {},
	"responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
	"errors": [{
		"errorCode": "string",
		"message": "string"
	}],
	"response" : null
}
```

### Response codes
200

### PUT /registereddevices/status

This service updates status of the device. The history is persisted

### Resource URL
### `PUT /registereddevices/status?devicecode='10001'&status='REVOKED'`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
deviceCode|yes|This is the code of the device|-NA|-NA-
status|yes|This is the code of the device|-NA|-NA-

### Example success response
```JSON
{
	"id": "io.mosip.masterdata.device.l0.delete",
	"version": "1.0",
	"metadata": {},
	"responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
	"errors": null,
	"response" : {
		"status": "success",
		"message": "Device de-register successfully"
	}
}
```

### Response codes
200

### Example failure response
```JSON
{
	"id": "io.mosip.masterdata.device.l0.update",
	"version": "1.0",
	"metadata": {},
	"responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
	"errors": [{
		"errorCode": "string",
		"message": "string"
	}],
	"response" : null
}
```

### Response codes
200

#### Failure details
Error Code  | Error Message | Error Description
-----|----------|-------------
KER-ATH-401|Authentication Failed|If no role/invalid token is detected
ADM-DPM-036|Mandatory input parameter is missing|If any mandatory input parameter is missing
ADM-DPM-037|Invalid Status received|If in Status, standard values are not received
ADM-DPM-038|Error occurred while updating Device Status|If there an error from DB while updating Device Status

### POST /deviceprovidermanagement/validate

This service will validate the device details from the list of registered devices.

### Resource URL
### `POST /deviceprovidermanagement/validate`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
deviceCode|Yes|code of the device| | 
digitalId|Yes|JSON object consists of device details| | 
deviceServiceVersion|Yes|DeviceServiceVersion of the mds| | 

### Example Request
```
https://mosip.io/masterdata/deviceprovidermanagement/validate

{
   "id":"string",
   "metadata":null,
   "request":{
        "deviceCode":"string",
     	"deviceServiceVersion":"string",
     	"digitalId":{
     		"serialNo": "string",
                "make": "string",
                "model" : "string",
                "type": "string",
                "dp": "string",
                "dpId": "string",
                "dateTime": "string"

}
},
   "version":"1.0",
   "requesttime":"2019-08-21T16:34:22.890Z"
}
```

### Example Response

200 Ok

```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "2018-12-10T06:12:52.994Z",
  "errors": null,
  "response":  [
    {
	  "status": "success",
      "message": "Device details validated successfully"
    }
  ],
}

```

##### Error Response:

```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
 "response": null
}

```

#### Failure details
Error Code  | Error Message | Error Description
-----|----------|-------------
KER-MSD-500 |Internal Server Error|If system error occurs
KER-ATH-403 |Forbidden|If unauthorized role detected
KER-ATH-401 |Authentication Failed|If no role/invalid token is detected
ADM-DPM-001 |Device does not exist|If the Device does not exist 
ADM-DPM-002 |Device is Revoked/Retired|If the Device exist and is in Revoked/Retired
ADM-DPM-003 |Device Provider does not exist|If the Device Provider does not exist
ADM-DPM-004 |Device Provider is marked Inactive|If the Device Provider exist and is in Inactive State
ADM-DPM-005 |MDS does not exist|If the MDS does not exist
ADM-DPM-006 |MDS is marked Inactive|If the MDS exist and is in Inactive State
ADM-DPM-007 |Software version does not match against the Service ID|If the Software version does not match the Service ID received
ADM-DPM-008 |Device Provider ID does not match against the Service ID|If the Device provider ID does not match the Service ID received
ADM-DPM-009 |Error occurred while checking a Device Details| If there an error from DB while checking device details

### POST /deviceprovidermanagement/validate/history

This service will validate the device history details from the list of registered devices.

### Resource URL
### `POST/deviceprovidermanagement/validate/history`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
deviceCode|Yes|code of the device| | 
digitalId|Yes|JSON object of the device details| | 
deviceServiceVersion|Yes|DeviceServiceVersion of the mds| |
timeStamp|Yes|Timestamp in LocalDataTimeformat of history table| | 

### Example Request
```
https://mosip.io/masterdata/deviceprovidermanagement/validate/history

{
   "id":"string",
   "metadata":null,
   "request":{
        "deviceCode":"10001",
     	"deviceServiceVersion":"0.1v",
        "timestamp":"2019-09-09T09:09:09.000Z"
     	"digitalId":{
     		"serialNo": "string",
                "make": "string",
                "model" : "string",
                "type": "string",
                "dp": "string",
                "dpId": "string",
                "dateTime": "string"
                }

},
   "version":"1.0",
   "requesttime":"2019-08-21T16:34:22.890Z"
}
```

### Example Response

200 Ok

```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "2018-12-10T06:12:52.994Z",
  "errors": null,
  "response":  [
    {
      "status": "Valid",
      "message": "Device details history validated successfully"
    }
  ],
}

```

##### Error Response:

```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
 "response": null
}

```

#### Failure details
Error Code  | Error Message | Error Description
-----|----------|-------------
KER-MSD-500 |Internal Server Error|If system error occurs
KER-ATH-403 |Forbidden|If unauthorized role detected
KER-ATH-401 |Authentication Failed|If no role/invalid token is detected
ADM-DPM-001 |Device does not exist|If the Device does not exist 
ADM-DPM-002 |Device is Revoked/Retired|If the Device exist and is in Revoked/Retired
ADM-DPM-003 |Device Provider does not exist|If the Device Provider does not exist
ADM-DPM-004 |Device Provider is marked Inactive|If the Device Provider exist and is in Inactive State
ADM-DPM-005 |MDS does not exist|If the MDS does not exist
ADM-DPM-006 |MDS is marked Inactive|If the MDS exist and is in Inactive State
ADM-DPM-007 |Software version does not match against the Service ID|If the Software version does not match the Service ID received
ADM-DPM-008 |Device Provider ID does not match against the Service ID|If the Device provider ID does not match the Service ID received
ADM-DPM-009 |Error occurred while checking a Device Details| If there an error from DB while checking device details

# MDS API

* [POST /mosipdeviceservice](#post-mosipdeviceservice)
* [PUT /mosipdeviceservice](#put-mosipdeviceservice)

# POST /mds
Master data is required across the platform. 

This service will create the MDS which are used in the MOSIP platform. 

### Resource URL
### `POST /mosipdeviceservice`

`https://qa.mosip.io/v1/masterdata/mosipdeviceservice`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
id|Yes|id of the mds| | 
deviceProviderId|Yes|Deviceproviderid of the mds| | 
regDeviceSubCode|Yes|Devicetypecode of the mds| | 
regDeviceTypeCode|Yes|Devicesubtypecode of the mds| | 
swversion|Yes|software version of the mds| | 
swBinaryHash|Yes|binary hash of the mds| | 
make|Yes|make of the mds| | 
model|Yes|model of the mds| | 
swCreateDateTime|Yes|Created date time of MDS| | 
swExpiryDateTime|Yes|Expiry date time of MDS| | 

### Example Request
```JSON
{
	"id": "string",
	"metadata": {},
	"request": {
		"deviceProviderId": "0e90bb45-cc9b-4521-9644-72755f6aa1e9",
		"isActive": true,
		"make": "test make",
		"model": "test model",
		"regDeviceSubCode": "Full face",
		"regDeviceTypeCode": "Face",
		"swBinaryHash": "test",
		"swCreateDateTime": "2020-12-10T06:12:52.994Z",
		"swExpiryDateTime": "2021-12-10T06:12:52.994Z",
		"swVersion": "TestSwVersion1"
	},
	"requesttime": "2018-12-10T06:12:52.994Z",
	"version": "string"
}
```
### Example Response

200 Ok

```JSON
{
	"id": "string",
	"version": "string",
	"responsetime": "2020-02-06T09:17:27.134Z",
	"metadata": null,
	"response": {
		"isActive": true,
		"createdBy": "110006",
		"createdDateTime": "2020-02-06T09:17:27.144Z",
		"updatedBy": null,
		"updatedDateTime": null,
		"isDeleted": null,
		"deletedDateTime": null,
		"id": "0f343b65-aba2-44d2-b836-e7511270b1ab",
		"swVersion": "TestSwVersion1",
		"deviceProviderId": "0e90bb45-cc9b-4521-9644-72755f6aa1e9",
		"regDeviceTypeCode": "Face",
		"regDeviceSubCode": "Full face",
		"make": "test make",
		"model": "test model",
		"swCreateDateTime": "2020-12-10T06:12:52.994Z",
		"swExpiryDateTime": "2021-12-10T06:12:52.994Z",
		"swBinaryHash": "test"
	},
	"errors": null
}

```

#### Failure details
Error Code  | Error Message | Error Description
-----|----------|-------------
KER-ATH-401|Authentication Failed|If no role/invalid token is detected
ADM-DPM-020|Mandatory input parameter is missing|If any mandatory input parameter is missing
ADM-DPM-021|MDS Details already exist|If the MDS Details already exist
ADM-DPM-039|Device Provider ID not found in the list of Device Providers|Device Provider ID received does not exist in the Device Provider Table
ADM-DPM-040|Device Type Code not found in the list of Device Types|Device Type Code received does not exist in the Device Type Table
ADM-DPM-041|Device Sub Type Code not found in the list of Device Sub Types|Device Sub Type Code received does not exist in the Device Sub Type Table

# PUT /mosipdeviceservice
Master data is required across the platform. 

This service will update the MDS which are used in the MOSIP platform. 

### Resource URL
### `PUT /mosipdeviceservice`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
id|Yes|id of the mds| | 
deviceProviderId|Yes|Deviceproviderid of the mds| | 
regDeviceSubCode|Yes|Devicetypecode of the mds| | 
regDeviceTypeCode|Yes|Devicesubtypecode of the mds| | 
swversion|Yes|software version of the mds| | 
swBinaryHash|Yes|binary hash of the mds| | 
make|Yes|make of the mds| | 
model|Yes|model of the mds| | 
swCreateDateTime|Yes|Created date time of MDS| | 
swExpiryDateTime|Yes|Expiry date time of MDS| | 

### Example Request
```JSON
{
  "id": "string",
  "metadata": {},
  "request": {
    "active": true,
    "deviceProviderId": "11123",
    "id": "77777",
    "make": "make1",
    "model": "model1",
    "regDeviceSubCode": "Slab",
    "regDeviceTypeCode": "Finger",
    "swBinaryHash": "test",
    "swCreateDateTime": "2019-11-19T07:00:13.375Z",
    "swExpiryDateTime": "2019-11-30T07:00:13.375Z",
    "swVersion": "v2"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```
### Example Response

200 Ok

```JSON
{
  "id": "string",
  "version": "string",
  "responsetime": "2019-11-19T07:07:55.709Z",
  "metadata": null,
  "response": {
    "isActive": true,
    "createdBy": "110005",
    "createdDateTime": "2019-11-19T07:07:55.731Z",
	"updatedBy": "110005",
    "updatedDateTime": "2019-11-19T07:07:55.731Z",
    "updatedBy": null,
    "updatedDateTime": null,
    "isDeleted": null,
    "deletedDateTime": null,
    "id": "77777",
    "swVersion": "v2",
    "deviceProviderId": "11123",
    "regDeviceTypeCode": "Finger",
    "regDeviceSubCode": "Slab",
    "make": "make1",
    "model": "model1",
    "swCreateDateTime": "2019-11-19T07:00:13.375Z",
    "swExpiryDateTime": "2019-11-30T07:00:13.375Z",
    "swBinaryHash": "test"
  },
  "errors": null
}

```

##### Error Response:

```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
 "response": null
}

```

#### Failure details
Error Code  | Error Message | Error Description
-----|----------|-------------
KER-ATH-401|Authentication Failed|If no role/invalid token is detected
ADM-DPM-020|Mandatory input parameter is missing|If any mandatory input parameter is missing
ADM-DPM-021|MDS Details already exist|If the MDS Details already exist
ADM-DPM-039|Device Provider ID not found in the list of Device Providers|Device Provider ID received does not exist in the Device Provider Table
ADM-DPM-040|Device Type Code not found in the list of Device Types|Device Type Code received does not exist in the Device Type Table
ADM-DPM-041|Device Sub Type Code not found in the list of Device Sub Types|Device Sub Type Code received does not exist in the Device Sub Type Table

