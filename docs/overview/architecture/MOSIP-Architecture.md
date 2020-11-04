# Design choices

The MOSIP architecture decisions have been based on the [Guiding Principles](Architecture-Principles.md) defined in the charter. The design choices are in line with the need for modularity, loose coupling and scalability of it components, and being API first.
* Micro-service based architecture for all platform services for modularity and scalability.
* Staged Event Driven Architecture (SEDA) for processing Registration data for extensibility.
* Thick client architecture for the registration client to support offline operations as well as process security.


The sections below provide different views of the logical architecture of MOSIP.

# Functional Architecture

From a MOSIP perspective, several actors are involved in the ID system.
* The **Individual** or the **Resident** is the at the center of it all. It is their identity that the system deals with.
* The **Officer** is a representative of the ID issuer. There are several specialized roles for the officer.
    * The **Operator** assists the individual during registration.
    * The **Supervisor** verifies and attests exceptional cases in registration.
    * The **Adjudicator** carries out manual verification or comparison of individual's data in the ID issue process.
    * The **Auditor** performs audit or forensic analysis of specific enrollments.
    * The **Administrator** is a super user who manages the configuration data of the system.
* The **Partner** represents a 3rd party service or application that interacts with MOSIP. There are specialized partners in the ecosystem.
    * The **Relying Party** is an **Authentication Partner** who relies on the ID system for their business transaction. This could be a social scheme for benefits disbursement or a bank for opening accounts.
    * The **Credential Provider** is a print service provider for credential issue.
    * The **Device Provider** is a partner who provides biometric devices.
    * The **FTM Provider** is a partner who provides foundational trust modules for devices.
    * The **Partner Application** is a system that relies on MOSIP or one that MOSIP relies on. This could be a CRVS system or a Functional ID system such a Passport or a Drivers License.
    * The **ID System** is a system that MOSIP integrates with for inter-operable ID 

The diagram shows the functional architecture of MOSIP with the actors.

![](_images/arch_diagrams/mosip_functional_architecture_v1.png)


# Modular Architecture

Mosip has several modules that offer related functionality. These include the core modules of
* Pre-registration
* Registration client
* Registration processor
* ID Repository
* Authentication
* Resident Services

and the support modules 
* Partner Management
* Administration
* Reporting

**Note**: All user interface modules are reference implementations and can be uses as is, refactored or customized or replaced with alternative implementations in the actual deployment.

The diagram below show the various modules of mosip with their respective service bouquets and their interaction.

![](_images/arch_diagrams/mosip_logical_architecture_v1.png)

