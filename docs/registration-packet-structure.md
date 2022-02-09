# Registration Packet Structure

## Overview
A registration packet is a zipped, [encrypted](data-protection.md#registration-data-flow) file containing ID information of an individual. It contains meta information about operator/supervisor, registration center, machine, devices etc.  

## Zipped packet
Example zipped file:

`10001100771006920220128223618-10001_10077-20220128223618.zip`

Naming convention: `appid-refid_timestamp.zip` 
* [appid](identifiers.md#rid-appid)
* refid: `centerid_machineid`

## Unzipped packet
```
.
└── REGISTRATION_CLIENT
    └── NEW
        ├── 10001100771006920220128223618_evidence.json
        ├── 10001100771006920220128223618_evidence.zip
        ├── 10001100771006920220128223618_id.json
        ├── 10001100771006920220128223618_id.zip
        ├── 10001100771006920220128223618_optional.json
        └── 10001100771006920220128223618_optional.zip
```
* `_evidence.json`: It contains meta information(process, encryptedhash, signature, schemaversion etc) for "evidence.zip" file.
* `_evidence.zip`: It contains applicant demographic/biometric/document fields which are marked as "evidence" or "none" in identity schema.
* `_id.json`: It contains meta information(process, encryptedhash, signature, schemaversion etc) for "id.zip" file.
* `_id.zip`: It contains applicant demographic/biometric/document fields which are marked as "pvt" or "kyc" or "none" in identity schema.
* `_optional.json`: It contains meta information(process, encryptedhash, signature, schemaversion etc) for "optional.zip" file.
* `optional.zip`: It contains applicant demographic/biometric/document fields which are marked as "optional" or "none" in identity schema.

## Unzipped components
Note: this is a sample packet and doesnot mean a particular information will be always available in same packet. The fields are populated based on the fieldCategory set in schema json.
* Id 
```
id
├── ID.json
├── individualBiometrics_bio_CBEFF.xml
├── packet_data_hash.txt
├── packet_meta_info.json
├── packet_operations_hash.txt
├── proofOfAddress.pdf
├── proofOfIdentity.pdf
└── proofOfRelationship.pdf
```
* Evidence
```
evidence
├── ID.json
├── packet_data_hash.txt
├── packet_meta_info.json
├── packet_operations_hash.txt
└── proofOfException.pdf
```
* Optional
```
optional
├── ID.json
├── packet_data_hash.txt
├── packet_meta_info.json
└── packet_operations_hash.txt
```

See [this folder](https://github.com/mosip/documentation/tree/1.2.0-rc2/docs/_files/packet-structure) for contents of each of the above files.

