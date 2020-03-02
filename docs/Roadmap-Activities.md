# MOSIP Roadmap
As of Feb 2020

The Roadmap consists of 5 bucket of features that we want to develope and contribute over the coming year: Functionality, Modularity, Testing, Security and Scale.

## Functionality
* **Master Data sync**: allow different installations to have their own master data, and sync is without code changes with the Registration Cient
* **Interoperatbility of MOSIP auth** with other instances (eIDAS Connector). Support for credential management.
* **Configurable UI**: A simple UI for the Human User Facing API of MOSIP that responds to changes in configuration as without need for reprogramming.
* **Mobile App**:
   * Android Reg Client
   * IOS Reg Client
   * Online Registration
   * Resident app
* **Reporting and Analytics Framework**: to support canned reports and realtime dashboard atop a common data infrastructure.
* Other **Functional Backlog** in Registration Processor, Auth and Admin

## Modularity

* **Data Enrichment Rigidity**: allow data input from existing functional ID systems for verification and / or updation. Currently this mechanism is very fluid, we would like it to be configuration driven with integration hooks at specific points in data processing in Registration Processor.
* **Registration Client refactoring**: into a reference client and platform library.
* **Stubbed config** fixes for untested paths.

## Testing
* **Interface Mutation Test Rig**: automated check of code contribution to check possible interface mutation before merging.
* **Unit mutation testing**: identify the real code coverage using automated mutation of unit tests.

## Security
* Starter **Security Test Rig** : automated known attacks on MOSIP client and server instances. Open ended

## Scale
* **Database Sharding**: ability to continue running the MOSIP DB on commodity hardware as it grows. Covers sharding and resharding strategies.
* **High Availability**: Data store replication
* **Disaster Recovery**: Cross datacenter operations and failover
* **Data Center Ops**: Health and performance monitoring of the infrastructure.

