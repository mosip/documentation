# Audit Manager
The Audit Manager in MOSIP captures all the information about the actions performed by various MOSIP applications. This information can further be used for data analysis which will help in inspecting, cleansing, transforming, and modeling data to discovering useful information, informing conclusions, and decision-making.

## Audit Log Parameters
The following parameters are captured as a part of the audit service, 

Parameters | Description | Example
-----------|-------------|----------
**Event ID** | The ID of the Event that triggered for which the audit action has happened | 
**Event Type** | Type of event that triggered the audit log | System, User  
**Event Name** | Name of the event | Create, Register, Update, Processing
**Log Description** | Detailed description of the audit event captured | 
**Module ID** | Application Module ID that triggered for which the audit action has happened | 
**Module Name** | Name of the application module | Packet Service, Resident Service, and MISP Management Service)
**Ref ID** | Reference ID for any cross-reference purpose relevant for audit tracking | userid, rid, prid, app id, app or module id, etc.
**Ref ID Type** | Type of reference id entered |
**Application ID** | Application Id of audit action happened and logged | 
**Application Name** | Name of the application | Admin, Resident Services, Partner Management etc.

## Application Specific Audit Details

* [Admin Service Audits](audits/Admin-Service-Audits.md)
* [Resident Service Audits](audits/Resident-Service-Audits.md)
* [Partner Management Audits](audits/Partner-Management-Audits.md)
* [Registration Client Audits](audits/Registration-Client-Audits.md)
* [Registration Processor Audits](audits/Registration-Processor-Audits.md)
* [ID Repository Audits](audits/ID-Repository-Audits.md)
* [ID Authentication Audits](audits/ID-Authentication-Audits.md)
* [Pre-registration Audits](audits/Pre-Registration-Audits.md)

## Abbreviations
Abbreviation | Definition
-------------|-------------
ADM | Admin
AUTH | Authentication
BLK	| Bulk
EVT | Event
EXPT | Export
MISP | MOSIP Infrastructure Service Provider
NAV | Navigation
PKT	| Packet
PMS | Partner Management System
PRT | Partner
RES	| Resident
RID	| Registration ID
SCH | Scheduler
SYNC | Synchronization
UIN	| Unique Identification Number
UPL | Upload
VID	| Virtual ID
