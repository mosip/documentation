This document contains the list of known issues that were identified as part of MOSIP LTS Pre-release 1 during our testing cycle.

* This release doesn't have any upgrade scripts, hence, upgrading from 1.1.5 to LTS Pre-release 1 is not possible. For now, this release is made for a fresh installation only.
* Infant demographic data update is not possible as part of this release.
* In this release generation of temporary VIDs for children is not possible
* Demographic update via resident service APIs is not possible.
* In the admin portal has multiple issues, 
    * Packet status is not working
    * The user can view centres from zones to which he/she doesn't belong, which might lead to issues while updating the centre details.
    * When a user is mapped to a centre & zone, the user-centre mapping is active but user-zone mapping is in-active.
    * When the mapping for a user is being removed then the user-centre mapping is removed but the user-zone mapping remains as-is.
    * Packet upload through the admin portal is not working
    * The feature to clone data is not working in the admin portal
    * Key manager UI in admin portal has few issues