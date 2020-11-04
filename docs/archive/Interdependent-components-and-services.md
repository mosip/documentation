## ID Repository

* id-repository-identity-service

	 *  Kernel-auditmanager-service in Kernel module.
	 *  Kernel-auth-service in Kernel module.
	 *  Kernel-config-server  in Kernel module.
	 *  Kernel-cryptomanager-service in Kernel module.
	 *  Kernel-masterdata-service in Kernel module.
	 
* id-repository-vid-service
	 *  Kernel-auditmanager-service in Kernel module. 
	 *  Kernel-auth-service in Kernel module. 
	 *  Kernel-config-server in Kernel module. 
	 *  Kernel-cryptomanager-service in Kernel module. 
	 *  Kernel-masterdata-service in Kernel module. 
	 *  Kernel-vidgenerator-service in Kernel module. 
	 *  id-repository-identity-service in ID Repository module. 
	 
	 
## ID Authentication

* authentication-internal-service
	 
	 *  Kernel-auditmanager-service in Kernel module.  
	 *  id-repository-identity-service in ID Repository module.  
	 *  id-repository-vid-service in ID Repository module.  
	 *  Kernel-otpmanager-service in Kernel module.  
	 *  Kernel-cryptomanager-service in Kernel module.  
	 *  Kernel-masterdata-service in Kernel module.  
	 *  Kernel-auth-service in Kernel module.  
	 *  Kernel-signature-service in Kernel module.  

* authentication-otp-service
	 
	 *  Kernel-auditmanager-service in Kernel module.  
	 *  Kernel-auth-service in Kernel module.  
	 *  id-repository-identity-service in ID Repository module.  
	 *  id-repository-vid-service in ID Repository module.  
	 *  Kernel-cryptomanager-service in Kernel module.  
	 *  kernel-otpmanager-service in Kernel module.  
	 *  kernel-signature-service in Kernel module.  

* authentication-kyc-service
	 
	 *  Kernel-auditmanager-service in Kernel module.  
	 *  id-repository-identity-service in ID Repository module.  
	 *  id-repository-vid-service in ID Repository module.  
	 *  Kernel-otpmanager-service in Kernel module.  
	 *  Kernel-cryptomanager-service in Kernel module.  
	 *  kernel-tokenidgenerator-service in Kernel module.  
	 *  kernel-signature-service in Kernel module.  
	 *  kernel-masterdata-service in Kernel module.  
	 
* authentication-service
	 
	 *  Kernel-auditmanager-service in Kernel module.  
	 *  id-repository-identity-service in ID Repository module.  
	 *  id-repository-vid-service in ID Repository module.  
	 *  Kernel-otpmanager-service in Kernel module.  
	 *  kernel-smsnotification-service in Kernel module.  
	 *  kernel-emailnotification-service in Kernel module.  
	 *  kernel-cryptomanager-service in Kernel module.  
	 *  kernel-tokenidgenerator-service in Kernel module.  
	 *  kernel-masterdata-service in Kernel module. 
	 *  kernel-signature-service in Kernel module.
	 
	 
## Registration Processor

* registration-processor-packet-receiver-stage

     *  cryptomanager/decrypt in Kernel module.
     *  auditmanager/audits in Kernel module. 

* registration-processor-packet-uploader-stage

     *  cryptomanager/decrypt in Kernel.
     *  auditmanager/audits in Kernel.

* registration-processor-packet-validator-stage

     *  maserdata in Kernel module
     *  idrepository module all services.
     *  auditmanager/audits in Kernel module
     *  preregistration/v1/sync/consumedPreRegIds in pre-registration module

* registration-processor-osi-validator-stage

     *  maserdata in Kernel module
     *  idrepository module all services.
     *  auditmanager/audits in Kernel module
* registration-processor-manual-verification-stage
    *  maserdata in Kernel module
    * signature/sign in Kernel module
* registration-processor-biometric-authentication-stage
     *  idrepository module all services.
     *  auditmanager/audits in Kernel module
* registration-processor-uin-generator-stage
     * uingenerator/uin   in Kernel module
     *  idrepository module all services.
     *  auditmanager/audits in Kernel module
* registration-processor-printing-stage
     *  idrepository module all services.
     *  auditmanager/audits in Kernel module
