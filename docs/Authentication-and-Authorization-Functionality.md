In MOSIP, Authentication largely falls into the below categories:
* Authentication via web channel (for Pre-Registration web application, Admin web application and Resident portal)
* Authentication via local system i.e., offline authentication (for Registration client)

In MOSIP, Authorization falls into the below categories:
* Authorization of API's accessed via web channel
* Authorization to access specific data

A country will have its own hierarchy of system users especially the Registration staff and system administration staff. So, instead of defining a fixed hierarchy, by default MOSIP will depend on an LDAP implementation to manage users, organizational hierarchy and roles for users in the hierarchy. MOSIP will use an open source LDAP server as the LDAP implementation. Administrators can create hierarchy and users using Apache Directory Studio.

MOSIP system can handle Authorization across core services and restricts access to Web-services as per the roles defined. 

For details on the APIs for authentication and authorization please view our documentation on [Authentication & Authorization APIs](AuthN-and-AuthZ-APIs.md).