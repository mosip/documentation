MOSIP offers high configurability to customise and deploy for a country. Many components are available out of the box.  However, for a specific deployment certain customisations and additions may be needed as follows:
1. ID Object
    1. [Definition](https://github.com/mosip/documentation/wiki/MOSIP-ID-Object-Definition)
    1. [Schema](https://github.com/mosip/mosip-config/blob/master/config-templates/mosip-identity-json-schema-env.json)
    1. Schema and field custom validations on Reg Client and Reg Processor. [(Ref validator)](https://github.com/mosip/mosip-ref-impl/tree/master/kernel/kernel-ref-idobjectvalidator)  

1. Languages
   1. Defining primary and secondary languages
   1. Transliteration libraries integration in Reg Client
   1. Messaging templates (master data and configuration files)

1. Master Data: Country specific master data 

1. Adding/modifying Reg Processor flow 
   1. Adding a new stage (e.g. fetch data from CRVS system). [(Camel configurations)](https://github.com/mosip/mosip-config/blob/master/config-templates)
   1. Remove or re-arrange the stages 
   1. Demographic dedup logic

1. [Configurations](https://github.com/mosip/mosip-config/blob/master/config-templates/)

1. Registration Client App
   1. Fields as per ID Object
   1. Labels in preferred languages
   1. Field validations
   1. Screen flow changes
   1. Integration with MDS

1. Residents Portal: UI implementation

1. Admin portal: UI modifications (if needed) 

1. Integration with external components
    1. Virus scanner 
    1. ABIS 
    1. Bio SDK (in Reg Client and Reg Proc)
    1. Manual Adjudication
    1. IAM (OAuth 2.0 compliant)
    1. HSM
    1. Postal service
    1. Email/SMS gateway

## FAQ
### What's there in MOSIP and what's not
|Features|Present in MOSIP?|Comments
|---|---|---|
|UIN Generator|Yes||
|Token Generator|Yes||
|Partner Management|Yes|[APIs](https://github.com/mosip/documentation/wiki/Partner-Management-Service-APIs) available.  Portal to be created by SI|
|Device Management|Yes|Admin portal allows managing registered devices. Device registration API is available. Device vendor to provide Device Management Server which takes care of registering devices and Key rotation|
|SMS Notification|Yes|Interface available.  SMS Gateway/service to be provided by SI|
|Email Notification|Yes|Interface available.  SMS Gateway/service to be provided by SI|
|Audit Trail|Yes||
|Technical Help Desk|No||
|Customer Relationship Management|No||
|Backup/Restore Management|No||
|Manual Adjudication|No|APIs available to retrieve data and approve/reject a packet when a Biometric Duplicate is found|
|Manual Verification|No||
|Analytics|No||
|Authentication OTP|Yes||
|Authentication Biometrics|Yes||
|Knowledge Management System|No||
|Payment Gateway|No||
|Card Production|No||
|Card Management|No| Implementation available for sending cards in queue to print and forward to postal system|
|Fraud Management|No||
|Supporting Document Retrieval|No|Registration processor may be customized for the same|
|Token Management at Registration Center|No||
|Registration of Pre-registered/Appointment|Yes|If MOSIP PreReg module is deployed|
|UIN Retrieval (Lost UIN)|Yes||
|Update of Demographic Information|Yes||
|Update of Biometric data|Yes||
|Grievance Reporting|No||
|Lock UIN against Auth|Yes||
|Transaction History Generator|No|Audit logs, DB records, and Resident Services APIs available|
|Enrollment Status/Update|Yes|[Resident Services APIs](https://github.com/mosip/documentation/wiki/Resident-Service-APIs) available.  Portal to be made by SI|
|Payment Gateway|No||
|Mobile/Table Registration App|No||
|Virus Scanner|No|Integration hooks provided. SI to procure and integrate|