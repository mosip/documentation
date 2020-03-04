_This document is work-in-progress_

#  Login 

##  Login

The Admin Portal integrates with the Key Cloak IAM to store users and provides login functionality.  When an Administrator access the Homepage or any page on the Admin portal through a browser, the portal detects if the Administrator is already logged-in or not. If not, the system re-directs the Administrator to the Key Cloak Login User Interface (UI) which requests the Administrator for his/her Username and Password.  After getting the credentials, KeyCloak verifies the Administrator’s credentials and Role. It also validates whether the Administrator is not deactivated.After successful validation of the credentials, the system then re-directs the Administrator to the page he/she initially landed on.

##  Logout

###  Manual Logout

If an Administrator wishes to logout of the Admin Portal, he/she can opt to select the Logout option from the profile menu on the Administrator UI. The system logs out the Administrator.

### Auto Logout

If the user is inactive for X minutes (X is configurable), the system logs out the user automatically. In such case, the system will not save any user’s data.


# Account Management

Using the portal, user will  manage his/her profile. The  portal users are Central Admin, Central Approver, Zonal Admin, Zonal Approver, Registration Center Head, Registration Supervisor, and Registration Officer.


# Resource Management 

##  Center Management

Admin Portal allows an Administrator to manage Registration Centers the Country will setup for taking Registrations of the Residents. Center management includes functionalities like Viewing, Creating, Editing, Activating, Deactivating and Decommission of Centers. An Administrator should have the role of a Zonal Admin/Global Admin to do this. A Zonal Admin/Global Admin can manage only Centers under his/her administrative zone.

### View Center 

The Admin portal allows an Admin to view the list of all Registration Centers available in the jurisdiction of his/her administrative zone. The system does not fetch the details of Decommissioned Registration Centers but only Active and Inactive Centers. Admin portal UI shows the list of Registration Centers in only the country configured Primary Language.

The Admin can filter the list of Registration Centers based on following parameters:
1. Center Name
1. Center Type
1. Status
1. Location Hierarchy (all location levels)

Besides the list view, an administrator can also view the detail of a Registration Center by clinking on a Center Name in the List view. This Detail view shows all the details of a Registration Center in all the country configured languages.

The Registration Center List View Screen is built using a templatized approach. 

### Create Center 

An Admin can create a Center by providing necessary mandatory details. A Center needs to be created in both configured Primary and Secondary language. Although the Portal will allow creation of a Center in only primary language but will not allow activation of that Center until data for that Center is not updated for all the languages.
 
A Center is created with the following attributes: 
Center name, Center Type, Address, Latitude, Longitude, Location, Contact Phone, Contact Person, Working Hours, No. of Kiosk, Center Start Time, Center End Time, Lunch Start Time, Lunch End Time, Time Zone, Holiday Zone and Administrative Zone the Center belongs to. A Center can only be mapped to the Administrative Zonal at the lowest Zonal hierarchy. While defining centers, An Admin can also define the working days of the week for a Center and any exceptional holidays that might be applicable for a particular Center.  

While entering data through UI in multiple languages, the dropdown values and numeric values entered in primary language gets automatically captured in all language. But the text fields (e.g., Center Name) needs to be manually input in all the languages.

###  Update Center 
Once a Center is created, an Admin can edit a Center later if required. The Update can include adding the details in another required language that were missed during creation of the Center or changing the details of a Center itself.  
All the attributes mentioned in the 'Create Center' section can be updated for a Center.

###  Activate/Deactivate/Decommission Center 

An admin can Deactivate or Decommission a Center through the Admin Portal.

Deactivation refers to a temporary shut down while Decommission refers to a permanent shut down of the Center. Decommissioning a Center also automatically deactivates the Center. In cases, where a Center has some resources mapped to it (e.g. Machines, Devices or Users), the portal won't allow the Admin to decommission such a Center. 

Difference between Deactivated and Decommissioned center is that a Deactivated center can later be Activated later through Admin Portal as required by the country. But a Decommissioned Center cannot be bought into commission again as decommission refers to a permanent shutdown. To reactivate such a Center (if decommissioned by mistake), the Admin must directly update the database through the back-end scripts.

## Machine Management 
Admin Portal allows an Administrator to manage Machines the Country will use for taking Registration of the Residents. The definition of Machine is the device on which the registration Client is installed. Machine management includes Viewing, Creating, Editing, Activating, Deactivating and Decommission of Machines. An Administrator should have the role of a Zonal Admin/Global Admin to do this. An Admin can manage only Machines under his/her administrative zone.

###  View Machine 

