# ABIS API

This document defines the APIs specifications for various operations that ABIS can perform to integrate with MOSIP.

API specification version: **0.9**

Published Date: February 05, 2021

## Revision Note

| Publish Date      | Revision                                                                                                                                                                                                                                     |
| ----------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| May 07, 2020      | This is the first formal publication of the interface as a version-ed specification. Earlier draft are superseded by this document. The interface is revamped to make it friendlier to programmers and also has a new method for conversion. |
| June 09, 2020     | A note related to targetFPIR was added.                                                                                                                                                                                                      |
| June 26, 2020     | New [failure reason](abis-api.md#failure-reasons) (code - 6, 8, 9, 10, 11, 12) for ABIS have been added.                                                                                                                                     |
| August 04, 2020   | Analytics section has been added to the overall response for Identify and the [failure reason](abis-api.md#failure-reasons) have been updated.                                                                                               |
| November 19, 2020 | Note on encryption of biometric data share using referenceURL has been added.                                                                                                                                                                |
| February 05, 2021 | Note on [referenceURL](abis-api.md#reference-url) and [authentication token](abis-api.md#authentication-token) was added for Insert Request.                                                                                                 |
| March 23, 2021    | New [failure reason](abis-api.md#failure-reasons) (code - 17) for ABIS has been added.                                                                                                                                                       |
| May 3, 2021       | The logic for encryption has been updated for ABIS Datashare URL.                                                                                                                                                                            |
| September 8, 2021 | All possible error codes for DataShare URL has been added.                                                                                                                                                                                   |

## Introduction

An ABIS system that integrates with MOSIP should support the following operations.

* [Insert](abis-api.md#insert)
* [Identify](abis-api.md#identify)
* [Delete](abis-api.md#delete)
* [Ping](abis-api.md#ping)
* [Pending Jobs](abis-api.md#pending-jobs)
* [Reference Count](abis-api.md#reference-count)

{% hint style="info" %}
All ABIS operations are via. a message queue and are asynchronous. The data sent in ABIS can be byte array or text based on a configuration in the registration processor.
{% endhint %}

## Parameters

### Common Parameters

Common parameters used for all ABIS operations:

| Name          | Description                                                                                                                   | Restrictions                                                         | Type      |
| ------------- | ----------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------- | --------- |
| requestID     | ID that is associated with each request sent to ABIS                                                                          | ABIS should not use this ID in any other context outside the request | UUID      |
| referenceID   | ID of a single registration record. Registration record is maintained in MOSIP. This ID is the mapping between MOSIP and ABIS | None                                                                 | UUID      |
| referenceURL  | URL to the biometrics data stored in MOSIP. This URL will have read only access                                               | None                                                                 | HTTPS URL |
| biometricType | Type of biometric data sent in the request                                                                                    | FID/FIR/IIR                                                          | String    |
| returnValue   | Code for response                                                                                                             | [Standard Return Codes](abis-api.md#standard-return-codes)           | String    |
| failureReason | Code for failure reason                                                                                                       | [Failure Reasons](abis-api.md#failure-reasons)                       | String    |

### Standard Return Codes

| Code | Status  |
| ---- | ------- |
| 1    | Success |
| 2    | Failed  |

### Failure Reasons

| Code | Reason                                                  |
| ---- | ------------------------------------------------------- |
| 1    | internal error - Unknown                                |
| 2    | aborted                                                 |
| 3    | unexpected error                                        |
| 4    | unable to serve the request - invalid request structure |
| 5    | missing referenceId (in request body)                   |
| 6    | missing requestId (in request body)                     |
| 7    | unable to fetch biometric details (using referenceURL)  |
| 8    | missing reference URL (in request body)                 |
| 9    | missing requesttime (in request body)                   |
| 10   | referenceId already exists (in ABIS)                    |
| 11   | CBEFF has no data                                       |
| 12   | referenceId not found (in ABIS)                         |
| 13   | invalid version                                         |
| 14   | invalid id                                              |
| 15   | invalid requesttime format                              |
| 16   | invalid CBEFF format                                    |
| 17   | data share URL has expired                              |
| 18   | Biometric Quality check failed                          |

## ABIS Operations

The following operations are supported by MOSIP:

* [Insert](abis-api.md#insert)
* [Identify](abis-api.md#identify)
* [Delete](abis-api.md#delete)
* [Ping](abis-api.md#ping)
* [Pending Jobs](abis-api.md#pending-jobs)
* [Reference Count](abis-api.md#reference-count)

### Insert

* ABIS must get biometric data from referenceURL, process it and store it locally within the ABIS reference database. More details about the referenceURL is mentioned in our [referenceURL section](abis-api.md#reference-url).
* referenceId must not be active prior to this operation i.e., it must not have been used before this operation.
* De-duplication must not be performed in this operation.
* MOSIP will provide biometric data in CBEFF format to ABIS as a response of referenceURL and the data will be encrypted and encoded as mentioned below.

#### Request and Response Structure for Insert

**Insert Request**

```
{
  "id": "mosip.abis.insert",
  "version": "1.1",
  "requestId": "91234567-89AB-CDEF-0123-456789ABCDEF",
  "requesttime": "2020-03-29T07:01:24.692Z",
  "referenceId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "referenceURL": "https://{base_url}/v1/datashare/get/mpolicy-default-abis/mpartner-default-abis/mpartner-default-abismpolicy-default-abis20210205062412BlQo0rJB"
}
```

**Success Response**

```
{
  "id": "mosip.abis.insert",
  "requestId": "91234567-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2020-03-29T07:01:24.692Z",
  "returnValue": "1"
}
```

**Failure Response**

```
{
  "id": "mosip.abis.insert",
  "requestId": "91234567-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2020-03-29T07:01:24.692Z",
  "returnValue": "2",
  "failureReason": "7"
}
```

#### Reference URL

The reference URL is MOSIP's datashare URL which is generated based on a policy defined by MOISP's adopter.

* The referenceURL is authenticated and authorized; ABIS needs to send a JWT token inside the request header COOKIE.
* The referenceURL will be active for a certain time as decided by the MOSIP adopter.
* The data sent in the referenceURL will be encrypted.

**Authentication Token**

As mentioned above in order to access the request URL the ABIS system needs to send a JWT token inside the request header COOKIE. In order to get the token ABIS needs to call MOSIP's AuthN & AuthZ API with Client ID & Secret Key by passing the credentials (clientid, secretkey and appid) which would be provided by the System Integrator (SI).

Below are the sample API details for getting the authentication token. More details about the API are available in our [AuthN & AuthZ document](https://docs.mosip.io/1.1.5/apis/authn-and-authz-apis).

**Sample Request URL**

`POST https://{base_url}/v1/authmanager/authenticate/clientidsecretkey`

**Sample Request Body**

```
{
  "id": "string",
  "metadata": {},
  "request": {
    "appId": "regproc",
    "clientId": "mosip-regproc-client",
    "secretKey": "abc123"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```

**Sample Response**

```
Response Cookie:

Set-Cookie 
authorization: eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJyanpjdUZPTmpBLWZRRDZYVVpYeFlldk5UZWtYcnZKVXN1RG5TeHJjZ0tZIn0.eyJqdGkiOiI2Yzg0ZDMyNi04NjZhLTRmZTQtOGJiMy02NGY0YWVjNmZiZDAiLCJleHAiOjE2MDk5NDg3NTAsIm5iZiI6MCwiaWF0IjoxNjA5OTEyNzUwLCJpc3MiOiJodHRwczovL3FhMi5tb3NpcC5uZXQva2V5Y2xvYWsvYXV0aC9yZWFsbXMvbW9zaXAiLCJhdWQiOiJhY2NvdW50Iiwic3ViIjoiODdmMDU3NjQtNzg5ZC00ZTZiLTljMWUtYzU2YmJkYzI5NTYzIiwidHlwIjoiQmVhcmVyIiwiYXpwIjoibW9zaXAtYWJpcy1jbGllbnQiLCJhdXRoX3RpbWUiOjAsInNlc3Npb25fc3RhdGUiOiJiNjZjMjBiMy03OTY1LTQ0ZDUtODg3Ny00Zjk2MDNlNzI5OTEiLCJhY3IiOiIxIiwiYWxsb3dlZC1vcmlnaW5zIjpbImh0dHBzOi8vcWEyLm1vc2lwLm5ldCJdLCJyZWFsbV9hY2Nlc3MiOnsicm9sZXMiOlsib2ZmbGluZV9hY2Nlc3MiLCJ1bWFfYXV0aG9yaXphdGlvbiJdfSwicmVzb3VyY2VfYWNjZXNzIjp7Im1vc2lwLWFiaXMtY2xpZW50Ijp7InJvbGVzIjpbInVtYV9wcm90ZWN0aW9uIl19LCJhY2NvdW50Ijp7InJvbGVzIjpbIm1hbmFnZS1hY2NvdW50IiwibWFuYWdlLWFjY291bnQtbGlua3MiLCJ2aWV3LXByb2ZpbGUiXX19LCJzY29wZSI6ImVtYWlsIHByb2ZpbGUiLCJjbGllbnRJZCI6Im1vc2lwLWFiaXMtY2xpZW50IiwiY2xpZW50SG9zdCI6IjEwLjI0NC4zLjM1IiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJzZXJ2aWNlLWFjY291bnQtbW9zaXAtYWJpcy1jbGllbnQiLCJjbGllbnRBZGRyZXNzIjoiMTAuMjQ0LjMuMzUifQ.ntez3ZkbDsjWi467JVj9d3kfktbUc7e6zQhHv0bVJfmiQA0N1QGyXAiZdqZrHj3cgFo0Lft54jgEtCGZZAma8nAw9IDICet9TA2A_u5hZ3oAq6HwYMS1pWb43jx5K9RRr_Yc-hdNnma754KzHhJgU1A7e_y0m88MT_oohHpRQ16jItEfC0AUQUvOAsxPwn-mmhu4uFFEq9e05ftBDIEBr24t-8feWN92uCJVMrSYHHjFL2ayg03I4Zkw1IupfLa-HACIlIToUmAk00aPxLtyWMFpOHVcLKBS2i9gEeqCEiUzklwuEp0B4aCqk5_M-Ng2X6VcGsCUJ8ACWRG4lCQQYA
```

```
{
  "id": "string",
  "version": "string",
  "responsetime": "2021-02-05T06:31:36.885Z",
  "metadata": null,
  "response": {
    "status": "Success",
    "message": "Clientid and Token combination had been validated successfully"
  },
  "errors": null
}
```

**DataShare URL**

Below is the sample API detail for reference URL.

**Sample Request URL**

`GET https://{base_url}/v1/datashare/get/mpolicy-default-abis/mpartner-default-abis/mpartner-default-abismpolicy-default-abis20210205062412BlQo0rJB`

**Sample Encrypted Response**

**The structure of the encrypted data downloaded from referenceURL in MOSIP 1.2.0 or later versions**

The data downloaded would be URL-safe base64 encoded. Hence, after decoding the data will be in the below format. It will be divided into two Parts after splitting using #KEY\_SPLITTER#.

| Encrypted Key Data | KEY\_SPLITTER   | Encrypted Actual Data |
| ------------------ | --------------- | --------------------- |
| Block 1            | #KEY\_SPLITTER# | Block 2               |

{% hint style="info" %}
**Block 1:**

Block 1, i.e. the encrypted key data is again split into three parts,

* The 1st part is _**VER\_BYTES**_ (version bytes). The Current version constant is set as VER\_R2 and this is present in the first 6 bytes of Block 1.
* The 2nd part is the _**Certificate Thumbprint**_ i.e. the key identifier which is present in the next 32 bytes after VER\_BYTES.
* The 3rd part is the _**Encrypted Random AES Key**_, encrypted with the RSA OAEP - SHA256-MFG1. This constitutes the remaining 256 bytes of Block 1.

**Block 2:**

Block 2, i.e. the encrypted actual data is again split into two parts,

* The 1st part is the random 32 bytes which will be used as _**AAD**_ in AES encryption(first 32 bytes). From this 32 bytes AAD data, the first 12 bytes is _**IV/Nonce**_.
* The 2nd part is the encrypted data which is encrypted using AES GCM PKCS5Padding.

_**Note**_: In Java 11, `PKCS5Padding` serves as a synonym for `NoPadding` in GCM mode encryption. Conversely, in Java 17, the synonym PKCS5Padding has been eliminated, and it is now mandatory to exclusively use NoPadding. Consequently, if data is encrypted using PKCS5Padding in Java 11, it will be decrypted with NoPadding in Java 17.
{% endhint %}

**The structure of the encrypted data downloaded from referenceURL in MOSIP 1.1.5.5 or prior versions**

The data downloaded would be base64 encoded. Hence, after decoding the data will be in the below format. It will be divided into two Parts after splitting using #KEY\_SPLITTER#.

| Encrypted Key Data | KEY\_SPLITTER   | Encrypted Actual Data |
| ------------------ | --------------- | --------------------- |
| Block 1            | #KEY\_SPLITTER# | Block 2               |

{% hint style="info" %}
**Block 1:**

Block 1, i.e. the encrypted key data is again split into two parts,

* The first part is the _**Certificate Thumbprint**_ i.e. the key identifier which is the first 32 bytes in Block 1.
* The second part is the _**Encrypted Random AES Key**_ which is encrypted with RSA OAEP - SHA256-MFG1. This constitutes the remaining 256 bytes of Block 1.

**Block 2:**

Block 2, i.e. the encrypted actual data is again split into two parts,

* The 1st part is the _**Encrypted data**_, encrypted using AES GCM PKCS5Padding.
* The 2nd part is _**IV/Nonce**_ i.e. the last 32 bytes appended after encrypted data.

_**Note**_: In Java 11, `PKCS5Padding` serves as a synonym for `NoPadding` in GCM mode encryption. Conversely, in Java 17, the synonym PKCS5Padding has been eliminated, and it is now mandatory to exclusively use NoPadding. Consequently, if data is encrypted using PKCS5Padding in Java 11, it will be decrypted with NoPadding in Java 17.
{% endhint %}

**Sample Response after Decryption**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<BIR xmlns="http://standards.iso.org/iso-iec/19785/-3/ed-2/">
    <BIRInfo>
        <Integrity>false</Integrity>
    </BIRInfo>
    <!-- right index finger -->
    <BIR>
        <Version>
            <Major>1</Major>
            <Minor>1</Minor>
        </Version>
        <CBEFFVersion>
            <Major>1</Major>
            <Minor>1</Minor>
        </CBEFFVersion>
        <BIRInfo>
            <Integrity>false</Integrity>
        </BIRInfo>
        <BDBInfo>
            <Format>
                <Organization>Mosip</Organization>
                <Type>7</Type>
            </Format>
            <CreationDate>2019-06-27T13:40:06.209Z</CreationDate>
            <Type>Finger</Type>
            <Subtype>Right IndexFinger</Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>100</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSAD...</BDB>
    </BIR>
    <!-- right middle finger -->
    <BIR>
        <Version>
            <Major>1</Major>
            <Minor>1</Minor>
        </Version>
        <CBEFFVersion>
            <Major>1</Major>
            <Minor>1</Minor>
        </CBEFFVersion>
        <BIRInfo>
            <Integrity>false</Integrity>
        </BIRInfo>
        <BDBInfo>
            <Format>
                <Organization>Mosip</Organization>
                <Type>7</Type>
            </Format>
            <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
            <Type>Finger</Type>
            <Subtype>Right MiddleFinger</Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>100</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSAD...</BDB>
    </BIR>
    <!-- right ring finger -->
    <BIR>
        <Version>
            <Major>1</Major>
            <Minor>1</Minor>
        </Version>
        <CBEFFVersion>
            <Major>1</Major>
            <Minor>1</Minor>
        </CBEFFVersion>
        <BIRInfo>
            <Integrity>false</Integrity>
        </BIRInfo>
        <BDBInfo>
            <Format>
                <Organization>Mosip</Organization>
                <Type>7</Type>
            </Format>
            <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
            <Type>Finger</Type>
            <Subtype>Right RingFinger</Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>100</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSAD...</BDB>
    </BIR>
    <!-- right little finger -->
    <BIR>
        <Version>
            <Major>1</Major>
            <Minor>1</Minor>
        </Version>
        <CBEFFVersion>
            <Major>1</Major>
            <Minor>1</Minor>
        </CBEFFVersion>
        <BIRInfo>
            <Integrity>false</Integrity>
        </BIRInfo>
        <BDBInfo>
            <Format>
                <Organization>Mosip</Organization>
                <Type>7</Type>
            </Format>
            <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
            <Type>Finger</Type>
            <Subtype>Right LittleFinger</Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>100</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSAD...</BDB>
    </BIR>
    <!-- left index finger -->
    <BIR>
        <Version>
            <Major>1</Major>
            <Minor>1</Minor>
        </Version>
        <CBEFFVersion>
            <Major>1</Major>
            <Minor>1</Minor>
        </CBEFFVersion>
        <BIRInfo>
            <Integrity>false</Integrity>
        </BIRInfo>
        <BDBInfo>
            <Format>
                <Organization>Mosip</Organization>
                <Type>7</Type>
            </Format>
            <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
            <Type>Finger</Type>
            <Subtype>Left IndexFinger</Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>100</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSAD...</BDB>
    </BIR>
    <!-- left middle finger -->
    <BIR>
        <Version>
            <Major>1</Major>
            <Minor>1</Minor>
        </Version>
        <CBEFFVersion>
            <Major>1</Major>
            <Minor>1</Minor>
        </CBEFFVersion>
        <BIRInfo>
            <Integrity>false</Integrity>
        </BIRInfo>
        <BDBInfo>
            <Format>
                <Organization>Mosip</Organization>
                <Type>7</Type>
            </Format>
            <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
            <Type>Finger</Type>
            <Subtype>Left MiddleFinger</Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>100</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSAD...</BDB>
    </BIR>
    <!-- left ring finger -->
    <BIR>
        <Version>
            <Major>1</Major>
            <Minor>1</Minor>
        </Version>
        <CBEFFVersion>
            <Major>1</Major>
            <Minor>1</Minor>
        </CBEFFVersion>
        <BIRInfo>
            <Integrity>false</Integrity>
        </BIRInfo>
        <BDBInfo>
            <Format>
                <Organization>Mosip</Organization>
                <Type>7</Type>
            </Format>
            <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
            <Type>Finger</Type>
            <Subtype>Left RingFinger</Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>100</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSAD...</BDB>
    </BIR>
    <!-- left little finger -->
    <BIR>
        <Version>
            <Major>1</Major>
            <Minor>1</Minor>
        </Version>
        <CBEFFVersion>
            <Major>1</Major>
            <Minor>1</Minor>
        </CBEFFVersion>
        <BIRInfo>
            <Integrity>false</Integrity>
        </BIRInfo>
        <BDBInfo>
            <Format>
                <Organization>Mosip</Organization>
                <Type>7</Type>
            </Format>
            <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
            <Type>Finger</Type>
            <Subtype>Left LittleFinger</Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>100</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSAD...</BDB>
    </BIR>
    <!-- right thumb finger -->
    <BIR>
        <Version>
            <Major>1</Major>
            <Minor>1</Minor>
        </Version>
        <CBEFFVersion>
            <Major>1</Major>
            <Minor>1</Minor>
        </CBEFFVersion>
        <BIRInfo>
            <Integrity>false</Integrity>
        </BIRInfo>
        <BDBInfo>
            <Format>
                <Organization>Mosip</Organization>
                <Type>7</Type>
            </Format>
            <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
            <Type>Finger</Type>
            <Subtype>Right Thumb</Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>100</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSAD...</BDB>
    </BIR>
    <!-- left thumb finger -->
    <BIR>
        <Version>
            <Major>1</Major>
            <Minor>1</Minor>
        </Version>
        <CBEFFVersion>
            <Major>1</Major>
            <Minor>1</Minor>
        </CBEFFVersion>
        <BIRInfo>
            <Integrity>false</Integrity>
        </BIRInfo>
        <BDBInfo>
            <Format>
                <Organization>Mosip</Organization>
                <Type>7</Type>
            </Format>
            <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
            <Type>Finger</Type>
            <Subtype>Left Thumb</Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>100</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSAD...</BDB>
    </BIR>
    <!-- face -->
    <BIR>
        <Version>
            <Major>1</Major>
            <Minor>1</Minor>
        </Version>
        <CBEFFVersion>
            <Major>1</Major>
            <Minor>1</Minor>
        </CBEFFVersion>
        <BIRInfo>
            <Integrity>false</Integrity>
        </BIRInfo>
        <BDBInfo>
            <Format>
                <Organization>Mosip</Organization>
                <Type>8</Type>
            </Format>
            <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
            <Type>Face</Type>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>100</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSAD...</BDB>
    </BIR>
    <!-- right iris -->
    <BIR>
        <Version>
            <Major>1</Major>
            <Minor>1</Minor>
        </Version>
        <CBEFFVersion>
            <Major>1</Major>
            <Minor>1</Minor>
        </CBEFFVersion>
        <BIRInfo>
            <Integrity>false</Integrity>
        </BIRInfo>
        <BDBInfo>
            <Format>
                <Organization>Mosip</Organization>
                <Type>9</Type>
            </Format>
            <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
            <Type>Iris</Type>
            <Subtype>Right</Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>100</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSAD...</BDB>
    </BIR>
    <!-- left iris -->
    <BIR>
        <Version>
            <Major>1</Major>
            <Minor>1</Minor>
        </Version>
        <CBEFFVersion>
            <Major>1</Major>
            <Minor>1</Minor>
        </CBEFFVersion>
        <BIRInfo>
            <Integrity>false</Integrity>
        </BIRInfo>
        <BDBInfo>
            <Format>
                <Organization>Mosip</Organization>
                <Type>9</Type>
            </Format>
            <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
            <Type>Iris</Type>
            <Subtype>Left</Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>100</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSAD...</BDB>
    </BIR>
</BIR>
```

**Sample Response in case of Authentication Failure**

```
{
  "id": null,
  "version": null,
  "responsetime": "2021-02-05T06:29:48.257Z",
  "metadata": null,
  "response": null,
  "errors": [
    {
      "errorCode": "KER-ATH-401",
      "message": "Authentication Failed"
    }
  ]
}
```

**All Possible Error codes and Messages from Datashare URL**

| Error Code  | Error Message                         |
| ----------- | ------------------------------------- |
| DAT-SER-003 | File does not exists or File is empty |
| DAT-SER-006 | Data share not found                  |
| DAT-SER-006 | Data share usage expired              |
| KER-ATH-401 | Authentication Failed                 |
| KER-ATH-403 | Forbidden                             |

{% hint style="info" %}
Please note that for all the functional failures MOSIP sends a response code 200.
{% endhint %}

### Identify

* All Insert requests added to the queue earlier must be serviced by ABIS when performing an Identify request.
* Identify request provides a 1:N comparison. The given input is compared either against the gallery passed or if the gallery is not specified the entire database.
* The input for comparison can be provided by referenceID or referenceURL.
  * If the referenceID is given it is used as the preferred option. The given referenceID must be existing in the ABIS database else ABIS will throw an error.
  * If the referenceID is omitted or NULL and the referenceURL is passed the ABIS retrieves the biometrics provided in the referenceURL and compares the same against either a gallery or its database.
  * If in case, both referenceID and referenceURL are missing ABIS throws an error.

{% hint style="info" %}
We are not using the referenceURL in Identify request for our current implementation. Hence, it will be an empty string for Identify request. MOSIP adopters can have customized workflows where the referenceURL can be used.
{% endhint %}

* Identify requests should give to all candidates which are considered as a match based on ABIS thresholds.
* This request should not match against referenceID that is not in the reference database.
* The response now has a section for analytics that contains key-value pairs. Values can be JSON objects also. The contents of the analytics section will be agreed upon by the MOSIP adopter with the ABIS provider. Scores are also moved to this section and are not mandatory response parameters anymore.
* Ordering or ranking of results is not explicitly specified and can be agreed upon between the MOSIP adopter and the ABIS provider.
* The flags section of the request can be used to customize or control ABIS behaviour by sending specific key-value pairs.
* "targetFPIR" or "maxResults" are examples of such flags that can alter ABIS behaviour. These are optional attributes for MOSIP during an identify request. MOSIP expects the adopters to define these parameters based on the accuracy expectations and workflow requirements. These can be set at the ABIS configuration level and need not be part of the individual request at all.

To give an example, please find the following calculation for targetFPIR - which is the error rate at which identification requests are expected to return a non-empty candidate list.

`round (-10 * log10 (target false positive identification rate))`

With this calculation:

| Target False Positive Identification Rate | targetFPIR |
| ----------------------------------------- | ---------- |
| 1 in 1,000                                | 30         |
| 1 in 10,000                               | 40         |
| 1 in 100,000                              | 50         |

#### Identify Request

```
{
  "id": "mosip.abis.identify",
  "version": "1.1",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "requesttime": "2020-03-29T07:01:24.692Z",
  "referenceId": "987654321-89AB-CDEF-0123-456789ABCDEF",
  "referenceURL": "",//will be an empty string, if not used
  "flags": { //optional
    //maxResults is an example and not a prescribed flag
	"maxResults": "10", 
	//targetFPIR is an example and not a prescribed flag
	"targetFPIR": "30",
    //there can be more following this	
	"flag1": "value1",
	"flag2": "value2" 
  },
  "gallery": {
    "referenceIds": [
      {
        "referenceId": "2abe7b7d-b58a-4466-a006-c79297281123"
      }, 
      {
        "referenceId": "7acce7b7d-b58a-4466-a006-c79297281456"
      }, 
      {
        "referenceId": "3bce7b7d-b58a-4466-a006-c79297281678"
      }, 
      {
        "referenceId": "5cce7b7d-b58a-4466-a006-c79297281098"
      }, 
      {
        "referenceId": "2cce7b7d-b58a-4466-a006-c79297281321"
      } 
    ]
  }
}
```

#### Success Response

```
{
  "id": "mosip.abis.identify",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2020-03-29T07:01:24.692Z",
  "returnValue": "1",
  "candidateList": {
    "count": "1",
    "candidates": [
      {
        "referenceId": "7acce7b7d-b58a-4466-a006-c79297281456",
        "analytics": {
		  //internalScore is an example and not prescribed
		  "internalScore": "112", 
		  //confidence is an example and not prescribed
          "confidence": "90",
		  //there can be more following this	
		  "key1": "value1",
		  "key2": "value2"
        },
		// modality wise analytics
        "modalities": [ 
          {
            "biometricType": "FIR",
            "analytics": {
			  "confidence": "90",
              "internalScore": "112",
			  "key1": "value1",
			  "key2": "value2"
            }
          },
		  {
            "biometricType": "IIR",
            "analytics": {
			  "confidence": "90",
              "internalScore": "112",
			  "key1": "value1",
			  "key2": "value2"
            }
          },
		  {
            "biometricType": "FID",
            "analytics": {
			  "confidence": "90",
              "internalScore": "112",
			  "key1": "value1",
			  "key2": "value2"
            }
          }
        ]
      }
    ]
    "analytics": {
      //This is an optional section
      //Data in this section can be agreed upon between the MOSIP adopter and the ABIS Provider
	}
  }
}
```

#### Failure Response

```
{
  "id": "mosip.id.identify",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2020-03-29T07:01:24.692Z",
  "returnValue": "2",
  "failureReason": "7"
}
```

### Delete

* Removes only the entry referred by the referenceId.
* This operation can be used to remove duplicates found by Identify.

#### Delete Request

```
{
  "id": "mosip.abis.delete",
  "version": "1.1",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "requesttime": "2020-03-29T07:01:24.692Z",
  "referenceId": "7acce7b7d-b58a-4466-a006-c79297281456"
}
```

#### Success response

```
{
  "id": "mosip.abis.delete",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2020-03-29T07:01:24.692Z",
  "returnValue": "1"
}
```

#### Failure response

```
{
  "id": "mosip.abis.delete",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2020-03-29T07:01:24.692Z",
  "returnValue": "2",
  "failureReason": "1"
}
```

### Ping

* A Ping request should respond with a response on the liveness of the ABIS system.

#### Ping Request

```
{
  "id": "mosip.abis.ping",
  "version": "1.1",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "requesttime": "2020-03-29T07:01:24.692Z",
}
```

#### Success response

```
{
  "id": "mosip.abis.ping",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2020-03-29T07:01:24.692Z",
  "returnValue": "1"
}
```

### Pending Jobs

* ABIS responds with the count of requests that are still pending.

#### Pending Jobs Request

```
{
  "id": "mosip.abis.pendingJobs",
  "version": "1.1",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "requesttime": "2020-03-29T07:01:24.692Z",
}
```

#### Success Response

```
{
  "id": "mosip.abis.pendingJobs",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2020-03-29T07:01:24.692Z",
  "jobscount": "10",
  "returnValue": "1"
}
```

### Reference Count

* ABIS will send a count of records in the reference database

#### Reference Count Request

```
{
  "id": "mosip.abis.referenceCount",
  "version": "1.1",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "requesttime": "2020-03-29T07:01:24.692Z",
}
```

#### Success Response

```
{
  "id": "mosip.abis.referenceCount",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2020-03-29T07:01:24.692Z",
  "count": "10",
  "returnValue": "1"
}
```

## References

* [Biometric Specification](https://docs.mosip.io/1.1.5/biometrics/mosip-device-service-specification) to know about the biometric specification in MOSIP.
* [CBEFF XML](https://docs.mosip.io/1.2.0/biometrics/cbeff-xml) to know how MOSIP stores biometric data.
* [Authentication and Authorization API](https://docs.mosip.io/1.1.5/apis/authn-and-authz-apis) to get the JWT token.
* [MOSIP's de-duplication process](https://docs.mosip.io/1.1.5/modules/registration-processor/deduplication-and-manual-adjudication) for details about the De-Duplication process in MOSIP.
