# Anonymous Profiling Support

## Overview

When a country is implementing and running the ID program, people at the forefront, like policymakers and other executives, will need to monitor the progress. Progress can be measured with the help of various attributes, like:

* total enrollment count
* gender profile for enrollment
* age group profile
* enrollment numbers and profiles per registration centre
* quality of biometric data captured

Information like this will allow policymakers to take corrective measures as and when required.

Some examples are given below:

Example 1: If registration centres are setup for enrolling residents and if they see that the number of women enrolling in a particular area is less because of cultural factors, they can introduce a door-to-door enrollment process to increase coverage.

Example 2: The quality of biometrics captured for a particular registration centre or region can be monitored. And if it is found to be unacceptable, they can proceed to replace the biometric devices in that centre.

Example 3: They can compare the total number of enrollments against the total number of UINs issued. If there is a big gap, they can then address this by increasing the capacity of the registration processor module to handle and process more packets.

## Design

* In order to achieve this, we have published a fixed anonymized profile of the users and ensured the same is accessible to a search engine such as elastic search so that it can be used for analytics. The basic guideline followed to create these profiles is that the limited dataset should not violate the privacy of the person or point to specific individuals. These JSON profiles are not configurable in the current design and a code change is required to change them.
* This dataset is called an **anonymous profile** and is captured at various stages in the ID lifecycle like pre-registration, registration processing, ID issuance and authentication.
* As a part of this implementation, a new **anonymous\_profile** table is created in each of these modules and is populated as per the JSON structure given below for each profile.

| Module                 | Table name         | Profile name                        |
| ---------------------- | ------------------ | ----------------------------------- |
| Pre-registration       | anonymous\_profile | Anonymous Registration profile      |
| Registration Processor | anonymous\_profile | Anonymous Registration profile      |
| ID Repository          | anonymous\_profile | Anonymous Identity Issuance profile |
| Authentication         | anonymous\_profile | Anonymous Authentication profile    |

_Note_: New DB tables are added for the anonymous profile because data in existing tables (except the pre-registration module) are encrypted and cannot be used to create reports and dashboards.

### Anonymous Registration profile

* This profile will be used to capture data about enrollment. This suggests that the user has started the registration process.
* This data is captured at two stages, i.e., during pre-registration and registration processing.
* The same registration profile JSON is re-used to capture data in these two modules.
* This profile data is captured in `anonymous_profile` tables under the `mosip_prereg`  `mosip_regprc` schemas.
* We can configure the stage at which the anonymous profile data in the registration processor needs to be captured. This can be configured as a part of the **registration processor camel routes** in the `mosip-config` repository as shown below.

![Registration processor camel routes configuration](\_images/camel-config.png)

**The profile will be available from version 1.2.0 and above.**

JSON structure of the registration profile is given below

```
{
  "processName": "", //process as new or update or correction or lost uin
  "processStage": "", //internal stage of the process eg: preregistration, client, sync, classifier etc
  "date": "", //Occurance of the event. Just date with no time.
  "startDateTime": "",
  "endDateTime": "",
  "yearOfBirth": "",
  "gender": "", // Confidential, Female, Male, Transgender, ...
  "location": [""], //hiearchy except last 2 (means no personal address) maintained as per the array. JSON array remembers the order. Its the center info
  "preferredLanguages": [""], // list of preferred languages
  "channel":["phone or email "//Please note all values should be hashed after normalization] , // Used for computing how many have this number
  "exceptions": [{
      "type" : "",
      "subtype": ""
  }],  
  "verified": [""], // list of all the verified id schema atribute names
  "biometricInfo": [ {
  "type" : "",
    "subtype": "",
    "qualityScore": "",
    "attempts": ""
    "digitalId": "" //Digital Id of the device
  }],
  "assisted": [""], //set of people who assisted in this process. Could be empty in case of automated or self. In case of assisted prereg that individuals id is listed here. 
  "registrationCenterId": "", //Center id
  "device": { //leave it empty in case if the atribute does not match your need.
    "os": "", //operating system
    "browser": "",
    "browserVersion": "",
    "software": "", 
    "version": "",
    "year": "",
    "id": "" //any unique id of the enrollment device.
   }, //all device identies involved in this process 
  "documents": [""], //type of the documents. eg: passport, license.
  "status": "" //Any internal status that needs to be published. 
}
```

