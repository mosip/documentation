# Anonymous Profiling Support

## Overview

When a country is implementing and running the ID program, people at the forefront like policymakers and other executives will need to monitor the progress. Progress can be measured with the help of various attributes like:

* total enrollment count
* gender profile for enrollments
* age group profile
* enrollment numbers and profile per registration center
* quality of biometric data captured 

Information like this will allow policymakers to take corrective measures as and when required. 

Some examples are given below:

Example 1: If registration centers are setup for enrolling residents and if they see that the number of women enrolling in a particular area is less because of cultural factors, they can introduce a door to door enrollment process to increase coverage.

Example 2: Quality of biometrics captured for a particular registration center or region can be monitored. And if it is found to be unacceptable, they can proceed to replace the biometric devices in that centre.

Example 3: They can compare the total number of enrollments against the total number of UIN’s issued. If there is a big gap, they can then address this by increasing the capacity of the registration processor module to handle and process more packets.

## Design

* In order to achieve this, we have published a fixed anonymized profile of the users and ensured the same is accessible to a search engine such as elastic search so that it can be used for analytics. The limited dataset should not violate the privacy of the person or point to specific individuals.
* This dataset is called **anonymous profile** and is captured at various stages in the ID lifecycle like pre-registration, registration processing, ID issuance and  authentication.
* As a part of this implementation, a new **anonymous_profile** table is created in each of these modules and is populated as per the JSON structure given below for each profile.

_Note_: New DB tables are added for anonymous profile because data in existing tables (except pre-registration module) are encrypted and cannot be used to create reports and dashboards. 
  
### Module in which the profile data is captured

* ID Repository

  
### Anonymous Identity issuance profile
  
* This profile data will be captured during the identity issuance process when an entry is made in the ID repository. 
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
  
Below is the image for Anonymous profile table created in ID repository schema
 
![Anonymous profile table created in ID repository schema](_images/ap-identity-issuance.png)  


