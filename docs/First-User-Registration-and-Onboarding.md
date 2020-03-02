Steps to generate the first User in MOSIP eco-system, refer below for the process:

### 1. Creating the First User in LDAP
* First the role "Default" need to be created in LDAP with all other roles ([**Refer to the link for more details**](https://github.com/mosip/documentation/wiki/Steps-to-Install-and-config-LDAP)).
* A User say 'X' has to be created in LDAP and the role “Default” needs to be mapped
* Preferred login for users with role "Default" should be set as User ID and Password as part of Master Data as mentioned below.

_(Note - Once user management is developed in admin portal this will be handled there)_

### 2. Creating the Relevant Master Data
* All data required as part of ID Object, for example, Gender, Location hierarchy, templates, etc. should be setup in the database through the CSV Utility
* Master data of user, machine, device and center should be created and uploaded through the CSV Utility _(Note - the user id for the User 'X' should be present in Master data of _User_)_
* All necessary center-machine-device-user mappings should be completed through the CSV Utility

### 3. Creating the First User in MOSIP
* The User 'X' should now download the latest Registration Client and login with the credentials set in LDAP.
* The User will automatically skip Operator/Supervisor On-boarding and will reach the home page of Registration Client.
* The User now can register himself/herself in MOSIP and will get an RID and UIN.

### 4. Allocating the RID to the User Created in LDAP
* The RID created for the User 'X' needs to be updated in LDAP.

### 5. User On-boarding
* The role for the User 'X' needs to be changed to Registration_Officer or Registration_Supervisor. 
* The role "Default" needs to be removed from LDAP so that no other user has the role Default.
* The User 'X' can now login to Registration Client (From the mapped machine/centre) with the above Username/Password.
* The User now would need to On-board as his/her role would be changed.
* Once on-boarding is completed User 'X' can register the subsequent  Officers and Supervisors.
* The User details of the subsequent Officers and Supervisor must be created in LDAP with appropriate roles assigned (as per Step 1) and their RIDs should be mapped in LDAP (as per Step 4) so that they can login to Registration Client