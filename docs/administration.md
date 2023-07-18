# Administration

## Overview
The MOSIP platform is configured via the Admin application. This application can be accessed only by a privileged group of administration personnel.
The admin module provides the following functions:
1. Management of resources via CRUD operations:
    1. Zone 
    1. Centers (registration centers)
    1. Device
    1. Machine
    1. Users (Admin, registration staff)
1. Registration administration
    1. Packet status 
    1. Retrieve lost RID
    1. Resume RID

## Administrative zones

* Administrative zones are virtual boundaries which a country can define to better manage their resources that are used during registrations. These resources includes Centers, Users, Machines and Devices. These zones can be defined in a hierarchical fashion and a country can allocate resources to such zones based on their requirements.
* Resources under each zone is managed by a *Zonal Admin*. This is done by assigning an Administrative zone to the Zonal Admin during user creation. 
* These Zonal Admins can exist at any zonal hierarchy. (For e.g, a Zonal Admin can directly be mapped to the whole country as a Zone or can be mapped to a significantly smaller zone such as a city). Thus, these resources when mapped to an Administrative zone can only be managed by the Admin of that zone.

## Activate/deactivate/decommission resources

### What is deactivation of a resource?
Deactivation refers to a temporary shutdown. This means that the resource will not be available for use unless and until it is activated later through the admin portal as required by the country.

### What is decommissioning a resource?
* Decommission refers to a permanent shut down of the resource. This also automatically deactivates it. 
* The primary difference being that a decommissioned resource cannot be bought into commission again as decommission refers to a permanent shutdown.
* Also, in cases where a center has some resources mapped to it (e.g. machines, devices or users), the portal will not allow the admin to decommission such a center.

 *Note- Activation/Deactivation/Decommission of a center in one language will be applied to the same center created in all the languages.*

## Services
1. [Admin Service](https://github.com/mosip/admin-services/tree/release-1.2.0/admin/admin-service)
2. [Hotlist Service](https://github.com/mosip/admin-services/tree/release-1.2.0/admin/hotlist-service)
3. [kernel Masterdata Service](https://github.com/mosip/admin-services/tree/release-1.2.0/admin/kernel-masterdata-service)
4. [Kernel Syncdata Service](https://github.com/mosip/admin-services/tree/release-1.2.0/admin/kernel-syncdata-service)

## Frontend- Admin portal
Reference implementation of the Admin portal is available in [admin-ui](https://github.com/mosip/admin-ui/tree/master) repository.

To know more, refer to the [Admin portal user guide](admin-portal-user-guide.md).

## Developer Guide

To know more about the setup, read [Admin Services Developer's Guide](https://docs.mosip.io/1.2.0/modules/administration/admin-services-developers-guide).

## API
Refer [API Documentation](https://mosip.github.io/documentation/1.2.0/1.2.0.html).

## Source code 
[Github repo](https://github.com/mosip/admin-services/tree/release-1.2.0).
