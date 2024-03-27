# Device APIs

This page contains detail about the service APIs for Device Master data.

* [Devices API](Device-APIs.md#devices) These APIs includes create and update APIs. These are used by the Administrator Portal for the Create and Update Device functionality.
* [Device Types API](Device-APIs.md#device-types) These APIs includes create and update APIs. These are used by the Administrator Portal for the Create and Update Device Type functionality.
* [Device Specifications API](Device-APIs.md#device-specifications) These APIs includes create and update APIs. These are used by the Administrator Portal for the Create and Update Device Specification functionality.

## Devices

* [POST /devices](Device-APIs.md#post-devices)
* [PUT /devices](Device-APIs.md#put-devices)
* [GET /devices/{languagecode}](Device-APIs.md#get-devices-languagecode)
* [GET /devices/{languagecode}/{deviceType}](Device-APIs.md#get-devices-languagecode-devicetype)
* [PUT /devices/decommission/{id}](Device-APIs.md#put-devices-decommission-id)
* [DELETE /devices/{id}](Device-APIs.md#delete-devices-id)
* [POST /devices/search](Device-APIs.md#post-devices-search)
* [POST /devices/filtervalues](Device-APIs.md#post-devices-filtervalues)

### POST /devices

This service will create a device which will be used in the MOSIP platform. Please find the steps to create primary/secondary languages in [Registration Center Create/Update API](Registration-Center-APIs.md#create-update-api).

#### Resource URL

`https://{base_url}/v1/masterdata/devices`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name             | Required | Description                           | Default Value | Example |
| ---------------- | -------- | ------------------------------------- | ------------- | ------- |
| id               | Yes      | Id of the device                      |               |         |
| macAddress       | Yes      | Mac Address of the device             |               |         |
| name             | Yes      | Name of the device                    |               |         |
| deviceSpecId     | Yes      | Device specification Id of the device |               |         |
| serialNum        | Yes      | Serial number of the device           |               |         |
| langCode         | Yes      | Language code of the device           |               |         |
| ipAddress        | No       | Ip Address of the device              |               |         |
| isActive         | Yes      | Is the device active?                 |               |         |
| validityDateTime | Yes      | Validity date of device               |               |         |
| zoneCode         | Yes      | Zone code of device                   |               |         |

#### Example Request

```
{
  "id": "string",
  "metadata": {},
  "request": {
    "id": "",
    "name": "Test device1",
    "serialNum": "BS563Q2230898",
    "deviceSpecId": "165",
    "macAddress": "85-BB-97-4B-14-05",
    "ipAddress": "10.4.6.8",
    "langCode": "eng",
    "validityDateTime": "2021-08-07T09:13:22.221Z",
    "zoneCode": "ORT",
    "isActive": true
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```

#### Example Response

```
{
  "id": "string",
  "version": "string",
  "responsetime": "2020-05-01T13:39:30.996Z",
  "metadata": null,
  "response": {
    "id": "5f1cfd87-f078-41f0-aea9-d205ca715e68",
    "name": "Test device1",
    "serialNum": "BS563Q2230898",
    "deviceSpecId": "165",
    "macAddress": "85-BB-97-4B-14-05",
    "ipAddress": "10.4.6.8",
    "langCode": "eng",
    "validityDateTime": "2021-08-07T09:13:22.221Z",
    "zoneCode": "ORT",
    "isActive": false,
    "createdBy": "110006",
    "createdDateTime": "2020-05-01T13:39:31.057Z",
    "updatedBy": null,
    "updatedDateTime": null,
    "isDeleted": null,
    "deletedDateTime": null
  },
  "errors": null
}
```

**Response codes: 200 Ok**

#### Error Response:

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "2020-05-01T13:39:31.057Z",
  "errors": [
    {
      "errorCode": "KER-MSD-439",
      "message": "Admin not authorized to access this Device for this Zone"
    }
  ],
 "response": null
}
```

**Response codes: 200 Ok**

#### Failure details

| Error Code  | Error Message                                            | Error Description                                        |
| ----------- | -------------------------------------------------------- | -------------------------------------------------------- |
| KER-MSD-500 | Internal Server Error                                    | If system error occurs                                   |
| KER-ATH-403 | Forbidden                                                | If unauthorized role detected                            |
| KER-ATH-401 | Authentication Failed                                    | If no role/invalid token is detected                     |
| KER-MSD-069 | Error occurred while inserting Device details            |                                                          |
| KER-MSD-439 | Admin not authorized to access this Device for this Zone | When Admin is not allowed to created a device for a Zone |

### PUT /devices

This service will update the list of devices which are used in the MOSIP platform. Please find the steps to create primary/secondary languages in [Registration Center Create/Update API](Registration-Center-APIs.md#createupdate-api)

#### Resource URL

`https://{base_url}/v1/masterdata/devices`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name             | Required | Description                           | Default Value | Example |
| ---------------- | -------- | ------------------------------------- | ------------- | ------- |
| id               | Yes      | Id of the device                      |               |         |
| macAddress       | Yes      | Mac Address of the device             |               |         |
| name             | Yes      | Name of the device                    |               |         |
| deviceSpecId     | Yes      | Device specification Id of the device |               |         |
| serialNum        | Yes      | Serial number of the device           |               |         |
| langCode         | Yes      | Language code of the device           |               |         |
| ipAddress        | No       | Ip Address of the device              |               |         |
| isActive         | Yes      | Is the device active?                 |               |         |
| validityDateTime | Yes      | Validity date of device               |               |         |
| zoneCode         | Yes      | Zone code of device                   |               |         |

#### Example Request

```
{
  "id": "string",
  "metadata": {},
  "request": {
    "id": "5f1cfd87-f078-41f0-aea9-d205ca715e68",
    "name": "Test device2",
    "serialNum": "BS563Q2230898",
    "deviceSpecId": "165",
    "macAddress": "85-BB-97-4B-14-05",
    "ipAddress": "10.4.6.8",
    "langCode": "eng",
    "validityDateTime": "2022-08-07T09:13:22.221Z",
    "zoneCode": "ORT",
    "isActive": true
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```

#### Example Response

```
{
  "id": "string",
  "version": "string",
  "responsetime": "2020-05-01T13:45:58.054Z",
  "metadata": null,
  "response": {
    "id": "5f1cfd87-f078-41f0-aea9-d205ca715e68",
    "name": "Test device2",
    "serialNum": "BS563Q2230898",
    "deviceSpecId": "165",
    "macAddress": "85-BB-97-4B-14-05",
    "ipAddress": "10.4.6.8",
    "langCode": "eng",
    "validityDateTime": "2022-08-07T09:13:22.221Z",
    "zoneCode": "ORT",
    "isActive": false,
    "createdBy": "110006",
    "createdDateTime": "2020-05-01T13:39:31.057Z",
    "updatedBy": "110006",
    "updatedDateTime": "2020-05-01T13:45:58.086Z",
    "isDeleted": null,
    "deletedDateTime": null
  },
  "errors": null
}
```

**Response codes: 200 Ok**

#### Error Response

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "2020-05-01T13:39:31.057Z",
  "errors": [
    {
      "errorCode": "KER-MSD-439",
      "message": "Admin not authorized to access this Device for this Zone"
    }
  ],
 "response": null
}
```

**Response codes: 200 Ok**

#### Failure details

| Error Code  | Error Message                                            | Error Description                                        |
| ----------- | -------------------------------------------------------- | -------------------------------------------------------- |
| KER-MSD-500 | Internal Server Error                                    | If system error occurs                                   |
| KER-ATH-403 | Forbidden                                                | If unauthorized role detected                            |
| KER-ATH-401 | Authentication Failed                                    | If no role/invalid token is detected                     |
| KER-MSD-069 | Error occurred while inserting Device details            |                                                          |
| KER-MSD-439 | Admin not authorized to access this Device for this Zone | When Admin is not allowed to created a device for a Zone |

### GET /devices/{languagecode}

This service will provides the service for the list of devices.

#### Resource URL

`GET https://{base_url}/v1/masterdata/devices/{languagecode}`

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

```
{
  "id": null,
  "version": null,
  "metadata": null,
  "responsetime": "2020-05-01T14:10:38.512Z",
  "errors": null,
  "response": {
	"devices": [
	  {
	   "id": "3000023",
        "name": "Dummy Finger Print Scanner 3",
        "serialNum": "AT8075685650",
        "deviceSpecId": "165",
        "macAddress": "6B-D5-10-4B-3A-9E",
        "ipAddress": null,
        "langCode": "eng",
        "isActive": true,
        "validityDateTime": null,
        "zoneCode": "NTH"
	  }
	] 
  }
}
```

**Response codes: 200 Ok**

#### Error Response

```
{
  "id": null,
  "version": null,
  "responsetime": "2020-05-01T14:20:17.569Z",
  "metadata": null,
  "response": null,
  "errors": [
    {
      "errorCode": "KER-MSD-010",
      "message": "Device not Found"
    }
  ]
}
```

**Response codes: 200 Ok**

#### Failure details

| Error Code  | Error Message         | Error Description                    |
| ----------- | --------------------- | ------------------------------------ |
| KER-MSD-500 | Internal Server Error | If system error occurs               |
| KER-ATH-403 | Forbidden             | If unauthorized role detected        |
| KER-ATH-401 | Authentication Failed | If no role/invalid token is detected |
| KER-MSD-010 | Device not Found      | Data Not Found                       |

### GET /devices/{languagecode}/{deviceType}

This service will provides the list of devices based on device type and language code.

#### Resource URL

`GET https://{base_url}/v1/masterdata/devices/{languagecode}/{deviceType}`

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

```
{
  "id": null,
  "version": null,
  "metadata": null,
  "responsetime": "2020-05-01T14:10:38.512Z",
  "errors": null,
  "response": {
	"devices": [
	  {
	   "id": "3000023",
        "name": "Dummy Finger Print Scanner 3",
        "serialNum": "AT8075685650",
        "deviceSpecId": "165",
        "macAddress": "6B-D5-10-4B-3A-9E",
        "ipAddress": null,
        "langCode": "eng",
        "isActive": true,
        "validityDateTime": null,
        "zoneCode": "NTH"
	  }
	] 
  }
}
```

**Response codes: 200 Ok**

#### Error Response

```
{
  "id": null,
  "version": null,
  "responsetime": "2020-05-01T14:20:17.569Z",
  "metadata": null,
  "response": null,
  "errors": [
    {
      "errorCode": "KER-MSD-010",
      "message": "Device not Found"
    }
  ]
}
```

**Response codes: 200 Ok**

#### Failure details

| Error Code  | Error Message         | Error Description                    |
| ----------- | --------------------- | ------------------------------------ |
| KER-MSD-500 | Internal Server Error | If system error occurs               |
| KER-ATH-403 | Forbidden             | If unauthorized role detected        |
| KER-ATH-401 | Authentication Failed | If no role/invalid token is detected |
| KER-MSD-010 | Device not Found      | Data Not Found                       |

### PUT /devices/decommission/{id}

This service will update existing devices.

#### Resource URL

`PUT /devices/decommission/{id}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name | Required | Description | Default Value | Example |
| ---- | -------- | ----------- | ------------- | ------- |
| id   | Yes      | Device ID   | -NA-          | -NA-    |

#### Example Request

\-NA-

#### Example Response

```
{
    "id": null,
    "version": null,
    "responsetime": "2020-05-01T15:10:33.831Z",
    "metadata": null,
    "response": {
        "id": "663bf60a-bd29-4e77-a128-7f281f8de21c"
    },
    "errors": null
}
```

**Response codes: 200 Ok**

#### Error Response

```
{
  "id": null,
  "version": null,
  "responsetime": "2020-05-01T14:20:17.569Z",
  "metadata": null,
  "response": null,
  "errors": [
    {
      "errorCode": "KER-MSD-010",
      "message": "Device not Found"
    }
  ]
}
```

**Response codes: 200 Ok**

#### Failure details

| Error Code  | Error Message                                            | Error Description                                        |
| ----------- | -------------------------------------------------------- | -------------------------------------------------------- |
| KER-MSD-500 | Internal Server Error                                    | If system error occurs                                   |
| KER-ATH-403 | Forbidden                                                | If unauthorized role detected                            |
| KER-ATH-401 | Authentication Failed                                    | If no role/invalid token is detected                     |
| KER-MSD-083 | Error occurred while updating Device details             |                                                          |
| KER-MSD-010 | Device not Found                                         | Data Not Found                                           |
| KER-MSD-439 | Admin not authorized to access this Device for this Zone | When Admin is not allowed to created a device for a Zone |

### DELETE /devices/{id}

This service will delete the devices.

#### Resource URL

`DELETE https://{base_url}/v1/masterdata/devices/{id}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name     | Required | Description   | Default Value | Example |
| -------- | -------- | ------------- | ------------- | ------- |
| deviceId | Yes      | The device Id |               |         |

#### Example Response

```
{
  "id": null,
  "version": null,
  "responsetime": "2020-05-01T14:07:52.929Z",
  "metadata": null,
  "response": {
    "id": "5f1cfd87-f078-41f0-aea9-d205ca715e68"
  },
  "errors": null
}
```

**Response codes: 200 Ok**

#### Failure Response:

```
{
  "id": null,
  "version": null,
  "responsetime": "2020-05-01T13:50:48.733Z",
  "metadata": null,
  "response": null,
  "errors": [
    {
      "errorCode": "KER-MSD-010",
      "message": "Device not Found"
    }
  ]
}
```

#### Failure details

| Error Code  | Error Message                                            | Error Description                                        |
| ----------- | -------------------------------------------------------- | -------------------------------------------------------- |
| KER-MSD-009 | Error occurred while fetching Devices                    | Fetch Issue                                              |
| KER-MSD-069 | Error occurred while inserting Device details            | Insertion Issue                                          |
| KER-MSD-010 | Device not Found                                         | Data Not Found                                           |
| KER-MSD-083 | Error while updating                                     | Update Issue                                             |
| KER-MSD-084 | Error while deleting                                     | Deletion Issue                                           |
| KER-MSD-147 | Cannot delete as dependency found                        | Deletion Issue because of dependency                     |
| KER-MSD-439 | Admin not authorized to access this Device for this Zone | When Admin is not allowed to created a device for a Zone |

### POST /devices/search

This service is for the devices search functionality. All the filter parameters are passed and the devices are searched and the matching results are returned.

#### Resource URL

`POST /devices/search`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name         | Required                                    | Description                                                                     | Default Value | Example |
| ------------ | ------------------------------------------- | ------------------------------------------------------------------------------- | ------------- | ------- |
| filters      | No                                          | Array of the filter applied. In case of "list" screen, this array will be empty | -NA-          |         |
| columnName   | No                                          | The column name in the JSON response                                            | -NA-          |         |
| type         | No                                          | The value have to be in \["contains","equals","startsWith","between"]           | -NA-          |         |
| value        | No                                          | Value or id selected in the filter by the end user                              | -NA-          |         |
| fromValue    | No                                          | If the type is "between", this field is the value of the fromName               | -NA-          |         |
| toValue      | No                                          | If the type is "between", this field is the value of the toName                 | -NA-          |         |
| languagecode | Yes                                         | Language code in Language code in ISO 639-2 format                              |               |         |
| sort         | No                                          | This is an array of the sort field and type                                     |               |         |
| sortfield    | The field on which the sort is applied      |                                                                                 | modifiedDate  |         |
| sorttype     | This should be either of \['ASC','DESC']    |                                                                                 | ASC           |         |
| pagination   | The pagination parameter object             |                                                                                 |               |         |
| pageStart    | This is the start index                     | 0                                                                               | 0             |         |
| pageFetch    | This is the amount of records to be fetched | 10                                                                              | 10            |         |

#### Filter Values

Please find the filter columns used in search \* name \* isActive \* macAddress \* serialNum \* mapStatus \* deviceTypeName

| Filter Name             | Search Values                       |
| ----------------------- | ----------------------------------- |
| Device Name             | \["contains","equals","startsWith"] |
| Status                  | \["contains","equals","startsWith"] |
| MAC Address             | \["contains","equals","startsWith"] |
| Serial Number           | \["contains","equals","startsWith"] |
| Map Status              | \["contains","equals","startsWith"] |
| Device Type             | \["contains","equals","startsWith"] |
| Device Specification ID | \["contains","equals","startsWith"] |

#### Example Request

```
{
  "id": "string",
  "metadata": {},
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string",
  "request": {
	"filters" : [
	  {
		"columnName": "",
		"type": "in",
		"value": "",
		"fromValue": "",
		"toValue": ""
	  }
	],
	"sort":[
	  {
		"sortfield":"string",
		"sorttype":"ASC"
	  }
	],
	"pagination":{
	  "pageStart":"number",
	  "pageFetch":"number"
	},
	"languageCode":""
  }
}
```

#### Example Response

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {
    "devices": [
      {
        "deviceSpecId": "string",
        "id": "string",
        "ipAddress": "string",
        "isActive": true,
        "langCode": "string",
        "macAddress": "string",
        "name": "string",
        "serialNum": "string",
        "validityDateTime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
      }
    ],
	"fromRecord" : "number",
	"toRecord":"number",
	"totalRecord":"number"
  }
}
```

**Response codes: 200 Ok**

### POST /devices/filtervalues

This service returns the filter values which are required in the dropdown entries of the filter screen.

#### Resource URL

`POST /devices/filtervalues`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name         | Required | Description                                                                     | Default Value | Example |
| ------------ | -------- | ------------------------------------------------------------------------------- | ------------- | ------- |
| filters      | No       | Array of the filter applied. In case of "list" screen, this array will be empty | -NA-          |         |
| columnName   | No       | The column name in the JSON response                                            | -NA-          |         |
| type         | No       | The value have to be in \["unique","all"]                                       | unique        | unique  |
| languagecode | Yes      | Language code in Language code in ISO 639-2 format                              |               |         |

#### Example Request

```
{
	"id": "string",
	"metadata": {},
	"requesttime": "2018-12-10T06:12:52.994Z",
	"version": "string"
	"request": {
		"filters" : [
			{
				"columnName": ""
				"type": "unique"
			}
		],
		"languageCode": "string",
	}
}
```

#### Example Response

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {
  "filters": [
	{
		"fieldID": "string",
		"fieldValue": "string"
	}
   ]
 }
}
```

**Response codes: 200 Ok**

***

## Device Types

* [POST /devicetypes](Device-APIs.md#post-devicetypes)
* [PUT /devicetypes](Device-APIs.md#put-devicetypes)
* [POST /devicetypes/search](Device-APIs.md#post-devicetypes-search)
* [POST /devicetypes/filtervalues](Device-APIs.md#post-devicetypes-filtervalues)

### POST /devicetypes

This service will create the list of Device types which are used in the MOSIP platform.

#### Resource URL

`POST /devicetypes`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name           | Required | Description                      | Default Value | Example |
| -------------- | -------- | -------------------------------- | ------------- | ------- |
| devicetypecode | Yes      | Code of the device type          |               |         |
| devicename     | Yes      | Name of the device type          |               |         |
| description    | Yes      | Description of the device type   |               |         |
| languagecode   | Yes      | Language code of the device type |               |         |
| isactive       | Yes      | Is the device type active?       |               |         |

#### Example Request

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "requesttime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "request":  {
    "code": "string",
    "description": "string",
    "isActive": true,
    "langCode": "string",
    "name": "string"
  }
}
```

#### Example Response

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response":{
      "code": "string",
      "langCode": "string"
  }
}
```

**Response codes: 200 Ok**

#### Failure details

| Error Code  | Error Message                                      | Error Description |
| ----------- | -------------------------------------------------- | ----------------- |
| KER-MSD-053 | Error occurred while inserting Device Type details | Insertion Issue   |
| KER-MSD-003 | Required Device Type detail Not Found              | Data Not Found    |
| KER-MSD-002 | Error occurred while mapping Device Type details   | Mapping Issue     |
| KER-MSD-054 | Error occurred while fetching Device Type details  | Fetch Issue       |

### PUT /devicetypes

This service will update the list of Device types which are used in the MOSIP platform.

#### Resource URL

`PUT /devicetypes`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name           | Required | Description                      | Default Value | Example |
| -------------- | -------- | -------------------------------- | ------------- | ------- |
| devicetypecode | Yes      | Code of the device type          |               |         |
| devicename     | Yes      | Name of the device type          |               |         |
| description    | Yes      | Description of the device type   |               |         |
| languagecode   | Yes      | Language code of the device type |               |         |
| isactive       | Yes      | Is the device type active?       |               |         |

#### Example Request

```
{
  "id": "string",
  "metadata": {},
  "request": {
    "code": "1234",
    "description": "test123",
    "isActive": false,
    "langCode": "eng",
    "name": "test"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```

#### Example Response

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response":{
      "code": "1234",
      "langCode": "eng"
  }
}
```

**Response codes: 200 Ok**

#### Failure details

| Error Code  | Error Message                                     | Error Description               |
| ----------- | ------------------------------------------------- | ------------------------------- |
| KER-MSD-003 | Required Device Type detail Not Found             | Data Not Found                  |
| KER-MSD-054 | Error occurred while updating Device Type details | while updating Issue will occur |

### POST /devicetypes/search

This service is for the devices types search functionality. All the filter parameters are passed and the devices types are searched and the matching results are returned.

#### Resource URL

`POST /devicetypes/search`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name         | Required                                    | Description                                                                     | Default Value | Example |
| ------------ | ------------------------------------------- | ------------------------------------------------------------------------------- | ------------- | ------- |
| filters      | No                                          | Array of the filter applied. In case of "list" screen, this array will be empty | -NA-          |         |
| columnName   | No                                          | The column name in the JSON response                                            | -NA-          |         |
| type         | No                                          | The value have to be in \["contains","equals","startsWith","between"]           | -NA-          |         |
| value        | No                                          | Value or id selected in the filter by the end user                              | -NA-          |         |
| fromValue    | No                                          | If the type is "between", this field is the value of the fromName               | -NA-          |         |
| toValue      | No                                          | If the type is "between", this field is the value of the toName                 | -NA-          |         |
| languagecode | Yes                                         | Language code in Language code in ISO 639-2 format                              |               |         |
| sort         | No                                          | This is an array of the sort field and type                                     |               |         |
| sortfield    | The field on which the sort is applied      |                                                                                 | modifiedDate  |         |
| sorttype     | This should be either of \['ASC','DESC']    |                                                                                 | ASC           |         |
| pagination   | The pagination parameter object             |                                                                                 |               |         |
| pageStart    | This is the start index                     | 0                                                                               | 0             |         |
| pageFetch    | This is the amount of records to be fetched | 10                                                                              | 10            |         |

#### Filter Values

Please find the filter columns used in search \* name \* status

#### Example Request

```
{
  "id": "string",
  "metadata": {},
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string",
  "request": {
	"filters" : [
	  {
		"columnName": "",
		"type": "in",
		"value": "",
		"fromValue": "",
		"toValue": ""
	  }
	],
	"sort":[
	  {
		"sortfield":"string",
		"sorttype":"ASC"
	  }
	],
	"pagination":{
	  "pageStart":"number",
	  "pageFetch":"number"
	},
	"languageCode":""
  }
}
```

#### Example Response

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {
    "deviceTypes": [
      {
        "code": "string",
	"langCode": "string",
	"name": "string",
        "description": "string",
        "isActive": true
      }
    ],
	"fromRecord" : "number",
	"toRecord":"number",
	"totalRecord":"number"
  }
}
```

**Response codes: 200 Ok**

### POST /devicetypes/filtervalues

This service returns the filter values which are required in the dropdown entries of the filter screen.

#### Resource URL

`POST /devicetypes/filtervalues`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name         | Required | Description                                                                     | Default Value | Example |
| ------------ | -------- | ------------------------------------------------------------------------------- | ------------- | ------- |
| filters      | No       | Array of the filter applied. In case of "list" screen, this array will be empty | -NA-          |         |
| columnName   | No       | The column name in the JSON response                                            | -NA-          |         |
| type         | No       | The value have to be in \["unique","all"]                                       | unique        | unique  |
| languagecode | Yes      | Language code in Language code in ISO 639-2 format                              |               |         |

#### Example Request

```
{
  "id": "string",
  "metadata": {},
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
  "request": {
	"filters" : [
	  {
		"columnName": ""
		"type": "unique"
	  }
	],
	"languageCode": "string",
  }
}
```

#### Example Response

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {
  "filters": [
	{
	  "fieldID": "string",
	  "fieldValue": "string"
	}
   ]
 }
}
```

**Response codes: 200 Ok**

***

## Device Specifications

* [POST /devicespecifications](Device-APIs.md#post-devicespecifications)
* [PUT /devicespecifications](Device-APIs.md#put-devicespecifications)
* [DELETE /devicespecifications/{id}](Device-APIs.md#delete-devicespecifications-id)
* [GET /devicespecifications/{langcode}/{devicetypecode}](Device-APIs.md#get-devicespecifications-langcode-devicetypecode)
* [GET /devicespecifications/{lang\_code}](Device-APIs.md#get-devicespecifications-lang\_code)
* [POST /devicespecifications/search](Device-APIs.md#post-devicespecifications-search)
* [POST /devicespecifications/filtervalues](Device-APIs.md#post-devicespecifications-filtervalues)

### POST /devicespecifications

This service will create a Device Specification which are used in the MOSIP platform.

#### Resource URL

`https://mosip.io/v1/masterdata/devicespecifications`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name             | Required | Description                                                  | Default Value | Example |
| ---------------- | -------- | ------------------------------------------------------------ | ------------- | ------- |
| id               | Yes      | ID of the Device Specification                               |               |         |
| name             | Yes      | Name of the Device Specification                             |               |         |
| brand            | Yes      | Brand of the Device specification                            |               |         |
| model            | Yes      | Model of the Device specification                            |               |         |
| deviceTypeCode   | Yes      | device type code of the Device specification                 |               |         |
| minDriverversion | Yes      | Minimum driver version required for the Device specification |               |         |
| description      | Yes      | Description of the Device specification                      |               |         |
| langCode         | Yes      | Language of the Device specification                         |               |         |
| isActive         | Yes      | Is the Device Specification active                           |               |         |

#### Example Request

```
{
  "id": "string",
  "metadata": {},
  "request": {
    "brand": "string",
    "description": "string",
    "deviceTypeCode": "string",
    "id": "added",
    "isActive": true,
    "langCode": "string",
    "minDriverversion": "string",
    "model": "string",
    "name": "string"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```

#### Example Response

```
{
  "id": "string"
}
```

**Response codes: 200 Ok**

### PUT /devicespecifications

This service will update a Device Specification which are used in the MOSIP platform.

#### Resource URL

`PUT /devicespecifications`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name       | Required | Description                               | Default Value | Example |
| ---------- | -------- | ----------------------------------------- | ------------- | ------- |
| id         | Yes      | ID of the Device Specification            |               |         |
| lang\_code | Yes      | Language code of the Device Specification |               |         |

#### Example Request

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "requesttime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "request": {
    "brand": "string",
    "description": "string",
    "id": "string",
    "isActive": true,
    "langCode": "string",
    "deviceTypeCode": "string",
    "minDriverversion": "string",
    "model": "string",
    "name": "string"
  }
}
```

#### Example Response

```
{
  "id": "string"
}
```

**Response codes: 200 Ok**

### DELETE /devicespecifications/{id}

This service deletes a Device Specification from the Device Specifications master module.

#### Resource URL

`DELETE /devicespecifications/{id}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name | Required | Description                    | Default Value | Example |
| ---- | -------- | ------------------------------ | ------------- | ------- |
| id   | Yes      | ID of the Device Specification |               |         |

#### Example Response

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response":  {
          "id": "string"
   }
}
```

**Response codes: 200 Ok**

### GET /devicespecifications/{langcode}/{devicetypecode}

This service will provides the list of all Device Specifications for specified language code and device type code .

#### Resource URL

`GET /devicespecifications/{langcode}/{devicetypecode}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name       | Required | Description                                  | Default Value | Example |
| ---------- | -------- | -------------------------------------------- | ------------- | ------- |
| lang\_code | Yes      | Language code of the Device Specification    |               |         |
| dtyp\_code | Yes      | device type code of the Device specification |               |         |

#### Example Request

```
-NA-
```

#### Example Response

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response":   {
  "devicespecifications": [
    {
      "brand": "string",
      "description": "string",
      "deviceTypeCode": "string",
      "id": "string",
      "isActive": true,
      "langCode": "string",
      "minDriverversion": "string",
      "model": "string",
      "name": "string"
    }
  ]
}
}
```

**Response codes: 200 Ok**

### GET /devicespecifications/{lang\_code}

This service will provides the list of all Device Specifications in a specific language.

#### Resource URL

`GET /devicespecifications/{lang_code}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name       | Required | Description                               | Default Value | Example |
| ---------- | -------- | ----------------------------------------- | ------------- | ------- |
| lang\_code | Yes      | Language code of the Device Specification |               |         |

#### Example Request

```
-NA-
```

#### Example Response

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response" : {
  "devicespecifications": [
    {
      "brand": "string",
      "description": "string",
      "deviceTypeCode": "string",
      "id": "string",
      "isActive": true,
      "langCode": "string",
      "minDriverversion": "string",
      "model": "string",
      "name": "string"
    }
  ]
 }
}
```

**Response codes: 200 Ok**

#### Failure Response:

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": [{
      "errorCode": "string",
      "message": "string"
    }],
  "response" : null
}
```