* registration-processor-demo-dedupe-stage
     *  idrepository module all services.
     *  auditmanager/audits in Kernel module

## Pre-registration

The dependent services for Pre-registration are mentioned below:

* pre-registration-login-service
	 
     *  Kernel-auditmanager-service in Kernel module. 
     *  Kernel-auth-service in Kernel module. 
     *  Kernel-config-server in Kernel module. 

* pre-registration-demographic-service

     *  Kernel-auditmanager-service in Kernel module.
     *  Kernel-auth-service in Kernel module. 
     *  Kernel-config-server  in Kernel module. 
     *  Kernel-cryptomanager-service in Kernel module. 
     *  Kernel-masterdata-service in Kernel module. 
     *  Kernel-pridgenerator-service in Kernel module. 
	 
* pre-registration-document-service
	 
     *  Kernel-auditmanager-service in Kernel module. 
     *  Kernel-auth-service in Kernel module. 
     *  Kernel-config-server in Kernel module. 
     *  Kernel-cryptomanager-service in Kernel module. 
     *  Kernel-masterdata-service in Kernel module. 

* pre-registration-booking-service
	 
     *  Kernel-auditmanager-service in Kernel module. 
     *  Kernel-auth-service in Kernel module. 
     *  Kernel-config-server in Kernel module.  
     *  Kernel-masterdata-service in Kernel module. 

* pre-registration-notification-service
	 
     *  Kernel-auditmanager-service in Kernel module. 
     *  Kernel-auth-service in Kernel module. 
     *  Kernel-config-server in Kernel module. 
     *  Kernel-cryptomanager-service in Kernel module. 
     *  Kernel-masterdata-service in Kernel module. 
     *  Kernel-emailnotification-service in Kernel module. 
     *  Kernel-smsnotification-service in Kernel module. 

* pre-registration-datasync-service
	 
     *  pre-registration-demographic-service in pre-reg module. 
     *  pre-registration-document-service in pre-reg module. 
     *  pre-registration-booking-service in pre-reg module. 
     *  Kernel-auditmanager-service in Kernel module. 
     *  Kernel-auth-service in Kernel module. 
     *  Kernel-config-server in Kernel module. 

* pre-registration-generateqrcode-service
	 
     *  Kernel-auditmanager-service in Kernel module. 
     *  Kernel-auth-service in Kernel module. 
     *  Kernel-config-server in Kernel module.  

* pre-registration-tranlitration-service

     *  Kernel-config-server in Kernel module.  

* pre-registration-batchjob

     *  pre-registration-notification-service in pre-reg module.
     *  pre-registration-booking-service in pre-reg module.
     *  Kernel-auditmanager-service in Kernel module. 
     *  Kernel-auth-service in Kernel module. 
     *  Kernel-config-server in Kernel module. 
     *  Kernel-masterdata-service in Kernel module.

## Admin

* admin-service
     * Kernel-masterdata-service in Kernel module.
     * Kernel-auditmanager-service in Kernel module.
     * Kernel-auth-service in Kernel module.
     * Kernel-config-server in Kernel module.  
     * Registration-transaction-service in Registration-Processor module

## Resident Services

* resident-services

     * registration-processor-registration-status-service in Registration Processor module.
     * registration-processor-print-service in Registration Processor.
     * registration-processor-request-handler-service in Registration Processor
     * Kernel-cryptomanager-service in Kernel module.
     * Kernel-auth-service in Kernel module.
     * Kernel-config-server  in Kernel module.
     * authentication-internal-service in IDA module.
     * authentication-otp-service in IDA module.
     * Kernel-masterdata-service in Kernel module.
     * idrepository module all services.
     * Kernel-emailnotification-service in Kernel module.
     * Kernel-smsnotification-service in Kernel module.

## Registration client

* Registration client application 

     * Kernel-auth-service in Kernel module.
     * kernel-syncdata-service in Kernel module. 

## Kernel

* For the services in Kernel module have to run, following services are necessary, 

     * Kernel-auditmanager-service in Kernel module.
     * Kernel-auth-service in Kernel module.
     * Kernel-config-server in Kernel module.
     * Kernel-cryptomanager-service in Kernel module.