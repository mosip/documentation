# Admin user guide

## Overview
Admin application is a web-based application used by a privileged group of administrative personnel to manage various master data. Admin portal supports multiple languages.
An admin user can login with their preferred language amongst the list of languages configured by the country.

In MOSIP, a country is assumed to be divided into Zones and further into sub-zones(hierarchial data) to ensure that the zonal data is handled by authoritative personnel belonging to that particular zone and all of sub-zones data. To get started with using the Admin portal, an admin user must be assigned to a zone.

### Types of data managed in Admin UI

Data Relationship 
Explain type of data and roles required to manage them
By default, the system provides the roles mentioned below


<zone tree>

Pre-requisites

1. Setup of hierarchial zones(using DML scripts)
2. Create Admin roles in KeyCloak(using scripts)
3. Create first admin user in KeyCloak(scripts available)
4. Assign first user to root zone(scripts available)

### First user login
1. Select the preferred language in the login screen
2. Login with the KeyCloak credentials.
3. Admin user can view the Home page.
  
  <<Login image>>
  
  Menu bar --
  
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











