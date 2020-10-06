# OTP Manager

## OTP Generation

1. OTP Manager Component handles OTP Generation and OTP Validation
1. For OTP Generation, system receives a request to generate an OTP along with a Key in input parameter. 
1. This Key can be a Mobile number, Email ID or a combination of Mobile Number and Email ID. 
1. The component generates an OTP as per the configured length and responds back with the OTP to the source. OTP manager maps an expiry period with the OTP as configured by the Admin.

## OTP Validation

1. For OTP Validation, system receives a request to validate an OTP with a Key and OTP in input parameter. 
1. The component validates the OTP against the expiry and then validates the OTP against the Key if the OTP is not expired. 
1. If the OTP is not expired and is valid against the Key, it will respond with message “Valid” else responds with “Invalid”. 
1. A user will have a maximum configured number of tries to get the OTP wrong after which he/she will be blocked for a configured amount of time. During this blocked period, he/she cannot generate or validate another OTP.

# QR Code Generator

QR code generator takes the content received along with the version number and converts the content into a QR code. The version number is configurable and determines how much data a QR code can store. The more the version number, the more data can be stored in a QR Code.

# Crypto Services

## Cryptography Services
Crypto service encrypts or decrypts data across MOSIP with the help of Public/Private Keys.

### For Encryption
The Crypto Service receives a request from an application with input parameters – Application ID, Reference ID, Timestamp and the Data which needs to be encrypted. 
The Service then calls the Key Generator API to get a symmetric Key and encrypts the data using that symmetric Key. 

The Service then calls the Key Manager Service with the Application ID and Timestamp received in the input parameters and gets the public key. 

The Service then encrypts the symmetric key using the Public key and joins the Encrypted data and Encrypted Symmetric Key using a Key splitter and respond to the source with the joined data.

### For Decryption
The Crypto Service will receive a request from an application with input parameters – Application ID, Reference ID, Timestamp and Data that needs to be decrypted. 

The Application ID received will be the one, which was sent for encryption of data in the above flow. 

The Crypto Service then splits the received data into Encrypted Content and Encrypted Symmetric Key using the Key Splitter and then calls the Key Manager Service with the Encrypted Symmetric Key, Application ID and Timestamp to decrypt the data using private key.

The Key Manager instead of responding with the private key, decrypts the symmetric itself and send it back to the crypto service. The service then uses this symmetric key to decrypt data and send the decrypted data back to the source.

## Key Generator

### Generate a Symmetric Key

Upon receiving a request to generate symmetric key pair the system generates a key pair (public and private key) as defined below and responds with the symmetric key
* The symmetric key generated supports AES algorithm
* The symmetric key generated is of 256 bit size
* The symmetric will be returned as a byte array

### Generate an Asymmetric Key

Upon receiving a request to generate asymmetric key pair the system generates a key pair (public and private key) as defined below and responds with the Asymmetric key
* The asymmetric key pair is generated using the RSA encryption
* The asymmetric key pair generated is of 2048 bit size
* The asymmetric is returned as a byte array

## Key Management

1. The Key Manager Service works together with the Crypto Service. 
1. It receives a request from Crypto Service from Public Key with the Application ID and Timestamp. 
1. Key Manager Service then sends a valid Public key against the application ID received to Crypto Service. 
1. In case, the public key is expired against that Application ID, it will generate a new Public Key and respond with it.
1. When there is a request to decrypt data, the private key of the application id or reference id is used. The Key manager will not respond with Private Key but instead takes the encrypted data from the source and decrypts it itself and responds with decrypted content

## Crypto Utility

The crypto utility is supports encryption and decryption. It provides a utility called as key splitter which performs following functions:

1. It combines the encrypted data and encrypted the symmetric key while sending encrypted content to the source
2. It also splits the encrypted data and encrypted the symmetric key while receiving the content for decryption
 
## Hash Utility 