**Response codes: 200 Ok**

#### Failure details

| Error Code  | Error Message                                               | Error Description                    |
| ----------- | ----------------------------------------------------------- | ------------------------------------ |
| KER-MSD-011 | Error occurred while fetching Device Specifications         | Fetch Issue                          |
| KER-MSD-054 | Error occurred while inserting Device Specification details | Insertion Issue                      |
| KER-MSD-012 | Device Specification not found                              | Data Not Found                       |
| KER-MSD-081 | Error occurred while updating Device Specification          | Update Issue                         |
| KER-MSD-082 | Error occurred while deleting Device Specification          | Deletion Issue                       |
| KER-MSD-121 | Cannot delete dependency found                              | Deletion Issue because of dependency |

### POST /devicespecifications/search

This service is for the devices specifications search functionality. All the filter parameters are passed and the device specifications are searched and the matching results are returned.

#### Resource URL

`POST /devicespecifications/search`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name         | Required                                    | Description                                                                     | Default Value | Example |
| ------------ | ------------------------------------------- | ------------------------------------------------------------------------------- | ------------- | ------- |
| filters      | No                                          | Array of the filter applied. In case of "list" screen, this array will be empty | -NA-          |         |
| columnName   | No                                          | The column name in the JSON response                                            | -NA-          |         |
| type         | No                                          | The value have to be in \["contains","equals","startsWith","between"]           | -NA-          |         |
| value        | No                                          | Value or id selected in the filter by the end user                              | -NA-          |         |
| fromValue    | No                                          | If the type is "between", this field is the value of the start range            | -NA-          |         |
| toValue      | No                                          | If the type is "between", this field is the value of the end range              | -NA-          |         |
| languagecode | Yes                                         | Language code in Language code in ISO 639-2 format                              |               |         |
| sort         | No                                          | This is an array of the sort field and type                                     |               |         |
| sortfield    | The field on which the sort is applied      |                                                                                 | modifiedDate  |         |
| sorttype     | This should be either of \['ASC','DESC']    |                                                                                 | ASC           |         |
| pagination   | The pagination parameter object             |                                                                                 |               |         |
| pageStart    | This is the start index                     | 0                                                                               | 0             |         |
| pageFetch    | This is the amount of records to be fetched | 10                                                                              | 10            |         |

