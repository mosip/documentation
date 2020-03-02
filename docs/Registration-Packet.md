
The below diagram depicts the packet creation flow along with the encryption process.

![Packet Creation Flow](_images/registration/packet-creation-flow.png)  
 
This document describes the following aspects
- Registration packet structure
- Packet encryption procedure

**Registration Packet Structure**
	![Packet Design view](_images/registration/packet_creation_overview.png)

   Create the Registration packet in the below format. 
	![Packet Design view](_images/registration/packet_zip_format.png)

1.  **Folder structure inside the packet zip.**
	![Inside Packet Design view](_images/registration/packet_struct_inside_zip.png)
	
2.  **Biometric and Demographic folders should have the below sub folder structure.**
    -   Applicant
    -   Introducer [Either HOF/Parent/Introducer  data will be captured for the packet]
    
    **Biometric Folder:**
    
    Each folder contains the respective biometric detail in [**CBEFF XML**](CBEFF-XML-sample) format.
    It contains the applicant's IRIS, Finger Print and Face bio in XML format.

    **Demographic Folder:**
    
    This folder contains the Applicant document image and demographic data.
     
     **a. Applicant**  
        - POI_drivinglicense.jpg  
        - POR_Relation.jpg  
        - POA_passport.jpg  
        - POB_date_Of_birth.jpg  
        - ApplicantPhoto.jpg  
        - ExceptionPhoto.jpg \[If Exceptional cases\]  
        
        
     **b.  Demographic\_info.json**  
        - Follwed the Mosip [**ID Spec**](MOSIP-ID-Object-definition) and generated this JSON structure. It contains the entire text data captured in the UI application. 
	
3.  **registration_id.txt**
    -   It contains the generated Registration id which is having the length of 29 digit.  
        [Eg: 10001782130002201811011002010]  
        [Eg: Center ID + Machine ID + Packet Random Seq Number + Timestamp[14]]

4.  **packet_data_hash.txt**
    -   Generate the Hash for the Biometric, Demographic and RID of
        Resident Information.
	-   Store the generated Hash in a file and append to the created Zip
	    object.

5.  **packet_osi_hash.txt**
    -   Generate Hash for the Biometric of Officer and Supervisor who provided authentication to the registration.
	-   Store the generated Hash in a file and append to the created Zip object.
    
6.  **packet_meta_info.json**  
    It contains the following attributes.