The Admin portal allows an Admin to view the list of all Machines available in the jurisdiction of his/her administrative zone. The system does not fetch the details of Decommissioned Machines but only Active and Inactive Machines. 
Admin portal UI shows the list of Machines in only the country configured Primary Language. 

The Admin can filter the list of Registration Centers based on following parameters
1.  Machine Name
1.  Mac Address
1.  Serial Number
1.  Status
1.  Map Status
1.  Machine Type

Besides the list view, an Administrator can also view the detail of a Machine by clinking on a Machine Name in the List view. This Detail view shows all the details of a Machine in all the country configured languages.

###  Create Machine 

An Admin can create a Machine by providing necessary mandatory details. A Machine needs to be created in both configured Primary and Secondary language. Although the Portal will allow creation of the Machine in only primary language but will not allow activation of that Machine until data for that Machine is not updated for all the languages. 

A Machine is created with the following attributes: 

Machine ID, Machine Name, Mac Address, Serial Number, Machine Spec ID and Administrative Zone the Machine belongs to.

While entering data through UI in multiple languages, the dropdown values and numeric values entered in primary language gets automatically captured in all language. But the text fields (e.g., Machine Name) needs to be manually input in all the languages. A Machine can be mapped to the Administrative Zone which is at the any Zonal hierarchy.

###  Update Machine 

Once a Machine is created, an Admin can edit a Machine later if required. The Update can include adding the details in another required language that were missed during creation of the Machine or changing the details of a Machine itself. 
All the attributes mentioned in the 'Create Machine' section can be updated for a Machine.

### Activate/Deactivate/Decommission Machine 

An Admin can Deactivate or Decommission a Machine through the Admin Portal. 

Deactivation refers to a temporary shut down while Decommission refers to a permanent shut down of the Machine. Decommissioning a Machine also automatically deactivates the Machine. In cases, where a Machine is mapped to any Center, the portal won't allow the Admin to decommission such a Machine. 

Difference between Deactivated and Decommissioned Machine is that a Deactivated Machine can later be Activated through Admin Portal after a period as required by the country. But a Decommissioned Machine cannot be bought into commission again as decommission refers to a permanent shutdown. To reactivate such a Machine (if decommissioned by mistake), the Admin must directly update the database through the back-end scripts.


###  Map/Un-map/Re-map Machine to a Center 

Admin portal allows an Admin to map Machines to a Center. This mapping specifies as to which Center the Machine will be used in. A Machine can only be mapped to a Center which belongs under the Machines’ Administrative Zone.

A Machine can later be un-mapped from the Center in cases where a Machine is needed to be moved to another Center. In such cases, the Machine will later need to be mapped to the new Center. In case the Machine is required to be mapped to a Registration Center outside the Administrative Zonal Restriction, the Administrative Zone of the Machine must be changed. 

##  Device Management 

Admin Portal allows an Administrator to manage Devices the Country will use for taking Registration of the Residents. These includes Device for bio-metric capture (Fingerprint, Iris, Web camera etc.) Device management includes Viewing, Creating, Editing, Activating, Deactivating and Decommission of Devices. An Administrator should have the role of a Zonal Admin/Global Admin to do this. A Zonal Admin can manage only Devices under his/her administrative zone.

###  View Device 

The Admin portal allows an Admin to view the list of all Devices available in the jurisdiction of his/her administrative zone. The system does not fetch the details of Decommissioned Devices but only Active and Inactive Devices. 
Admin portal UI shows the list of Devices in only the country configured Primary Language. 

The Admin can filter the list of Registration Centers based on following parameters:
1.  Device Name
1.  Mac Address
1.  Serial Number
1.  Status
1.  Map Status
1.  Device Type
1.  Device Spec ID

Besides the list view, an Administrator can also view the detail of a Device by clinking on a Device Name in the List view. This Detail view shows all the details of a Device in all the country configured languages.

###  Create Device 

An Admin can create a Device by providing necessary mandatory details. A Device needs to be created in both configured Primary and Secondary languages. Although the Portal will allow creation of the Device in only primary language but will not allow activation of that Device until data for that Device is not updated for all the languages. 
A Device is created with the following attributes: 
Device ID, Device Name, Mac Address, Serial Number, Device Spec ID and Administrative Zone the Device belongs to. A Machine can be mapped to the Administrative Zone which is at the any Zonal hierarchy.

While entering data through UI in multiple languages, the dropdown values and numeric values entered in primary language gets automatically captured in all language. But the text fields (e.g., Device Name) needs to be manually input in all the languages.

###  Update Device 

Once a Device is created, an Admin can edit a Device later if required. The Update can include adding the details in another required language that were missed during creation of the Device or changing the details of a Device itself. 
All the attributes mentioned in the 'Create Machine' section can be updated for a Machine.