#### Filter Values

Please find the filter columns used in search \* name \* isActive \* deviceTypeName

#### Example Request

```
{
  "id": "string",
  "metadata": {},
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string",
  "request": {
    "filters" : [
	  {
	    "columnName": "",
	    "type": "in",
	    "value": "", 
	    "fromValue": "",  
	    "toValue": ""
	  }
    ],
    "sort":[
	  {
	    "sortfield":"string",
	    "sorttype":"ASC"
	  }
    ],
    "pagination":{
	  "pageStart":"number",
	  "pageFetch":"number"
	},
	"languageCode":""	
  }
}
```

#### Example Response

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {
    "devicespecifications": [
      {
        "brand": "string",
        "description": "string",
        "deviceTypeCode": "string",
        "id": "string",
        "isActive": true,
        "langCode": "string",
        "minDriverversion": "string",
        "model": "string",
        "name": "string"
      }
    ],
	"fromRecord" : "number",
	"toRecord":"number",
	"totalRecord":"number"
  }
}
```

**Response codes: 200 Ok**

### POST /devicespecifications/filtervalues

This service returns the filter values which are required in the dropdown entries of the filter screen.

#### Resource URL

`POST /devicespecifications/filtervalues`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name         | Required | Description                                                                     | Default Value | Example |
| ------------ | -------- | ------------------------------------------------------------------------------- | ------------- | ------- |
| filters      | No       | Array of the filter applied. In case of "list" screen, this array will be empty | -NA-          |         |
| columnName   | No       | The column name in the JSON response                                            | -NA-          |         |
| type         | No       | The value have to be in \["unique","all"]                                       | unique        | unique  |
| languagecode | Yes      | Language code in Language code in ISO 639-2 format                              |               |         |

#### Example Request

```
{
  "id": "string",
  "metadata": {},
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
  "request": {
	"filters" : [
	  {
		"columnName": ""
		"type": "unique"
	  }
	],
	"languageCode": "string",
  }
}
```

#### Example Response

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {
  "filters": [
	{
		"fieldCode": "string",
		"fieldID": "string",
		"fieldValue": "string"
	}
   ]
 }
}
```

**Response codes: 200 Ok**