***
```{
  "identity" : {
    "biometric" : {
      "applicant" : {
        "leftEye" : {
          "language" : "en",
          "label" : "label",
          "imageName" : "LeftEye",
          "type" : "iris",
          "qualityScore" : 79.0,
          "numRetry" : 2,
          "forceCaptured" : false
        },
        "rightEye" : null,
        "leftIndex" : {
          "language" : "en",
          "label" : "label",
          "imageName" : "LeftIndex",
          "type" : "fingerprint",
          "qualityScore" : 80.0,
          "numRetry" : 3,
          "forceCaptured" : false
        },
		"leftMiddle" : {
          "language" : "en",
          "label" : "label",
          "imageName" : "LeftMiddle",
          "type" : "fingerprint",
          "qualityScore" : 80.0,
          "numRetry" : 3,
          "forceCaptured" : false
        },
		"leftRing" : {
          "language" : "en",
          "label" : "label",
          "imageName" : "LeftRing",
          "type" : "fingerprint",
          "qualityScore" : 80.0,
          "numRetry" : 3,
          "forceCaptured" : false
        },
		"leftLittle" : {
          "language" : "en",
          "label" : "label",
          "imageName" : "LeftLitle",
          "type" : "fingerprint",
          "qualityScore" : 80.0,
          "numRetry" : 3,
          "forceCaptured" : false
        },
		"leftThumb" : {
          "language" : "en",
          "label" : "label",
          "imageName" : "LeftThumb",
          "type" : "fingerprint",
          "qualityScore" : 80.0,
          "numRetry" : 3,
          "forceCaptured" : false
        },
        "rightIndex" : {
          "language" : "en",
          "label" : "label",
          "imageName" : "RightIndex",
          "type" : "fingerprint",
          "qualityScore" : 95.0,
          "numRetry" : 2,
          "forceCaptured" : false
        },
		"rightMiddle" : {
          "language" : "en",
          "label" : "label",
          "imageName" : "RightMiddle",
          "type" : "fingerprint",
          "qualityScore" : 95.0,
          "numRetry" : 2,
          "forceCaptured" : false
        },
		"rightRing" : {
          "language" : "en",
          "label" : "label",
          "imageName" : "RightRing",
          "type" : "fingerprint",
          "qualityScore" : 95.0,
          "numRetry" : 2,
          "forceCaptured" : false
        },
		"rightLittle" : {
          "language" : "en",
          "label" : "label",
          "imageName" : "RightLittle",
          "type" : "fingerprint",
          "qualityScore" : 95.0,
          "numRetry" : 2,
          "forceCaptured" : false
        },
        "rightThumb" : {
          "language" : "en",
          "label" : "label",
          "imageName" : "rightThumb",
          "type" : "fingerprint",
          "qualityScore" : 85.0,
          "numRetry" : 0,
          "forceCaptured" : false
        }
      },
      "introducer" : {
        "introducerFingerprint" : {
          "language" : "en",
          "label" : "label",
          "imageName" : "introducerLeftThumb",
          "type" : "fingerprint",
          "qualityScore" : 0.0,
          "numRetry" : 0,
          "forceCaptured" : false
        },
        "introducerIris" : null,
        "introducerImage" : null
      }
    },
    "exceptionBiometrics" : [ {
      "language" : "en",
      "type" : "fingerprint",
      "missingBiometric" : "LeftThumb",
      "exceptionDescription" : "Due to accident",
      "exceptionType" : "Permananent"
    }, {
      "language" : "en",
      "type" : "fingerprint",
      "missingBiometric" : "LeftForefinger",
      "exceptionDescription" : "Due to accident",
      "exceptionType" : "Permananent"
    }, {
      "language" : "en",
      "type" : "iris",
      "missingBiometric" : "RightEye",
      "exceptionDescription" : "By birth",
      "exceptionType" : "Permananent"
    } ],
    "applicantPhotograph" : {
      "language" : "en",
      "label" : "label",
      "photographName" : "ApplicantPhoto",
      "numRetry" : 1,
      "qualityScore" : 89.0
    },
    "exceptionPhotograph" : {
      "language" : "en",
      "label" : "label",
      "photographName" : "ExceptionPhoto",
      "numRetry" : 0,
      "qualityScore" : 0.0
    },
    "documents" : [ {
      "documentName" : "ProofOfIdentity",
      "documentCategory" : "PoI",
      "documentOwner" : "Self",
      "documentType" : "PAN"
    }, {
      "documentName" : "ProofOfAddress",
      "documentCategory" : "PoA",
      "documentOwner" : "hof",
      "documentType" : "passport"
    }, {
      "documentName" : "RegistrationAcknowledgement",
      "documentCategory" : "RegistrationAcknowledgement",
      "documentOwner" : "Self",
      "documentType" : "RegistrationAcknowledgement"
    } ],
    "metaData" : [ {
      "label" : "geoLocLatitude",
      "value" : "13.0049"
    }, {
      "label" : "geoLoclongitude",
      "value" : "80.24492"
    }, {
      "label" : "registrationType",
      "value" : "Child"
    }, {
      "label" : "applicantType",
      "value" : "New"
    }, {
      "label" : "preRegistrationId",
      "value" : "PEN1345T"
    }, {
      "label" : "registrationId",
      "value" : "20187821300001211120181030160"
    }, {
      "label" : "machineId",
      "value" : "yyeqy26356"
    },
	{
      "label" : "dongleId",
      "value" : "yyeqy26356"
    },
	{
      "label" : "macID",
      "value" : "8F-23-12-45-FG-56"
    },
	{
      "label" : "centerId",
      "value" : "12245"
    }, {
      "label" : "uin",
      "value" : null
    }, {
      "label" : "previousRID",
      "value" : null
    }, {
      "label" : "introducerType",
      "value" : "Parent"
    }, {
      "label" : "introducerRID",
      "value" : "2018234500321157812"
    }, {
      "label" : "introducerUIN",
      "value" : null
    }, {
      "label" : "officerFingerprintType",
      "value" : "leftThumb"
    }, {
      "label" : "officerIrisType",
      "value" : null
    }, {
      "label" : "supervisorFingerprintType",
      "value" : "leftThumb"
    }, {
      "label" : "supervisorIrisType",
      "value" : null
    }, {
      "label" : "introducerFingerprintType",
      "value" : "leftThumb"
    }, {
      "label" : "introducerIrisType",
      "value" : null
    }],
    "osiData" : [ {
      "label" : "officerId",
      "value" : "op0r0s12"
    }, {
      "label" : "officerFingerprintImage",
      "value" : "officerLeftThumb"
    }, {
      "label" : "officerIrisImage",
      "value" : null
    }, {
      "label" : "supervisorId",
      "value" : "s9ju2jhu"
    }, {
      "label" : "supervisorFingerprintImage",
      "value" : "supervisorLeftThumb"
    }, {
      "label" : "supervisorIrisImage",
      "value" : null
    }, {
      "label" : "supervisorPassword",
      "value" : null
    }, {
      "label" : "officerPassword",
      "value" : null
    }, {
      "label" : "supervisorPIN",
      "value" : null
    }, {
      "label" : "officerPIN",
      "value" : null
    }, {
      "label" : "supervisorFaceImage",
      "value" : null
    }, 
	{
      "label" : "officerFaceImage",
      "value" : null
    }, 
	{
      "label" : "officerOTPAuthentication",
      "value" : true/false
    },
	{
      "label" : "supervisiorOTPAuthentication",
      "value" : true/false
    }
	],
    "hashSequence1" : [ {
      "label" : "applicantBiometricSequence",
      "value" : [ "applicant_bio_CBEFF.xml" ]
    }, {
      "label" : "introducerBiometricSequence",
      "value" : [ "introducer_bio_CBEFF.xml" ]
    }, {
      "label" : "applicantDemographicSequence",
      "value" : [ "DemographicInfo", "ProofOfIdentity", "ProofOfAddress", "ApplicantPhoto", "ExceptionPhoto", "ProofOfBirth", "ProofOfRelation" ]
    } ],
	"hashSequence2" : [ {
      "label" : "otherFiles",
      "value" : [ "officerCBEFF", "supervisiorCBEFF", "Audit"]
    } ],
	"capturedRegiseredDevices" : [ {
      "label" : "fingerprint",
      "value" : "123455YRHTIFHKJI8U90U2334"
    },
	"label" : "iris",
      "value" : "123455YRHTIFHKJI8U90U5476"
    },
	"label" : "photo",
      "value" : "123455YRHTIFHKJI8U90U4648"
    }	
	],
	"capturedNonRegisteredDevices" : [ {
      "label" : "GPS",
      "value" : "123455YRHTIFHKJI8U90U2334"
    },
	"label" : "scanner",
      "value" : "123455YRHTIFHKJI8U90U5476"
    },
	"label" : "printer",
      "value" : "123455YRHTIFHKJI8U90U6786"
    }	
	],
    "checkSum" : [ {
      "label" : "registration-service.jar",
      "value" : "65gfhab67586cjhsabcjk78"
    }, {
      "label" : "registration-ui.jar",
      "value" : "uygdfajkdjkHHD56TJHASDJKA"
    } ]
  }
}
```

    -   Biometric image detail  
    -   Exceptional Biometric detail
    -   Geo Location detail
    -   Applicant Type [New/ UIN Update/ Lost UIN]
    -   Pre Registration Id
    -   osiData {Operator and Supervisor authentication info.}
    -   HashSequence for both applicant and OSI detail.{It provides the hash created sequence}

