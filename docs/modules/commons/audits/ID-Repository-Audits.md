ID Repository contains the record of identity for an individual, and provides API based mechanism to store, retrieve and update identity details by other MOSIP modules.

# ID Repository Service
The ID Repository functionality will store identity data and documents and also retrieve stored identity details by UIN or VID upon receiving the request.

## User Event Type
The following events are triggered as part of System Event Type in ID Repository Service module

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | IDR-001 | System | Create Identity Request and Response | This event triggers an API call to create the requested identity. | Registration ID | Registration ID
2 | IDR-002 | System | Update Identity Request and Response | This event triggers an API call to update the requested identity. | Registration ID | Registration ID
3 | IDR-003 | System | Retrieve Identity Request and Response with UIN | This event triggers an API call to retrieve the requested identity for the UIN. | UIN | UIN
4 | IDR-004 | System | Retrieve Identity Request and Response with RID | This event triggers an API call to retrieve the requested identity for the RID. | Registration ID | Registration ID
5 | IDR-005 | System | Create VID | This event triggers an API call to create a VID requested for the VID type. | UIN | UIN
6 | IDR-006 | System | Retrieve VID | This event triggers an API call to retrieve the UIN by the VID requested. | VID | VID
7 | IDR-007 | System | Revoke VID | This event triggers an API call to revoke the VID requested. | VID | VID
8 | IDR-008 | System | Regenerate VID | This event triggers an API call to regenerate the VID requested. | VID | VID
9 | IDR-009 | System | Update VID status | This event triggers an API call to update the requested VID status. | VID | VID
10 | IDR-010 | System | Deactivate VID | This event triggers an API call to deactivate the VID requested. | UIN | UIN
11 | IDR-011 | System | Reactivate VID | This event triggers an API call to reactivate the VID requested. | UIN | UIN
12 | IDR-012 | System | Retrieve UIN | This event triggers an API call to retrieve the VID's based on the UIN requested. | UIN | UIN
13 | IDR-013 | System | Create Credential Request | This event triggers an API call to create a credential request for the partner. | ID | ID
14 | IDR-014 | System | Cancel Credential Request| This event triggers an API call to cancel a credential request for the partner. | ID | ID
15 | IDR-015 | System | Create Credential | This event triggers an API call to create the credentials for the partner. | ID | ID

16 | IDR-016 | System | Update authentication type status | This event triggers an API call to update the authentication type status to either true or false.| UIN | UIN
17 | IDR-017 | System | Update Credential Request | This event triggers an API call to update the credential request for the partner. | ID | ID