Below is the image for the Anonymous profile table created in the Pre-registration schema

![Anonymous profile table created in Pre-registration schema](\_images/ap-prereg.png)

Below is the image for the Anonymous profile table created in the Registration processor schema

![Anonymous profile table created in Registration processor schema](\_images/ap-regprc.png)

### Anonymous Identity issuance profile

* This profile data will be captured during the identity issuance process when an entry is made in the ID repository.
* The profile data is captured in a `anonymous_profile` table under the `mosip_idrepo` schema.

**The profile will be available from 1.1.5.5 and above.**

JSON structure of the identity issuance profile is given below:

```
{
  "processName": "", //New, Update or Lost. Correction is not included here
  "date": "", //Occurance of the event date. Just date with no time. 
  "oldProfile": {
    "yearOfBirth": "", //Only the year of birth is kept.  
    "gender": "", // Code for - Female, Male, Transgender, ...
    "location": [""], //hiearchy except last 2 (means no personal address) maintained as per the array. JSON array remembers the order
    "preferredLanguages": [""], // list of preferred languages
    "channel":["list of channel names eg: phone,email"],
    "exceptions": [{
        "type" : "", //eg: Finger
        "subType": "" //eg: Right Thumb
    }],
    "verified":[""] // list of all the verified id schema atribute names
    "biometricInfo": [ {
        "type" : "",
        "subType": "",
        "qualityScore": "",
        "attempts": "",
        "digitalId": "" //Digital Id of the device
   }],
   "documents": [""] //type of the documents eg: driving license, passport.
  },
  "newProfile": {
    "yearOfBirth": "",
    "gender": "", // Confidential, Female, Male, Transgender, ...
    "location": [""], //hiearchy except last 2 (means no personal address) maintained as per the array. JSON array remembers the order
    "preferredLanguages": [""], // list of preferred languages
    "channel":["list of channel names eg: phone,email"],
    "exceptions": [{
        "type" : "", //eg: Finger
        "subType": "" //eg: Right Thumb
    }], 
    "verified": [""] // list of all the verified id schema atribute names
    "biometricInfo": [ {
        "type" : "",
        "subType": "",
        "qualityScore": "",
        "attempts": "",
        "digitalId": "" //Digital Id of the device
   }],
    "documents": [""] //type of the documents eg: driving license, passport
  }
}
```

Below is the image for the Anonymous profile table created in the ID repository schema

![Anonymous profile table created in ID repository schema](\_images/ap-identity-issuance.png)

### Anonymous Authentication Profile

* This profile data will be captured when the resident performs authentication.
* The profile data is captured in an `anonymous_profile` table under the `mosip_IDA` schema.

**The profile will be available from 1.2.0 and above**.

JSON structure of the Authentication profile is given below:

```
{
  "partnerName": "", 
  "date": "", //Occurance of the event date. Just date with no time. 
  
    "yearOfBirth": "",//**mandatory
    "gender": "", // Confidential, Female, Male, Transgender, ...
    "location": [""], //hiearchy except last 2 (means no personal address) maintained as per the array. JSON array remembers the order
    "preferredLanguages": [""], // list of preferred languages
    "authFactors":[''] , // modalities used for authetication like OTP, face, finger etc
    "biometricInfo": [ {
      "type":"",
      "subtype": "",
      "qualityScore": "",
      "digitalId": "" //Digital Id of the device
    }],
    "status":"",//success or failure
    "errorCode":['']
}
```

Below is the image for the Anonymous profile table created in the IDA schema

![Anonymous profile table created in IDA schema](\_images/ap-ida.png)

## Generating dashboards from Anonymous profile data

Reports and dashboards can be created using anonymous profile data. The [reporting framework](https://github.com/mosip/reporting/blob/release-1.2.0/README.md) used for the platform can be used to push this data into elastic search and dashboards can be configured using Kibana. A dashboard created using **ID Issuance Anonymous profile** data is available as a part of the reference implementation. The same is shown below.

![](\_images/reports-id-issuance-1.png) ![](\_images/reports-id-issuance-2.png)

More details about reporting module and dashboards can be found [here](https://docs.mosip.io/1.2.0/modules/reporting).
