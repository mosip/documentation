# Administration

## Overview
The MOSIP platform is configured via the Admin application. This application can be accessed only by the privileged group of administration personnel. 
Admin module provides the following functions: 
1. Management of resources via CRUD operations:
    1. Zone 
    1. Center (registration centers)
    1. Device
    1. Machine
    1. Users (Admin, registration staff)
1. Registration administration
    1. Packet status 
    1. Retrieve lost RID
    1. Resume RID

TODO: add any functionality

TODO: Diagram

## Administrative zones

* Administrative Zones are virtual boundaries which a country can define to better manage their resources that are used during registrations. These resources includes Centers, Users, Machines and Devices. These zones can be defined in a hierarchical fashion and a country can allocate resources to such zones based on their requirements.
* Resources under each zone is managed by a *Zonal Admin*. This is done by assigning an Administrative zone to the Zonal Admin during user creation. 
* These Zonal Admins can exist at any zonal hierarchy. (For e.g, a Zonal Admin can directly be mapped to the whole country as a Zone or can be mapped to a significantly smaller zone such as a city). Thus, these resources when mapped to an Administrative Zone can only be managed by the Admin of that Zone.

## Activate/deactivate/decommission resources

### What is deactivation of a resource?
* Deactivation refers to a temporary shutdown. This means that the resource will not be available for use unless and until it is activated later through the admin portal as required by the country.

### What is decommissioning a resource?
* Decommission refers to a permanent shut down of the resource. This also automatically deactivates it. 
* The primary difference being that a decommissioned resource cannot be bought into commission again as decommission refers to a permanent shutdown.
* Also, in cases where a center has some resources mapped to it (e.g. machines, devices or users), the portal will not allow the admin to decommission such a center.

 *Note- Activation/Deactivation/Decommission of a center in one language will be applied to the same center created in all the languages.*

## Services
1. [Admin Service]()
2. [Hotlist Service]()
3. [kernel Masterdata Service]()
4. [Kernel Syncdata Service]()

## Frontend - Admin portal
Reference implementation of Admin portal is available in ref impl repo.

To know more, refer to the Admin portal user guide.

## Build and Deploy
Build and deploy instructions available in the above repositories.

