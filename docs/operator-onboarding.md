# Operator onboarding 
This guide constitutes all the details you may want to know about the operator onboarding.

## Creating the first operator in MOSIP
To generate the first operator in MOSIP eco-system, refer to the steps below:
1. Create the role "Default" in KeyCloak with all the other roles.
1. Create the operator' user account in KeyCloak.
1. Assign the operator user account with the “Default” role.
1. Perform Zone and center mapping for the operator using the Admin Portal.
1. Onboard the operator machine using the Admin Portal. Machine' details can be extracted using the ![TPM utility](https://github.com/mosip/mosip-infra/blob/develop/deployment/sandbox-v2/utils/tpm/key_extractor/README.md)
1. The operator needs to download the latest registration client and login with the credentials set in KeyCloak.
1. The operator will automatically skip Operator/Supervisor onboarding and reaches the home page of the registration client.
1. The operator can now register themselves in MOSIP and will get an RID and UIN.
1. Now, the role for the operator needs to be changed to either REGISTRATION_OFFICER or REGISTRATION_SUPERVISOR. 
1. Delete the role "Default" from KeyCloak so that no other user has the role Default.   
1. This operator can now register and onboard other Supervisors and Officers.

## On-boarding an operator
* The admin needs to map the operator' UIN in KeyCloak under Attributes with attribute name as `individualId`.
* The admin needs to remove the "Default" role mapping for the operator' user account if it exists.
* The operator needs to login(password based) to the registration client using Keycloak credentials.
* The operator needs to ensure that the registration client machine is online.
* The operator will land in the below page and needs click on **Get Onboarded**
<< diagram>>
* The operator needs to provide their biometrics and click **Save**.
* After successful onboarding, the operator is automatically re-directed to the registration client home page.
**Note:**
- After successful onboarding of the operator, the templates are extracted from the captured biometrics using configured Bio-SDK.
The extracted templates are stored in Derby DB. This can be used later for operator' biometric-authentication and also for local de-duplication checks during registration.
- After the first login and successful on-boarding, the registration client would mandate the operator to login with the configured authentication mode decided by the administrator.
- Any number of operators can login to a registration client machine but they need to be mapped to the same center where the machine is onboarded.
- Login operator' user ID is case-insensitive.

Summarizing, on-boarding of an operator is successful only if,
* The operator is active and not block listed.
* The operator and the machine belongs to the same center.
* The operator's User ID is mapped to their UIN. 
* The operator's biometric authentication is successful during on-boarding.
* The system is online during on-boarding.

### Modes of login
* MOSIP supports single factor and multi factor login including password, iris, fingerprint, and face authentication for registration client. An administrative configuration setting determines the mode of authentication login.
* The registration client can authenticate an operator in offline mode using the locally stored biometrics templates (face/finger/iris) and password hash.

### Temporarily lock the operator
The registration client temporarily locks the operator’s account in case they provides an invalid password/fingerprint/iris/face for X times continuously to login(X is configurable). The temporarily account lock lasts for X minutes (X configurable).

### Logout
An Operator can logout of the registration client by:
* Clicking the Logout button, 
* Closing the registration client, 
* Being in-active on the registration client for configured amount of time after which they are automatically logged out.
* Upon logout, any unsaved data will be lost. 
* Data will not be automatically saved in the database and will not be retained in memory though transaction details which is used for auditing will be captured and stored (except for PII data).

**Note**: Registration client provides an alerts to the operator ‘X’ minutes before reaching the auto logout time limit. Registration client displays a countdown timer in the alert. The operator can choose to dismiss the alert and continue working. This will also reset the timer to zero.

## Deactivation of an operator

### How to deactivate an operator?
Operators can be deactivated by the admin using the IAM application user for user management.

### Why should an admin deactivate an operator?
1. The operator (Admin, Supervisor or Officer) has left the organization and should not have access to the MOSIP system
2. The operator (Admin, Supervisor or Officer) is now considered as a rouge individual in the system and should not have access to the MOSIP system

### What happens when an admin deactivates an officer or supervisor?
1. If the operator is not logged in to the registration client when the admin deactivates them,
 a. Operator tries to log in when their system is online, then, 
     i. The system performs an automatic login sync  
     ii. The system would have the latest status of the operator
     iii. The operator should not be able to log in
  
 b. Operator tries to login when their system is offline, then,
    i. The operator should be able to login into the system and perform most of the routine activities until the sync has happened as the application will not know if the operator was deactivated
   ii. When the operator does a sync,
       1. The system would have the latest status of the operator
       2. The operator would be informed that he/she is now deactivated
       3. The operator would be auto logged out from the system

2. If the operator is logged in when the admin deactivates the them,
  a. The operator should be able to perform most of the routine activities until sync has happened as the application will not know if the operator was deactivated
  b. When the sync is done,
      1. The system would have the latest status of the operator
      2. The operatorvwould be informed that he/she is now deactivated
      3. The operator would be auto logged out from the system

### What happens when a packet is created after the operator is deactivated?
Any packet created by the operator after the re-mapping in the server, should be sent for investigation in the registration processor. But, packets created by the operator before re-mapping should be processed unless the operator is in the blocklist.

### How can we upload packets created by the deactivated operator?
Another operator having access to the system should view the packets created by the deactivated operator and upload the packets to the server.

### What happens when an admin deactivates another admin?
1. If the user is not logged in to the admin application when another admin deactivates the user,
   a. If the user tries to login then, he/she should not be able to login to the admin portal
2. If the user is logged in to the admin application when another admin deactivates the user,
   b. Users should be able to access the admin portal until the session expires


