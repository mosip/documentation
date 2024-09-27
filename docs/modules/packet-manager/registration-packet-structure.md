# Registration Packet Structure

## Overview

A registration packet is a zipped, [encrypted](../../privacy-and-security/data-protection.md#registration-data-flow) file containing ID information of an individual. It contains meta information about operator/supervisor, registration center, machine, devices etc.

## Zipped packet

Example zipped file:

`10001100771006920220128223618-10001_10077-20220128223618.zip`

Naming convention: `appid-refid_timestamp.zip`

* [appid](../../id-lifecycle-management/identifiers.md#rid-appid)
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

* `*_id.zip`: Applicant demographic/biometric/document fields which are marked as "pvt" or "kyc" or "none" in [ID Schema](../../id-lifecycle-management/id-schema.md).
* `*_id.json`: Meta information (process, encrypted hash, signature, schema version etc.) for `*_id.zip` file.
* `*_evidence.zip`: Applicant's demographic/biometric/document fields which are marked as "evidence" or "none" in [ID Schema](../../id-lifecycle-management/id-schema.md).
* `*_evidence.json`: Meta information (process, encrypted hash, signature, schema version etc.) for `*_evidence.zip` file.
* `*_optional.zip`: Applicant demographic/biometric/document fields which are marked as "optional" or "none" [ID Schema](../../id-lifecycle-management/id-schema.md).
* `*_optional.json`: Meta information (process, encrypted hash, signature, schema version etc.) for `*_optional.zip` file.

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

## Sample packet

See [sample packet](https://github.com/mosip/documentation/tree/1.2.0/docs/\_files/packet-structure).
