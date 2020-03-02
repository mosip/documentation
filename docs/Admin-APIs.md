* [PacketStatus Services](#packet-status-services)

# Packet Status Services

* [GET /packetstatusupdate](#get-packetstatusupdate)

### GET /packetstatusupdate

The user can get status of the uin

#### Resource URL
<div>https://mosip.io/v1/admin/packetstatusupdate?rid={rid}</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Part Parameters
Name | Required | Description |  Example
-----|----------|-------------|--------
rid |Yes|rid of the user| 10008100670000220191226111423

#### Request
<div>https://mosip.io/v1/admin/packetstatusupdate?rid=10008100670000220191226111423</div>

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: returns status of rid
```JSON

{
    "id": null,
    "version": null,
    "responsetime": "2020-01-01T06:09:33.371Z",
    "metadata": null,
    "response": {
        "packetStatusUpdateList": [
            {
                "id": "aa712099-e033-4806-be73-b0532653fb0e",
                "registrationId": "10008100670000220191226111423",
                "transactionTypeCode": "PACKET_RECEIVER",
                "parentTransactionId": null,
                "statusCode": "SUCCESS",
                "statusComment": "Packet has reached Packet Receiver",
                "createdDateTimes": "2019-12-26T11:14:32.804"
            },
            {
                "id": "d2b1f7b8-212d-467d-aa8c-383979efe69a",
                "registrationId": "10008100670000220191226111423",
                "transactionTypeCode": "PACKET_RECEIVER",
                "parentTransactionId": "aa712099-e033-4806-be73-b0532653fb0e",
                "statusCode": "SUCCESS",
                "statusComment": "Packet is Uploaded to Landing Zone",
                "createdDateTimes": "2019-12-26T11:14:36.109"
            },
            {
                "id": "e316d39e-e5cd-4162-85fe-c4b37b24caea",
                "registrationId": "10008100670000220191226111423",
                "transactionTypeCode": "UPLOAD_PACKET",
                "parentTransactionId": "d2b1f7b8-212d-467d-aa8c-383979efe69a",
                "statusCode": "SUCCESS",
                "statusComment": "Packet uploaded to Packet Store",
                "createdDateTimes": "2019-12-26T11:14:44.654"
            },
            {
                "id": "8fb33f4f-4bc7-4b8c-ba94-b6737e12c6df",
                "registrationId": "10008100670000220191226111423",
                "transactionTypeCode": "PRINT_SERVICE",
                "parentTransactionId": "e316d39e-e5cd-4162-85fe-c4b37b24caea",
                "statusCode": "PROCESSED",
                "statusComment": "PDF is added to Queue for Printing",
                "createdDateTimes": "2019-12-26T11:14:58.05"
            },
            {
                "id": "906a8c71-3e5c-43dd-af4e-bf0105a935fe",
                "registrationId": "10008100670000220191226111423",
                "transactionTypeCode": "PRINT_POSTAL_SERVICE",
                "parentTransactionId": "e316d39e-e5cd-4162-85fe-c4b37b24caea",
                "statusCode": "PROCESSED",
                "statusComment": "Printing and Post Completed",
                "createdDateTimes": "2019-12-26T11:14:58.188"
            }
        ]
    },
    "errors": null
}
```
### Response codes

200 Ok

##### Error Response:
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
Error Code  | Error Message | Error Description
-----|----------|-------------
ADM-PKT-001|Admin is not authorized|
ADM-PKT-002 |RID is invalid|If RID is invalid
ADM-PKT-003 |Center does not exist|If Center ID extracted from RID does not exist
ADM-PKT-004 |RID is miss|If RID is missing in the Input
ADM-PKT-005 |Error occurred while fetch Packet Status|If any system error occurs while fetching Packet Status