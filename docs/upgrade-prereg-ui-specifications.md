# Pre-Registration: Upgrading UI specifications from 1.1.5.x to 1.2.0

The Pre-Registration UI-spec file `pre-registration-demographic.json` was previously included in the mosip-config repository in version 1.1.5.*, but starting from version 1.2.0, it should be manually published using the master data UI-spec API.

### How to define and publish UI spec?

1. Go to Swagger `clientIdSecretKey` to get the Authentication token:
   
    ```
   {env_url}/v1/authmanager/swagger-ui/index.html?configUrl=/v1/authmanager/v3/api-docs/swagger-config#/authmanager/clientIdSecretKey

   "request": {
      "clientId": "mosip-reg-client",
      "secretKey": {secret_key},
      "appId": "admin"
    } 
   ```
    
3. Go to Swagger `defineUISpec` to define the new UI Specifications

  ```
  {env_url}/v1/masterdata/swagger-ui/index.html?configUrl=/v1/masterdata/v3/api-docs/swagger-config#/ui-spec-controller/defineUISpec"

  request": {
      "identitySchemaId": {id of latest identity schema},
      "domain": "pre-registration",
      "type": "schema",
      "title": "Pre-registration UI Specification",
      "description": "Pre-registration UI Specification",
      "jsonspec": {Add New UI Spec}
   }
```

4. Go to `publishUISpec` to Publish the newly defined UI Spec

```
  {env_url}/v1/masterdata/swagger-ui/index.html?configUrl=/v1/masterdata/v3/api-docs/swagger-config#/ui-spec-controller/publishUISpec

  get the id from the defineUISpec response and add it in request

  "request": {
      "id": "{}",
    "effectiveFrom": "2022-07-28T08:42:07.706Z"
    }  
  ```

4. Once done, check the `master.ui_spec` table.

### Changes in UI specifications:

The [Pre-registration UI Specifications](https://docs.mosip.io/1.2.0/modules/pre-registration/pre-registration-ui-specifications) document provides details about all UI spec attributes. This document can be referred to in order to identify the changes between versions 1.1.5 and 1.2.0.1.

The following new attributes have been added:

- subType (optional - for dynamic dropdowns)
- transliteration (mandatory to enable transliteration)
- locationHierarchyLevel (mandatory to be added in each location dropdown to indicate the location hierarchy level)
- parentLocCode (mandatory to be added in the topmost dropdown in the location hierarchy to indicate the parent for it. It can also be omitted, in which case the mosip.country.code property will be used)
- The control type for the date of birth should be changed to "ageDate"
- The labelName should be provided with the "languageCode" as the "key" and the label as the "value". Example: {"labelName": {
  "eng": "Date Of Birth",
  "ara": "تاريخ الولادة",
  "fra": "Date de naissance"
}}
- visibleCondition (optional)
- requiredCondition (optional)
- alignmentGroup (optional)
- containerStyle (optional)
- headerStyle (optional)
- changeAction (optional)

### UI Specifications of 1.1.5 and 1.2.0 





