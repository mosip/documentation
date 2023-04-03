# e-Signet PARTNER ONBOARDING

This document contains the steps that needs to be followed for onboarding an e-Signet partner manually.

*Note*: The same is automated and is done through `mosip-onboarder`, however this document helps in understanding the key details and the manual onboarding process.

**Step 1: Authenticate as policy manager**

URL: {{url}}/v1/authmanager/authenticate/internal/useridPwd

 Request body:
 ```
 {
  "id": "string",
  "version": "string",
  "requesttime": "",
  "metadata": {},
  "request": {
    "userName": "",
    "password": "",
    "appId": "",
    "clientId": "",
    "clientSecret": ""
  }
}
```

**Step 2: Create a policy group**

URL: {{url}}/v1/policymanager/policies/group/new
 
  Request body:
 ```
  {
  "id": "",
  "metadata": {},
  "request": {
    "desc":"",
    "name":""
  },
  "requesttime": "",
  "version": "LTS"
}
```

**Step 3: Create a MISP policy**

URL: {{url}}/v1/policymanager/policies
 
 Request body:
 ```
 {
  "id": "string",
  "metadata": {},
  "request": {
    "desc": "",
    "name": "",
    "version" : "1.0",
    "policies": {
        "allowAuthRequestDelegation": true,
        "allowKycRequestDelegation":true,
        "trustBindedAuthVerificationToken": true 
        },
    "policyGroupName": "",
    "policyType": "MISP"
  },
  "requesttime": "",
  "version": "LTS"
}
```

**Step 4: Publish the policy and policy group**

URL: {{url}}/v1/policymanager/policies/{{policyid}}/group/{{policygroupid}}/publish

**Step 5: Add an e-Signet partner**

URL: {{url}}/v1/partnermanager/partners

Request body :
```
{
  "id": "string",
  "metadata": {},
  "request": {
    "address":"",
    "contactNumber":"",
    "emailId":"",
    "organizationName":"IITB",
    "partnerId":"",
    "partnerType":"MISP_Partner",
    "policyGroup": ""
  },
  "requesttime": "",
  "version": "string"
}
```

**Step 6: Get Root Certificate**

URL: {{external-url}}/v1/esignet/system-info/certificate?applicationId=ROOT

*Note*: External-url means URLs outside of api-internal domain, e.g for dev external url will be : https://api.dev.mosip.net

**Step 7: Get Intermediate certificate**

URL: {{external-url}}/v1/esignet/system-info/certificate?applicationId=OIDC_SERVICE

**Step 8: Get Leaf Certificate**

URL: {{external-url}}/v1/esignet/system-info/certificate?applicationId=OIDC_PARTNER

**Step 9: Upload ROOT certificate**

URL: {{url}}/v1/partnermanager/partners/certificate/ca/upload

Request body:
```
{
    "id": "string",
  "metadata": {},
  "request": {
    "certificateData":"",
    "partnerDomain": "MISP"
  },
  "requesttime": "",
  "version": "string"
  }
```

**Step 10: Upload Intermediate Certificate**

URL: {{url}}/v1/partnermanager/partners/certificate/ca/upload

Request body:
```
{
    "id": "string",
  "metadata": {},
  "request": {
    "certificateData":"",
    "partnerDomain": "MISP"
  },
  "requesttime": "",
  "version": "string"
  }
```

**Step 11: Upload partner certificate**

URL: {{url}}/v1/partnermanager/partners/certificate/upload

Request body:
```
{
  "id": "string",
  "metadata": {},
  "request": {
    "certificateData":"",
    "partnerDomain": "MISP",
    "partnerId": ""
   },
  "requesttime": "",
  "version": "string"
}
```

**Step 12: Activate MISP partner**

URL: {{url}}/v1/partnermanager/partners/{{partner_id}}

Request body:
```
{
  "id": "string",
  "version": "string",
  "requesttime": "",
  "metadata": null,
  "request": {
    "status": "ACTIVE"
  }
}
```

**Step 13: Upload signed cert to e-Signet**

URL: {{external-url}}/v1/esignet/system-info/uploadCertificate

Request body:
```
{
  "request": {
    "certificateData": "certificate recieved in the response of STEP-11 to be used as input",
    "applicationId": "OIDC_PARTNER",
    "referenceId" : ""
  },
  "requestTime": ""
}
```

**Step 14: Map partner with policy**

URL: {{url}}/v1/partnermanager/partners/{{partnerid}}/policy/map
Request body:
```
{
  "id": "string",
  "metadata": {},
  "request": {
    "policyName": "name of the policy ",
    "useCaseDescription": "mapping Partner to policyName"
  },
  "requesttime": "",
  "version": "string"
}
```

**Step 15: Approve partner-policy mapping**

 URL: {{url}}/v1/partnermanager/partners/policy/{mapping key recieved from the STEP-14}
 Request body:
 ```
 {
  "id": "string",
  "metadata": {},
  "request": {
    "status": "Approved"
  },
  "requesttime": "",
  "version": "string"
}
```

**Step 16: Generate MISP license key**

 URL: {{url}}/v1/partnermanager/misps
 Request body:
 ```
 {
  "id": "string",
  "metadata": {},
  "request": {
    "providerId": "{{partnerid}}"
  },
  "requesttime": "",
  "version": "string"
}
```

**Step 17**: Collect the Generated MISP license key from the response of Step 16 and update the `esignet-default-properties` in the `mosip-config`.