###  Activate/Deactivate/Decommission Device 

An Admin can Deactivate or Decommission a Device through the Admin Portal.

Deactivation refers to a temporary shut down while Decommission refers to a permanent shut down of the Device. Decommissioning a Machine also automatically deactivates the Machine. In cases, where a Device is mapped to any Center, the portal won't allow the Admin to decommission such a Device. 

Difference between Deactivated and Decommissioned Device is that a Deactivated Device can later be Activated through Admin Portal after a period as required by the country. But a Decommissioned Device cannot be bought into commission again as decommission refers to a permanent shutdown. To reactivate such a Device (if decommissioned by mistake), the Admin must directly update the database through the back-end scripts.


###  Map/Un-map/Re-map Device to a Center 

Admin portal allows an Admin to map each Device to a Center. This mapping specifies as to which Center the Device will be used in. A Device can only be mapped to a Center which belongs under the Device’s Administrative Zone.

A Device can later be un-mapped from the Center in cases where a Device is needed to be moved to another Center. In such cases, the Device will later need to be mapped to the new Center. In case the Device is required to be mapped to a Registration Center outside the Administrative Zonal Restriction, the Administrative Zone of the Device must be changed.
Refer to section on more details of CRUD APIs used in above mentioned features.

## User Management 

MOSIP uses Keycloak as an IAM (Identity access management tool) for managing Users. These users are internal users of MOSIP including Registration Officers, Registration Supervisors, Zonal Admins, Global Admins etc. 
User Management includes Viewing, Creating, Editing, Activating, Deactivating and Blacklisting of Users.

###  Map/Un-map User to a Registration Center

Admin portal allows an Admin to map Users to a Center. This mapping specifies as to which Center the User will be used in. A User can only be mapped to a Center which belongs under the User’s Administrative Zone.

A User can later be un-mapped from the Center in cases where a User is needed to be moved to another Center. In such cases, the User will later need to be mapped to the new Center. In case the User is required to be mapped to a Registration Center outside the Administrative Zonal Restriction, the Administrative Zone of the User must be changed.

## Administrative Zone Management 

Administrative Zones are virtual boundaries which a country can define to better manage their resources which are used during registrations. These resources includes Centers, Users, Machines and Devices. These zones can be defined in a hierarchical fashion and a country can allocate resources to such zones based on their requirements. 

Resources under each zone is managed by a Zonal Admin. This is done by assigning an Administrative zone to the Zonal Admin during user creation. These Zonal Admins can exist at any zonal hierarchy. (For e.g, a Zonal Admin can directly be mapped to the whole country as a Zone or can be mapped to a significantly smaller zone such as a city). Thus these resources when mapped to an Administrative Zone can only be managed by the Admin of that Zone.

#  Master Data Management 

Admin Portal allows an Administrator to manage Masterdata applicable for a Country. These data includes list of Genders, list of Holidays, Templates etc. This data is used by all the modules across MOSIP which includes Pre-Registration, Registration Client, Registration processor and ID-Authentication. An Administrator should have the role of a Global Admin to manage Masterdata.

##  View Master Data Types 

The portal allows a Global Admin to view the list of Masterdata types. Through this list, the global admin can click on any of them and can view the data for that particular Masterdata table.
##  View Master Data for Each Table 
The portal allows the Global Admin to view the data of any Masterdata which are applicable to a country. The Administrator can access these list views by clicking on a type of Masterdata in the Masterdata Types Screen.

Each of these List views consumes the same UI template and allows following features:

1. List view shows data of a Masterdata Type only in the country configured Primary Language. 
1. The Global Admin can access pagination features on each list screens. These includes selecting no. of rows to be displayed on the list view and options to jump to next or previous set of records. 
1. The Global Admin can sort the data by any column on the list view
1. The List view also allows the Global Admin to directly activate or deactivate a Masterdata record from list view itself
1. The List view also supports filtering by multiple attributes. The attribute can either have a drop-down or a search box which an Admin can use to input values for filtering the values. The search box supports wildcard search as listed below
    *  text*:  implies "Starts with" search
    * *text: implies "Contains in" search
    *  text: implies exact match search

Since not all the attributes for a Masterdata record will be shown on the list view, the Global Admin can them all on the Masterdata detail view page. This view can be accessed by clicking on a record in the list view. The detail view will show all the details of a Masterdata record in all the languages configured by the country. The Global Admin can also activate/deactivate the record from detail view page.

##  Manage Master Data 

###  Manage Document Type (View, Create, Update, Activate, Deactivate) 

