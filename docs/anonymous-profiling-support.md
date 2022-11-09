# Anonymous Profiling Support

## Overview

* Allow for reporting and analytics on a limited set of attributes on various flows of ID in MOSIP. 
* The limited set should not violate the privacy of the person or be pointing to specific individuals.
* The flows would cover pre-registration, registration, id issue/rejection, updates, authentication, credential issue, credential verification.

In order to achieve this if we can publish either a fixed anonymized profile or a dynamic anonymized profile of the users and the same is accessible to a search engine such as elastic search it can be used for analytics. 
This anonymous profile can be either stored or published in an analytics stream one time or both. 
Storage brings certain capabilities and limitations and also creates some change in the system. 
Publishing is fairly easy to plugin but brings with it some limitations in usage.

## Design

Anonymous Identity Issuance Profile event

This profile will be used during the identity issuance. The profile will be available from 1.1.5.5 and above.

DTO name: io.mosip.analytics.event.anonymous.IdentityIssuanceProfile

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
`
