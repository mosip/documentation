# Admin services role accessibility management guide

Below is the list of admin roles:

* GLOBAL\_ADMIN
* ZONAL\_ADMIN
* REGISTRATION\_ADMIN
* MASTERDATA\_ADMIN
* KEY\_MAKER

| GLOBAL\_ADMIN          | ZONAL\_ADMIN           | REGISTRATION\_ADMIN | MASTERDATA\_ADMIN      | KEY\_MAKER                   |
| ---------------------- | ---------------------- | ------------------- | ---------------------- | ---------------------------- |
| Centers                | Devices                | Packet Status       | Devices                | GenerateMasterKey            |
| User Zone Mapping      | Machines               | Pause/ Resume RID   | Machines               | GenerateCSR                  |
| All Master Data        | User Zone Mapping      | Retrieve Lost RID   | All Master Data        | GetCertificate               |
| Masterdata Bulk Upload | User Center Mapping    | Packet Bulk Upload  | Masterdata Bulk Upload | UploadCertificate            |
|                        | All Master Data        |                     |                        | UploadOtherDomainCertificate |
|                        | Masterdata Bulk Upload |                     |                        |                              |

Here:

  Green-colored represent persisted roles.

  Blue-colored cells represent newly added roles.

  Red-colored cells represent removed roles.

**How to adjust the role accessibilities for existing users after upgrading to 1.2.0.1-x from 1.1.5.5-P1?**

 For a user having `GLOBAL_ADMIN` role:

 * If a GLOBAL_ADMIN user is performing Certificate related operations then KEY_MAKER role need to be added to that user.

 * If a GLOBAL_ADMIN user is performing Packet Bulk Upload then REGISTRATION_ADMIN role need to be added to that user.
 

 For a user having `ZONAL_ADMIN` role:

 * If a ZONAL_ADMIN user is performing Certificate related operations then KEY_MAKER role need to be added to that user.

 * If a ZONAL_ADMIN user is performing Packet Bulk Upload then REGISTRATION_ADMIN role need to be added to that user.

 
 For a user having `REGISTRATION_ADMIN` role:

 * If a REGISTRATION_ADMIN user is performing Certificate related operations then KEY_MAKER role need to be added to that user.

 For a user having `MASTERDATA_ADMIN` role:

 * If a MASTERDATA_ADMIN user is performing GenerateCSR then KEY_MAKER role need to be added to that user.
 
 * If a MASTERDATA _ADMIN user is performing Packet Bulk Upload then REGISTRATION_ADMIN role need to be added to that user.

 
**Note**: A few new permissions were added to MASTERDATA_ADMIN and KEY_MAKER roles, please refer to the above role matrix table and if there is any inconsistency in the accessibility or roles of existing user, please reassign the roles to the user accordingly.

 
