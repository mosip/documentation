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
  
 ### Admin UI- Home page
 
 ![](_images/admin-home.png)
 
 **MENU BAR**
 
 On successful login, the user can see the following on the menu bar:
 
     * MOSIP logo
     * Zone of the logged in user
     * Admin UserName
  
The options seen on the left navigation pane is displayed or hidden based on the role of the logged in admin user.

First user actions

When the MOSIP platform gets initialized, there are default configurations and seed data that are setup. Post installation, following operations can be done using the Admin application:
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













