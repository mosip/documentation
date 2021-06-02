# User Management

## Self Registration
* Partners in MOSIP are created in a self-service mode. The partner visit the MOSIP partner management portal and requests for collaborating with MOSIP by providing basic details such as organization name & email id, purpose of registration (how they want to collaborate with MOSIP - as a device provider, authentication partner, print partner, etc), basic credentials and performing an OTP based verification.
Once these details are filled by the partner and a request is sent to MOSIP, the Partner Admin verifies the details of the partners and allows the partner to integrate with MOSIP.

## Role Mapping (MISP,Partner,Policy Manager,Partner Manager)
## MISP 
  A . MISP Creation

* Upon receiving a request to create MISP with the parameters, the system performs the following steps:

   * Validates the credentials of the MOSIP Admin.
    The system then validates if the MISP is not registered earlier using the same MISP Organization Name.
    The system then generate MISP ID as per the logic defined below:
        The MISP ID is a numeric 3 digit number. The length can be configurable
        Each new MISP ID should be incremented by 1 for each new request
        MISP ID generation should start from 100
        Each generated ID should be unique
    In case of Exceptions, system triggers relevant error messages.
    The system then generates MISP License key and sets the default expiry of the key as 6 months. The License Key expiry is configurable.
    The default status of MISP and MISP License Key is active.
    The actor responds with the parameters: MISP ID, MISP status, MISP License Key, MISP License Key expiry, MISP License Key status, err (as applicable).

B. Retrieve MISPs

* An Admin user can retrieve a MISP ID

* Upon receiving a request from the admin user to retrieve MISP ID, the system performs the following steps:

    * Validates the credentials of the MOSIP Admin
    A standard MISP retrieval request must have the following parameters based on which the system will retrieve the MISP-MOSIP Admin Username, MOSIP Admin Password, MISP Organization Name
    The system fetches the data based on complete or partial match. Partial Match is defined as ‘when the input string is available in any part of a MISP Organization Name’
    The system then fetches all the MISPs available in the system if the input parameter is not provided
    The system responds with the following parameters: MISP ID, MISP status, MISP Organization Name,MISP Contact Number, MISP Email ID, MISP Address,MISP License Key, MISP License Key expiry, MISP License key status for all the MISPs retrieved, err (as applicable).

C. Update MISPs

* An Admin user can update MISPs
* Upon receiving a request from the admin user to update an MISP, the system performs the following steps:

    * Validates the credentials of the MOSIP Admin
    Ideally an update MISP request should have the following parameters: MOSIP Admin Username, MOSIP Admin Password, MISP ID, MISP Organization Name, MISP Contact Number, MISP Email ID, MISP Address
    The system updates the record based on the MISP ID and based on the requested parameters and responds with a status, err (as applicable)

D. Deactivate/Suspend MISP and MISP License

* An Admin user can update MISP License key status

    * Ideally an update MISP License key status request should have the following parameters: MOSIP Admin Username, MOSIP Admin Password, MISP ID, MISP status, MISP License Key and MISP License key status
* Upon receiving a request from the admin user to update an MISP License key status the system performs the following steps:

    1. Validates the following:

        * The credentials of the MOSIP Admin
        * Validates if MISP ID is valid
        * Validates if MISP License Key is associated to the MISP ID

    2. The system updates the ‘MISP License Key Status’ for the MISP ID and MISP License key in the request.
    3. The system updates the ‘MISP Status’ for the MISP ID
    4. The system validates if the status to be updated is ‘‘Deactive' then the MISP/MISP Admin should not be allowed to access any services of PM.
    5. The system validates if the status to be updated is ‘Active’ from ‘Deactivated’ for the MISP License Key, then the expiry time period tracking for License key time validity as per configuration should be re-initiated.
    6. The system then responds with a status, err (as applicable).

## Partner
A. Partner Creation
* Upon receiving a request to generate partner ID, the system performs the following steps:

    1. Partner ID will be created based on default logic.
    2. The number of digits for Partner ID generation will be configurable
    3. The system then responds with the Partner ID, err (as applicable) to the source
    4. Raises an alert in case of exceptions

B. Create Auth/E-KYC Partners
* For creation of Auth/E-KYC Partners its necessary that Partners Role exists in the system. The partner must download digital certificates signed by MOSIP and upload digital certificate (either MOSIP provided/third party provided).

    1. Upon receiving a request to create Partner with the parameters: Partner Organization Name, Partner Contact Number, Partner Email ID, Partner Address Policy Group the system validates if the a partner is not registered earlier using the same Partner Organization Name in the policy group
    2. The system then generates Partner ID (PM to integrate with IAM to obtain the Partner ID (user-id)
    3. The default status of Partner is set as active.
    4. The system responds with the parameters: Partner ID, Partner status, err (as applicable). partner ID generated will be the partner User Name

## Policy Manager
A. Generate Policy Manager ID
* Upon receiving a request to generate Policy Manager ID, the system performs the following steps:

    1. MOSIP Admin will create Policy Manager.
    2. The system then responds with the Policy Manager ID, err (as applicable) to the source
    3. Raises an alert in case of exceptions

## Partner Manager
A. Generate Partner Manager ID
* Upon receiving a request to generate Partner Manager ID, the system performs the following steps:

    1. MOSIP Admin will create Partner Manager
    2. The system then responds with the Partner Manager ID to the source
    3. Raises an alert in case of exceptions

## Adding additional contacts

## API Key management
* The authentication partner can view associated API keys and request for an API key for against a policy which is available for his/her policy group. Once a requeste is initiated a request is generated but a request is also sent for approval to the partner admin. The partner admin needs to approve the request before it can be used in MOSIP. This API key is one of the manadatory attributes in the authentication request using which MOSIP verifies the partner and policy mapping.

## Certificate Upload
* A device provider needs to upload his/her certificate using which he/she would be generating their device keys. These certificates are verified by MOSIP. Once the verification is done the root for these certificates are changed to MOSIP and can be downloaded back by the partner.
A device provider needs to upload a single certificate for all his/her devices.
This certificate needs to be upto date in MOSIP system before anyone performs any authentication using the device. During authentication, MOSIP would verify the device certificate using which the device info in authentication request is signed.

## Policy Group Assignment
## Create Policy Group
* In order to create a policy we must have a policy group first. The policy admin needs to first create a policy group using the partner management portal.A Country should define all the policy groups in the Country.
One Partner Manager should be created in IAM for each of these policy groups.In general Partner Manager and Policy Manger should be mapped to any of the policy groups created above

## To Do
## API Details
 * [API Documentation](https://nayakrounak.gitbook.io/mosip-docs/v/1.2.0/modules/operations/partner-management/PMS-API-Documentation.md)

* Configuration Parameters
    * List of parameters and how they alter the behaviour of the API

## Links to related content
* Links to design documentation
* Links to How To articles

