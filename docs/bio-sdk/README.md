# Biometric SDK

## Introduction

MOSIP uses biometrics - fingerprint, iris, face - in registration and authentication processes. This requires specialized processing of biometrics data for biometric quality check and matching two biometric images. Biometric SDK consists of software libaries that provide these functions. Note that MOSIP platform does not include such an SDK.

{% hint style="info" %}
Biometric SDK is primarily used for 1:1 authentication and quality check while \[ABIS]\(Automated-Biometric-Identification-System-ABIS.md) is used for 1:N deduplication. MOSIP does not recommend using an ABIS system for 1:1 authentication.
{% endhint %}

## Biometric SDK Functions

### SDK Initialization

Shares information about the SDK and performs any one time activities including initialization of internal variables and algorithms.

### Quality Checker

Checks the quality of input biometrics and returns quality score for the same.

#### Use Cases

* When a biometric image is received by MOSIP in the registration client using a forced capture, this method is used to check the quality of the image
* Server side validation of quality of biometric images uses this method
* When external biometric images are received to be put on record this method is used to determine the quality of the received biometric image

### Matcher

Matches the captured biometric record or a list of biometric records (based on single match or composite match), matches it against list of stored biometric records. It then returns a matching score against each stored biometric record or a composite matching score for the list of input biometric records.

#### Use Cases

* Used for matching one or multiple modes of biometric received in an auth transaction with a list of biometrics record
* Used for authentication of operators in offline mode
* Used for prevention of erroneous submission of operator biometrics in place of registrant’s biometric on registration client
* Match is expected to be capable of image-image, extract-extract and extract-image comparisons

### Extractor

Extracts salient features and patterns of input biometric record to use in fast comparison. It returns the extracted biometric record.

#### Use Cases

* Used to extract salient features and patterns of a biometric to use in fast comparison
* In case of fingerprints this is called Minutiae and a standard representation of minutiae is an ISO template for FMR

### Segmenter

Segments single biometric record into multiple biometric records and returns list of segmented biometric records. Eg: Split thumb slab into multiple fingers and eyes into left and right eye.

#### Use Cases

* Used to split images into individual biometric segments when received from external sources

### Converter

Converts images in all segments in the biometric record.

## Biometric SDK integration points

![](\_images/biometrics/biometric\_sdk\_integration\_points.png)

&#x20; &#x20;

![](\_images/biometrics/biometric\_sdk\_integration\_points\_table.png)

## Biometric SDK API Specification

The SDK needs to comply to [Biometric SDK API Specification](Biometric-SDK-API-Specification.md)

## Biometric Specification

For details about biometric specifications in MOSIP please view the page [Biometric Specification](Biometric-Specification.md).