# Anonymous Profiling Support

## Overview

When a country is implementing and running the ID program, people at the forefront like policymakers and other executives will have a need to monitor the progress. Progress can be measured with the help of various attributes like:

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

### Why new DB tables?

Data in existing tables (except pre-registration) are encrypted and cannot be used to create reports and dashboards.

### In which modules is the profile data being captured?

* Pre-reg
* Reg-proc

### How to configure the stage where data is captured. Add example <TODO>

* ID-Repo
* Auth
  
 ## Objectives

* Allow for reporting and analytics on a limited set of attributes on various flows of ID in MOSIP. 
* The limited set should not violate the privacy of the person or be pointing to specific individuals.
* The flows would cover pre-registration, registration, id issue/rejection, updates, authentication, credential issue, credential verification.
* In order to achieve this, we have published a fixed anonymized profile of the users and ensured the same is accessible to a search engine such as elastic search so that it can be used for analytics. 
  
  
This anonymous profile can be either stored or published in an analytics stream one time or both. Storage brings certain capabilities and limitations and also creates some change in the system. Publishing is fairly easy to plugin but brings with it some limitations in usage.

## Design

### Anonymous Identity Issuance Profile event

* This profile will be used during the identity issuance. 
* The profile will be available from 1.1.5.5 and above.
* The profile data is captured in a `anonymous_profile` table under the `idrepo schema`.

**DTO name**: io.mosip.analytics.event.anonymous.IdentityIssuanceProfile

The event is published when an entry is made in the ID repo. 

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

The event is published when an entry is made in the ID repo.   

Note:

Verified: will be sent to IDRepo from Regproc in request