1. Identifies hash util methods
1. Creates wrapper class for methods defined in apache-commons hash util
1. Raises an alert in case of listed

## HMAC Utility/Checksum Utility

A HMAC/checksum function is a way to create a compact representation of an arbitrarily large amount of data 

# Notification

## OTP Notification Services

1. OTP Notification Services is a combined service, which receives a request to generate an OTP and responds directly to the User using SMS or Email Notification. 
1. The service receives a request to generate and send OTP with User ID, OTP Channel (MOBILE and/or EMAIL), Template Variables, and Template Context (SMS and/or Email). 
1. It then calls OTP Generator Service to generate an OTP against a Key (Mobile Number or Email). 
1. It calls the Template Merger Service to merge OTP with the Template (SMS and/or Email). 
1. It calls SMS and/or Email Notification Service to send the notification as per the template. 
1. The choice of sending SMS and/or Email depends on the Notification Type Flag received in Input.
1. The system responds with the error message if a particular User ID does not have an Email or Mobile number registered against it if the otp channel received is Email or Mobile number respectively 

## Email Notification

1. This service triggers an Email Notification upon receiving a request to trigger notification with Recipient Email-ID, CC Recipients Email-IDs, Subject, Email Content, and Attachment as input parameter. 
1. The restriction on Attachment and its size is configurable. 
1. The Third-Party Email Vendor is configurable and any country specific vendor can be used.

## SMS Notification

This service triggers an SMS Notification upon receiving a request to trigger notification with Phone Number and Content as input parameter. The third-party SMS Vendor is configurable and any country specific vendor can be used.

## PDF Generator

This utility enables creation of PDF from the content received. It will receive a content in input parameter, convert it into a PDF document, and respond with it to the source.

PDF Generator also supports the feature to generate a Password Protected PDF with an additional input parameter “Password”, which is an optional parameter.

**NOTE**: If a Password is not received, then PDF Generator will generate the PDF of received content without the password protection.

## Template Merger

This utility merges a Template with Placeholders with the dynamic values to form the content to be sent as Notifications or Acknowledgement. The Utility will receive a template and dynamic values from a source. It will merge the values and template and respond with the processed content.

# Transliteration

MOSIP system can facilitate transliteration by integrating with a third party service provider. Receive a request for transliteration with the required input parameters (Word, Input Language Code, and Output Language Code)

1. Validates if all required input parameters have been received as listed below for each specific request
   * User Input Word - Mandatory
   * Input Language Code - Mandatory
   * Output Language Code - Mandatory
2. Transliterates the Word received from Input Language to Output Language
1. In case of Exceptions, system triggers relevant error messages.


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
1. Store generated logs in configured location
1. Raises an alert in case of listed exceptions

## ID Object Validator Utility

1. Validate the Attributes in ID object against the Pre-Defined pattern and Master data values
   * Validate Gender Types against country defined Masterdata
   * Validate Document Categories against country defined Masterdata
   * Validate Document Types country against defined Masterdata
   * Validate Location and Location hierarchy against country defined Masterdata
   * Validate Date of Birth against country configured pattern
   * Validate Phone Number against country configured pattern
   * Validate Email ID against country configured pattern
   * Validate Age against country configured pattern
   * Validate Full Name against country configured pattern
   * Validate Address line 1,2 and 3 against country configured pattern
   * Validate Reference Identity Number against country configured pattern
   * Validate Country Code against country configured pattern
2. Respond with proper error messages in case of any validation faliure

# Virus Scanner

Virus Scanner utility allows for virus scanning across MOSIP at various places. This includes:

1. Scanning of Document uploaded in Pre-registration
2. Scanning in Registration Client Software
3. Scanning of Registration packet in Registration Processor

Currently for Virus Scanner, MOSIP has integrated with Clam Antivirus which allows for 290 concurrent users. A Country may integrate their own Licensed version of antivirus as per their requirement.
