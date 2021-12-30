# Operator Onboarding 

## First User Registration and Onboarding

To generate the first User in MOSIP eco-system, refer to the steps below:

### 1.	Creating the First User in KeyCloak
*	First the role "Default" needs to be created in KeyCloak with all the other roles.
*	The user account needs to be created in KeyCloak.
*	This user should be assigned with the “Default” role.
*	The user should be mapped to the registration center using the Admin Portal.
*	The user machine should be onboarded using Admin Portal

### 2. Creating the First User in MOSIP
*	The First User should download the latest Registration Client and login with the credentials set in KeyCloak.
*	The user will automatically skip Operator/Supervisor onboarding and will reach the home page of Registration Client.
*	The user now can register themselves in MOSIP and will get an RID and UIN.

### 3. User On-boarding
*	The role for the User needs to be changed to either to Registration_Officer or Registration_Supervisor. 
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

