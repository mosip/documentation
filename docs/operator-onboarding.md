# Operator onboarding 
This guide constitutes all the details you may want to know about the operator onboarding.

## Creating the first operator in MOSIP
To generate the first user in MOSIP eco-system, refer to the steps below:
1. Create the role "Default" in KeyCloak with all the other roles.
1. Create the user account in KeyCloak.
1. Assign the operator with the “Default” role.
1. Map the operator to the to the registration center using the Admin Portal.
1. Onboard the operator machine using the Admin Portal
1. The operator needs to download the latest registration client and login with the credentials set in KeyCloak.
1. The operator will automatically skip Operator/Supervisor onboarding and reaches the home page of the registration client.
1. The operator can now register themselves in MOSIP and will get an RID and UIN.
1. Now, the role for the operator needs to be changed to either REGISTRATION_OFFICER or REGISTRATION_SUPERVISOR. 
1. Delete the role "Default" needs from KeyCloak so that no other user has the role Default.   
1. This operator can now register and onboard other Supervisors and Officers.

## On-boarding an operator
When an operator tries to login to their registration client machine for the very first time, they need to be online and will be re-directed automatically to the on-boarding page. During on-boarding, the operator needs to provide their biometrics, which will be stored and mapped to the client machine locally post authentication.
Operator's biometrics are captured during on-boarding to support login using biometrics, local duplicate checks, and registration submission via. biometric authentication in registration client.

Summarizing, on-boarding of an operator is successful only if,
* The operator is active and not block listed.
*	The operator and the machine belong to the same center.
*	The operator's User ID is mapped to their UIN. 
*	The operator's biometric authentication is successful during on-boarding.
*	The system is online during on-boarding.

## Login and Logout

### First time login
* When an operator logs into the registration client for the first time, they need to have the registration client in online mode. 
* The first time login for any user in registration client is mandated to be using their user name and password based login. 
* After the first login and successful on-boarding, the registration client would mandate the operator to login with the configured mode decided by the administrator.

**Note**: Any number of officers or supervisors can login to a registration client but,
          * They need to be mapped to the same center where the machine is registered.
          * They should have on-boarded to the registration client successfully.
          
### Modes of login
* MOSIP supports single factor and multi factor login including password, OTP, iris, fingerprint, and face authentication for registration client. An administrative configuration setting determines the mode of login.
* The registration client can authenticate an operator in offline mode using the locally stored biometrics (face/finger/iris) & password, but it has to be online to authenticate an operator using OTP.

**Note**: While a operator attempts to login to the registration client, the system matches the operator name with the locally stored user names using a case-insensitive logic.

### Locking-in the Operator
An operator can be temporarily locked in by the Registration Client if:
* They are inactive for more than X minutes (X is configurable)
* Provides invalid password or biometrics Y times during login (Y is configurable)

### Logout
An Operator can logout of the registration client by:
* Clicking the Logout button, 
* Closing the registration client, 
* Being in-active on the registration client for configured amount of time after which they are automatically logged out.
* Upon logout, any unsaved data will be lost. 
* Data will not be automatically saved in the database and will not be retained in memory though transaction details which is used for auditing will be captured & stored (except for PII data).

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


