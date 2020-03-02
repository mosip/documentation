* **Authentication and Authorization** _(AUT_FR_1)_

In MOSIP, Authentication largely falls into the below categories:
* Authentication via web channel (for Pre-Registration web app, Admin web app and Resident services portal)
* Authentication via local system i.e., offline authentication (for Registration client)

In MOSIP, Authorization falls into the below categories:
* Authorization of API's accessed via web channel
* Authorization to access specific data (will be implemented in v2)

A country will have its own hierarchy of system users especially the Registration staff and system administration staff. So, instead of defining a fixed hierarchy, by default MOSIP will depend on an LDAP implementation to manage users, organizational hierarchy and roles for users in the hierarchy. MOSIP will use an open source LDAP server as the LDAP implementation. Administrators can create hierarchy and users using Apache Directory Studio.

MOSIP system can handle Authorization across core services and restricts access to Web-services as per the roles defined. 
