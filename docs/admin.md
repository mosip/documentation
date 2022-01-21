# Administration

## Overview
The MOSIP platform is configured via the Admin application. This is a web-based application used by a privileged group of administrative personnel to manage master data, resources, etc. When the MOSIP platform gets initialized, some of the default configurations and master data seeded. 

Admin application contains UI layer and Service layer. All the components in both Services and UI are secure and authenticated. For example, if a component's data is not supposed to be viewed except authorized personnel, no user will be able to view it. Hence, the same is followed for creating, editing and deleting functionalities(CRUD).

Admin portal supports multiple languages. An admin user can login with their preferred language amongst the list of languages configured by the country.

In MOSIP, a country is assumed to be divided into Zones and further into sub-zones to ensure that the zonal and sub-zonal data is handled by authoritative personnel belonging to that particular zone. Hierarchical zones enable you to establish **parent-child zone** relationships, allowing the zonal data to be inherited down the zone hierarchy.

Post setup, the following operations can be done using the Admin application:

* Master Data management
* User Zone and User Center Mappings 
* Bulk operations
* Packet Status check

### Types of Master Data with their relationships 

Relationship diagram

Data Relationship 
Explain type of data and roles required to manage them
By default, the system provides the roles mentioned below

## Services

Kernel Master Data Service
Admin Service

## Frontend - Admin portal
Reference implementation of Admin portal is available in ref impl repo.

To know more, refer to the Admin portal user guide.

## Build and Deploy
Build and deploy instructions available in the above repositories.

