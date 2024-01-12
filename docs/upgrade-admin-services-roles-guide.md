# Adapting Changes in Administration Roles

Below is the list of admin roles:

* GLOBAL\_ADMIN
* ZONAL\_ADMIN
* REGISTRATION\_ADMIN
* MASTERDATA\_ADMIN
* KEY\_MAKER

| GLOBAL\_ADMIN                                                            | ZONAL\_ADMIN                                                             | REGISTRATION\_ADMIN                                                      | MASTERDATA\_ADMIN                                                 | KEY\_MAKER                                                               |
| ------------------------------------------------------------------------ | ------------------------------------------------------------------------ | ------------------------------------------------------------------------ | ----------------------------------------------------------------- | ------------------------------------------------------------------------ |
| <mark style="background-color:green;">Centers</mark>                     | <mark style="background-color:green;">Centers</mark>                     | <mark style="background-color:green;">Packet Status</mark>               | <mark style="background-color:green;">Devices</mark>              | <mark style="background-color:green;">GenerateMasterKey</mark>           |
| <mark style="background-color:green;">User Zone Mapping</mark>           | <mark style="background-color:green;">Devices</mark>                     | <mark style="background-color:green;">Pause/ Resume RID</mark>           | <mark style="background-color:green;">Machines</mark>             | <mark style="background-color:blue;">GenerateCSR</mark>                  |
| <mark style="background-color:green;">All Master Data</mark>             | <mark style="background-color:green;">Machines</mark>                    | <mark style="background-color:green;">Retrieve Lost RID</mark>           | <mark style="background-color:green;">All Master Data</mark>      | <mark style="background-color:blue;">GetCertificate</mark>               |
| <mark style="background-color:green;">Masterdata Bulk Upload</mark>      | <mark style="background-color:green;">User Zone Mapping</mark>           | <mark style="background-color:green;">Packet Bulk Upload</mark>          | <mark style="background-color:red;">Masterdata Bulk Upload</mark> | <mark style="background-color:blue;">UploadCertificate</mark>            |
| <mark style="background-color:red;">Packet Bulk Upload</mark>            | <mark style="background-color:green;">User Center Mapping</mark>         | <mark style="background-color:red;">UploadCertificate</mark>             | <mark style="background-color:red;">GenerateCSR</mark>            | <mark style="background-color:blue;">UploadOtherDomainCertificate</mark> |
| <mark style="background-color:red;">GenerateCSR</mark>                   | <mark style="background-color:green;">All Master Data</mark>             | <mark style="background-color:red;">Upload OtherDomainCertificate</mark> | <mark style="background-color:blue;">Devices</mark>               |                                                                          |
| <mark style="background-color:red;">GetCertificate</mark>                | <mark style="background-color:green;">Masterdata Bulk Upload</mark>      |                                                                          | <mark style="background-color:blue;">Machines</mark>              |                                                                          |
| <mark style="background-color:red;">UploadCertificate</mark>             | <mark style="background-color:red;">GenerateCSR</mark>                   |                                                                          |                                                                   |                                                                          |
| <mark style="background-color:red;">Upload OtherDomainCertificate</mark> | <mark style="background-color:red;">UploadCertificate</mark>             |                                                                          |                                                                   |                                                                          |
|                                                                          | <mark style="background-color:red;">Upload OtherDomainCertificate</mark> |                                                                          |                                                                   |                                                                          |
|                                                                          | <mark style="background-color:red;">Packet Bulk Upload</mark>            |                                                                          |                                                                   |                                                                          |

Here:

<mark style="color:green;">**Green**</mark>- colored represent persisted roles.

<mark style="color:blue;">**Blue**</mark>- colored cells represent newly added roles.

<mark style="color:red;">**Red**</mark>- colored cells represent removed roles.

**How to adjust the role accessibilities for existing users after upgrading to 1.2.0.1-x from 1.1.5.5-P1?**

For a user having `GLOBAL_ADMIN` role:

* If a GLOBAL\_ADMIN user is performing Certificate related operations then KEY\_MAKER role need to be added to that user.
* If a GLOBAL\_ADMIN user is performing Packet Bulk Upload then REGISTRATION\_ADMIN role need to be added to that user.

For a user having `ZONAL_ADMIN` role:

* If a ZONAL\_ADMIN user is performing Certificate related operations then KEY\_MAKER role need to be added to that user.
* If a ZONAL\_ADMIN user is performing Packet Bulk Upload then REGISTRATION\_ADMIN role need to be added to that user.

For a user having `REGISTRATION_ADMIN` role:

* If a REGISTRATION\_ADMIN user is performing Certificate related operations then KEY\_MAKER role need to be added to that user.

For a user having `MASTERDATA_ADMIN` role:

* If a MASTERDATA\_ADMIN user is performing GenerateCSR then KEY\_MAKER role need to be added to that user.
* If a MASTERDATA \_ADMIN user is performing Packet Bulk Upload then REGISTRATION\_ADMIN role need to be added to that user.

**Note**: A few new permissions were added to MASTERDATA\_ADMIN and KEY\_MAKER roles, please refer to the above role matrix table and if there is any inconsistency in the accessibility or roles of existing user, please reassign the roles to the user accordingly.
