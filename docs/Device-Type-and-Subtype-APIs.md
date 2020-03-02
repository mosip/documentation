This page represents the Device type and Device subtype API's

# Device Types API

* [POST /devicetypes](#post-devicetypes)
* [GET /devicetypes/{code}](#get-devicetypescode)
* [PUT /devicetypes](#put-devicetypes)
* [DELETE /devicetypes/{code}](#delete-devicetypescode)
	
# POST /devicetypes
Master data is required across the platform. 

This service will create the Device Types which are used in the MOSIP platform. 

### Resource URL
### `POST /devicetypes`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
code|Yes|code of the device type| | 
name|Yes|name of the device type| | 
descr|No|description of the device type| | 

### Example Request
```JSON
{
  "id": "string",
  "metadata": {},
  "request":  {
    "code": "DeviceTypeCode",
    "name": "Finger",
    "descr": "Device Type Finger"
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
  "metadata": {},
  "responsetime": "2018-12-10T06:12:52.994Z",
  "errors": null,
  "response":  [
    {
      "code": "Finger",
      "name": "Device Type Finger"
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

# GET /devicetypes/{code}
Master data is required across the platform. 

This service will provides the service to get the device types. 

### Resource URL
### `GET /devicetypes/{code}`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
-NA-


### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {
		 "code": "DeviceTypeCode",
    "name": "Finger",
    "descr": "Device Type Finger",
    "isActive": true,
    "createdBy": "superadmin",
    "createdDateTime": "2019-07-26T12:18:40.718Z",
    "updatedBy": null,
    "updatedDateTime": null,
    "isDeleted": null,
    "deletedDateTime": null
  }
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

# PUT /devicetypes
Master data is required across the platform. 

This service will update the Device Types which are used in the MOSIP platform. 

### Resource URL
### `PUT /devicetypes`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
code|Yes|code of the device type| | 
name|No|name of the device type| | 
descr|No|description of the device type| | 

### Example Request
```JSON
{
  "id": "string",
  "metadata": {},
  "request":  {
    "code": "DeviceTypeCode",
    "name": "Finger",
    "descr": "Device Type Finger"
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
  "metadata": {},
  "responsetime": "2018-12-10T06:12:52.994Z",
  "errors": null,
  "response":  [
    {
      "code": "DeviceTypeCode",
      "name": "Finger"
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

# DELETE /devicetypes/{code}
Master data is required across the platform. 

This service will provides the service to delete the device types. 

### Resource URL
### `DELETE /devicetypes/{code}`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
-NA-


### Example Response

200 Ok
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {
		 "code": "DeviceTypeCode"
  }
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

# Device Subtypes API

* [POST /devicesubtypes](#post-devicesubtypes)
* [GET /devicesubtypes/{code}](#get-devicesubtypes)
* [PUT /devicesubtypes](#put-devicesubtypes)
* [DELETE /devicesubtypes/{code}](#delete-devicesubtypes)
	
# POST /devicesubtypes
Master data is required across the platform. 

This service will create the Device Subtypes which are used in the MOSIP platform. 

### Resource URL
### `POST /devicesubtypes`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
code|Yes|code of the device subtype| | 
deviceTypeCode|Yes|devicetype code of the device subtype| | 
name|Yes|name of the device subtype| | 
descr|No|description of the device subtype| | 

### Example Request
```JSON
{
  "id": "string",
  "metadata": {},
  "request":  {
    "code": "DeviceSubtypeCode",
    "deviceTypeCode": "DevicetypeCode",
    "name": "Finger Slab",
    "descr": "Finger Slab Description"
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
  "metadata": {},
  "responsetime": "2018-12-10T06:12:52.994Z",
  "errors": null,
  "response":  [
    {
      "code": "DeviceSubtypeCode",
      "name": "Finger Slab"
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

# GET /devicesubtypes/{code}
Master data is required across the platform. 

This service will provides the service to get the device subtypes. 

### Resource URL
### `GET /devicesubtypes/{code}`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
-NA-


### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {
		"code": "DeviceSubtypeCode",
    "deviceTypeCode": "DevicetypeCode",
    "name": "Finger Slab",
    "descr": "Finger Slab Description",
    "isActive": true,
    "createdBy": "superadmin",
    "createdDateTime": "2019-07-26T12:18:40.718Z",
    "updatedBy": null,
    "updatedDateTime": null,
    "isDeleted": null,
    "deletedDateTime": null
  }
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

# PUT /devicesubtypes
Master data is required across the platform. 

This service will update the Device Subtypes which are used in the MOSIP platform. 

### Resource URL
### `PUT /devicesubtypes`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
code|Yes|code of the device subtype| | 
deviceTypeCode|Yes|devicetype code of the device subtype| | 
name|Yes|name of the device subtype| | 
descr|No|description of the device subtype| | 

### Example Request
```JSON
{
  "id": "string",
  "metadata": {},
  "request":  {
    "code": "DeviceSubtypeCode",
    "deviceTypeCode": "DevicetypeCode",
    "name": "Finger Slab",
    "descr": "Finger Slab Description"
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
  "metadata": {},
  "responsetime": "2018-12-10T06:12:52.994Z",
  "errors": null,
  "response":  [
    {
       "code": "DeviceSubtypeCode",
      "name": "Finger Slab"
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

# DELETE /devicesubtypes/{code}
Master data is required across the platform. 

This service will provides the service to delete the device subtypes. 

### Resource URL
### `DELETE /devicesubtypes/{code}`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
-NA-


### Example Response

200 Ok
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {
		 "code": "DeviceSubtypeCode"
  }
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