Document types is the list of Documents a country will configure for the users to give during registrations. 

### View Document Types 

The Global Admin can view list of all the available Document Types on the Admin UI portal. The portal shows both activated or deactivated Document Types.  The Admin can filter the list of Document Types based on Document Name(Search box) and Status (Drop-down).

### Create/Update Document Types 

Using the portal, the Global Admin can create the document type providing the Document name and description if applicable.  A Document type needs to be created in both configured Primary and Secondary language. Although the Portal will allow creation of a Document type in only primary language but will not allow activation of that Document type until data for that Type is not updated for all the languages. A deactivated document type will not show up on the Pre-Registration/Registration Client UI.  While entering the data, the text fields (e.g., Document Type Name) needs to be manually input in all the languages. After successful creation, a Document type code will be generated.

Admin Portal also allows modification of any detail of a Document type. The modification includes either adding the details in another language that were missed during creation of the Document type or changing the details of a Document Type itself including name, description etc.

### Activate/Deactivate Document types 

The portal allows Zonal Admin to activate or deactivate a document type. Deactivation of a document type can be done if the country feels the document type is not applicable anymore. Thus, deactivated documents does now show up on the Pre-Registration and Registration Client UI. The Activation/Deactivation functionality can be accessed from both the list view or the detail view page of Document Types

### View Document Categories 

The Global Admin can view list of all the available Document Categories as created by the Country in Masterdata. The portal shows both activated or deactivated Document Categories. The Admin can filter the list of Document Categories based on Status (Drop-down).

###  Create/Update Document Categories 

Using the portal, the Global Admin can create the document category providing the Document Category name and description if applicable.  A Document category needs to be created in both configured Primary and Secondary language. Although the Portal will allow creation of a Document category in only primary language but will not allow activation of that Document category until data for that Cateagory is not updated for all the languages. A deactivated document category will not show up on the Pre-Registration/Registration Client UI. While entering the data, the text fields (e.g., Document category Name) needs to be manually input in all the languages. After successful creation, a Document category code will be generated.

Admin Portal also allows modification of any detail of a Document category . The modification includes either adding the details in another language that were missed during creation of the Document category or changing the details of a Document category itself including name, description etc.

###  View mappings of Document Categories and Document Types 

The portal allows an Global Admin to view Document Categories along with its mapped and un-mapped Document Types. From the view screen itself, the Global Admin can map or un-map the Documents from a Document Category.

###  Map/Un-map Document Type to Document Category 

The portal allows the Global Admin to map the available Document types to a Document category. This feature helps the country define as to which document falls under which category. Each Document can be mapped to multiple categories depending on the country's requirement.

### View Location Data 

The Global Admin can view list of all the Locations created by the country on the Admin UI portal. This list of locations defined shows up on the Pre-Registration and Registration UI while typing the address. The portal shows both activated or deactivated Locations Types. The Admin can filter the list of Locations based on Status (Drop-down) and each Location level (Search Box).

### Create/Update Location Data 

Using the portal, Global Admin can create/update the location data by providing location name and the parent hierarchy of that location. A location needs 

A Location needs to be created in both configured Primary and Secondary language. Although the Portal will allow creation of a Location in only primary language but will not allow activation of that Location until data for that Location is not updated for all the languages. A deactivated Location will not show up on the Pre-Registration/Registration Client UI.  While entering the data, the text fields (e.g., Document Type Name) needs to be manually input in all the languages. After successful creation, a Location code will be generated.

Admin Portal also allows modification of any detail of a Location. The modification includes either adding the details in another language that were missed during creation of the Location or changing the details of a Location itself including name, parent hierarchy etc.

### Activate/Deactivate Location data 

The portal allows activation or deactivation of a Location. Deactivation of a Location can be done if the country feels the Location is not applicable anymore. Thus, deactivated locations does now show up on the Pre-Registration and Registration Client UI. The Portal won't allow deactivation of a Location if any child of that location is still active. The Admin will have to first deactivate all the child locations before deactivating a parent location. The Activation/Deactivation functionality can be accessed from both the list view or the detail view page of Location data.

###  View Blacklisted Words 

The Global Admin can view list of all the available Blacklisted words on the Admin UI portal. The portal shows both activated or deactivated Blacklisted words. Blacklisted words in the only Masterdata which is language independent and will show the data in all the languages unlike the rest of the Masterdata tables which will show data only in primary language. The Admin can filter the list of Blacklisted Words based on Status (Drop-down), Word (Search Box) and Language (Drop-Down).

### Create/Update Blacklisted Word 