7.  **Registration Officer authentication Bio [officer_bio_cbeff.xml]**
    -   Officer bio should be captured in standard [**CBEFF xml**](MOSIP-Biometric-Data-Specifications) format.
7.  **Registration Supervisor authentication Bio [supervisor_bio_cbeff.xml]**
    -   Supervisor bio should be captured in standard [**CBEFF xml**](MOSIP-Biometric-Data-Specifications) format.

-   Capture the Registration Officer/Supervisor Authentication finger
    image and append to the Zip object.

-   Create the Packet Info JSON file, which contains the **Meta data**
    information about packet and appended to the existing Zip object.

**Packet Encryption Procedure**

Before writing the packet into the local disk, the zipped content should be encrypted using Session and RSA public key [center specific] to secure the data. The same data can only be decrypted at server end where the private key is available. 
    
-   Session Key Encryption:

    -   Session key generation is \[MAC of machine + RO Id + Timestamp\]
        should not exceed 32 characters.

    -   Pass the created Zip object \[in-memory\] through the AES-256
        bit encryption.

    -   Pass the Random Session Key as a seed to this AES encryption.

    -   Get the Registration Officer Id from user context object. 

-   RSA Public Key Encryption:

    -   AES Session key bytes pass through the RSA public key
        encryption.

-   Use the "\#KEY\_SPLITTER\#" as a key separator for the AES encrypted
    bytes and the RSA Public key encrypted Session key seed.

-   Append the RSA Public key Encrypted Session Key, Key Separator to
    the AES encrypted bytes.

-   Append the EO and machine information as a META-INFO JSON file and
    create another ZIP out of it. \[Packet Zip + META-INFO JSON\]

-   Save the encrypted data as a ZIP in local file system under the
    defined location in configuration file.


***
