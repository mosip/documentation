## Table Of Contents
- [Common Services](#common-services)
  * [1. OTP Manager](#1-otp-manager-) _(CMN_FR_1)_
  * [2. QR Code Generator](#2-qr-code-generator-) _(CMN_FR_2)_
  * [3. Crypto Services](#3-crypto-services-)
    * [3.1 Cryptography Services](#31-cryptography-services-) _(CMN_FR_3.1)_
    * [3.2 Key Generator](#32-key-generator-) _(CMN_FR_3.2)_
    * [3.3 Key Management](#33-key-management-) _(CMN_FR_3.3)_
    * [3.4 Crypto Utility](#34-crypto-utility-) _(CMN_FR_3.4)_
    * [3.5 Hash Utility](#35-hash-utility-) _(CMN_FR_3.5)_
    * [3.6 HMAC Utility/Checksum Utility](#36-hmac-utilitychecksum-utility-) _(CMN_FR_3.6)_
  * [4. Notification](#4-notification-) 
    * [4.1 OTP Notification Services](#41-otp-notification-services-) _(CMN_FR_4.1)_
    * [4.2 Email Notification](#42-email-notification-) _(CMN_FR_4.2)_
    * [4.3 SMS Notification](#43-sms-notification-) _(CMN_FR_4.3)_
    * [4.4 PDF Generator](#44-pdf-generator-) _(CMN_FR_4.4)_
    * [4.5 Template Merger](#45-template-merger-) _(CMN_FR_4.5)_
  * [5. Transliteration](#5-transliteration-) _(CMN_FR_5)_
  * [6. MOSIP Utils](#6-mosip-utils-) 
    * [6.1 Mobile Data Validator](#61-mobile-data-validator-) _(CMN_FR_6.1)_
    * [6.2 Email Data Validator](#62-email-data-validator-) _(CMN_FR_6.2)_
    * [6.3 Exception Framework](#63-exception-framework-) _(CMN_FR_6.3)_
    * [6.4 Calendar Utility](#64-calendar-utility-) _(CMN_FR_6.4)_
    * [6.5 Date Utility](#65-date-utility-) _(CMN_FR_6.5)_
    * [6.6 File Utility](#66-file-utility-) _(CMN_FR_6.6)_
    * [6.7 Json Utility](#67-json-utility-) _(CMN_FR_6.7)_
    * [6.8 Math Utility](#68-math-utility-) _(CMN_FR_6.8)_
    * [6.9 String Utility](#69-string-utility-) _(CMN_FR_6.9)_
    * [6.10 UUID Utility](#610-uuid-utility-) _(CMN_FR_6.10)_
    * [6.11 Zip-Unzip Utility](#611-zip-unzip-utility-) _(CMN_FR_6.11)_
    * [6.12 Log Utility](#612-log-utility-) _(CM_FR_6.12)_
    * [6.13 ID Object Validator Utility](#613-id-object-validator-utility-) _(CM_FR_6.13)_
   * [7. Virus Scaner](#7-virus-scanner-) _(CMN_FR_7)_
- [List of Configurable Parameters and Processes](#list-of-configurable-parameters-and-processes-)
- [Kernel API](#kernel-api-)
# Common Services
## 1. OTP Manager [**[↑]**](#table-of-contents)
### A. OTP Generation
1. OTP Manager Component handles OTP Generation and OTP Validation
1. For OTP Generation, system receives a request to generate an OTP along with a Key in input parameter. 
1. This Key can be a Mobile number, Email ID or a combination of Mobile Number and Email ID. 
1. The component generates an OTP as per the configured length and responds back with the OTP to the source. OTP manager maps an expiry period with the OTP as configured by the Admin.

### B. OTP Validation
1. For OTP Validation, system receives a request to validate an OTP with a Key and OTP in input parameter. 

1. The component validates the OTP against the expiry and then validates the OTP against the Key if the OTP is not expired. 

1. If the OTP is not expired and is valid against the Key, it will respond with message “Valid” else responds with “Invalid”. 

1. A user will have a maximum configured number of tries to get the OTP wrong after which he/she will be blocked for a configured amount of time. During this blocked period, he/she cannot generate or validate another OTP.

[**Link to design**](/mosip/mosip/blob/master/docs/design/kernel/kernel-otpmanager.md)

## 2. QR Code Generator [**[↑]**](#table-of-contents)
QR code generator takes the content received along with the version number and converts the content into a QR code. The version number is configurable and determines how much data a QR code can store. The more the version number, the more data can be stored in a QR Code.

[**Link to design**](/mosip/mosip/blob/master/docs/design/kernel/kernel-qrcodegenerator.md)
## 3. Crypto Services [**[↑]**](#table-of-contents)
### 3.1 Cryptography Services [**[↑]**](#table-of-contents)
Crypto service encrypts or decrypts data across MOSIP with the help of Public/Private Keys.

#### A. For Encryption
The Crypto Service receives a request from an application with input parameters – Application ID, Reference ID, Timestamp and the Data which needs to be encrypted. 
The Service then calls the Key Generator API to get a symmetric Key and encrypts the data using that symmetric Key. 

The Service then calls the Key Manager Service with the Application ID and Timestamp received in the input parameters and gets the public key. 

The Service then encrypts the symmetric key using the Public key and joins the Encrypted data and Encrypted Symmetric Key using a Key splitter and respond to the source with the joined data.
#### B. For Decryption
The Crypto Service will receive a request from an application with input parameters – Application ID, Reference ID, Timestamp and Data that needs to be decrypted. 


The Application ID received will be the one, which was sent for encryption of data in the above flow. 


The Crypto Service then splits the received data into Encrypted Content and Encrypted Symmetric Key using the Key Splitter and then calls the Key Manager Service with the Encrypted Symmetric Key, Application ID and Timestamp to decrypt the data using private key.


The Key Manager instead of responding with the private key, decrypts the symmetric itself and send it back to the crypto service. The service then uses this symmetric key to decrypt data and send the decrypted data back to the source.

[**Link to design**](/mosip/mosip/blob/master/docs/design/kernel/kernel-crypto.md)
### 3.2 Key Generator [**[↑]**](#table-of-contents)
#### A. Generate a Symmetric Key

Upon receiving a request to generate symmetric key pair the system generates a key pair (public and private key) as defined below and responds with the symmetric key
* The symmetric key generated supports AES algorithm
* The symmetric key generated is of 256 bit size
* The symmetric will be returned as a byte array


#### B. Generate an Asymmetric Key

Upon receiving a request to generate asymmetric key pair the system generates a key pair (public and private key) as defined below and responds with the Asymmetric key
* The asymmetric key pair is generated using the RSA encryption
* The asymmetric key pair generated is of 2048 bit size
* The asymmetric is returned as a byte array

[**Link to design**](/mosip/mosip/blob/master/docs/design/kernel/kernel-keygenerator.md)

### 3.3 Key Management [**[↑]**](#table-of-contents)

1. The Key Manager Service works together with the Crypto Service. 
1. It receives a request from Crypto Service from Public Key with the Application ID and Timestamp. 
1. Key Manager Service then sends a valid Public key against the application ID received to Crypto Service. 
1. In case, the public key is expired against that Application ID, it will generate a new Public Key and respond with it.
1. When there is a request to decrypt data, the private key of the application id or reference id is used. The Key manager will not respond with Private Key but instead takes the encrypted data from the source and decrypts it itself and responds with decrypted content

[**Link to design**](/mosip/mosip/blob/master/docs/design/kernel/kernel-keymanager.md)

### 3.4 Crypto Utility [**[↑]**](#table-of-contents)

The crypto utility is supports encryption and decryption. It provides a utility called as key splitter which performs following functions
1. It combines the encrypted data and encrypted the symmetric key while sending encrypted content to the source
2. It also splits the encrypted data and encrypted the symmetric key while receiving the content for decryption
 
### 3.5 Hash Utility [**[↑]**](#table-of-contents)
1. Identifies hash util methods
1. Creates wrapper class for methods defined in apache-commons hash util
1. Raises an alert in case of listed
### 3.6 HMAC Utility/Checksum Utility [**[↑]**](#table-of-contents)

A HMAC/checksum function is a way to create a compact representation of an arbitrarily large amount of data 

## 4. Notification [**[↑]**](#table-of-contents)
### 4.1 OTP Notification Services [**[↑]**](#table-of-contents)
1. OTP Notification Services is a combined service, which receives a request to generate an OTP and responds directly to the User using SMS or Email Notification. 
1. The service receives a request to generate and send OTP with User ID, OTP Channel (MOBILE and/or EMAIL), Template Variables, and Template Context (SMS and/or Email). 
1. It then calls OTP Generator Service to generate an OTP against a Key (Mobile Number or Email). 
1. It calls the Template Merger Service to merge OTP with the Template (SMS and/or Email). 
1. It calls SMS and/or Email Notification Service to send the notification as per the template. 
1. The choice of sending SMS and/or Email depends on the Notification Type Flag received in Input.
1. The system responds with the error message if a particular User ID does not have an Email or Mobile number registered against it if the otp channel received is Email or Mobile number respectively 

### 4.2 Email Notification [**[↑]**](#table-of-contents)
1. This service triggers an Email Notification upon receiving a request to trigger notification with Recipient Email-ID, CC Recipients Email-IDs, Subject, Email Content, and Attachment as input parameter. 
1. The restriction on Attachment and its size is configurable. 
1. The Third-Party Email Vendor is configurable and any country specific vendor can be used.

[**Link to design**](/mosip/mosip/blob/master/docs/design/kernel/kernel-emailnotification.md)

### 4.3 SMS Notification [**[↑]**](#table-of-contents)

This service triggers an SMS Notification upon receiving a request to trigger notification with Phone Number and Content as input parameter. The third-party SMS Vendor is configurable and any country specific vendor can be used.

[**Link to design**](/mosip/mosip/blob/master/docs/design/kernel/kernel-smsnotification.md)

### 4.4 PDF Generator [**[↑]**](#table-of-contents)
This utility enables creation of PDF from the content received. It will receive a content in input parameter, convert it into a PDF document, and respond with it to the source.

PDF Generator also supports the feature to generate a Password Protected PDF with an additional input parameter “Password”, which is an optional parameter.

**NOTE**: If a Password is not received, then PDF Generator will generate the PDF of received content without the password protection.

[**Link to design**](/mosip/mosip/blob/master/docs/design/kernel/kernel-pdfgenerator.md)

### 4.5 Template Merger [**[↑]**](#table-of-contents)
This utility merges a Template with Placeholders with the dynamic values to form the content to be sent as Notifications or Acknowledgement. The Utility will receive a template and dynamic values from a source. It will merge the values and template and respond with the processed content.

[**Link to design**](/mosip/mosip/blob/master/docs/design/kernel/kernel-templatemanager.md)

## 5. Transliteration [**[↑]**](#table-of-contents)
MOSIP system can facilitate transliteration by integrating with a third party service provider. Receive a request for transliteration with the required input parameters (Word, Input Language Code, and Output Language Code)
1. Validates if all required input parameters have been received as listed below for each specific request
   * User Input Word - Mandatory
   * Input Language Code - Mandatory
   * Output Language Code - Mandatory
2. Transliterates the Word received from Input Language to Output Language
1. In case of Exceptions, system triggers relevant error messages.

[**Link to design**](/mosip/mosip/blob/master/docs/design/kernel/kernel-transliteration.md)

## 6. MOSIP Utils [**[↑]**](#table-of-contents)
### 6.1 Mobile Data Validator [**[↑]**](#table-of-contents)

Upon receiving a request to validate a mobile number against configured mobile number policy, the system validates the mobile number against the policy
1. Validates if all required input parameters have been received as listed below for each specific request
   * Mobile number
2. Validates if the mobile no. against the following policies
   * Mobile no. should contain no of digits configured by the ADMIN
   * Mobile no. should only be numerical.
3. In case of Exceptions, system should trigger relevant error messages. Refer “Messages” section
1. Responds to the source with the result (Valid/Invalid)
1. Raises an alert in case of exceptions.

### 6.2 Email Data Validator [**[↑]**](#table-of-contents)

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

[**Design Link to mobile and email data validator**](/mosip/mosip/blob/master/docs/design/kernel/kernel-datavalidator.md)
### 6.3 Exception Framework [**[↑]**](#table-of-contents)
MOSIP system provides base exception framework.
### 6.4 Calendar Utility [**[↑]**](#table-of-contents)
1. Identifies Calendar util methods
1. Creates wrapper class for methods defined in apache-commons Calendar util
1. Raises an alert in case of listed exceptions 

### 6.5 Date Utility [**[↑]**](#table-of-contents)
1. Identifies File util methods
1. Creates wrapper class for methods defined in apache-commons date and time util
1. Raises an alert in case of listed exceptions 
### 6.6 File Utility [**[↑]**](#table-of-contents)
1. Identifies File util methods
1. Creates wrapper class for methods defined in apache-commons File util
1. Raises an alert in case of listed exceptions 
### 6.7 Json Utility [**[↑]**](#table-of-contents)
1. Identifies Json util methods
1. Creates wrapper class for methods defined in apache-commons Json util
1. Raises an alert in case of listed exceptions 
### 6.8 Math Utility [**[↑]**](#table-of-contents)
1. Identifies Math util methods
1. Creates wrapper class for methods defined in apache-commons Math util
1. Raises an alert in case of listed exceptions 
### 6.9 String Utility [**[↑]**](#table-of-contents)
1. Identifies String util methods
1. Creates wrapper class for methods defined in apache-commons String util
1. Raises an alert in case of listed exceptions
### 6.10 UUID Utility [**[↑]**](#table-of-contents)
1. Upon receiving a request to generate UUID the system generates UUID as per default UUID generation logic
1. UUID generated should be as per UUID Version 5
1. UUID generated should be of 36 characters (32 alphanumeric characters and four hyphens e.g. 123e4567-e89b-12d3-a456-426655440000)
1. Any application in MOSIP can use this UUID utility
1. Responds with the UUID to the source
1. Raises an alert in case of listed exceptions

[**Link to design**](/mosip/mosip/blob/master/docs/design/kernel/kernel-uuid-generator.md)
### 6.11 Zip-Unzip Utility [**[↑]**](#table-of-contents)
1. Identifies Zip-Unzip util methods
1. Creates wrapper class for methods defined in apache-commons Zip-Unzip util
1. Raises an alert in case of listed exceptions

[**Link to design for Utilities**](/mosip/mosip/blob/master/docs/design/kernel/kernel-utils.md)

### 6.12 Log Utility [**[↑]**](#table-of-contents)
1. Generate logs across the application
1. Store generated logs in configured location
1. Raises an alert in case of listed exceptions

[**Link to design for Utilities**](/mosip/mosip/blob/master/docs/design/kernel/kernel-utils.md)

### 6.13 ID Object Validator Utility [**[↑]**](#table-of-contents)
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

## 7 Virus Scanner [**[↑]**](#table-of-contents)
Virus Scanner utility allows for virus scanning across MOSIP at various places. This includes:
1. Scanning of Document uploaded in Pre-registration
2. Scanning in Registration Client Software
3. Scanning of Registration packet in Registration Processor

Currently for Virus Scanner, MOSIP has integrated with Clam Antivirus which allows for 290 concurrent users.
A Country may integrate their own Licensed version of antivirus as per their requirement.

### List of Configurable Parameters and Processes [**[↑]**](#table-of-contents)

1. Configurable Parameters

   [**Link to Configurable Parameters of Kernel**](/mosip/mosip-configuration/blob/0.12.0/config/kernel-dev.properties)

   [**Link to Kernel Application Properties**](/mosip/mosip-configuration/blob/0.12.0/config/application-dev.properties)
2. Configurable Processes 
* (Work in Progress) 

### Kernel API [**[↑]**](#table-of-contents)
[**Refer to Wiki for more details on Kernel API**](Kernel-APIs)
