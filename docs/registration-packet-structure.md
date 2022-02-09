# Registration Packet Structure

## Overview
A registration packet is a zipped, [encrypted](data-protection.md#registration-data-flow) file containing ID information and meta data of an individual.

## Zipped packet
A registration packet is an [encrypted](data-protection.md#registration-data-flow), zipped file containing ID information and meta data of an individual.

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
* `_evident.json`:
* `_evident.zip`:
* `_id.json`:
* `_id.zip`:
* `_optional.json`:
* `optiona.zip`:

## Unzipped components
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

