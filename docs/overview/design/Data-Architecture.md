## Data Architecture Principles
MOSIP deals with sensitive information pertaining to the identity of people. It is a central repository of identity data and extra attention is paid to ensure the security and privacy of this data. MOSIP advocates minimalism in the data collected and incorporates features to minimise interpretation of this data as information. A low to zero knowledge design paradigm is used to achieve this.

## Data Sets in MOSIP
* Master Data - This includes lookups, locations, centers, devices, zones etc. This is not sensitive information
* Configuration Manager Data - This includes system configuration information and must be protected. It does not contain any personal information. 
* Registration Client Database - This is a local database in the registration client. This contains local copies of the relevant master data, downloaded pre-registration information and some transactional information. The pre-registration information is sensitive and is encrypted and stored.
* Registration Packets - Registration packets are created and encrypted in memory on the registration client and then persisted in the encrypted form. The sync process moves these packets to the server for processing. These packets are the source of truth and are digitally signed.
* Registration Processor Database -  The registration processor contains transactional information of the RIDs being processed and do not contain any personal information.
* ID Repository Entries - ID Repository contains the identity data. This includes the biographic/demographich information and the biometric information. The actual storage of these is distributed between RDBMS and object storage.
* Authentication Entries - It has encrypted records with one way linkage to the ID using cryptography. The information can be decrypted for return as part of KYC response. Biometrics stored here are only non-reversible extracts. A low-resolution photograph can be stored for KYC purposes.
* Partner Management Data - This contains protected information such as the API Key and Public Key of the partner. There is not personal information here.
* Audit Trail - This does not contain any personal information. It does contain transaction id for traceability.
* Application Logs - These logs do not contain any personal information.
* Resident Services Data - This has transaction history with ID numbers, but does not contain any personal information.
* Pre Registration Data - This has personal information and is stored in an encrypted form.
* IAM Data - The mosip system user list is present here and this is protected information as it controls access to the system.

## Data Storage Guidelines
* PII of an individual like name, age, gender, address etc... and other sensitive information must be signed and stored in an encrypted form.
* Documents and images must not be stored in a database table. They must be stored in a object store and referenced in DB.
* Object store should have only encrypted data present in it with access control.
* No business logic applied at database level, only Primary, Unique, foreign keys and not-null are applied. Foreign keys are applied within the same database, if a table is referenced in another database then no FK is applied.
* Database specific features like triggers, DB functions like sequence generators etc.… must not be used in MOSIP. This avoids vendor lock-in
* Surrogate key, wherever used, must be a random number and not be generated based on the record data or sequence number.
* Direct queries on the database by a human must not be made. Database administrators must ensure this control during database configuration setup
* Database is setup in UTF-8*** file format to support multiple languages
* Following data types are used
	* Character Varying
    * Timestamp
    * Date
    * Integer
    * Number
    * Bytea/blob
    * Boolean

## Logical view of MOSIP data system

![](_images/arch_diagrams/mosip_data_architecture_v1.jpg)

## Access Control to Data
In MOSIP, the following users are defined to perform various activities and have control over the DB objects that are defined
* **sysadmin:** sysadmin user is a super administrator role, who will have all the privileges to perform any task within the database. Currently all the objects are being owned by sysadmin.
* **dbadmin:** dbadmin user is created to handle all the database administration activities like monitoring, performance tuning, backups, restore, replication setup, etc.
* **appadmin:** appadmin user is used to perform all the DDL tasks. All the db objects that are created in these databases will be owned by appadmin user.
* **Application User:** Each module will have a user created to perform DML tasks like CRUD operations. Will have masteruser, prereguser, idauser, idrepouser, idmapuser, kerneluser, audituser, regprcuser, keymgruser, regdeviceuser, authdeviceuser to perform tasks in respective modules.

{% hint style="info" %}
From the above set of roles only application user is specific to a module. The other users are common which needs to be created per PostgreSQL db instance.
{% endhint %}

## Multi-Language
MOSIP platform is being built for multiple countries, there is a need to support multiple languages. So as per the requirements, MOSIP will support multiple languages as configured by the country level administrator. Multi language support is needed for the following datasets. 
* Master Data
* ID data of an individual
* Transaction comments
* Labels used in UI
* Messages and notifications

From database side, the data will support **UTF-8 Unicode character set** to store data entered in multiple languages. 

There will not be any in-built support to translate data at database level. Any translation or transliteration will be handled at API or UI layer. Internationalization support is available to handle multiple language needs in the user interface and communication templates. For master data the information can be stored in multiple languages. For user data MOSIP supports storage of data in two languages.

## Performance
To support performance, following database design features are to be considered
* Database sharding: By default, sharding algorithm is not applied in MOSIP system. SI can define the sharding algorithm based on the deployment setup
* All tables will have a primary key index on the primary key field. This will help in faster retrievals and joins
* All foreign keys will have indexes defined so that it will help in faster joins
* No referential integrity is applied on tables across databases
* Partitioning: Partitioning design is database-specific. Depending upon the chosen database,  the  country may employ the partitioning approach as prescribed by the database engine"
* Data in object stores should be easily addressable with hierarchical path conventions

## Data Model Consideration
* **Meaningful Naming:** DB objects that are being created will have a meaningful naming.
* **Flexible model:** No business rules are set at database level other than few mapping data. Most of the business logic is applied at application layer.
* **Database specific features:** Use of DB specific features like defaults, DB sequences, identify fields are not used.
* **No business logic at DB:** No business logic implemented at database level other than PK, UK, FKs. 
* **Data Security:** Individual and security related information is encrypted.
