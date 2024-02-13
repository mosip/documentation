# Identifying Applicant Type

**Location**: [mosip-config](https://github.com/mosip/mosip-config) repository

Applicant-type MVEL script usages in MOSIP modules :

| **Module Name**     | **Before LTS** | **LTS** |
| ------------------- | -------------- | ------- |
| Pre-registration    | Yes            | Yes     |
| Registration Client | No             | No      |

This MVEL script is used to determine the type of applicant based on the captured demographic data during the registration process.

→ Set of rules to determine the type of applicant is written as an MVEL script.

→ Applicant Data required for the evaluation passed as “identity” map to the MVEL context.

→ def `getApplicantType()` method MUST be defined in the script. The string returned from this method should be a valid applicant type code or error code (KER-MSD-151, KER-MSD-147)

`applicant_type_code` - Must be one of the values in the apptyp\_code column in “master.applicant\_valid\_document" table.

```
INVALID_QUERY_EXCEPTION("KER-MSD-147", "Invalid query passed for applicant type"),	INVALID_DATE_DOB_EXCEED_EXCEPTION("KER-MSD-151", "DOB cannot exceed current date");
```

`"KER-MSD-147"` - returned when any of the demographics that are required for the script to return a code are empty (As per default script, it throws this exception if gender or residenceStatus or age is not filled / empty).

`"KER-MSD-151"` - returned when the DOB exceeds the current date.

→ Data in the “identity” map are key-value pairs. The Key is the field id in the id-schema.

→ For the fields which are based on dynamic field values. For Ex: gender

“identity” map will have 2 mappings, genderCode, and gender. where the

identity.genderCode = “FLE”

identity.gender = “Female”

→ Age group configuration is also passed in the MVEL context as below

`{ “ageGroups” : {'INFANT':'0-5','MINOR':'6-17','ADULT':'18-200'} }` and will be accessible as below in the script.

ageGroups.INFANT = “0-5”

ageGroups.MINOR = “6-17”

ageGroups.ADULT = “18-200”

Sample MVEL script is defined here https://github.com/mosip/mosip-config/blob/master/applicanttype.mvel

**Note**: In Pre-registration and Registration-Client, `applicant-type` code is used to control the list of documents to be collected during the registration process.

The `applicant_type_code` returned from this mvel script will be then used to fetch the required documents from `master.applicant_valid_document` table.

For example, if the script returns applicant\_type\_code as “001”, all those entries in the applicant\_valid\_document table with app\_typ\_code as “001” will be picked and shown in the respective document dropdowns.

Attaching the sample csv file below which lists down the required entries for `master.applicant_valid_document` table.

{% file src="../../.gitbook/assets/applicant_valid_document.xlsx" %}

We can upload this default data from Admin Portal through Bulk Upload feature.

The steps to be followed are mentioned below:

1. Login to Admin Portal.
2. Navigate to **Bulk Upload** → **Master Data**.
3. Select the **Insert** operation, select the table name (`ApplicantValidDocument`) from the dropdown and upload the csv file.
4. Click on **Upload**, which saves the uploaded data to the server DB.

Attaching screenshot for reference:

![](../../\_images/upgrade-application-mvel.png)
