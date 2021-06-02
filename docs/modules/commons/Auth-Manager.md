In MOSIP, Authentication largely falls into the below categories:
* Authentication via web channel (for Pre-Registration web application, Admin web application and Resident portal)
* Authentication via local system i.e., offline authentication (for Registration client)

In MOSIP, Authorization falls into the below categories:
* Authorization of API's accessed via the web channel
* Authorization to access specific data

A country will have its hierarchy of system users especially, the registration staff and system administration staff. So, instead of defining a fixed hierarchy by default MOSIP will depend on an open-source IAM implementation to manage its users, organizational hierarchy, and roles for users in the hierarchy. MOSIP will use an open-source IAM product in its implementation.

MOSIP system can handle authorization across core services and restricts access to Web services as per the roles defined. 

For details on the APIs for authentication and authorization please view our documentation on [Authentication & Authorization APIs](AuthN-and-AuthZ-APIs.md).