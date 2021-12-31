# Operator onboarding 
This guide constitues all the details you may want to know about the operator operating the Registration Client.

## First user registration and onboarding

To generate the first User in MOSIP eco-system, refer to the steps below:

### 1.	Creating the first user in KeyCloak
*	First the role "Default" needs to be created in KeyCloak with all the other roles.
*	The user account needs to be created in KeyCloak.
*	This user should be assigned with the “Default” role.
*	The user should be mapped to the registration center using the Admin Portal.
*	The user machine should be onboarded using Admin Portal

### 2. Creating the first user in MOSIP
*	The First User should download the latest registration client and login with the credentials set in KeyCloak.
*	The user will automatically skip Operator/Supervisor onboarding and will reach the home page of registration client.
*	The user now can register themselves in MOSIP and will get an RID and UIN.

### 3. User on-boarding
*	The role for the User needs to be changed to either to REGISTRATion_Officer or Registration supervisor. 
*	The role "Default" needs to be removed from KeyCloak so that no other user has the role Default.   
*	This user can now register and onboard other Supervisors and Officers.

## Who are the Operators in MOSIP?
The operator is the one who can login to the Registration Client application and perform various activities. The roles associated to an operator in MOSIP can be that of a Supervisor or an Officer. Below are features accessed by a supervisor and an officer in the registration client.

## On-boarding an operator
When an operator tries to login to their Registration Client machine for the very first time, they need to be online and will be re-directed automatically to the on-boarding page. During on-boarding, the operator needs to provide their biometrics, which will be stored and mapped to the client machine locally post authentication.
Operator's biometrics are captured during on-boarding to support login using biometrics, local duplicate checks, and registration submission via. biometric authentication in Registration Client.

Summarizing, on-boarding of an operator is successful only if,
* The operator is active and not block listed.
*	The operator and the machine belong to the same center.
*	The operator's User ID is mapped to their UIN. 
*	The operator's biometric authentication is successful during on-boarding.
*	The system is online during on-boarding.

## Login and Logout

### First time login
* When an operator logs into the Registration Client for the first time, they need to have the Registration Client in online mode. 
* The first time login for any user in Registration Client is mandated to be using their user name and password based login. 
* After the first login and successful on-boarding, the Registration Client would mandate the operator to login with the configured mode decided by the administrator.

**Note**: Any number of officers or supervisors can login to a registration client but,
          * They need to be mapped to the same center where the machine is registered.
          * They should have on-boarded to the registration client successfully.
          
### Modes of login
* MOSIP supports single factor and multi factor login including password, OTP, iris, fingerprint, and face authentication for Registration Client. An administrative configuration setting determines the mode of login.
* The Registration Client can authenticate an operator in offline mode using the locally stored biometrics (face/finger/iris) & password, but it has to be online to authenticate an operator using OTP.

**Note**: While a operator attempts to login to registration client, the system matches the user name with the locally stored user names using a case-insensitive logic.

### Locking-in the Operator
An operator can be temporarily locked in by the Registration Client if:
* They are inactive for more than X minutes (X is configurable)
* Provides invalid password or biometrics Y times during login (Y is configurable)

### Logout
An Operator can logout of the Registration Client by:
* Clicking the Logout button, 
* Closing the Registration Client, 
* Being in-active on the Registration Client for configured amount of time after which they are automatically logged out.
* Upon logout, any unsaved data will be lost. 
* Data will not be automatically saved in the database and will not be retained in memory though transaction details which is used for auditing will be captured & stored (except for PII data).

**Note**: Registration Client provides an alerts to the operator ‘X’ minutes before reaching the auto logout time limit. Registration Client displays a countdown timer in the alert. The operator can choose to dismiss the alert and continue working. This will also reset the timer to zero.

## Deactivation of a User

### How to deactivate a user?
Users can be deactivated by the admin using the IAM application user for user management.

### Why should an admin deactivate a user?
1. The user (Admin, Supervisor or Officer) has left the organization and should not have access to the MOSIP system
2. The user (Admin, Supervisor or Officer) is now considered as a rouge individual in the system and should not have access to the MOSIP system

### What happens when an admin deactivates an officer or supervisor?
1. If the user is not logged in to the Registration Client when the admin deactivates the user,
 a. User tries to log in when their system is online, then, 
    i. The system performs an automatic login sync  
   ii. The system would have the latest status of the user
  iii. The user should not be able to log in
 b. User tries to login when their system is offline, then,
    i. The user should be able to login into the system and perform most of the routine activities until he/she has synced as the application will not know if the user was deactivated
   ii. When the user does sync,
       1. The system would have the latest status of the user
       2. The user would be informed that he/she is now deactivated
       3. The user would be auto logged out from the system

2. If the user is logged in when the admin deactivates the user,
  a. The user should be able to perform most of the routine activities until he/she has synced as the application will not know if the user was deactivated
  b. When the sync is done,
      1. The system would have the latest status of the user
      2. The user would be informed that he/she is now deactivated
      3. The user would be auto logged out from the system

### What happens when a packet is created after the user is deactivated?
Any packet created by the user after the re-mapping in the server should be sent for investigation in the Registration Processor. But, packets created by the user before re-mapping should be processed unless the user is in the blocklist.

### How can we upload packets created by the deactivated user?
Another user having access to the system should view the packets created by the deactivated user and upload the packets to the server.

### What happens when an admin deactivates another admin?
1. If the user is not logged in to the admin application when another admin deactivates the user,
   a. If the user tries to login then, he/she should not be able to login to the admin portal
2. If the user is logged in to the admin application when another admin deactivates the user,
   b. Users should be able to access the admin portal until the session expires


