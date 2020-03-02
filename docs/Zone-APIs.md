This section details about the service APIs for the Zones

# Zone Master API

* [GET /zones/hierarchy/{langCode}](#get-zoneshierarchylangcode)
* [GET /zones/leafs/{langCode}](#get-zonesleafslangcode)
* [GET /zones/zonename](#get-zoneszonename)


## GET /zones/hierarchy/{langCode}

This service will fetch the logged-in user zone hierarchy. 

### Resource URL
### `GET /zones/hierarchy/{langCode}`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
langCode | yes | user language code ||


### Example Response
```JSON
{
  "id": null,
  "version": null,
  "responsetime": "2019-11-18T06:04:39.194Z",
  "metadata": null,
  "response": [
    {
      "isActive": true,
      "createdBy": "superadmin",
      "createdDateTime": "2019-08-27T12:28:10.549Z",
      "updatedBy": null,
      "updatedDateTime": null,
      "isDeleted": null,
      "deletedDateTime": null,
      "code": "STT",
      "langCode": "eng",
      "name": "Settat",
      "hierarchyLevel": 3,
      "hierarchyName": "Province",
      "parentZoneCode": "CST",
      "hierarchyPath": "MOR/NTH/CST/STT"
    }
  ],
  "errors": []
}
```
### Response codes

200

Description: Success

404

Description: Not Found

401

Description: Unauthorized

403

Description: Forbidden

-----

## GET /zones/leafs/{langCode}

This service will fetch the logged-in user zone hierarchy leaf zones. 

### Resource URL
### `GET /zones/leafs/{langCode}`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
langCode | yes | user language code ||


### Example Response
```JSON
{
  "id": null,
  "version": null,
  "responsetime": "2019-11-18T06:09:15.321Z",
  "metadata": null,
  "response": [
    {
      "isActive": true,
      "createdBy": "superadmin",
      "createdDateTime": "2019-08-27T12:28:10.549Z",
      "updatedBy": null,
      "updatedDateTime": null,
      "isDeleted": null,
      "deletedDateTime": null,
      "code": "BSN",
      "langCode": "eng",
      "name": "Benslimane",
      "hierarchyLevel": 3,
      "hierarchyName": "Province",
      "parentZoneCode": "CST",
      "hierarchyPath": "MOR/NTH/CST/BSN"
    }
  ],
  "errors": []
}
```
### Response codes

200

Description: Success

404

Description: Not Found

401

Description: Unauthorized

403

Description: Forbidden

-----

## GET /zones/zonename

This service will fetch the logged-in user zone hierarchy leaf zones. 

### Resource URL
### `GET /zones/zonename`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
langCode | yes | user language code ||
userID | yes | user id ||


### Example Response
```JSON
{
  "id": null,
  "version": null,
  "responsetime": "2019-11-18T06:22:22.475Z",
  "metadata": null,
  "response": {
    "zoneName": "Casablanca-Settat"
  },
  "errors": []
}
```
### Response codes

200

Description: Success

404

Description: Not Found

401

Description: Unauthorized

403

Description: Forbidden

-----

## Failure details
Error Code | Error Message | Error Description
------------|------------------------------|-------------
KER-MSD-337 | Error occured while fetching zone | Fetch Issue
KER-MSD-339 | No zone found for the logged-in user | Data Not Found
KER-MSD-338 | Error Occured while fetching zone of the user | Fetch Issue
KER-MSD-391 | Entity for user ID specified Not Found | Data Not Found
KER-MSD-392 | Entity for Zone Code of user ID specified Not Found | Data Not Found
KER-MSD-393 | Internal Server Error | Dependency issue