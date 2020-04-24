# Introduction

This document defines the interface for the Java Library providing the functional support for processing biometrics.

API specification version:  **Draft 4 (April, 2020)**

# Quality Check

* **Signature**  

`Response<QualityScore> checkQuality(BIR sample, KeyValuePair[] flags)`

* **Input Parameters**
  * Biometric Image in “Biometric Image Record” format. This could be FIR, IIR etc.
  * Control Flags is an optional list of name value pairs that can be used to configure the behavior of the library.

* **Output Parameters**
  * QualityScore object with Quality score and Analytics. The quality score is on a scale of 100 - Higher is better.

* **Errors/Exceptions**
  * Unsupported biometric type
  * Unsupported image format
  * Processing error

## Behavior

### Fingerprint
* The biometric image record is a Fingerprint Image Record. The FIR structure is explained in a later section
* The image is a jpeg2000 format lossless image
* The quality score will be using NFIQ2 for 500 dpi images and NFIQ for other densities
* The analytics data returned can have information on finger index, liveness, etc.

### Iris
* The biometric image record is a Iris Image Record. The IIR structure is explained in a later section
* The image is a jpeg2000 format lossless image
* The quality score will be on a scale of 100 and will factor focus, blur, eyelid position etc.
* The analytics data returned can have information on eye index, eyelid position, iris obscuration, gaze angle etc.

### Face
* The biometric image record is a Face Image Record. The FaceIR structure is explained in a later section
* The image is a jpeg2000 format lossless image
* The quality score will be on a scale of 100 and will factor ICAO standards
* The analytics data returned can have information on tilt, missing landmarks, lighting etc.

**_Note:_** For new biometrics that come up the quality check could be different. The quality score could be a single or composite score in the future.

# Matcher

* **Signature**  

`Response<MatchDecision[]> match(BIR sample, BIR[] gallery, KeyValuePair[] flags)`

* **Input Parameters**
  * Sample Input Image Record (1) - This is a Biometric Image Record with metadata and image data. This is the freshly received input which needs to be matched.
  * Match List of Image Records (n) - This is the set of biometrics on record that the input images needs to be matched against. The smaller this list the better the performance. Also there will be outer limits to the size of this list based on the library used.
  * Control Flags is an optional list of name value pairs that can be used to configure the behavior of the library.

**_Note:_** One of the example for the behaviour is threshold for match using which the SDK can take a decision.

* **Output Parameters**
  * List of Decision object with Match decision and Analytics.
  * Each Decision object will contain a match - yes/no decision and an Analytics object with key value pairs

* **Errors/Exceptions**
  * Unsupported biometric type
  * Unsupported image format
  * Mismatch in biometric types (sample to record)
  * Mixed biometric types (mix of types in the on records list)
  * Processing error

## Behavior

### Fingerprint
* The biometric record will have a jpeg2000 format lossless image or minutiae in an ISO template (FMR).
* The on record biometrics will be jpeg200 format lossless images or biometric extracts tagged to a specific extractor.
* Best matches are provided for an image to image match. The sample and on records data are both images. The matcher uses its own extraction algorithm on the images to be compared.
* In case the sample is not an image but minutiae (FMR) then the match accuracy and efficacy might be lower as the extraction templates and algorithms might not be the same
* In case the on record extract is a format that the matcher does not understand the match will not happen. Also if the comparison is between two extracts (Minutiae) the False Rejection and False Acceptance cases might be high
* A typical 1 : n match is used when comparing one finger received to a set of fingers (upto 10) on record for that person or a limited set of people (upto 10 per person).
* The match decision will return a yes/no and optional anaytics with details such a confidence level.

### Iris
* Input and on record images are jpeg2000 format lossless images or matchers own extract as provided by the extarctor API
* The matcher uses its own algorithm to perform extraction, segmentation and identifying patterns on the images being compared.
* Typical comparisons are 1 : 2 for a person and 1 : n for multiple people. (deduplication scenario)
* The match decision will return a yes/no and optional anaytics with details such a confidence level.

### Face
* Input and on record images are jpeg2000 format lossless images or matchers own extract as provided by the extarctor API
* The matcher uses its own algorithm to perform extraction, segmentation and identifying landmarks on the images being compared.
* Typical comparisons are 1 : 1 for one person and 1 : n for multiple people (deduplication scenario)
* The match decision will return a yes/no and optional anaytics with details such a confidence level.

# Extractor

* **Signature**

`Response<BIR> extractTemplate(BIR sample, KeyValuePair[] flags)`

* **Input Parameters**
  * Biometric Image in “Biometric Image Record” format. This could be FIR, IIR, FaceIR etc.
  * Control Flags is an optional list of name value pairs that can be used to configure the behavior of the library.

* **Output Parameters**
  * Biometric Extract Record in the form of FMR or a proprietary structure. The extract also contains a quality score.

* **Errors/Exceptions**
  * Unsupported biometric type
  * Unsupported image format
  * Processing error

## Behavior

### Fingerprint
* The extractor will extract either an ISO template FMR or extract a proprietary representation that can give better results. The extract record will be marked with the format and any additional metadata needed.

### Iris
* Currently there are no known IRIS extraction standards. Any template extracted can be consumed only by a corresponding matcher.

### Face
* Face analysis yields landmarks on face and these are typically stored in proprietary formats. Any template extracted can be used by a corresponding matcher.

**_Note:_** For non fingerprint biometrics characteristics and patterns and landmarks might be identified and stored in a custom format. This format will be proprietary to each extractor and can be only consumed by its corresponding matcher. The extract will also contain meta information about the extractor and the version of the algorithm it uses and any other assumption it has made in the process of extraction that can be useful during matching.

