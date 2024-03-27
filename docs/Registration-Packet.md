# Registration Packet

This document describes the registration packet structure and the packet encryption procedure.

## Registration Packet

Once a resident visits the registration center and provides their demographic & biometric details an encrypted zip file is created which is called a "Packet". This packet can only be decrypted by the registration processor using a private key available in the Kernel Key Manager.

The below diagram depicts the packet creation flow using the packet manager.

![](\_images/registration/packet\_creation\_using\_packet\_manager.png)

### Packet Structure

The packet is created using the Commons Packet Manager, which creates a packet in the below structure using the [ID Schema](MOSIP-ID-Object-Definition.md).

#### Encrypted ZIP File

![](\_images/registration/packet\_zip\_format.png)

The packet name here is also the request ID that is generated for a request created when a resident enrolls into MOSIP, requests for updating data or request for finding his/her lost id. The request ID is a 29 digit number derived from the Center ID (5 digits), Machine ID (5 digits), sequence number (5 digits), timestamp (14 digits).

#### Folder Structure

![](\_images/registration/mosip\_packet\_structure.png)

* **Container**: The container is the base folder in which the sub-packets are stored with their respective JSON files containing meta information.
* **Sub-Packets**: Inside the container we ideally have three packets named as ID Packet, Evidence Packet and Optional Packet. Data inside each packet is stored based on a property in ID Schema called "Field Category".
* **Packet JSON**: Each sub packet has a JSON file associated with it which contains the meta information of the respective sub-packet.

```
{
	"process": "NEW",
	"providerVersion": "v1.0",
	"schemaVersion": "0.0",
	"signature": "eyJhbGciOiJSUzI1NiJ9..adXTYgQe2_KLeretI2Qrp1BQNobqiZ4RpcMonxGdb6ZVL5eXX5-a2pVaspk69ujZ7W7z9wPTd54ogy8Mne6hTJeQ4f3OQiJ-MZwbf0mNr1PgeL14a7wHgzHOdR23gFZv6oEVL3IGGTA52SCIXAFJgrp7F4FRZ3nNcHCiP5FJtRMwKG9iGFiqHNii0ZGKOongWwibJihd5-xMW1VWWnxV-eDwVRE2S2W-KOrgOl5oiX5a0Uk4XeEMQ27l20Xvv60YiThUogKLZtwWTp3y2CxYF7X5qrZudjdewS0WVil4ePoTzqCZEi29BptlfJGCF1xaJywFS0nQxdOCnMsrM9SSsg",
	"encryptedHash": "��BC& �c!\u0016\u0019�(jZFh���\"\n}�r\u0018{���",
	"id": "10001100770000320200720092256",
	"source": "registration",
	"packetName": "10001100770000320200720092256_id",
	"creationDate": "2020-08-06T06:05:20.839Z",
	"providerName": "PacketWriterImpl"
}
```

* **ID Object**: Each packet has an ID JSON attached with it which has basic demographic data of the resident, document names that were uploaded, information about the introducers or guardians, biometrics file names (of applicant, introducer, guardians) and the version of the ID schema used. Data for each ID JSON is populated based on the ID Schema property, "Field Category".

{% hint style="info" %}
You can find the more about ID Object in our [**ID Object definition**](MOSIP-ID-Object-Definition.md) document.
{% endhint %}

* **Biometric Files**: The biometric data of the resident, officer, supervisor, intorducer or guardian is stored in respective [**CBEFF XML**](CBEFF-XML.md) and in respective folders as driven by ID schema.
* **Documents**: The documents uploaded by the resident during registration or pre-registration is stored in respective folders as driven by ID schema.
* **Packet Meta Information**: A bunch of meta data is generated during the registration process like the officer's or supervisor's id, machine details, device details, gps location, etc. which is stored in the Packet Meta Info file in JSON format.
* **Audit**: The audit trails created during packet creation is logged and sent to registration processor to be uploaded in the audit database for analytics.

{% hint style="info" %}
No PII (Personally Identifiable Information) data is captured in the audit logs.
{% endhint %}

* **Packet Hash**: During the packet creation a hash of the data being collected is stored in these files so that the data can be verified when the packet reaches the server. We have two types of hash file, Packet Data Hash file & Packet Operation Hash file.

## Packet Encryption Procedure

Before writing the packet into the local disk, the zipped content should be encrypted using Session and RSA public key (center specific) to secure the data. The same data can only be decrypted at server end where the private key is available.

* Session Key Encryption:
  * Session key generation is a randomly generated and sent to client as part of sync from server.
  * Pass the created Zip object \[in-memory] through the AES-256 bit encryption.
  * Pass the Random Session Key as a seed to this AES encryption.
  * Get the Registration Officer Id from user context object.
* RSA Public Key Encryption:
  * AES Session key bytes pass through the RSA public key encryption.
* Use the "#KEY\_SPLITTER#" as a key separator for the AES encrypted bytes and the RSA Public key encrypted Session key seed.
* Append the RSA Public key Encrypted Session Key, Key Separator to the AES encrypted bytes.
* Append the EO and machine information as a META-INFO JSON file and create another ZIP out of it. \[Packet Zip + META-INFO JSON]
* Save the encrypted data as a ZIP in local file system under the defined location in configuration file.
