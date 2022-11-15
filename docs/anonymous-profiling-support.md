# Anonymous Profiling Support

## Overview

When a country is implementing and running the ID program, people at the forefront like policymakers and other executives will need to monitor the progress. Progress can be measured with the help of various attributes like:

* total enrollment count
* gender profile for enrollments
* age group profile
* enrollment numbers and profile per registration center
* quality of biometric data captured 

Information like this will allow policymakers to take corrective measures as and when required. 

## Use cases

Some examples or use cases are given below:

Example 1: If registration centers are setup for enrolling residents and if they see that the number of women enrolling in a particular area is less because of cultural factors, they can introduce a door to door enrollment process to increase coverage.

Example 2: Quality of biometrics captured for a particular registration center or region can be monitored. And if it is found to be unacceptable, they can proceed to replace the biometric devices in that centre.

Example 3: They can compare the total number of enrollments against the total number of UIN’s issued. If there is a big gap, then they can address this by increasing the capacity of the registration processor module to handle and process more packets.



### How to configure the stage where data is captured. Add example <TODO>

* ID-Repo
* Auth
  




## Design

* In order to achieve this, we have published a fixed anonymized profile of the users and ensured the same is accessible to a search engine such as elastic search so that it can be used for analytics. The limited dataset should not violate the privacy of the person or point to specific individuals.
* This dataset is called **anonymous profile** and is captured at various stages in the ID lifecycle like pre-registration, registration, id issuance/rejection and  authentication.
* As a part of this implementation, a new **anonymous_profile** table is created in each of these modules and is populated as per the JSON structure given below for each profile.

image an profile table in ID repo

_Note_: New DB tables are added for anonymous profile because data in existing tables (except pre-registration module) are encrypted and cannot be used to create reports and dashboards. 
  
### In which modules is the profile data being captured?

* Pre-registration
* Reg-processor
* ID Repository
* Authentication

### Anonymous Registration profile

* This profile will be used to capture data about enrollment. This suggests that the user has started the registration process.
* This data is captured at two stages of registration process, i.e., during pre-registration and registration. The same registration profile JSON is re-used to capture data in these two modules.
* The event is published by multiple stages within the registration based on the configurations.
* This profile data is captured in `anonymous_profile` tables under the `mosip_prereg` and `mosip_regprc` schemas.
  
**The profile will be available from 1.2.0 and above**
  
  JSON structure of the registration profile is given below

```jsonc
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

### Anonymous Identity issuance profile
  
* This profile data will be captured during the identity issuance process when an entry is made in the ID repository. 
.
* The profile data is captured in a `anonymous_profile` table under the `mosip_idrepo` schema.

**The profile will be available from 1.1.5.5 and above.**

 JSON structure of the identity issuance profile is given below:

```jsonc
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

### Anonymous Authentication Profile

* This profile data will be captured when the resident performs authentication.
* The profile data is captured in an `anonymous_profile` table under the `mosip_IDA` schema.

**The profile will be available from 1.2.0 and above**.

JSON structure of the Authentication profile is given below:

```jsonc
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

IMAGE
  
## How to generate dashboards from Anonymous profile data?
  
 * Refer [reporting framework](ttps://github.com/mosip/reporting/blob/release-1.2.0/README.md).
 *
  
  Example of a sample dashboard created using ID Issuance Anonymous profide data 
  
  ID issuance profile
  
  