Using the portal, the Global Admin can create the Blacklisted Word providing the Word, Description (if applicable) and Language in which the blacklisted word in being added.  While entering the data, the text fields (e.g., Word, Description) needs to be manually input in all the languages.  Admin Portal also allows modification of any detail of a Blacklisted Word. The modification includes either changing the word altogether or changing the description itself.

### Activate/Deactivate Blacklisted Word 

The portal allows activation or deactivation of a Blacklisted Word. Deactivation of a Blacklisted Word can be done if the country feels the Blacklisted Word is not applicable anymore. The Activation/Deactivation functionality can be accessed from both the list view or the detail view page of Blacklisted Word.

###  View Registration Center Types 

Registration Center Type indicates the type of Centers a country can have. Some examples can be Regular, Mobile, temporary etc. The Global Admin can view list of all the available Registration Center Types on the Admin UI portal. A Registration Center while creation, can be assigned to a Center Type as defined by the country.  The portal shows both activated or deactivated Center Types. The Admin can filter the list of Center Types based on Status (Drop-down).

### Create/Update Registration Center Types 

Using the portal, the Global Admin can create the Registration Center Type providing the Registration Center Type name and description if applicable.  A Registration Center Type needs to be created in both configured Primary and Secondary language. Although the Portal will allow creation of a Registration Center Type in only primary language but will not allow activation of that Registration Center Type until data for that Type is not updated for all the languages.  While entering the data, the text fields (e.g., Registration Center Type Name) needs to be manually input in all the languages. After successful creation, a Registration Center Type code will be generated.

Admin Portal also allows modification of any detail of a Registration Center Type. The modification includes either adding the details in another language that were missed during creation of the Registration Center Type or changing the details of a Registration Center Type itself including name, description etc.

###  View Machine Types 

Machine Type indicates the type of Machines a country uses to take registrations. The Global Admin can view list of all the Machine Types on the Admin UI portal. A Machine while creation, can be assigned to a Machine Types as defined by the country.
The portal shows both activated or deactivated Machine Types. 

###  Create/Update Machine Types 

Using the portal, the Global Admin can create a Machine type providing the Machine type name and description if applicable.  
A Machine type needs to be created in both configured Primary and Secondary language. Although the Portal will allow creation of a Machine type in only primary language but will not allow activation of that Machine type until data for that Type is not updated for all the languages.
While entering the data, the text fields (e.g., Machine type Name) needs to be manually input in all the languages. After successful creation, a Machine type code will be generated.

Admin Portal also allows modification of any detail of a Machine Type. The modification includes either adding the details in another language that were missed during creation of the Machine Type or changing the details of a Machine Type itself including name, description etc.

###  View Machine Specifications 

Machine specification indicates the Brand, Make and Model of a Machine a country uses to take registrations. The Global Admin can view list of all the Machine Specifications on the Admin UI portal. A Machine while creation, can be assigned to a Machine Specification as required by the country.
The portal shows both activated or deactivated Machine Specification. The Admin can filter the list of Machine Specifications based on Status (Drop-down), Name (Search Box), Brand (Search Box), Model (Search Box), and Machine type (Search Box).

###  Create/Update Machine Specifications 

Using the portal, the Global Admin can create the Machine Specification providing the Machine Specification name, brand, make and model.  A Machine Specification needs to be created in both configured Primary and Secondary language. Although the Portal will allow creation of a Machine Specification in only primary language but will not allow activation of that Machine Specification until data for that Specification is not updated for all the languages.  While entering the data, the text fields (e.g., Machine Specification Name) needs to be manually input in all the languages. After successful creation, a Machine Specification ID will be generated.

Admin Portal also allows modification of any detail of a Machine Specification. The modification includes either adding the details in another language that were missed during creation of the Machine Specification or changing the details of a Machine Specification itself including name, brand etc.

####  View Device Types 

Device Type indicates the type of Devices a country uses to take registrations. This device types includes Fingerprint scanner, Iris Scanner, Web camera, Document scanner etc. The Global Admin can view list of all the Device Types on the Admin UI portal. A Device while creation, can be assigned to a Device Types as defined by the country.
The portal shows both activated or deactivated Device Types. The Admin can filter the list of Device types based on Status (Drop-down) and  Name (Search Box).

####  Create/Update Device Types 

Using the portal, the Global Admin can create a Device type providing the Device type name and description if applicable.  
A Device type needs to be created in both configured Primary and Secondary language. Although the Portal will allow creation of a Device type in only primary language but will not allow activation of that Device type until data for that Type is not updated for all the languages.
While entering the data, the text fields (e.g., Device type Name) needs to be manually input in all the languages. After successful creation, a Device type code will be generated.

