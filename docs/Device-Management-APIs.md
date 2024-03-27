# Device Management APIs

This page contains detail about the Device Provider Management API's.

* [Device Providers](Device-Management-APIs.md#device-providers)
* [Foundational Trust Providers](Device-Management-APIs.md#foundational-trust-providers)
* [Devices](Device-Management-APIs.md#devices)
* [MDS API](Device-Management-APIs.md#mds-api)

## Device Providers

* [POST /deviceprovider](Device-Management-APIs.md#post-deviceprovider-private)
* [PUT /deviceprovider](Device-Management-APIs.md#put-deviceprovider)

### POST /deviceprovider (Private)

This service creates a device service provider in the device provider table as well as a record in the device provider history table.

#### Resource URL

`POST https://{base_url}/v1/masterdata/deviceprovider`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name             | Required | Description                                                | Default Value | Example |
| ---------------- | -------- | ---------------------------------------------------------- | ------------- | ------- |
| vendorName       | Yes      | This is the name of the vendor                             | NA            | NA      |
| address          | Yes      | This is the address of the vendor                          | NA            | NA      |
| email            | Yes      | This is the email of the vendor                            | NA            | NA      |
| contactNumber    | Yes      | This is the contact number of the vendor                   | NA            | NA      |
| certificateAlias | Yes      | This is the certificate alias of the vendor                | NA            | NA      |
| isActive         | Yes      | This field represents whether this entity is active or not | NA            | NA      |

#### Request

```
{
  "id": "io.mosip.masterdata.deviceprovider.create",
  "metadata": {},
  "request": {
	"address": "Address of Test Vendor",
	"certificateAlias": "Test",
	"contactNumber": "9663175928",
	"email": "test@mosip.io",
	"isActive": true,
	"vendorName": "Test Vendor"
  },
  "requesttime": "2020-02-06T09:13:59.522Z",
  "version": "1.0"
}
```

#### Response

**Success response**

```
{
  "id": "io.mosip.masterdata.deviceprovider.create",
  "version": "1.0",
  "responsetime": "2020-02-06T09:13:59.522Z",
  "metadata": null,
  "response": {
	"id": "0e90bb45-cc9b-4521-9644-72755f6aa1e9",
	"vendorName": "Test Vendor",
	"address": "Address of Test Vendor",
	"email": "test@mosip.io",
	"contactNumber": "9663175928",
	"certificateAlias": "Test",
	"isActive": true,
	"createdBy": "110006",
	"updatedBy": null,
	"isDeleted": null
  },
  "errors": []
}
```

**Response code: 200**

**Failure response**

```
{
  "id": "io.mosip.masterdata.deviceprovider.create",
  "version": "1.0",
  "metadata": {},
  "responsetime": "2020-02-06T09:13:59.522Z", 
  "errors": [{
	"errorCode": "KER-ATH-401",
	"message": "Authentication Failed"
  }],
  "response": null
}
```

**Response code: 200**

#### Failure details

| Error Code  | Error Message                                      | Error Description                                                  |
| ----------- | -------------------------------------------------- | ------------------------------------------------------------------ |
| KER-ATH-401 | Authentication Failed                              | If no role/invalid token is detected                               |
| ADM-DPM-010 | Mandatory input parameter is missing               | If any mandatory input parameter is missing                        |
| ADM-DPM-011 | Device Provider already exist                      | If the Device provider details already exist                       |
| ADM-DPM-012 | Error occurred while registering a Device Provider | If there an error from DB while storing details of Device Provider |

### PUT /deviceprovider

This service updates a device service provider in the device provider table as well as creates a record in the device provider history table.

#### Resource URL

`PUT https://{base_url}/v1/masterdata/deviceprovider`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name             | Required | Description                                                      | Default Value | Example |
| ---------------- | -------- | ---------------------------------------------------------------- | ------------- | ------- |
| vendorName       | Yes      | This is the name of the vendor                                   | NA            | NA      |
| address          | Yes      | This is the address of the vendor                                | NA            | NA      |
| email            | Yes      | This is the email of the vendor                                  | NA            | NA      |
| contactNumber    | Yes      | This is the contact number of the vendor                         | NA            | NA      |
| certificateAlias | Yes      | This is the certificate alias of the vendor                      | NA            | NA      |
| isActive         | Yes      | This field represents whether this entity is active or not       | NA            | NA      |
| id               | Yes      | This is the unique id of the vendor which was generated by MOSIP | NA            | NA      |

#### Request

```
{
  "id": "io.mosip.masterdata.deviceprovider.update",
  "metadata": {},
  "request": {
    "address": "New Address of Test Vendor",
    "certificateAlias": "changed",
    "contactNumber": "9000000000",
    "email": "test@mosip.io",
    "id": "0e90bb45-cc9b-4521-9644-72755f6aa1e9",
    "isActive": true,
    "vendorName": "Test Vendor"
  },
  "requesttime": "2020-02-10T09:13:59.522Z",
  "version": "1.0"
}
```

#### Response

**Success response**

```
{
  "id": "io.mosip.masterdata.deviceprovider.update",
  "version": "1.0",
  "responsetime": "2020-02-10T09:13:59.522Z",
  "metadata": null,
  "response": {
    "id": "0e90bb45-cc9b-4521-9644-72755f6aa1e9",
    "vendorName": "Test Vendor",
    "address": "New Address of Test Vendor",
    "email": "test@mosip.io",
    "contactNumber": "9000000000",
    "certificateAlias": "changed",
    "isActive": true,
    "createdBy": "110006",
    "updatedBy": "110005",
    "isDeleted": null,
  },
  "errors": []
}
```

**Response code: 200**

**Failure response**

```
{
  "id": "io.mosip.masterdata.deviceprovider.update",
  "version": "1.0",
  "metadata": {},
  "responsetime": "2020-02-10T09:13:59.522Z",
  "errors": [{
	"errorCode": "KER-ATH-401",
	"message": "Authentication Failed"
  }],
  "response" : null
}
```

**Response code: 200**

#### Failure details

| Error Code  | Error Message                                      | Error Description                                                  |
| ----------- | -------------------------------------------------- | ------------------------------------------------------------------ |
| KER-ATH-401 | Authentication Failed                              | If no role/invalid token is detected                               |
| ADM-DPM-013 | Mandatory input parameter is missing               | If any mandatory input parameter is missing                        |
| ADM-DPM-014 | Error occurred while registering a Device Provider | If there an error from DB while storing details of Device Provider |

## Foundational Trust Providers

* [POST /foundationaltrustprovider](Device-Management-APIs.md#post-foundationaltrustprovider)
* [PUT /foundationaltrustprovider](Device-Management-APIs.md#put-foundationaltrustprovider)

### POST /foundationaltrustprovider

This service creates a foundational trust provider.

#### Resource URL

`POST https://{base_url}/v1/masterdata/foundationaltrustprovider`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name      | Required | Description                                                | Default Value | Example |
| --------- | -------- | ---------------------------------------------------------- | ------------- | ------- |
| name      | Yes      | This is the name of the vendor                             | NA            | NA      |
| address   | Yes      | This is the address of the vendor                          | NA            | NA      |
| email     | Yes      | This is the email of the vendor                            | NA            | NA      |
| contactNo | Yes      | This is the contact number of the vendor                   | NA            | NA      |
| isActive  | Yes      | This field represents whether this entity is active or not | NA            | NA      |
| certAlias | Yes      | This is the certificate alias of the vendor                | NA            | NA      |

#### Request

```
{
  "id": "io.mosip.masterdata.foundationaltrustprovider.create",
  "metadata": {},
  "request": {
    "name": "FTP 1",
    "address": "Address of FTP 1",
    "email": "FTP1@mosip.io",
    "contactNo": "9876543210",
    "certAlias": "Test",
    "isActive": true
  },
  "requesttime": "2020-02-06T09:13:59.522Z",
  "version": "1.0"
}
```

#### Response

**Success response**

```
{
  "id": "io.mosip.masterdata.foundationaltrustprovider.create",
  "version": "1.0",
  "responsetime": "2020-02-06T09:13:59.522Z",
  "metadata": null,
  "response": {
    "id": "83cdb6ea-6e62-11ea-bc55-0242ac130003",
    "name": "FTP 1",
    "address": "Address of FTP 1",
    "email": "FTP1@mosip.io",
    "contactNo": "9876543210",
    "certAlias": "Test",
    "isActive": true,
    "createdBy": "110006",
    "createdDateTime": "2020-02-06T09:13:59.522Z",
    "updatedBy": null,
    "updatedDateTime": null,
    "isDeleted": null,
    "deletedDateTime": null
  },
  "errors": null
}
```

**Response code: 200**

**Failure response**

```
{
  "id": "io.mosip.masterdata.foundationaltrustprovider.create",
  "version": "1.0",
  "metadata": {},
  "responsetime": "2020-02-06T09:13:59.522Z",
  "errors": [{
	"errorCode": "KER-ATH-401",
	"message": "Authentication Failed"
  }],
  "response": null
}
```

**Response code: 200**

#### Failure details

| Error Code  | Error Message                                                  | Error Description                                                              |
| ----------- | -------------------------------------------------------------- | ------------------------------------------------------------------------------ |
| KER-ATH-401 | Authentication Failed                                          | If no role/invalid token is detected                                           |
| ADM-DPM-015 | Mandatory input parameter is missing                           | If any mandatory input parameter is missing                                    |
| ADM-DPM-016 | Foundational Trust Provider already exist                      | If the Foundational Trust provider details already exist                       |
| ADM-DPM-017 | Error occurred while registering a Foundational Trust Provider | If there an error from DB while storing details of Foundational Trust Provider |

### PUT /foundationaltrustprovider

This service updates a foundational trust provider in the foundational trust provider table as well as creates a record in the foundational trust provider history table.

#### Resource URL

`PUT https://{base_url}/v1/masterdata/foundationaltrustprovider`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name      | Required | Description                                                                  | Default Value | Example |
| --------- | -------- | ---------------------------------------------------------------------------- | ------------- | ------- |
| name      | Yes      | This is the name of the vendor                                               | NA            | NA      |
| address   | yes      | This is the address of the vendor                                            | NA            | NA      |
| email     | Yes      | This is the email of the vendor                                              | NA            | NA      |
| contactNo | Yes      | This is the contact number of the vendor                                     | NA            | NA      |
| isactive  | Yes      | This field represents whether this entity is active or not                   | NA            | NA      |
| id        | Yes      | This is the Unique ID that was generated for the foundational trust provider | NA            | NA      |

#### Request

```
{
  "id": "io.mosip.masterdata.foundationaltrustprovider.update",
  "metadata": {},
  "request": {
    "active": true,
    "id": "83cdb6ea-6e62-11ea-bc55-0242ac130003",
    "name": "FTP 1",
    "address": "Address of FTP 1",
    "email": "FTP1test@mosip.io",
    "contactNo": "9876543210",
    "certAlias": "Change",
    "isActive": true
  },
  "requesttime": "2020-02-10T09:13:59.522Z",
  "version": "1.0"
}
```

#### Response

**Success response**

```
{
  "id": "io.mosip.masterdata.foundationaltrustprovider.update",
  "version": "1.0",
  "responsetime": "2020-02-10T09:13:59.522Z",
  "metadata": null,
  "response": {
    "id": "83cdb6ea-6e62-11ea-bc55-0242ac130003",
    "name": "FTP 1",
    "address": "Address of FTP 1",
    "email": "FTP1test@mosip.io",
    "contactNo": "9876543210",
    "certAlias": "Change",
    "isActive": true,
    "createdBy": "110006",
    "createdDateTime": "2020-02-06T09:13:59.522Z",
    "updatedBy": "110005",
    "updatedDateTime": "2020-02-10T09:13:59.522Z",
    "isDeleted": null,
    "deletedDateTime": null
  },
  "errors": null
}
```

**Response code: 200**

**Failure response**

```
{
  "id": "io.mosip.masterdata.foundationaltrustprovider.update",
  "version": "1.0",
  "metadata": {},
  "responsetime": "2020-02-10T09:13:59.522Z",
  "errors": [{
	"errorCode": "KER-ATH-401",
	"message": "Authentication Failed"
  }],
  "response": null
}
```

**Response code: 200**

#### Failure details

| Error Code  | Error Message                                                  | Error Description                                                              |
| ----------- | -------------------------------------------------------------- | ------------------------------------------------------------------------------ |
| KER-ATH-401 | Authentication Failed                                          | If no role/invalid token is detected                                           |
| ADM-DPM-018 | Mandatory input parameter is missing                           | If any mandatory input parameter is missing                                    |
| ADM-DPM-019 | Error occurred while registering a Foundational Trust Provider | If there an error from DB while storing details of Foundational Trust Provider |

***

## Devices

* [POST /registereddevices](Device-Management-APIs.md#post-registereddevices)
* [DELETE /deregister/{deviceCode}](Device-Management-APIs.md#delete-deregister-deviceCode)
* [PUT /registereddevices/status](Device-Management-APIs.md#put-registereddevices-status)
* [POST/deviceprovidermanagement/validate](Device-Management-APIs.md#post-deviceprovidermanagement-validate)

### POST /registereddevices

This service registers a device in MOSIP as well as creates a history record.

#### Resource URL

`POST https://{base_url}/v1/masterdata/registereddevices`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

_**Note:**_ Device data contains the device details in Base64 encoded format.

#### Request

**Parameters for device registration API**

| Name       | Required | Description                             | Default Value | Example |
| ---------- | -------- | --------------------------------------- | ------------- | ------- |
| deviceData | Yes      | This contains the encrypted device data | NA            | NA      |

**Request for device registration API\*\***

```
{
  "id": "io.mosip.masterdata.device.create",
  "metadata": {},
  "request": {
    "deviceData": "eyJkZXZpY2VJZCI6IjcwOTU5ZGQ1LWU0NWYtNDM4YS05ZmY4LTliMjYzOTA4ZTU3MiIsInB1cnBvc2UiOiJBVVRIIiwiZGV2aWNlSW5mbyI6eyJkZXZpY2VTdWJJZCI6IjEiLCJjZXJ0aWZpY2F0aW9uIjoiTDAiLCJkaWdpdGFsSWQiOiJleUp6WlhKcFlXeE9ieUk2SWpFNE1ERXhOakE1T1RJaUxDSmtaWFpwWTJWUWNtOTJhV1JsY2lJNklsTlpUa05DV1ZSRklpd2laR1YyYVdObFVISnZkbWxrWlhKSlpDSTZJbE5aVGtOQ1dWUkZMazFETURGQklpd2liV0ZyWlNJNklrMURNREZCSWl3aWJXOWtaV3dpT2lKVFRVbEVRMHdpTENKa1lYUmxWR2x0WlNJNklqSXdNakF0TURFdE1UTlVNRGM2TWpBNk5ESXVNVGsxV2lJc0luUjVjR1VpT2lKR2FXNW5aWEp3Y21sdWRDSXNJbk4xWWxSNWNHVWlPaUpUYVc1bmJHVWlmUT09IiwiZmlybXdhcmUiOiJmaXJtd2FyZSIsImRldmljZUV4cGlyeSI6IjIwMjAtMDEtMTNUMTI6NTA6NDIuMTk2WiIsInRpbWVTdGFtcCI6IjIwMjAtMDEtMTNUMTI6NTA6NDIuMjA4WiJ9LCJmb3VuZGF0aW9uYWxUcnVzdFByb3ZpZGVySWQiOiIifQ=="
  },
  "requesttime": "2020-02-16T09:13:59.522Z",
  "version": "v1"
}
```

_**Note:**_ Device data contains the device id, purpose, device info, and foundational trust provider id

**Device Data**

**Parameters for device data**

| Name                        | Required | Description                                       | Default Value | Example              |
| --------------------------- | -------- | ------------------------------------------------- | ------------- | -------------------- |
| deviceId                    | Yes      | This is the ID of the device                      | NA            | NA                   |
| foundationalTrustProviderId | No       | This is the ID of the foundational trust provider | NA            | NA                   |
| purpose                     | Yes      | This is the purpose of the device                 | NA            | AUTH or REGISTRATION |

If purpose is AUTH , we will auto-generate the code. If purpose is REGISTRATION, device ID will be populated as device code.

**Decoded JSON for device data**

```
{
  "deviceId": "70959dd5-e45f-438a-9ff8-9b263908e572",
  "purpose": "AUTH",
  "deviceInfo": {
    "deviceSubId": "1",
    "certification": "L0",
    "digitalId": "eyJzZXJpYWxObyI6IjE4MDExNjA5OTIiLCJkZXZpY2VQcm92aWRlciI6IlNZTkNCWVRFIiwiZGV2aWNlUHJvdmlkZXJJZCI6IlNZTkNCWVRFLk1DMDFBIiwibWFrZSI6Ik1DMDFBIiwibW9kZWwiOiJTTUlEQ0wiLCJkYXRlVGltZSI6IjIwMjAtMDEtMTNUMDc6MjA6NDIuMTk1WiIsInR5cGUiOiJGaW5nZXJwcmludCIsInN1YlR5cGUiOiJTaW5nbGUifQ==",
    "firmware": "firmware",
    "deviceExpiry": "2021-02-16T12:50:42.196Z",
    "timeStamp": "2020-02-16T12:50:42.208Z"
  },
  "foundationalTrustProviderId": "83cdb6ea-6e62-11ea-bc55-0242ac130003"
}
```

**Device Info**

**Parameters for device info**

| Name          | Required | Description                                               | Default Value     | Example  |
| ------------- | -------- | --------------------------------------------------------- | ----------------- | -------- |
| certification | Yes      | This is the certification level of the device             | NA                | L1 or L0 |
| deviceSubId   | Yes      | This is the sub type id of the device                     | NA                | 1,2,3    |
| firmware      | Yes      | This is the firmware of the device                        | NA                | NA       |
| timeStamp     | Yes      | This is the current timestamp when the request is created | NA                | NA       |
| deviceExpiry  | No       | This is the expiry date of the device                     | current timestamp | NA       |
| digitalID     | Yes      | This is the encoded digital ID of the device              | NA                | NA       |

**Device Info extracted from decode device data JSON**

```
"deviceInfo": {
  "deviceSubId": "1",
  "certification": "L0",
  "digitalId": "eyJzZXJpYWxObyI6IjE4MDExNjA5OTIiLCJkZXZpY2VQcm92aWRlciI6IlNZTkNCWVRFIiwiZGV2aWNlUHJvdmlkZXJJZCI6IlNZTkNCWVRFLk1DMDFBIiwibWFrZSI6Ik1DMDFBIiwibW9kZWwiOiJTTUlEQ0wiLCJkYXRlVGltZSI6IjIwMjAtMDEtMTNUMDc6MjA6NDIuMTk1WiIsInR5cGUiOiJGaW5nZXJwcmludCIsInN1YlR5cGUiOiJTaW5nbGUifQ==",
  "firmware": "firmware",
  "deviceExpiry": "2021-02-16T12:50:42.196Z",
  "timeStamp": "2020-02-16T12:50:42.208Z"
}
```

**Digital ID**

Digital Id will be encoded.

**Parameters for digital ID**

| Name             | Required | Description                                                  | Default Value | Example |
| ---------------- | -------- | ------------------------------------------------------------ | ------------- | ------- |
| deviceProvider   | Yes      | This is the name of the device provider                      | NA            | NA      |
| deviceProviderId | Yes      | This is the id of the device provider                        | NA            | NA      |
| type             | Yes      | This is the type of the device                               | NA            | NA      |
| subtype          | Yes      | This is the sub type of the device                           | NA            | NA      |
| serialNo         | Yes      | This is the serial number of the device                      | NA            | NA      |
| make             | Yes      | This is the make of the device                               | NA            | NA      |
| model            | Yes      | This is the model of the device                              | NA            | NA      |
| dateTime         | Yes      | This is the current date time when the digital ID is created | NA            | NA      |

**Decoded JSON for digital ID**

```
{
  "serialNo": "1801160992",
  "deviceProvider": "Test Vendor",
  "deviceProviderId": "0e90bb45-cc9b-4521-9644-72755f6aa1e9",
  "make": "MC01A",
  "model": "TVSFD",
  "dateTime": "2020-02-16T07:20:42.195Z",
  "type": "Fingerprint",
  "deviceSubType": "Single"
}
```

#### Response

**Success Response**

```
{
  "id": "io.mosip.masterdata.device.create",
  "version": "1.0",
  "responsetime": "2020-01-13T07:25:29.764Z",
  "metadata": null,
  "response": "eyJhbGciOiJSUzI1NiIsInR5cGUiOiJKV1MifQ==.eyJzdGF0dXMiOiJSRUdJU1RFUkVEIiwiZGlnaXRhbElkIjoiZXlKelpYSnBZV3hPYnlJNklqRTRNREV4TmpBNU9USWlMQ0prWlhacFkyVlFjbTkyYVdSbGNpSTZJbE5aVGtOQ1dWUkZJaXdpWkdWMmFXTmxVSEp2ZG1sa1pYSkpaQ0k2SWxOWlRrTkNXVlJGTGsxRE1ERkJJaXdpYldGclpTSTZJazFETURGQklpd2liVzlrWld3aU9pSlRUVWxFUTB3aUxDSmtZWFJsVkdsdFpTSTZJakl3TWpBdE1ERXRNVE5VTURjNk1qQTZOREl1TVRrMVdpSXNJblI1Y0dVaU9pSkdhVzVuWlhKd2NtbHVkQ0lzSW5OMVlsUjVjR1VpT2lKVGFXNW5iR1VpZlEiLCJkZXZpY2VDb2RlIjoiOGNkNDI4NjQtMmNkYy00MDY3LThkMTEtNDBiMjVmZjhjNzYwIiwiZW52IjoibG9jYWwiLCJ0aW1lU3RhbXAiOiIyMDIwLTAxLTEzVDEyOjU1OjI5LjkxOFoifQ==.dkd3Mlo2TStDT2JpM1lHY2Q1OFNJRkJ6T0E5bFZ6dUFlZnN3NHhQZzEzWE42LzAvWVZ6Qm0yNnpmZXFPRXdmWHNKQUN4aC9QNExuM2RHcjhSR2diZjEvRXgwNktCOEhhbEM1VjhPMFh4VGxmK3ZSZFlJeTZhbFh0cS8rY0s0VjRSYUpHYjVDL2kweHdzMFF3bHh0UEo4cFIvbnVrb1d5dzNNTmRDSkNZaVlGSkxVUUpKbnhyaEtYR3dvM1ZlcVNkaEYrMStjS1ZpSzFWSlQ5OHFsMjFhTUp0MGd4Wko1Rzg5V0lSbi9yTnU1Slg1N0c0dnNya1JhN3JEUURsNDI5dEdkT3RYYVJYK3dOb0FESmI5V0psOFlLOW5hUFkyNExkZ3FkOXRydEw2VUoyaTc5ek1Qclk0cjhIQWFQaXlxc0REQmRPVFdhanN5VmhOODFuU0JCQ0tBPT0=",
  "errors": null
}
```

**Response code: 200**

**Validation**

We have added a layer of validation here. We expect the the request to receive within "5 mins" from the time mentioned in "timeStamp" field of Device Info. The time "+5 mins" is configurable using the below property.

_Property:_ `masterdata.registerdevice.timestamp.validate=+5`

If any request comes after 5 mins, then we would throw an exception.

**Signed Response**

The response received is grouped into three parts as Header, Payload and Signature which is in JWT (Java Web Token) format.

**Header**

Encoded Header:

`eyJhbGciOiJSUzI1NiIsInR5cGUiOiJKV1MifQ==`

Decoded Header:

```
{
  "alg": "RS256",
  "type": "JWS"
}
```

**Payload**

Encoded Payload:

```
eyJzdGF0dXMiOiJSRUdJU1RFUkVEIiwiZGlnaXRhbElkIjoiZXlKelpYSnBZV3hPYnlJNklqRTRNREV4TmpBNU9USWlMQ0prWlhacFkyVlFjbTkyYVdSbGNpSTZJbE5aVGtOQ1dWUkZJaXdpWkdWMmFXTmxVSEp2ZG1sa1pYSkpaQ0k2SWxOWlRrTkNXVlJGTGsxRE1ERkJJaXdpYldGclpTSTZJazFETURGQklpd2liVzlrWld3aU9pSlRUVWxFUTB3aUxDSmtZWFJsVkdsdFpTSTZJakl3TWpBdE1ERXRNVE5VTURjNk1qQTZOREl1TVRrMVdpSXNJblI1Y0dVaU9pSkdhVzVuWlhKd2NtbHVkQ0lzSW5OMVlsUjVjR1VpT2lKVGFXNW5iR1VpZlEiLCJkZXZpY2VDb2RlIjoiOGNkNDI4NjQtMmNkYy00MDY3LThkMTEtNDBiMjVmZjhjNzYwIiwiZW52IjoibG9jYWwiLCJ0aW1lU3RhbXAiOiIyMDIwLTAxLTEzVDEyOjU1OjI5LjkxOFoifQ==
```

Decoded Payload:

```
{
  "status": "REGISTERED",
  "digitalId": "eyJzZXJpYWxObyI6IjE4MDExNjA5OTIiLCJkZXZpY2VQcm92aWRlciI6IlNZTkNCWVRFIiwiZGV2aWNlUHJvdmlkZXJJZCI6IlNZTkNCWVRFLk1DMDFBIiwibWFrZSI6Ik1DMDFBIiwibW9kZWwiOiJTTUlEQ0wiLCJkYXRlVGltZSI6IjIwMjAtMDEtMTNUMDc6MjA6NDIuMTk1WiIsInR5cGUiOiJGaW5nZXJwcmludCIsInN1YlR5cGUiOiJTaW5nbGUifQ",
  "deviceCode": "8cd42864-2cdc-4067-8d11-40b25ff8c760",
  "env": "local",
  "timeStamp": "2020-01-13T12:55:29.918Z"
}
```

Digital ID extracted from payload will be unsigned and will be base64 encoded. Encoded digital ID:

```
eyJzZXJpYWxObyI6IjE4MDExNjA5OTIiLCJkZXZpY2VQcm92aWRlciI6IlNZTkNCWVRFIiwiZGV2aWNlUHJvdmlkZXJJZCI6IlNZTkNCWVRFLk1DMDFBIiwibWFrZSI6Ik1DMDFBIiwibW9kZWwiOiJTTUlEQ0wiLCJkYXRlVGltZSI6IjIwMjAtMDEtMTNUMDc6MjA6NDIuMTk1WiIsInR5cGUiOiJGaW5nZXJwcmludCIsInN1YlR5cGUiOiJTaW5nbGUifQ
```

Decoded Digital ID:

```
{
  "serialNo": "1801160992",
  "deviceProvider": "Test Vendor",
  "deviceProviderId": "0e90bb45-cc9b-4521-9644-72755f6aa1e9",
  "make": "MC01A",
  "model": "TVSFD",
  "dateTime": "2020-02-16T07:20:42.195Z",
  "type": "Fingerprint",
  "deviceSubType": "Single"
}
```

**Signed Response**

Signed response from signature API:

```
dkd3Mlo2TStDT2JpM1lHY2Q1OFNJRkJ6T0E5bFZ6dUFlZnN3NHhQZzEzWE42LzAvWVZ6Qm0yNnpmZXFPRXdmWHNKQUN4aC9QNExuM2RHcjhSR2diZjEvRXgwNktCOEhhbEM1VjhPMFh4VGxmK3ZSZFlJeTZhbFh0cS8rY0s0VjRSYUpHYjVDL2kweHdzMFF3bHh0UEo4cFIvbnVrb1d5dzNNTmRDSkNZaVlGSkxVUUpKbnhyaEtYR3dvM1ZlcVNkaEYrMStjS1ZpSzFWSlQ5OHFsMjFhTUp0MGd4Wko1Rzg5V0lSbi9yTnU1Slg1N0c0dnNya1JhN3JEUURsNDI5dEdkT3RYYVJYK3dOb0FESmI5V0psOFlLOW5hUFkyNExkZ3FkOXRydEw2VUoyaTc5ek1Qclk0cjhIQWFQaXlxc0REQmRPVFdhanN5VmhOODFuU0JCQ0tBPT0=
```

**Failure response**

```
{
  "id": "io.mosip.masterdata.device.create",
  "version": "1.0",
  "metadata": {},
  "responsetime": "2020-02-16T07:20:42.195Z",
  "errors": [{
	"errorCode": "KER-ATH-401",
	"message": "Authentication Failed"
  }],
  "response": null
}
```

**Response code: 200**

#### Failure details

| Error Code  | Error Message                                                                     | Error Description                                                                                              |
| ----------- | --------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| KER-ATH-401 | Authentication Failed                                                             | If no role/invalid token is detected                                                                           |
| ADM-DPM-025 | Mandatory input parameter is missing                                              | If any mandatory input parameter is missing                                                                    |
| ADM-DPM-026 | Device Type does not exist                                                        | If Device Type received does not exist                                                                         |
| ADM-DPM-027 | Device Sub-Type does not exist                                                    | If Device Sub-Type received does not exist                                                                     |
| ADM-DPM-028 | Invalid Status received                                                           | If in Status, standard values are not received                                                                 |
| ADM-DPM-029 | For Device ID, Json value expected for a L0 Device                                | If in Device, a singed Json is not received if certification level is L0                                       |
| ADM-DPM-030 | Make/Model inside the Json does not match with the input                          | If Make/Model inside the digital ID does not match with details received in input                              |
| ADM-DPM-031 | Device Provider details inside the Json does not match with the input             | If Device Provider ID/Device Provider name inside the digital ID does not match with details received in input |
| ADM-DPM-032 | Device Provider ID/Name does not exist in the list of Registered Device Providers | If Device Provider ID/Name does not exist against the Device Provider Details                                  |
| ADM-DPM-034 | Invalid Purpose received                                                          | If in purpose, standard values are not received                                                                |
| ADM-DPM-036 | Error occurred while storing MDS Details                                          | If there an error from DB while registering the Device                                                         |
| MSD-RDS-001 | Time Stamp input is %s min after the current timestamp                            | When timestamp in device info is after the configured timestamp range                                          |
| MSD-RDS-001 | Time Stamp input is %s min before the current timestamp                           | When timestamp in device info is before the configured timestamp range                                         |

### DELETE /deregister/{deviceCode}

This service deregisters a device from the platform and also created a history record for the device.

#### Resource URL

`DELETE https://{base_url}/v1/masterdata/registereddevices/deregister/{deviceCode}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name       | Required | Description                    | Default Value | Example |
| ---------- | -------- | ------------------------------ | ------------- | ------- |
| deviceCode | Yes      | This is the code of the device | NA            | NA      |

#### Response

**Success response**

```
{
  "id": "io.mosip.masterdata.device.delete",
  "version": "1.0",
  "metadata": {},
  "responsetime": "2020-02-16T07:20:42.195Z",
  "errors": null,
  "response": {
	"status": "success",
	"message": "Device de-register successfully"
  }
}
```

**Response code: 200**

**Failure response**

```
{
  "id": "io.mosip.masterdata.device.delete",
  "version": "1.0",
  "metadata": {},
  "responsetime": "2020-02-16T07:20:42.195Z",
  "errors": [{
	"errorCode": "KER-ATH-401",
	"message": "Authentication Failed"
  }],
  "response": null
}
```

**Response code: 200**

### PUT /registereddevices/status

This service updates status of the device. The history is persisted

#### Resource URL

`PUT /registereddevices/status?devicecode='70959dd5-e45f-438a-9ff8-9b263908e572'&status='REVOKED'`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name       | Required | Description                    | Default Value | Example                          |
| ---------- | -------- | ------------------------------ | ------------- | -------------------------------- |
| deviceCode | Yes      | This is the code of the device | NA            | NA                               |
| status     | Yes      | This is the code of the device | NA            | REGISTERED or RETIRED or REVOKED |

#### Response

**Success response**

```
{
	"id": "io.mosip.masterdata.device.update",
	"version": "1.0",
	"metadata": {},
	"responsetime": "2020-02-16T07:20:42.195Z",
	"errors": null,
	"response": {
		"status": "success",
		"message": "Device de-register successfully"
	}
}
```

**Response code: 200**

**Failure response**

```
{
	"id": "io.mosip.masterdata.device.update",
	"version": "1.0",
	"metadata": {},
	"responsetime": "2020-02-16T07:20:42.195Z",
	"errors": [{
		"errorCode": "KER-ATH-401",
		"message": "Authentication Failed"
	}],
	"response": null
}
```

**Response code: 200**

#### Failure details

| Error Code  | Error Message                               | Error Description                                      |
| ----------- | ------------------------------------------- | ------------------------------------------------------ |
| KER-ATH-401 | Authentication Failed                       | If no role/invalid token is detected                   |
| ADM-DPM-036 | Mandatory input parameter is missing        | If any mandatory input parameter is missing            |
| ADM-DPM-037 | Invalid Status received                     | If in Status, standard values are not received         |
| ADM-DPM-038 | Error occurred while updating Device Status | If there an error from DB while updating Device Status |

### POST /deviceprovidermanagement/validate

This service will validate the device details from the list of registered devices.

#### Resource URL

`POST https://{base_url}/masterdata/deviceprovidermanagement/validate`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Parameters

| Name                 | Required | Description                                          | Default Value | Example              |
| -------------------- | -------- | ---------------------------------------------------- | ------------- | -------------------- |
| deviceCode           | Yes      | Device ID of the device                              |               |                      |
| digitalId            | Yes      | JSON object consists of device details               |               |                      |
| deviceServiceVersion | Yes      | Device service version of the MDS                    |               |                      |
| timeStamp            | No       | Timestamp in local data time format of history table |               |                      |
| purpose              | No       | This is the purpose of the device                    | NA            | AUTH or REGISTRATION |

If timestamp is provided, then validate device using history data If purpose is provided, then validate purpose of device

#### Request

```
{
  "id": "io.mosip.masterdata.device.validate",
  "metadata": null,
  "request": {
    "deviceCode": "70959dd5-e45f-438a-9ff8-9b263908e572",
    "deviceServiceVersion": "TestSwVersion1",
    "timestamp": "2020-02-16T07:20:42.195Z"
    "purpose": "AUTH"
    "digitalId": {
      "serialNo": "1801160992",
      "make": "MC01A",
      "model": "TVSFD",
      "type": "Fingerprint",
      "deviceSubType": "Single",
      "dp": "Test Vendor",
      "dpId": "0e90bb45-cc9b-4521-9644-72755f6aa1e9",
      "dateTime": "2020-02-16T07:20:42.195Z"
    }
  },
  "version": "1.0",
  "requesttime": "2020-02-16T16:34:22.890Z"
}
```

#### Response

**Success response**

```
{
  "id": "io.mosip.masterdata.device.validate",
  "version": "1.0",
  "metadata": {},
  "responsetime": "2020-02-16T06:12:52.994Z",
  "errors": null,
  "response":  [
    {
      "status": "Valid",
      "message": "Device details validated successfully"
    }
  ],
}
```

**Response code: 200**

**Failure response**

```
{
  "id": "io.mosip.masterdata.device.validate",
  "version": "1.0",
  "metadata": {},
  "responsetime": "2020-02-16T06:12:52.994Z",
  "errors": [
    {
      "errorCode": "KER-MSD-500",
      "message": "Internal Server Error"
    }
  ],
 "response": null
}
```

**Response code: 200**

#### Failure details

| Error Code  | Error Message                                            | Error Description                                                |
| ----------- | -------------------------------------------------------- | ---------------------------------------------------------------- |
| KER-MSD-500 | Internal Server Error                                    | If system error occurs                                           |
| KER-ATH-403 | Forbidden                                                | If unauthorized role detected                                    |
| KER-ATH-401 | Authentication Failed                                    | If no role/invalid token is detected                             |
| ADM-DPM-001 | Device does not exist                                    | If the Device does not exist                                     |
| ADM-DPM-002 | Device is Revoked/Retired                                | If the Device exist and is in Revoked/Retired                    |
| ADM-DPM-003 | Device Provider does not exist                           | If the Device Provider does not exist                            |
| ADM-DPM-004 | Device Provider is marked Inactive                       | If the Device Provider exist and is in Inactive State            |
| ADM-DPM-005 | MDS does not exist                                       | If the MDS does not exist                                        |
| ADM-DPM-006 | MDS is marked Inactive                                   | If the MDS exist and is in Inactive State                        |
| ADM-DPM-007 | Software version does not match against the Service ID   | If the Software version does not match the Service ID received   |
| ADM-DPM-008 | Device Provider ID does not match against the Service ID | If the Device provider ID does not match the Service ID received |
| ADM-DPM-009 | Error occurred while checking a Device Details           | If there an error from DB while checking device details          |

## MDS API

* [POST /mosipdeviceservice](Device-Management-APIs.md#post-mosipdeviceservice)
* [PUT /mosipdeviceservice](Device-Management-APIs.md#put-mosipdeviceservice)

### POST /mosipdeviceservice

This service will create the MDS which are used in the MOSIP platform.

#### Resource URL

`POST https://{base_url}/v1/masterdata/mosipdeviceservice`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name              | Required | Description                  | Default Value | Example |
| ----------------- | -------- | ---------------------------- | ------------- | ------- |
| id                | Yes      | ID of the MDS                |               |         |
| deviceProviderId  | Yes      | Deviceproviderid of the MDS  |               |         |
| regDeviceSubCode  | Yes      | Devicetypecode of the MDS    |               |         |
| regDeviceTypeCode | Yes      | Devicesubtypecode of the MDS |               |         |
| swversion         | Yes      | Software version of the MDS  |               |         |
| swBinaryHash      | Yes      | Binary hash of the MDS       |               |         |
| make              | Yes      | Make of the MDS              |               |         |
| model             | Yes      | Model of the MDS             |               |         |
| swCreateDateTime  | Yes      | Created date time of MDS     |               |         |
| swExpiryDateTime  | Yes      | Expiry date time of MDS      |               |         |

#### Request

```
{
  "id": "io.mosip.masterdata.mds.create",
  "metadata": {},
  "request": {
	"deviceProviderId": "0e90bb45-cc9b-4521-9644-72755f6aa1e9",
	"isActive": true,
	"make": "MC01A",
	"model": "TVSFD",
	"regDeviceSubCode": "Single",
	"regDeviceTypeCode": "Finger",
	"swBinaryHash": "Test Hash",
	"swCreateDateTime": "2020-02-10T06:12:52.994Z",
	"swExpiryDateTime": "2021-02-10T06:12:52.994Z",
	"swVersion": "TestSwVersion1"
  },
  "requesttime": "2020-02-10T06:12:52.994Z",
  "version": "1.0"
}
```

#### Response

**Success response**

```
{
  "id": "io.mosip.masterdata.mds.create",
  "version": "1.0",
  "responsetime": "2020-02-10T06:12:52.994Z",
  "metadata": null,
  "response": {
	"isActive": true,
	"createdBy": "110006",
	"createdDateTime": "2020-02-10T06:12:52.994Z",
	"updatedBy": null,
	"updatedDateTime": null,
	"isDeleted": null,
	"deletedDateTime": null,
	"id": "0f343b65-aba2-44d2-b836-e7511270b1ab",
	"swVersion": "TestSwVersion1",
	"deviceProviderId": "0e90bb45-cc9b-4521-9644-72755f6aa1e9",
	"regDeviceTypeCode": "Finger",
	"regDeviceSubCode": "Single",
	"make": "MC01A",
	"model": "TVSFD",
	"swCreateDateTime": "2020-02-10T06:12:52.994Z",
	"swExpiryDateTime": "2021-02-10T06:12:52.994Z",
	"swBinaryHash": "Test Hash"
  },
  "errors": null
}
```

**Response code: 200**

**Failure response**

```
{
  "id": "io.mosip.masterdata.mds.create",
  "version": "1.0",
  "metadata": {},
  "responsetime": "2020-02-10T06:12:52.994Z",
  "errors": [
    {
      "errorCode": "KER-ATH-401",
      "message": "Authentication Failed"
    }
  ],
 "response": null
}
```

**Response code: 200**

#### Failure details

| Error Code  | Error Message                                                  | Error Description                                                         |
| ----------- | -------------------------------------------------------------- | ------------------------------------------------------------------------- |
| KER-ATH-401 | Authentication Failed                                          | If no role/invalid token is detected                                      |
| ADM-DPM-020 | Mandatory input parameter is missing                           | If any mandatory input parameter is missing                               |
| ADM-DPM-021 | MDS Details already exist                                      | If the MDS Details already exist                                          |
| ADM-DPM-039 | Device Provider ID not found in the list of Device Providers   | Device Provider ID received does not exist in the Device Provider Table   |
| ADM-DPM-040 | Device Type Code not found in the list of Device Types         | Device Type Code received does not exist in the Device Type Table         |
| ADM-DPM-041 | Device Sub Type Code not found in the list of Device Sub Types | Device Sub Type Code received does not exist in the Device Sub Type Table |

### PUT /mosipdeviceservice

This service will update the MDS which are used in the MOSIP platform.

#### Resource URL

`PUT https://{base_url}/v1/masterdata/mosipdeviceservice`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name              | Required | Description                  | Default Value | Example |
| ----------------- | -------- | ---------------------------- | ------------- | ------- |
| id                | Yes      | ID of the MDS                |               |         |
| deviceProviderId  | Yes      | Deviceproviderid of the MDS  |               |         |
| regDeviceSubCode  | Yes      | Devicetypecode of the MDS    |               |         |
| regDeviceTypeCode | Yes      | Devicesubtypecode of the MDS |               |         |
| swversion         | Yes      | Software version of the MDS  |               |         |
| swBinaryHash      | Yes      | Binary hash of the MDS       |               |         |
| make              | Yes      | Make of the MDS              |               |         |
| model             | Yes      | Model of the MDS             |               |         |
| swCreateDateTime  | Yes      | Created date time of MDS     |               |         |
| swExpiryDateTime  | Yes      | Expiry date time of MDS      |               |         |

#### Request

```
{
  "id": "io.mosip.masterdata.mds.update",
  "metadata": {},
  "request": {
    "active": true,
    "deviceProviderId": "0e90bb45-cc9b-4521-9644-72755f6aa1e9",
    "id": "0f343b65-aba2-44d2-b836-e7511270b1ab",
    "make": "MC01A",
    "model": "TVSFD",
    "regDeviceSubCode": "Single",
    "regDeviceTypeCode": "Finger",
    "swBinaryHash": "Test Hash",
    "swCreateDateTime": "2020-02-10T06:12:52.994Z",
    "swExpiryDateTime": "2022-02-10T06:12:52.994Z",
    "swVersion": "TestSwVersion1"
  },
  "requesttime": "2020-02-10T06:12:52.994Z",
  "version": "1.0"
}
```

#### Response

**Success response**

```
{
  "id": "io.mosip.masterdata.mds.update",
  "version": "1.0",
  "responsetime": "2020-02-11T06:12:52.994Z",
  "metadata": null,
  "response": {
    "isActive": true,
    "createdBy": "110006",
    "createdDateTime": "2020-02-10T06:12:52.994Z",
	"updatedBy": "110005",
    "updatedDateTime": "2020-02-11T06:12:52.994Z",
    "isDeleted": null,
    "deletedDateTime": null,
    "id": "0f343b65-aba2-44d2-b836-e7511270b1ab",
    "swVersion": "v2",
    "deviceProviderId": "0e90bb45-cc9b-4521-9644-72755f6aa1e9",
    "regDeviceTypeCode": "Finger",
    "regDeviceSubCode": "Single",
    "make": "MC01A",
    "model": "TVSFD",
    "swCreateDateTime": "2020-02-10T06:12:52.994Z",
    "swExpiryDateTime": "2022-02-10T06:12:52.994Z",
    "swBinaryHash": "Test Hash"
  },
  "errors": null
}
```

**Response code: 200**

**Failure Response**

```
{
  "id": "io.mosip.masterdata.mds.update",
  "version": "1.0",
  "metadata": {},
  "responsetime": "2020-02-11T06:12:52.994Z",
  "errors": [
    {
      "errorCode": "KER-ATH-401",
      "message": "Authentication Failed"
    }
  ],
 "response": null
}
```

**Response code: 200**

#### Failure details

| Error Code  | Error Message                                                  | Error Description                                                         |
| ----------- | -------------------------------------------------------------- | ------------------------------------------------------------------------- |
| KER-ATH-401 | Authentication Failed                                          | If no role/invalid token is detected                                      |
| ADM-DPM-020 | Mandatory input parameter is missing                           | If any mandatory input parameter is missing                               |
| ADM-DPM-021 | MDS Details already exist                                      | If the MDS Details already exist                                          |
| ADM-DPM-039 | Device Provider ID not found in the list of Device Providers   | Device Provider ID received does not exist in the Device Provider Table   |
| ADM-DPM-040 | Device Type Code not found in the list of Device Types         | Device Type Code received does not exist in the Device Type Table         |
| ADM-DPM-041 | Device Sub Type Code not found in the list of Device Sub Types | Device Sub Type Code received does not exist in the Device Sub Type Table |
