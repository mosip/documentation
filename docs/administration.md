# Admin User Guide

## Overview
Admin application is a web-based application used by a privileged group of administrative personnel to manage various master data, resources, etc. Admin portal supports multiple languages. An admin user can login with their preferred language amongst the list of languages configured by the country.

In MOSIP, a country is assumed to be divided into Zones and further into sub-zones(hierarchial data) to ensure that the zonal and sub-zonal data is handled by authoritative personnel belonging to that particular zone. Hierarchical zones enable you to establish **parent-child zone** relationships, allowing profile attributes, rights, and roles to be inherited down the zone hierarchy.

To get started with using the Admin portal, an admin user must be assigned to a zone.

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
1. Select the preferred language in the login screen
2. Login with the KeyCloak credentials.
3. Admin user can view the Home page.
  
 ![](_images/admin-login.png)
  
 ### Admin UI- Menu bar
 
 On successful login, the user can see the following on the menu bar:
 
     * MOSIP logo
     * Zone of the logged in user
     * UserName
  
The options seen on the left navigation pane is displayed or hidden based on the role of the logged in admin user.

First user actions




### Home page
center management
Device management
machine management
user management
other master data management
Bulk operations
KeyManager operations
registration related services
>> Packet status
>> Retrieve Lost RID
>> Pause/ Resume RID




### What and how to configure Admin UI











