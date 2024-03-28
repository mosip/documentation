# Data-Model

This section contains details related to MOSIP data model design.The section also provides the data dictionary of the tables and columns defined by MOSIP databases.

### Data Model Considerations

* **Meaningful Naming:** DB objects that are being created will have a meaningful naming.
* **Flexible model:** No business rules are set at the database level other than few mapping data. Most of the business logic is applied at application layer.
* **Database specific features:** Use of DB specific features like defaults, DB sequences, identify fields are not used
* **No business logic at DB:** No business logic implemented at database level other than PK, UK, FKs.
* **Data Security:** Individual and security related information is encrypted

### Data Model

Databases inventory in MOSIP



<table><thead><tr><th width="50">Sl No</th><th>Database Name</th><th>Schema Name</th><th>Description</th></tr></thead><tbody><tr><td>1</td><td>mosip_kernel</td><td>kernel</td><td>Kernel database store security key details, data related to kernel services like sync process, OTP, etc.</td></tr><tr><td>2</td><td>mosip_master</td><td>master</td><td>All the master data defined by a country / organization is maintained in mosip_master database.</td></tr><tr><td>3</td><td>mosip_idrepo</td><td>idrepo</td><td>ID repository database stores all the data related to an individual for which an UIN is generated.</td></tr><tr><td>4</td><td>mosip_prereg</td><td>prereg</td><td>Pre-registration database to store the data that is captured as part of pre-registration process and appointments booking.</td></tr><tr><td>5</td><td>mosip_reg</td><td>reg</td><td>Registration client database to capture registration related data. The needed data from MOSIP system will be synched with this database.</td></tr><tr><td>6</td><td>mosip_regprc</td><td>regprc</td><td>The data related to Registration process flows and transaction will be maintained in this database.</td></tr><tr><td>7</td><td>mosip_ida</td><td>ida</td><td>ID Authentication related requests, transactions will be stored in this database</td></tr><tr><td>8</td><td>mosip_audit</td><td>audit</td><td>Audit related logs collected from all modules are stored in this database</td></tr><tr><td>9</td><td>mosip_credential</td><td>credential</td><td>Credential request from MOSIP applications related entities and its data is stored in this database</td></tr><tr><td>10</td><td>mosip_idmap</td><td>idmap</td><td>Database to store and manage all the data related to mapping between various IDs, like vid with UIN of an individual</td></tr><tr><td>11</td><td>mosip_keymgr</td><td>keymgr</td><td>Key Manager database maintains common system configurations, data related to key services like encryption, decryption keys, certificates..etc</td></tr><tr><td>12</td><td>mosip_regdevice</td><td>regdevice</td><td>Database to store all registration device management data, look-up data, configuration data, metadata...etc.</td></tr><tr><td>13</td><td>mosip_authdevice</td><td>authdevice</td><td>Database to store all partner authentication device management data, look-up data, configuration data, metadata...etc</td></tr><tr><td>14</td><td>mosip_pms</td><td>pms</td><td>Partner Management Service related entities and its data is stored in this database</td></tr></tbody></table>

