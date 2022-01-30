# Masterdata Guide

## Overview
Masterdata is the necessary base data to run MOSIP services. The data resides in the [`mosip_master` DB](https://github.com/mosip/admin-services/tree/1.2.0-rc2/db_scripts/mosip_master). This data needs to be customized for a country specific deployment.  Masterdata is bulk uploaded one-time during the [installation process](https://github.com/mosip/mosip-infra/tree/1.2.0-rc2/deployment/v3/mosip/kernel/masterdata) and later may be updated using the [Admin Portal](admin-portal-guide.md). The default data uploaded during sandbox installation is available [here](https://github.com/mosip/mosip-data/tree/lts/mosip_master/xlsx). 

The tables that would need to be modified are listed below.  Other tables in `mosip_master` DB are either system-filled or pre-filled and not to be modified.

## Common guidelines
Applicable for all tables:

* Add/remove rows for the [configured languages](). 

|Category|Table|Guide|
|---||---|---|
|**Documents**|`doc_category`|Categories of documents to be captured|
||`doc_type`| Specific documents related to a country|
||`applicant_valid_document`|Mapping of document category, type and [applicant type](https://github.com/mosip/mosip-config/blob/develop3-v3/applicanttype.mvel)|
|**Location**|`loc_hierarchy_list`|List of location hierarchy|
||`location`|List of locations stored in a hierarchical format|
||`loc_holiday`|Holidays specific to different locations|
|**Machine**|`machine_type`|Type of registration machines|
||`machine_spec`|Specification of registration machine|
|**ID Schema**|`identity_schema`| Refer to [ID Schema customisation](id-schema.md). Update the JSON in `schema_json` column of [`identity_schema.xlsx`](https://github.com/mosip/mosip-data/tree/lts/mosip_master/xlsx/identity_schema.xlsx)|
||`ui_spec`|UI specification for registration and pre-registration UI screens. See [UI spec guides]()|
||`dynamic_field`|Dynamic dropdowns used during data capture|
|**Registration client**|`permitted_local_config`|List of changeable configurations by the operator|
||`reason_list`|List of reasons for a reason category|
|**Registration center**|`reg_center_type`|Type of center |
||`registration_center`|List of registration centers|
||`registration_center_h`|Historical data for any modification done on a registration center. One time intialization of this table identical to `registration_center`. Thereafter, the data will be system updated|
||`reg_exceptional_holiday`|Exception holiday for a registration center|
||`reg_working_nonworking`|Working and non-working day for a center|
|**Others**|`blocklisted_words`|List of blocked words|
||`title`|List of titles used in the country|
||`zone`|List of administrative zones in a country|