Admin Portal also allows modification of any detail of a Device Type. The modification includes either adding the details in another language that were missed during creation of the Device Type or changing the details of a Device Type itself including name, description etc.

####  View Device Specifications 

Device specification indicates the Brand, Make and Model of a Device a country uses to take registrations. The Global Admin can view list of all the Device Specifications on the Admin UI portal. A Device while creation, can be assigned to a Device Specification as required by the country.  The portal shows both activated or deactivated Device Specification. The Admin can filter the list of Device Specifications based on Status (Drop-down), Name (Search Box) and Device type (Search Box).

####  Create/Update Device Specifications 

Using the portal, the Global Admin can create the Device Specification providing the Device Specification name, brand, make and model.  A Device Specification needs to be created in both configured Primary and Secondary language. Although the Portal will allow creation of a Device Specification in only primary language but will not allow activation of that Device Specification until data for that Specification is not updated for all the languages.  While entering the data, the text fields (e.g., Device Specification Name) needs to be manually input in all the languages. After successful creation, a Device Specification ID will be generated.

Admin Portal also allows modification of any detail of a Device Specification. The modification includes either adding the details in another language that were missed during creation of the Device Specification or changing the details of a Device Specification itself including name, brand etc.

####  View Individual Types 

Individual Type indicates the category in which a country might want to categorize residents in. Foreigner, Non-Foreigner, Immigrant are some examples of Individual Types. These can be defined by the country in Masterdata are required by them. The Global Admin can view list of all the defined Individual Types on the Admin UI portal.  The portal shows both activated or deactivated Individual Types. 

####  Create/Update Individual Types 

Using the portal, the Global Admin can create the Individual Type providing the Individual Type name and description if applicable.  A Individual Type needs to be created in both configured Primary and Secondary language. Although the Portal will allow creation of a Individual Type in only primary language but will not allow activation of that Individual Type until data for that Type is not updated for all the languages. A deactivated Individual Type will not show up on the Pre-Registration/Registration Client UI.  While entering the data, the text fields (e.g., Individual Type Name) needs to be manually input in all the languages. After successful creation, a Individual Type code will be generated.

Admin Portal also allows modification of any detail of a Document category . The modification includes either adding the details in another language that were missed during creation of the Document category or changing the details of a Document category itself including name, description etc.

####  View List of Holidays 

List of Holiday defines all the public holiday a applicable for a country. These holidays are on of the criteria for Pre-Registration to generate appointments. The holidays only define the public holidays and not the week-end days for the country. The Global Admin can view list of all the defined Holidays on the Admin UI portal.  The portal shows both activated or deactivated Holidays. The Admin can filter the list of Holidays based on Status (Drop-down), Date Range (Search Box) and Name (Search Box).

#### Create/Update Holidays 

Using the portal, the Global Admin can create a Holiday providing the Document Category name, date, location, and description if applicable.  A Holiday  needs to be created in both configured Primary and Secondary language. Although the Portal will allow creation of a Holiday  in only primary language but will not allow activation of that Holiday  until data for that Holiday is not updated for all the languages. A deactivated Holiday will not be considered for appointment generation in Pre-Registration While entering the data, the text fields (e.g., Holiday Name) needs to be manually input in all the languages. After successful creation, a Holiday ID will be generated.

Admin Portal also allows modification of any detail of a Holiday. The modification includes either adding the details in another language that were missed during creation of the Holiday or changing the details of a Holiday itself including name, description etc.

####  View List of Templates 

List of Templates contains all the notification templates used by MOSIP to send notifications to the Users or Residents. This notification includes OTP notification, Acknowledgment Notifications etc. Even acknowledgement shown on the Pre-Registration UI is defined in the template Masterdata. Each template in the Masterdata has a description defined for it which indicates as to where the template is being used in MOSIP. The Global Admin can view list of all the defined Holidays on the Admin UI portal.  The portal shows both Activated or Deactivated Templates. The Admin can filter the list of Templates based on Status (Drop-down), Name (Search Box), Module Name (Drop-down) and Module ID (Drop-down).

####  Create/Update Templates 

Using the portal, the Global Admin can create a Template providing the Template name, Template Text, Template type and description if applicable.  A Template  needs to be created in both configured Primary and Secondary language. Although the Portal will allow creation of a Template  in only primary language but will not allow activation of that Template until data for that Template is not updated for all the languages. A deactivated Template will not be used thorughout MOSIP.  While entering the data, the text fields (e.g., Template Name) needs to be manually input in all the languages. After successful creation, a Template ID will be generated.

