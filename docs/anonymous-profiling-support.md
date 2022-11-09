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

### Anonymous Identity Issuance Profile event

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
```

The event is published when an entry is made in the ID repo.   

Note:

Verified: will be sent to IDRepo from Regproc in request

### Anonymous Authentication Profile

DTO name: io.mosip.analytics.event.anonymous.AnonymousAutheticationProfile

Available in LTS (1.2.0) and above

This will be stored in a table as a JSON and also published as a web-sub event.

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


### Anonymous registration profile event

This profile will be used to send events about the enrollment. This event suggests a user has started a registration process. The event is published by multiple stages within the registration. The profile will be available from 1.2.0 and above

DTO Name:  io.mosip.analytics.event.anonymous.RegistrationProfile

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
