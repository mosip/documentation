This document contains the features that were developed or enhanced as part of MOSIP 1.1.2 release.

# Commons
* Kernel Log Manager has been modified.
	* Logging framework has been changed from log4j to logback.
	* Spring Sleuth has been integrated in Kernel Log Manager.
* Data Share Module has been added to share data inform of sharable URLs to external entities.
* Packet Manager has been modified to support creating and reading packets as per our new packet structure.
* Multiple adapters (Posix, S3 & Swift) have been added to connect with Object Stores. 
* The passwords in configuration data is now encrypted and stored.
* APIs to add Certificate Authority & Sub-Certificate Authority has been added.
* Kernel Key Manager has been modified.
	* Key Manager related tables have been moved to a new database.
	* Support for Offline encryption & decryption has been added for encryption in Registration Client.
	* Support for PIN based encryption and decryption has been added.
* Integration with multiple Real HSMs was done.
* Web Sub has been added to integrate with external componets like Print & Postal service providers.
* Open ID Adapter was developed, so that MOSIP would be able to connect with any IAM provider.
* Commons repository re-structuring has been done to merge common components.

# Administration
* Feature to upload exported packets from Registration Client has been added.
* Feature to bulk insert, upload or delete - master data using csvs has been added.
* The APIs for Devices, Machines and Users have been modified to support mapping & unmapping of Registration Centers.
* The database for master data has been modified.
	* Unwanted tables have been reviewed to removed.
	* Mapping tables have been removed & one-to-one mappings have been added to respective tables.
	* Device Regitration tables have been moved to new database.

# Pre-registration
* Services in Pre-registration are re-organized to merge common services together.
* Documents are now being stored in Object Store using our new Object Store adapters.
* UI has been modified to resolve usability issues.
	* Support to capture age and date of birth has been added.
	* Calender has been removed for date of birth capture, instead text fields for capturing Date, Month & Year has been added.

# Registration Client
* Packet creation is now being performed using the new Packet Manager.
* Monera library has been added to integrate with any Scanner.
* UI has been modified to resolve usability issues.
	* Back button has been added in login screen to update the username.
	* Biometric capture screens have been updated.
	* UI has been resposive for Single & Multi-language.
	* Templates in Registration Client have been modified.
* Export to Device feature is now available to export packets to external hard drive.
* Direct call to notification service has been removed. Now, notification for registration would be sent to resident when packet reaches the server. 
* Sync data is now being encrypted using TPM.
* Implementation for Proxy MDS has been removed.

# Registration Processor
* Implementation in Registration Processor has been made to read packets using the new Packet Manager.
* Packets are now being stored in Object Store using the object store adapter.
* Biometrics are now being shared to ABIS using a data share URL.
* Data is being sent to Manual Adjudicator using data share URLs.

# ID Repository
* ID Repository has been moved from commons to a new repository.
* Extraction module has been added to extract biometrics into templates using biometric extract SDKs.
* Credential Issuance module has been added to share credentials based on policy.

# Authentication
* Authentication Transaction has been modified to store tokens instead of storing encrypted UIN or VID.
* Implementation has been made to support capture of consent token in header for authentication request.
* Authentication token generation is now driven by authentication policy for the partner.
* Locking/unlocking of authentication for an individual has been moved to ID Repository.
* Integration with Web Sub was done to receive ID details from ID Repository.

# Partner Management
* Partner Management APIs have been created, to support,
	* Self-registration of various types of partners (like, device providers, FTM providers, authentication partners, credential partners, etc.)
	* Device & FTM Make-Model registration.
	* Secure Biometric Interface registration.
	* Approvals of the above by the Partner administrator.
* Policy Management has been modified to support authentication as well as data share policies.

# Resident Services
* Demographic update implementation has been updated to create update packet using the new Packet Manager.
* Credential Issuance has been added using ID Repository's credential issuance module.
* API for verifying the credential issuance and print request status has been added.

# Reporting
* Reference Reporting Framework has been added. It uses the below tool for real-time steaming data and visualization.
	* Postgres for MOSIP data source enabled with binary or write ahead logs
	* Debezium for change data capture from postgres, This is used along with Kafka connect as plugin
	* Kafka connect to connect data source and stream data
	* Kafka server for message broker which will stream data from kafka connect
	* Zookepere for Kafka brokers co-ordination of the jobs
	* Spark streaming to process the data received from kafka topic in real-time
	* Spark uses pyspark for data processing and processing job are written in python.
	* Elastic search as data-index and persistence store
	* Kibana as visualization to create and view dashboards and reports.