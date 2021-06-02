# OTP Manager

## OTP Generation

1. OTP Manager Component handles OTP Generation and OTP Validation
1. For OTP Generation, the system receives a request to generate an OTP along with a Key in input parameter. 
1. This Key can be a Mobile number, Email ID, or a combination of Mobile Number and Email ID. 
1. The component generates an OTP as per the configured length and responds back with the OTP to the source. OTP manager maps an expiry period with the OTP as configured by the Administrator.

## OTP Validation

1. For OTP Validation, the system receives a request to validate an OTP with a Key and OTP in the input parameter. 
1. The component validates the OTP against the expiry and then validates the OTP against the Key if the OTP is not expired. 
1. If the OTP is not expired and is valid against the Key, it will respond with the message “Valid”, or else it will respond with the message “Invalid”. 
1. A user will have a maximum configured number of tries to get the OTP wrong after which he/she will be blocked for a configured amount of time. During this blocked period, he/she cannot generate or validate another OTP.

# QR Code Generator

QR code generator takes the content received along with the version number and converts the content into a QR code. The version number is configurable and determines how much data a QR code can store. The more the version number, the more data can be stored in a QR Code.

# MOSIP Utils

## Mobile Data Validator

Upon receiving a request to validate a mobile number against configured mobile number policy, the system validates the mobile number against the policy

1. Validates if all required input parameters have been received as listed below for each specific request
   * Mobile number
2. Validates if the mobile no. against the following policies
   * Mobile no. should contain no of digits configured by the ADMIN
   * Mobile no. should only be numerical.
3. In case of Exceptions, system should trigger relevant error messages. Refer “Messages” section
1. Responds to the source with the result (Valid/Invalid)
1. Raises an alert in case of exceptions.

## Email Data Validator

Upon receiving a request to validate an Email ID against the standard Email ID policy, system validates the Email ID against the Standard Email ID format

1. Validates if all required input parameters have been received as listed below for each specific request
   * Email ID
2. Validates if the Email ID contains the minimum no. of characters as configured
1. Validates if the Email ID contains less than 254 max length
1. Validates if the Email ID only contains following characters
   * Digits 0 to 9
   * Uppercase and lowercase English letters (a–z, A–Z)
   * Characters ! # $ % & ' * + - / = ? ^ _ ` { | }
   * ~ .

5. Validates if the Email ID contains "@" and domain name within the Email ID.
1. Responds to the source with the result (Valid/Invalid)
1. Raises an alert in case of exceptions 

## Exception Framework

MOSIP system provides base exception framework.

## Calendar Utility

1. Identifies Calendar util methods
1. Creates wrapper class for methods defined in apache-commons Calendar util
1. Raises an alert in case of listed exceptions 

## Date Utility

1. Identifies File util methods
1. Creates wrapper class for methods defined in apache-commons date and time util
1. Raises an alert in case of listed exceptions 

## File Utility

1. Identifies File util methods
1. Creates wrapper class for methods defined in apache-commons File util
1. Raises an alert in case of listed exceptions 

## JSON Utility

1. Identifies JSON util methods
1. Creates wrapper class for methods defined in apache-commons JSON util
1. Raises an alert in case of listed exceptions 

## Math Utility

1. Identifies Math util methods
1. Creates wrapper class for methods defined in apache-commons Math util
1. Raises an alert in case of listed exceptions 

## String Utility

1. Identifies String util methods
1. Creates wrapper class for methods defined in apache-commons String util
1. Raises an alert in case of listed exceptions

## UUID Utility

1. Upon receiving a request to generate UUID the system generates UUID as per default UUID generation logic
1. UUID generated should be as per UUID Version 5
1. UUID generated should be of 36 characters (32 alphanumeric characters and four hyphens e.g. 123e4567-e89b-12d3-a456-426655440000)
1. Any application in MOSIP can use this UUID utility
1. Responds with the UUID to the source
1. Raises an alert in case of listed exceptions

## Zip-Unzip Utility

1. Identifies Zip-Unzip util methods
1. Creates wrapper class for methods defined in apache-commons Zip-Unzip util
1. Raises an alert in case of listed exceptions

## Log Utility

1. Generate logs across the application
1. Store generated logs in the configured location
1. Raises an alert in case of listed exceptions

## ID Object Validator Utility

1. Validate the Attributes in ID object against the Pre-Defined pattern and Master data values
   * Validate Gender Types against country defined master data
   * Validate Document Categories against country defined master data
   * Validate Document Types country against defined master data
   * Validate Location and Location hierarchy against country defined master data
   * Validate Date of Birth against country configured pattern
   * Validate Phone Number against country configured pattern
   * Validate Email ID against country configured pattern
   * Validate Age against country configured pattern
   * Validate Full Name against country configured pattern
   * Validate Address line 1,2 and 3 against country configured pattern
   * Validate Reference Identity Number against country configured pattern
   * Validate Country Code against country configured pattern
2. Respond with proper error messages in case of any validation failure

# Virus Scanner

Virus Scanner utility allows for virus scanning across MOSIP at various places, which includes:

1. Scanning of Document uploaded in Pre-registration
2. Scanning in Registration Client Software
3. Scanning of Registration packet in Registration Processor

Currently, for Virus Scanner, MOSIP has integrated with Clam Antivirus which allows for 290 concurrent users. A Country may integrate its licensed version of antivirus as per its requirement.
