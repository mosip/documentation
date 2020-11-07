This document defines the public and private services of MOSIP.

**_Public_ _Services_**: MOSIP services available to the general public and can be accesed by UI or user token.

**_Private_ _Services_**: MOSIP services available for service to service call and should be accesed by service token or restricted user.

MOSIP Service | Private Service | Public Service
--------------|-----------------|----------------
Admin   /Bulk Upload | ![](_images/tick.png) |  
Admin   /Login | ![](_images/tick.png) |  
Admin   /AuditManager | ![](_images/tick.png) |  
Admin   /PacketUpdateStatus | ![](_images/tick.png) |  
Commons   /PacketReader-Writer | ![](_images/tick.png) |  
Kernel   /AuditManager | ![](_images/tick.png) |  
Kernel   /AuthManager | ![](_images/tick.png) |  
Kernel   /Login | ![](_images/tick.png) |  
Kernel   /Refresh |   | ![](_images/tick.png)
Kernel   /Jasperreport | ![](_images/tick.png) |  
Kernel   /ClientCrypto | ![](_images/tick.png) |  
Kernel   /CryptoManager | ![](_images/tick.png) |  
Kernel   /KeyManager | ![](_images/tick.png) |  
Kernel   /LicenceKey | ![](_images/tick.png) |  
Kernel   /PartnerCertManager | ![](_images/tick.png) |  
Kernel   /Signature | ![](_images/tick.png) |  
Kernel   /TokenIDGenerator | ![](_images/tick.png) |  
Kernel   /ZKCryptoManager | ![](_images/tick.png) |  
Kernel   /ApplicantType | ![](_images/tick.png) |  
Kernel   /ApplicantValidDocument | ![](_images/tick.png) |  
Kernel   /Application | ![](_images/tick.png) |  
Kernel   /BiometricAttribute | ![](_images/tick.png) |  
Kernel   /BiometricType | ![](_images/tick.png) |  
Kernel   /BlacklistedWords | ![](_images/tick.png) |  
Kernel   /Device | ![](_images/tick.png) |  
Kernel   /DeviceHistory | ![](_images/tick.png) |  
Kernel   /DeviceProvider | ![](_images/tick.png) |  
Kernel   /DeviceProviderManagement | ![](_images/tick.png) |  
Kernel   /DeviceRegister | ![](_images/tick.png) |  
Kernel   /DeviceSpecification | ![](_images/tick.png) |  
Kernel   /DeviceType | ![](_images/tick.png) |  
Kernel   /DocumentCategory | ![](_images/tick.png) |  
Kernel   /DocumentType | ![](_images/tick.png) |  
Kernel   /DynamicField | ![](_images/tick.png) |  
Kernel   /ExceptionalHoliday | ![](_images/tick.png) |  
Kernel   /FoundationalTrustProvider | ![](_images/tick.png) |  
Kernel   /GenderType |   | ![](_images/tick.png)
Kernel   /Holiday |   | ![](_images/tick.png)
Kernel   /IdType | ![](_images/tick.png) |  
Kernel   /IndividualType |   | ![](_images/tick.png)
Kernel   /Language |   | ![](_images/tick.png)
Kernel   /Location |   | ![](_images/tick.png)
Kernel   /LocationHierarchy | ![](_images/tick.png) |  
Kernel   /Machine | ![](_images/tick.png) |  
Kernel   /MachineHistory | ![](_images/tick.png) |  
Kernel   /MachineSpecification | ![](_images/tick.png) |  
Kernel   /MachineType | ![](_images/tick.png) |  
Kernel   /Module | ![](_images/tick.png) |  
Kernel   /MOSIPDeviceService | ![](_images/tick.png) |  
Kernel   /PacketRejectionReason | ![](_images/tick.png) |  
Kernel   /RegisteredDevice | ![](_images/tick.png) |  
Kernel   /RegistrationCenter | ![](_images/tick.png) |  
Kernel   /RegistrationCenterDevice | ![](_images/tick.png) |  
Kernel   /RegistrationCenterHistory | ![](_images/tick.png) |  
Kernel   /RegistrationCenterType | ![](_images/tick.png) |  
Kernel   /RegistrationCenterUserMachineHistory | ![](_images/tick.png) |  
Kernel   /Schema | ![](_images/tick.png) |  
Kernel   /Template |   | ![](_images/tick.png)
Kernel   /TemplateFileFormat | ![](_images/tick.png) |  
Kernel   /TemplateType |   | ![](_images/tick.png)
Kernel   /Title |   | ![](_images/tick.png)
Kernel   /UserDetailsHistory | ![](_images/tick.png) |  
Kernel   /ValidDocument | ![](_images/tick.png) |  
Kernel   /WorkingDay | ![](_images/tick.png) |  
Kernel   /Zone | ![](_images/tick.png) |  
Kernel   /EmailNotification | ![](_images/tick.png) |  
Kernel   /SmsNotification | ![](_images/tick.png) |  
Kernel   /OtpGenerator | ![](_images/tick.png) |  
Kernel   /OtpValidator | ![](_images/tick.png) |  
Kernel   /RidGenerator | ![](_images/tick.png) |  
Kernel   /SyncData | ![](_images/tick.png) |  
ID Authentication   /AuditTest | ![](_images/tick.png) |  
ID Authentication   /Test | ![](_images/tick.png) |  
ID Authentication   /CredentialIssueanceCallback | ![](_images/tick.png) |  
ID Authentication   /Cryptomanager | ![](_images/tick.png) |  
ID Authentication   /InternalAuth | ![](_images/tick.png) |  
ID Authentication   /InternalAuthTxn | ![](_images/tick.png) |  
ID Authentication   /InternalOTP | ![](_images/tick.png) |  
ID Authentication   /InternalUpdateAuthType | ![](_images/tick.png) |  
ID Authentication   /Keymanager | ![](_images/tick.png) |  
ID Authentication   /Signature | ![](_images/tick.png) |  
ID Authentication   /WebSub | ![](_images/tick.png) |  
ID Authentication   /KycAuth |   | ![](_images/tick.png)
ID Authentication   /OTP |   | ![](_images/tick.png)
ID Authentication   /Auth |   | ![](_images/tick.png)
ID Authentication   /StaticPin |   | ![](_images/tick.png)
ID Authentication   /VID |   | ![](_images/tick.png)
ID Repository   /BiometricExtractor | ![](_images/tick.png) |  
ID Repository   /CredentialRequestGenerator | ![](_images/tick.png) |  
ID Repository   /CredentialStore | ![](_images/tick.png) |  
ID Repository   /ID Repository | ![](_images/tick.png) |  
ID Repository   /Vid | ![](_images/tick.png) |  
Partner Management Service   /Misp |   | ![](_images/tick.png)
Partner Management Service   /PartnerManagement |   | ![](_images/tick.png)
Partner Management Service   /DeviceDetail |   | ![](_images/tick.png)
Partner Management Service   /FTPChipDetail |   | ![](_images/tick.png)
Partner Management Service   /RegisteredDevice |   | ![](_images/tick.png)
Partner Management Service   /SecureBiometricInterface | ![](_images/tick.png) |  
Partner Management Service   /PartnerService |   | ![](_images/tick.png)
Partner Management Service   /PolicyManagement |   | ![](_images/tick.png)
Pre Registration   /Demographic |   | ![](_images/tick.png)
Pre Registration   /Document |   | ![](_images/tick.png)
Pre Registration   /GenerateQRcode |   | ![](_images/tick.png)
Pre Registration   /Login |   | ![](_images/tick.png)
Pre Registration  /Notification |   | ![](_images/tick.png)
Pre Registration   /Transliteration |   | ![](_images/tick.png)
Pre Registration   /Booking |   | ![](_images/tick.png)
Pre Registration   /Captcha |   | ![](_images/tick.png)
Pre Registration   /DataSync | ![](_images/tick.png) |  
Registration Processor   /BioDedupe | ![](_images/tick.png) |  
Registration Processor   /RegistrationStatus | ![](_images/tick.png) |  
Registration Processor   /RegistrationSync | ![](_images/tick.png) |  
Registration Processor   /PrintApi |   | ![](_images/tick.png)
Registration Processor   /RegistrationTransaction | ![](_images/tick.png) |  
Registration Processor   /External |   | ![](_images/tick.png)
Registration Processor   /QCUsers | ![](_images/tick.png) |  
Registration Processor   /QualityChecker | ![](_images/tick.png) |  
Resident Services  /Resident |   | ![](_images/tick.png)
Resident Services  /ResidentVid |   | ![](_images/tick.png)
