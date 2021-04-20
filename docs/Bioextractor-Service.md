# Biometric Extractor Service

# Abstract

Biometrics is widely used in identification systems to improve their security. Despite the fact that biometric identification systems have reached a certain level of maturity, some difficult tasks still require further research. We presented three key aspects of biometric identification in this document: iris, face, and fingerprints, for which we proposed an efficient algorithm-based orientation deviation descriptor.

The proposed descriptor has the power to capture the orientation field variations in a local neighborhood of one format that will be expressed later in the multiple form of orientation .

# Introduction

Biometrics, as an automated tool to recognize persons, aims to imitate the wonderful recognition process of human beings. Individuals are highly mobile, constantly connected to each other, and their daily lives are highly influenced by the information technologies. In such case, most of the services are delivered electronically via intelligent machines that can be accessed remotely. Biometrics has revolutionized the way identification is performed as MOSIP does. It capture a variety of biometrics (iris, face, and fingerprints) to determine if the resident is unique in the MOSIP system, perform biometric authentication, and issue a physical or digital credential to the resident.

These biometrics may be captured in one format, but they may need to be used in a different format. To convert these biometric data from one format to another, we use an external extractor (SDK).

This service will be used by MOSIP modules internally to extract desired biometric format using SDKs based on a specified policy.

## Target User

ID Repository credential service.

## Key Functional Requirements

The ID Repository credential service will ask ID Repository for biometrics for a specific partner (extracted or non-extracted, depending on the policy).

## Key Non-Functional Requirements

*	Logging:
	*	Log all the exceptions along with error code and short error message
	*	As a security measure, Individual's UIN should not be logged
	
*	Audit:
	*	Audit all transaction details in database
	*	Individual's UIN should not be audited
	
*	Exception:
	*	Any error in storing or retrieval of Identity details should be handled with appropriate error code and message in the response
*	Security:
	*	Individual's UIN should not be visible, and should be encrypted

# Solution
The key solution considerations are:

TBD

## Class Diagram

![](_images/arch_diagrams/bioextractor-service-class-diagram.png)

## Sequence Diagram

![](_images/arch_diagrams/bioextractor-service-sequence-diagram.png)
