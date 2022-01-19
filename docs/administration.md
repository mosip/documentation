# Admin User Guide

## Overview
Admin application is a web-based application used by a privileged group of administrative personnel to manage master data, resources, etc. Admin portal supports multiple languages. An admin user can login with their preferred language amongst the list of languages configured by the country.

The MOSIP platform is configured via the Admin application. In MOSIP, a country is assumed to be divided into Zones and further into sub-zones(hierarchial data) to ensure that the zonal and sub-zonal data is handled by authoritative personnel belonging to that particular zone. Hierarchical zones enable you to establish **parent-child zone** relationships, allowing profile attributes, rights, and roles to be inherited down the zone hierarchy.

The module provides a single user interface to administer the MOSIP platform.  On initial platform installation, data and configurations may be uploaded from CSV files.  To get started with using the Admin portal, an admin user must be assigned to a zone.

### Types of data managed in Admin UI

Data Relationship 
Explain type of data and roles required to manage them
By default, the system provides the roles mentioned below


### Pre-requisites

1. Setup of hierarchial zones(using DML scripts)
2. Create Admin roles in KeyCloak(using scripts)
3. Create first admin user in KeyCloak(scripts available)
4. Assign first user to root zone(scripts available)

### First user login

 ![](_images/admin-login.png)
 
1. Select the preferred language in the login screen
2. Login with the KeyCloak credentials.
3. Admin user can view the Home page.

Note: The admin portal integrates with the KeyCloak IAM to store users and provide the login functionality.
  
 ### Admin UI- Home page
 
 ![](_images/admin-home.png)
 
 **MENU BAR**
 
 On successful login, the user can see the following on the menu bar:
 
     * MOSIP logo
     * Zone of the logged in user
     * Admin UserName
  
The options seen on the left navigation pane is displayed or hidden based on the role of the logged in admin user.

First user actions

When the MOSIP platform gets initialized, there are default configurations and seed data setup. Post installation, following operations can be done using the Admin application:
* Center management
* Device management
* Machine management
* User management
* Other Master Data management
* Bulk operations
* KeyManager operations

Registration related services
* Packet status
* Retrieve Lost RID
* Pause/ Resume RID

### Admin Roles

* GLOBAL_ADMIN
* ZONAL_ADMIN
*	REGISTRATION_ADMIN
* MASTERDATA_ADMIN
*	KEY_MAKER

Based on the role, following are the menu list accessible to the admin users:

|GLOBAL_ADMIN|ZONAL_ADMIN|REGISTRATION_ADMIN|MASTERDATA_ADMIN|KEY_MAKER|
|------|-----|-----|-----|-----|
|Centers|Devices|Packet Status|All Master Data|GenerateMasterKey|
|User Zone Mapping|Machines|Pause/ Resume RID|Bulk Upload||||||
|All Master Data|User Zone Mapping|Retrieve Lost RID|GenerateCSR|||||
|Bulk Upload|User Center Mapping|Packet Upload|GetCertificate||||
|GenerateCSR|All Master Data||UploadCertificate|||
|GetCertificate|Bulk Upload||UploadOtherDomainCertificate||
|UploadCertificate|GenerateCSR||||
|UploadOtherDomainCertificate|UploadCertificate||||
||UploadOtherDomainCertificate||||

### What and how to configure Admin UI

### RESOURCE MANAGEMENT

#### Center Management
* Admin portal allows an administrator to manage registration centers setup by the country for taking registrations of the residents.
* Center management includes functionalities like viewing, creating, editing, activating, deactivating and decommission of centers. 
* To be able to perform the above activites, an administrator should have the role of a zonal admin/global admin. 
* A zonal admin/global admin can manage only centers under his/her administrative zone.

**View Center**
* The admin portal allows an admin to view the list of all registration centers available in the jurisdiction of his/her administrative zone. The system does not fetch the details of decommissioned registration centers but only active and inactive centers. 
* Admin portal UI shows the list of registration centers in only the country configured primary language.
* The administrator can filter the list of registration centers based on parameters like *Center name, Center type, Status, Location hierarchy (all location levels)*.
* If the admin user does not find the center, they can check the *Center not available in other language*. Using this option, they can clone the information available, 
otherwise they can create their own center.
* For a detailed view, the admin can click on the center name in the list view. This detailed view shows all the details of a registration center in all the country configured languages.

**Create Center**
* An admin can create a center by providing data in the fields marked as mandatory. A center needs to be created in both configured primary and secondary language. Although the portal will allow creation of a center in only primary language but will not allow activation of that center until data for that center is not updated for all the languages.
* A center is created with the following attributes: Center name, center type, address, latitude, longitude, location, contact phone, contact person, working hours, no. of kiosk, center start time, center end time, lunch start time, lunch end time, time zone, holiday zone and administrative zone the center belongs to.
* A center can only be mapped to the administrative zone at the lowest zonal hierarchy. 
* While defining centers, an admin can also define the working days of the week for a center and any exceptional holidays that might be applicable for a particular center.
* While entering data through UI in multiple languages, the dropdown values and numeric values entered in primary language gets automatically captured in all language. But the text fields (e.g., center name) needs to be manually input in all the languages.


**Update Center**
* Once a center is created, an admin can edit a center deatail if required. The update can include adding the details in another required language that were missed during creation of the center or changing the details of a center itself.
* All the attributes mentioned in the 'Create center' section can be updated for a center.

**Activate/Deactivate/Decommission center**

* An admin can deactivate or decommission a center through the admin portal.
* Deactivation refers to a temporary shut down while decommission refers to a permanent shut down of the center. 
* Decommissioning a center also automatically deactivates the center. In cases where a center has some resources mapped to it (e.g. machines, devices or users), the portal will not allow the admin to decommission such a center.
* The primary difference between *deactivated* and *decommissioned* center is that a deactivated center can be activated later through admin portal as required by the country. But a decommissioned center cannot be bought into commission again as decommission refers to a permanent shutdown. To reactivate such a center (if decommissioned by mistake), the admin must directly update the database through the back-end scripts.