Admin Portal also allows modification of any detail of a Template. The modification includes either adding the details in another language that were missed during creation of the Template  or changing the details of a Template itself including name, description etc.

#### View Titles 

List of Titles contains all the salutations defined by a country in all the country defined languages. The Global Admin can view list of all the defined Holidays on the Admin UI portal.  The portal shows both Activated or Deactivated Titles. The Admin can filter the list of Titles based on Status (Drop-down).

####  Create/Update a Title 

Using the portal, the Global Admin can create the Title providing the Title name and description if applicable.  A Title needs to be created in both configured Primary and Secondary language. Although the Portal will allow creation of a Title in only primary language but will not allow activation of that Title until data for that Title is not updated for all the languages.  While entering the data, the text fields (e.g., Title Name) needs to be manually input in all the languages. After successful creation, a Title code will be generated.

Admin Portal also allows modification of any detail of a Title . The modification includes either adding the details in another language that were missed during creation of the Title or changing the details of a Title itself including name, description etc.

####  View Gender Types 

List of Gender Types contains all the Gender types defined by a country. The Global Admin can view list of all the defined Genders on the Admin UI portal.  The portal shows both Activated or Deactivated Gender types.

#### Create/Update Gender Types 

Using the portal, the Global Admin can create a Gender Type providing the Gender Type nameand description if applicable. A Gender Type needs to be created in both configured Primary and Secondary language. Although the Portal will allow creation of a Gender Type in only primary language but will not allow activation of that Gender Type until data for that Gender Type is not updated for all the languages. A deactivated Gender Type will not show up on the Pre-Registration/Registration Client UI.  While entering the data, the text fields (e.g., Gender Type Name) needs to be manually input in all the languages. After successful creation, a Gender Type code will be generated.

Admin Portal also allows modification of any detail of a Gender Type. The modification includes either adding the details in another language that were missed during creation of the Gender Type or changing the details of a Gender Type itself including name, description etc.

# UIN Activation/Deactivation 

Using the portal, a Global Admin can activate or deactivate a UIN based on the request by the UIN holder for any reason. The Admin have to provide a UIN/VID and a valid reason for deactivating the UIN. A standard set of reasons will be defined by the country. While Activation/Deactivation of a UIN, all the VIDs linked that UIN will also be activated/deactivated based on the request. the Admin can choose to send notification to the applicant whose UIN is activated/deactivated. Moreover, the admin can also choose to send notification to an additional recipient by giving the recipient's email id or mobile number or both.  

# Packet Status Check (based on RID) 

A Registration packet generated in Registration Client is sent to Registration Processor for further processing and UIN generation.  Using the Portal, A Zonal Admin can view the status of a packet by giving the RID of the packet. The packet status will contain all the stages the packet has passed through along with the last stage the packet is in. In case the packet has not been processed or is marked for Re-Send/Re-Register, the admin will be able to view specific comments indicating the reason for that particular status.

# Device Provider Management 

All the bio-metric devices which will be used for Authentication and Registration needs to be registered with MOSIP. Unless these devices are not registered, they cannot be used for capturing resident Bio-metrics for registrations or authentication.

For managing these devices, MOSIP needs to store details of following four entities:
1. Device Provider
1. Foundational Trust Providers
1. MOSIP Complaint MDS services
1. Biometric Devices (Registered and White-listed)

## Device Providers (Create/Update) 

Device Providers are the vendors supplying devices for Registration or Authentication. This device provides are needed to be registered before the devices of this providers are getting registered. 

An MOSIP Administrator can register each Device Provider with MOSIP by storing the attributes Vendor Name, Vendor Address, Contact Number, Email, Status (Active/Inactive) and Certificate Alias. The status of a Device Provider is automatically marked as ‘Active’ during the creation. After successful registration, a unique Device Provider ID is generated by MOSIP for each device provider. In case a device provider is getting registered with an already existing name and address, Admin portal won’t allow the creation of such a Provider.

Admin portal will also allow an Admin to update details of the Device Provider including the Name, Address, Contact Details and Status. Changing the status from Active to Inactive will render that provider inactive and any biometric received from a device of such a provider will fail the validation checks and thus rejecting the Auth/Registration request. Any creation and modification in the details of a Device Providers is maintained in a history table to future references.

## Foundational Trust Providers (Create/Update) 

MOSIP will use two types of devices. L0 devices (encryption is done on the host machine device driver or the MOSIP device service) and L1 (capable of performing encryption in device’s trusted module). A Foundational Trust Provider provides this module which is then put in the L1 devices during manufacturing. These Foundational Trust Providers are identified before-hand and are registered with MOSIP. 

