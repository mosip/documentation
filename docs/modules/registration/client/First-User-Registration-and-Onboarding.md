Steps to generate the first User in MOSIP eco-system, refer below for the process:

### 1. Creating the First User in KeyCloak
* First the role "Default" need to be created in KeyCloak with all other roles.
* A User say 'X' has to be created in KeyCloak and the role “Default” needs to be mapped to it.

### 2. Creating the Relevant Master Data
* All data required as part of ID Object, for example, Gender, Location hierarchy, templates, etc. should be setup in the database through the CSV Utility
* Master data of user, machine, device and center should be created and uploaded through the CSV Utility _(Note - the user id for the User 'X' should be present in Master data of User)_
* All necessary center-machine-device-user mappings should be completed through the CSV Utility for the first user.

### 3. Creating the First User in MOSIP
* The User 'X' should now download the latest Registration Client and login with the credentials set in KeyCloak.
* The User will automatically skip Operator/Supervisor On-boarding and will reach the home page of Registration Client.
* The User authentication method for User 'X' will be always User ID and Password as it is the default user.
* The User now can register himself/herself in MOSIP and will get an RID and UIN.

### 4. Allocating the RID to the User Created in KeyCloak
* The RID created for the User 'X' needs to be updated in KeyCloak.

### 5. User On-boarding
* The role for the User 'X' needs to be changed to Registration_Officer or Registration_Supervisor. 
* The role "Default" needs to be removed from KeyCloak so that no other user has the role Default.
* The User 'X' can now login to Registration Client (from the mapped Machine/Centre) with the above Username/Password.
* The User now would need to On-board as his/her role would be changed.
* Once on-boarding is completed User 'X' can register the subsequent  Officers and Supervisors.
* The User details of the subsequent Officers and Supervisor must be created in KeyCloak with appropriate roles assigned (as per Step 1) and their RIDs should be mapped in KeyCloak (as per Step 4) so that they can login to Registration Client.