# Segmenter

* **Signature**

`Response<BIR[]> segment(BIR sample, KeyValuePair[] flags)`

* **Input Parameters**
  * Biometric Image in “Biometric Image Record” format. This could be FIR, IIR, FaceIR etc.
  * Control Flags is an optional list of name value pairs that can be used to configure the behavior of the library.

* **Output Parameters**
  * List of Biometric Image Record that contains the individual biometrics

* **Errors/Exceptions**
  * Unsupported biometric type
  * Unsupported image format
  * Processing error

## Behavior

### Fingerprint
* Input will contain unsegmented image such as left slap or right slap or two thumbs
* Output will be biometrics of each finger present in the input image

### Iris
* Input will contain unsegmented image such as both eyes
* Output will be biometrics of each eye present in the input image

### Face
* Not applicable at present

**_Note:_** The segmenter will identify the individual fingers present.


# Biometric Image Record (BIR) Formats

Biometrics data is exchanged as per formats defined in [Biometric Data Specification](Biometric-Data-Specification.md). 

# Quality Score Object
The quality score object will have two sections. One is the score section and the other is the analytics section.

## Score Parameters
Graded score on a scale of 100. This is an unsigned float that represents a % and can have values between 0 and 100 including decimals like 82.45.

## Analytics
List of name value pairs that can be used to convey additional information. The values filled are specific to the implementing library. This could contain information about the aspects where quality is failing for e.g. ICAO compliance for tilt or lighting. In case of matches it could contain information like the NIST score, the algorithm used for matching and more.


# Appendix A - Java API Specifications

```java
class Response<T> {
	Integer statusCode;
	String statusMessage;
	T response;
}

class MatchDecision
{
   boolean match; //true or false indicates matchers decision
   KeyValuePair[] analyticsInfo; // detailed breakdown and other information
}

class QualityScore
{
   float score; //0 - 100 score that represents quality as a percentage
   KeyValuePair[] analyticsInfo; // detailed breakdown and other information
}

class BIR
{
   BIRVersion version;
   BIRVersion cbeffVersion;
   BIRInfo birInfo;
   BDBInfo bdbInfo;
   byte[] bdb;
   byte[] sb;
   SBInfo sbInfo;
   List<JAXBElement<String>> element;
}

class BIRInfo
{
   String creator;
   String index; // UUID with pattern [a-fA-F0-9]{8}\-([a-fA-F0-9]{4}\-){3}[a-fA-F0-9]{12}
   byte[] payload;
   Boolean integrity;
   DateTime creationDate;
   DateTime notValidBefore;
   DateTime notValidAfter;
}

class BDBInfo
{
   byte[] challengeResponse;
   String index; // UUID with pattern [a-fA-F0-9]{8}\-([a-fA-F0-9]{4}\-){3}[a-fA-F0-9]{12}
   Boolean encryption;
   DateTime creationDate;
   DateTime notValidBefore;
   DateTime notValidAfter;
   BiometricType[] type;
   BiometricSubType subtype;
   ProcessedLevelType level;
   RegistryInfo product;
   RegistryInfo captureDevice;
   RegistryInfo featureExtractionAlgorithm;
   RegistryInfo comparisonAlgorithm;
   RegistryInfo compressionAlgorithm;
   PurposeType purpose;
   Integer quality;
}

class RegistryInfo
{
   String organization;
   String type;
}

class SBInfo
{
   RegistryIDType format;
}

class BIRVersion 
{
   int major;
   int minor;
}

enum SingleType 
{
   Scent,
   DNA,
   Ear,
   Face,
   Finger,
   Foot,
   HandGeometry,
   Vein,
   Iris,
   Retina,
   Voice,
   Gait,
   Keystroke,
   LipMovement,
   SignatureSign
}

enum SingleAnySubtypeType
{
   Left,
   Right,
   Thumb,
   IndexFinger,
   MiddleFinger,
   RingFinger,
   LittleFinger
}

enum ProcessedLevelType
{
   Raw,
   Intermediate,
   Processed
}

enum PurposeType
{
   Verify,
   Identify,
   Enroll,
   EnrollVerify,
   EnrollIdentify,
   Audit
}

interface IBioApi
{
   Response<MatchDecision[]> match(BIR sample, BIR[] gallery, KeyValuePair[] flags);
   Response<QualityScore> checkQuality(BIR sample, KeyValuePair[] flags);
   Response<BIR> extractTemplate(BIR sample, KeyValuePair[] flags);
   Response<BIR[]> segment(BIR sample, KeyValuePair[] flags);
}
```

# Status Codes And Messages

Status Code	|Status Message	|Scenario
----- |----- |-----
2XX (range 200 to 299)	|OK |When everything is Okay
401	|Invalid Input Parameter - %s	|When data provided as input is invalid. (eg. Invalid Input Parameter - Gallery - FIR)
402	|Missing Input Parameter - %s	|When data required as input is missing. (eg. Missing Input Parameter - Probe - FIR)
403	|Quality check of Biometric data failed	|When data provided is valid but quality check cannot be performed
404	|Biometrics not found in CBEFF	|When there is no data found in the input CBEFF
405	|Matching of Biometric data failed	|When data provided is valid, but matching cannot be performed
406	|Data provided is of poor quality	|When some other error occurred (eg. licensing issue)
5XX (range 500 to 599)	|Unknown error occurred	|When some other error occurred (eg. licensing issue)
