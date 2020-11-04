This document contains high level features developed in Release 1.0.0. 

The MOSIP 1.0 is a functional release of the mosip platform with the core modules of pre-registration, registration processor, registration client, mosip commons, and id authentication. The sections below highlight the salient features available in each of these modules. More details are available in the documentation in the documentation repo in the mosip github project.


# Pre-registration

## Functional Features
* Email /phone number based Login using OTP
* Applications are associated with email or phone number
	* OTP is used with email or phone number for logging into the portal
* Support for multiple applications and appointments in a login
	* Enter data beforehand
	* Upload documents
* Book or cancel time slots for registration
* Issuance of Pre-registration ID with QR code
* Data entered here is synced to Registration Client
* Notification and the acknowledgement slip is sent to registered email or phone number

## Technical Features
* No password stored as we support only OTP based login
* Virus scan on server for uploaded documents
* Multiple language support with data in two languages
	* Primary language has to be one of the languages
* Virtual keyboard for data entry
* Transliteration support
	* Library has to be provided
* Public API set
* Reference Implementation for Pre-registration UI

# Registration Client

## Functional Features
* Registering residents for ID issuance
* Updating resident’s details
* Finding resident’s ID
* Can serve residents with Pre-registration ID and walk-ins
* Option to collect demographic and biometric data of resident
* Support for biometric exception scenario
* Support for guardian for registering minors
* Support for integration with devices such as printer, scanner or GPS device
* Issuance of Registration ID with QR code
* Officer and supervisor model

## Technical Features
* Secure and trusted environment
	* TPM
	* Encryption
* Can work offline
* Data sync service
	* Packets
	* Packet status sync
	* Master data
	* Pre-registration data
	* Configuration
* Biometric based login for Operators
* Use of MDS (MOSIP Device Service) for biometric device interfacing
* Multiple language support
	* Virtual keyboard
	* Transliteration
* Tested on Windows with Oracle JDK 9
* Reference implementation for Registration UI

# Registration Processor

## Functional Features
* Process flow for ID life-cycle
	* Application packets for Registration Client
	* Requests from resident portal
* Performs validations
	* Validate trust and security - Virus checks, machine and device checks
	* Validate the identity of officer and supervisor
	* Validate the data received including quality of biometrics captured
* Performs Uniqueness checks
	* Identifies duplicate applicants - demographic and biographic
	* Works with ABIS for biometric uniqueness check
* Takes Actions on ID
	* Supports ID creation and Issuance, ID update & Lost ID 
	* Sends Notifications
* Sends the ID information to external Printing & Delivery System

## Technical Features
* VertX EventBus with lightweight messaging for stages
* An apache camel bridge manages the flow of the packet through the stages
* Each flow has its own camel specification
* Integration stages can be added into the flow as needed
* Failed stages are rerun by the flow
* Stages have to be atomic and self aware, but agnostic of other stages
* No transaction control at the flow level
* Throughput for each stage is decided based on hardware available
* Packets are decrypted in memory and used
* HTTP based stages are possible too

# ID Repository

## Functional Features
* Stores the Identify information
	* Identity data & documents
* Offers APIs for ID operations
	* ID Updates
	* Virtual ID Support
* Limited Retrieval API
	* Retrieve non-biometric information
	* Retrieve biometrics for ABIS and Auth operations
* Activate & Deactivate ID
	* Block ID
	* Lock biometrics authentication

## Technical Features
* Multiple keys for encryption
	* Different fields in the row use different keys
	* Different rows use different keys
* Limited API functionality
	* No multiple record selection
	* No wildcard searches
* Distributed Storage
	* Part RDBMS
	* Part DFS
* Extensive Tokenization and Hashing
	* Ref Ids used everywhere as opposed to the UIN
	* No plain text storage

# Authentication

## Functional Features
* Identity verification services
	* Yes/no API confirms identity claimed
	* Works with Virtual ID
* Supports multiple levels of confidence and trust
	* Single and multi-factor authentication
	* Supports OTP, demographic, biometric factors
* e-KYC based authentication
	* Returns selected non biometric attributes excluding ID
	* Policy based sharing of data
* Authorization/Consent
	* OTP based consent mechanism linked to transaction being authorized or consented to
* Partner Ecosystem
	* API Key and Policy driven usage

## Technical Features
* Trust and security validations are performed on the request
	* Registered Devices, Authorized Partners
* Uses a third party SDK for biometrics comparison
* Call to authentication is a single request, OTP generation is a prior step
* UIN/VID based authentication requests can be made
	* Recommended configuration is VID only
* Currently works off the ID Repo
* Easy to plug in validations such as liveness detection
* Supports L0/L1 MDS Specifications for clients
* Domain feature and transaction feature for inter-op and authorization support

# Resident Services

## Functional Features 
* Ability to tracks application status
* Manage ID
	* Download printable card with QR code
	* Update of demographic data
	* Request for re-print of card
* Privacy features
	* View authentication history
	* Block and unblock authentication modes
	* On demand creation and revocation of Virtual ID/Alias ID

## Technical Features
* API only at present
* Portal and App reference implementations are not available yet
* Email, Phone Number based login
* JWT support for session
* Configurable log retention period

