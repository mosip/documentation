# Administration

## Overview
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

## Activate/deactivate/decommission resources

### Deactivation
* Temporary shutdown/ of a resource
tivation  refers to a temporary shut down while decommission refers to a permanent shut down of the center. 
* Decommissioning a center also automatically deactivates the center. In cases where a center has some resources mapped to it (e.g. machines, devices or users), the portal will not allow the admin to decommission such a center.
* The primary difference between *deactivated* and *decommissioned* center is that a deactivated center can be activated later through admin portal as required by the country. But a decommissioned center cannot be bought into commission again as decommission refers to a permanent shutdown.
* Activation/Deactivation/Decommission of a center in one language will be applied to the same center created in all the languages.

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