An MOSIP Administrator can register each Foundational Trust Provider with MOSIP by storing the attributes Trust Providers Name, Trust Providers Address, Contact Number, Email, Status (Active/Inactive) and Certificate Alias. The status of a Foundational Trust Provider is automatically marked as ‘Active’ during the creation. After successful registration, a unique Foundational Trust Provider ID is generated by MOSIP for each Foundational Trust Provider. In case a Foundational Trust Provider is getting registered with an already existing name and address, Admin portal won’t allow the creation of such a Trust Provider.

Admin portal will also allow an Admin to update details of the Foundational Trust Provider including the Name, Address, Contact Details and Status. Any creation and modification in the details of a Foundational Trust Providers is maintained in a history table to future references.

## MOSIP Complaint MDS services (Create/Update) 

Every Registration/Auth Device needs to use a MDS (MOSIP Device Service) to communicate with MOSIP. Each MDS needs to be registered before-hand with the MOSIP.  A MOSIP Administrator can register each MDS with MOSIP by storing the attributes Software Version, Provider ID, Device Type Code, Device Sub-Type, Make, Model, Software Created Date, Software Expiry Date and Software’s Binary hash. The status of a MDS is automatically marked as ‘Active’ during the creation. After successful registration, a unique Service ID is generated by MOSIP for each MDS. 

There will always be a unique service ID of an MDS against a unique combination of a Software Version, Provider ID, Device Type, Device Sub Type, Make and Model. Thus, no two MDS can exist with same above-mentioned combination. 
Admin portal will also allow an Admin to update details of an MDS. Any creation and modification in the details of a MDS is maintained in a history table to future references.

##  Devices (Register/De-Register) 

Devices are categorized in two types based on the usage. Registration Devices (used during registrations in Registration Client) and Auth Devices (used during authentication through Partners). Before being used, these devices are needed to be registered in MOSIP using the Register/De-Register API.

The Device is needed to be registered with the following attributes.

1. Device ID – Mandatory
1. Purpose – [Registration or Auth
1. Device Sub Ids - (optional)
1. Signed Digital ID
1. Firmware
1. Device Expiry - (optional)
1. Certification Level – L0 or L1
1. Timestamp - ISO format date time with time-zone
1. Foundational Trust provider ID - Required only if certification level received is L1

Digital ID will be a signed base64 encoded Json Object. It will be decoded and stored in the Registered Device Table once the signature is validated with the root certificate issued to each Device Provider (for L0 devices) or Foundational Trust Provider (for L1 devices). 

Registration Device can only be registered if they exist in the list of white-listed devices.  Once a device is registered, a unique device code is generated for each device. For Registration devices, the code comes from the white-list table.

Once the device is registered, there details should not be changed. However, an Admin can change the status of the device. The device can have three different statuses: Registered, Retired, and Revoked. Once retired, a device can be re-registered by updating the its status, although same is not the case of Revoked devices as they cannot be re-registered once revoked. Any creation and modification in the details of a Device is maintained in a history table to future references.


##  Device Detail Validation 

Device Provider Management also provides an API to validate device details during Authentication in IDA or during packet validation in Registration Processor.

The API receives Device Code, Digital ID, and MDS Service Version and validates the following conditions.
1. The Device exist and is ‘Registered’ and ‘Active’
2. The Device is not Revoked or Retired
3. The Device Provider exist and is 'Active’
4. The MDS service against he software version is in the list and is marked ‘Active’
5. The MDS Software version matches against the Device Type, Device Sub Type, Make, Model and Provider ID of the device as received in input as part of Digital ID
6. The Device Code received matches against the Make, Model, Device Type, Device Sub Type, Serial Number, Provider Name and Provider ID of the device which received as part of Digital ID

For validation in IDA, the API checks the current status of the details, But for validation in Registration processor, API checks the status of details as on the packet generation date and time. For this, the API additionally receives packet generation timestamp.

# Multi-language Support 

## i18N

Admin portal provides support for multiple languages which can be configured by a country. The portal can support two languages one of which will be primary and another a secondary language. Both can be configured as per the Country’s requirements. The portal will render all the functionalities (View, Create and Update) in two languages thus allowing the Admin to access these functionality in both the languages simultaneously. Although the Home page, Labels and certain functionalities like ‘Viewing Packet Status based on RID’ will only be rendered in the primary language.

If a Country wants to use only one language in MOSIP, both primary and secondary language must be configured as the same language. If configured, the portal will render the screens in only one configured language. Although to be noted, both the primary and secondary languages must be configured. If not, The portal won’t allow the Admin to login and will be shown a message saying “The system has encountered a technical error. Administrator to setup the necessary language configuration(s)".
