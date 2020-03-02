# Architecture Principles
[Architecture Principles](MOSIP-Architecture-Principles)

# Modules
* [Pre-Registration](Pre-Registration)
* [Registration](Registration-Client)
* [Registration Processor](Registration-Processor)
* [ID Authentication](ID-Authentication)
* [Resident Services](Resident-Services)
* [Partner Management](Partner-Management)
* [Admin](Admin)

# Functional Architecture
![](_images/arch_diagrams/MOSIP_functional_architecture.png)

# Logical Architecture
![](_images/arch_diagrams/MOSIP_logical_architecture_v0.1.png)

# Data Architecture
[MOSIP Data Architecture](https://github.com/mosip/documentation/wiki/MOSIP-Data-Architecture)

# Design choices
* Microservice based architecture for all platform services for modularity and scalability.
* Staged Event Driven Architecture (SEDA) for processing Registration data for extensibility.
* Thick client architecture for Registration client
