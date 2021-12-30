# Overview

Registration Processor is a backend processing engine to enable the ID Lifecycle management. The diagram below shows the Registration Processor along with the other modules that contribute in generating an Unique Identification Number(UIN) for an individual.

![](_images/reg-proc.png)

## Registration Processor functionality
Below are some of the features associated with the Registration Processor

### Functional features
* Processes packets containing individual’s data from multiple sources such as the Registration Client, Resident Services or other external systems
* Performs various validations
* Validates trust and security - Virus checks, machine and device checks
* Validates the identity of the officer and supervisor
* Validates the data received including quality of biometrics captured
* Classifies packets into various groups and has the ability to tag and process them based on a configurable workflow
* Performs uniqueness checks
    * Identifies duplicate applicants - demographic and biographic
    * Works with ABIS for biometric uniqueness check
    * Works with manual adjudication systems for manual deduplication
* Takes Actions on ID
    * Supports ID creation and Issuance, ID update & Lost ID
    * Supports extraction of templates from biometrics images
    * Sends Notifications
* Sends the ID information to external Printing & Delivery System

### Technical features 
* VertX EventBus with lightweight messaging for stages
* An apache camel bridge manages the flow of the packet through the stages
* Each flow has its own camel specification
* Integration stages can be added into the flow as needed
* Failed packets are reprocessed by the flow
* Stages have to be atomic and self-aware, but agnostic of other stages
* No transaction control at the flow level
* Throughput for each stage is decided based on hardware available
* Packets are decrypted in memory and used
* HTTP based stages are possible too

## Stages and services
For a detailed description of Registration processor, refer to [registration repo](https://github.com/pjoshi751/registration/tree/develop)

# Build and deploy
For more information on the build and deployment, refer to [registration processor repo](https://github.com/pjoshi751/registration/tree/develop).

# APIs
For detailed functionality of Registration Processor APIs, refer to [registration APIs](../../../api-reference/Pre-Registration-APIs.md).

# Configurations
For details related to registration processor configurations, refer to [registration processor configurations](https://github.com/pjoshi751/registration/blob/develop/docs/configuration.md).


