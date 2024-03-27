# Device Type and Subtype APIs

This page contains detail about the Device type and Device subtype API's.

* [Device Types](Device-Type-and-Subtype-APIs.md#device-types)
* [Device Subtypes](Device-Type-and-Subtype-APIs.md#device-subtypes)

## Device Types

* [POST /devicetypes](Device-Type-and-Subtype-APIs.md#post-devicetypes)
* [GET /devicetypes/{code}](Device-Type-and-Subtype-APIs.md#get-devicetypes-code)
* [PUT /devicetypes](Device-Type-and-Subtype-APIs.md#put-devicetypes)
* [DELETE /devicetypes/{code}](Device-Type-and-Subtype-APIs.md#delete-devicetypes-code)

### POST /devicetypes

This service will create the Device Types which are used in the MOSIP platform.

#### Resource URL

`POST /devicetypes`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name  | Required | Description                    | Default Value | Example |
| ----- | -------- | ------------------------------ | ------------- | ------- |
| code  | Yes      | code of the device type        |               |         |
| name  | Yes      | name of the device type        |               |         |
| descr | No       | description of the device type |               |         |

#### Example Request

```
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

#### Example Response

**Success Response**

```
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

**Response Code: 200 Ok**

**Error Response**

```
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

**Response Code: 200 Ok**

#### Failure details

| Error Code  | Error Message         | Error Description                    |
| ----------- | --------------------- | ------------------------------------ |
| KER-MSD-500 | Internal Server Error | If system error occurs               |
| KER-ATH-403 | Forbidden             | If unauthorized role detected        |
| KER-ATH-401 | Authentication Failed | If no role/invalid token is detected |

### GET /devicetypes/{code}

This service will provides the service to get the device types.

#### Resource URL

`GET /devicetypes/{code}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name | Required | Description | Default Value | Example |
| ---- | -------- | ----------- | ------------- | ------- |
| -NA- |          |             |               |         |

#### Example Response

**Success Response**

```
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

**Response Code: 200 Ok**

**Error Response**

```
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

**Response Code: 200 Ok**

#### Failure details

| Error Code  | Error Message                           | Error Description                    |
| ----------- | --------------------------------------- | ------------------------------------ |
| KER-MSD-500 | Internal Server Error                   | If system error occurs               |
| KER-ATH-403 | Forbidden                               | If unauthorized role detected        |
| KER-ATH-401 | Authentication Failed                   | If no role/invalid token is detected |
| KER-MDS-003 | Requiered Device Type details Not Found | Device code is not found             |

### PUT /devicetypes

This service will update the Device Types which are used in the MOSIP platform.

#### Resource URL

`PUT /devicetypes`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name  | Required | Description                    | Default Value | Example |
| ----- | -------- | ------------------------------ | ------------- | ------- |
| code  | Yes      | code of the device type        |               |         |
| name  | No       | name of the device type        |               |         |
| descr | No       | description of the device type |               |         |

#### Example Request

```
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

#### Example Response

**Success Response**

```
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

**Response Code: 200 Ok**

**Error Response**

```
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

**Response Code: 200 Ok**

#### Failure details

| Error Code  | Error Message                           | Error Description                    |
| ----------- | --------------------------------------- | ------------------------------------ |
| KER-MSD-500 | Internal Server Error                   | If system error occurs               |
| KER-ATH-403 | Forbidden                               | If unauthorized role detected        |
| KER-ATH-401 | Authentication Failed                   | If no role/invalid token is detected |
| KER-MDS-003 | Requiered Device Type details Not Found | Device code is not found             |

### DELETE /devicetypes/{code}

This service will provides the service to delete the device types.

#### Resource URL

`DELETE /devicetypes/{code}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name | Required | Description | Default Value | Example |
| ---- | -------- | ----------- | ------------- | ------- |
| -NA- |          |             |               |         |

#### Example Response

**Success Response**

```
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

**Response Code: 200 Ok**

**Error Response**

```
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

**Response Code: 200 Ok**

#### Failure details

| Error Code  | Error Message                           | Error Description                    |
| ----------- | --------------------------------------- | ------------------------------------ |
| KER-MSD-500 | Internal Server Error                   | If system error occurs               |
| KER-ATH-403 | Forbidden                               | If unauthorized role detected        |
| KER-ATH-401 | Authentication Failed                   | If no role/invalid token is detected |
| KER-MDS-003 | Requiered Device Type details Not Found | Device code is not found             |

## Device Subtypes

* [POST /devicesubtypes](Device-Type-and-Subtype-APIs.md#post-devicesubtypes)
* [GET /devicesubtypes/{code}](Device-Type-and-Subtype-APIs.md#get-devicesubtypes-code)
* [PUT /devicesubtypes](Device-Type-and-Subtype-APIs.md#put-devicesubtypes)
* [DELETE /devicesubtypes/{code}](Device-Type-and-Subtype-APIs.md#delete-devicesubtypes-code)

### POST /devicesubtypes

This service will create the Device Subtypes which are used in the MOSIP platform.

#### Resource URL

`POST /devicesubtypes`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name           | Required | Description                           | Default Value | Example |
| -------------- | -------- | ------------------------------------- | ------------- | ------- |
| code           | Yes      | code of the device subtype            |               |         |
| deviceTypeCode | Yes      | devicetype code of the device subtype |               |         |
| name           | Yes      | name of the device subtype            |               |         |
| descr          | No       | description of the device subtype     |               |         |

#### Example Request

```
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

#### Example Response

**Success Response**

```
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

**Response Code: 200 Ok**

**Error Response**

```
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

**Response Code: 200 Ok**

#### Failure details

| Error Code  | Error Message         | Error Description                    |
| ----------- | --------------------- | ------------------------------------ |
| KER-MSD-500 | Internal Server Error | If system error occurs               |
| KER-ATH-403 | Forbidden             | If unauthorized role detected        |
| KER-ATH-401 | Authentication Failed | If no role/invalid token is detected |

### GET /devicesubtypes/{code}

This service will provides the service to get the device subtypes.

#### Resource URL

`GET /devicesubtypes/{code}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name | Required | Description | Default Value | Example |
| ---- | -------- | ----------- | ------------- | ------- |
| -NA- |          |             |               |         |

#### Example Response

**Success Response**

```
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

**Response Code: 200 Ok**

**Error Response**

```
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

**Response Code: 200 Ok**

#### Failure details

| Error Code  | Error Message         | Error Description                    |
| ----------- | --------------------- | ------------------------------------ |
| KER-MSD-500 | Internal Server Error | If system error occurs               |
| KER-ATH-403 | Forbidden             | If unauthorized role detected        |
| KER-ATH-401 | Authentication Failed | If no role/invalid token is detected |

### PUT /devicesubtypes

This service will update the Device Subtypes which are used in the MOSIP platform.

#### Resource URL

`PUT /devicesubtypes`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name           | Required | Description                           | Default Value | Example |
| -------------- | -------- | ------------------------------------- | ------------- | ------- |
| code           | Yes      | code of the device subtype            |               |         |
| deviceTypeCode | Yes      | devicetype code of the device subtype |               |         |
| name           | Yes      | name of the device subtype            |               |         |
| descr          | No       | description of the device subtype     |               |         |

#### Example Request

```
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

#### Example Response

**Success Response**

```
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

**Error Response**

```
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

| Error Code  | Error Message         | Error Description                    |
| ----------- | --------------------- | ------------------------------------ |
| KER-MSD-500 | Internal Server Error | If system error occurs               |
| KER-ATH-403 | Forbidden             | If unauthorized role detected        |
| KER-ATH-401 | Authentication Failed | If no role/invalid token is detected |

### DELETE /devicesubtypes/{code}

This service will provides the service to delete the device subtypes.

#### Resource URL

`DELETE /devicesubtypes/{code}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name | Required | Description | Default Value | Example |
| ---- | -------- | ----------- | ------------- | ------- |
| -NA- |          |             |               |         |

#### Example Response

**Success Response**

```
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

**Response Code: 200 Ok**

**Error Response**

```
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

**Response Code: 200 Ok**

#### Failure details

| Error Code  | Error Message         | Error Description                    |
| ----------- | --------------------- | ------------------------------------ |
| KER-MSD-500 | Internal Server Error | If system error occurs               |
| KER-ATH-403 | Forbidden             | If unauthorized role detected        |
| KER-ATH-401 | Authentication Failed | If no role/invalid token is detected |
