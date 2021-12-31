# Overview

**ID Schema** describes the attributes that a country or entity will capture from an individual. MOSIP recommends collecting minimal data from the residents. However, there may be variations in the attributes that a country would want to collect from the residents. The ID Schema is flexible to accommodate such variations. 

Defining this schema becomes the fundamental step while using MOSIP. Once defined, all applications built on top of MOSIP platform must conform to the same.

The default schema used with MOSIP Sandbox installation is available [here](https://github.com/mosip/mosip-infra/blob/1.2.0-rc2deployment/v3/mosip/kernel/masterdata/samples/idschema.json).
Along with it, you will also find a guide to customize ID Schema for a country’s specific attributes.

ID schema is loaded as a part of master data to `identity_schema` table in `mosip_masterdata` DB.
