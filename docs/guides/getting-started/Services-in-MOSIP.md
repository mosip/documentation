This document defines the public and private services of MOSIP.

**Public Services**: MOSIP services available to the general public and can be accessed by UI or user token.

**Private Services**: MOSIP services available for service to service call and should be accessed by service token or restricted user.

MOSIP Service | Private Service | Public Service
--------------|-----------------|----------------
Admin   /Bulk Upload | <img src='tick.png' width=48 height=48 /> |  
Admin   /Login | <img src='tick.png' width=48 height=48 /> |  
Admin   /AuditManager | <img src='tick.png' width=48 height=48 /> |  
Admin   /PacketUpdateStatus | <img src='tick.png' width=48 height=48 /> |  
Commons   /PacketReader-Writer | <img src='tick.png' width=48 height=48 /> |  
Kernel   /AuditManager | <img src='tick.png' width=48 height=48 /> |  
Kernel   /AuthManager | <img src='tick.png' width=48 height=48 /> |  
Kernel   /Login | <img src='tick.png' width=48 height=48 /> |  
Kernel   /Refresh |   | <img src='tick.png' width=48 height=48 />
Kernel   /Jasperreport | <img src='tick.png' width=48 height=48 /> |  
Kernel   /ClientCrypto | <img src='tick.png' width=48 height=48 /> |  
Kernel   /CryptoManager | <img src='tick.png' width=48 height=48 /> |  
Kernel   /KeyManager | <img src='tick.png' width=48 height=48 /> |  
Kernel   /LicenceKey | <img src='tick.png' width=48 height=48 /> |  
Kernel   /PartnerCertManager | <img src='tick.png' width=48 height=48 /> |  
Kernel   /Signature | <img src='tick.png' width=48 height=48 /> |  
Kernel   /TokenIDGenerator | <img src='tick.png' width=48 height=48 /> |  
Kernel   /ZKCryptoManager | <img src='tick.png' width=48 height=48 /> |  
Kernel   /ApplicantType | <img src='tick.png' width=48 height=48 /> |  
Kernel   /ApplicantValidDocument | <img src='tick.png' width=48 height=48 /> |  
Kernel   /Application | <img src='tick.png' width=48 height=48 /> |  
Kernel   /BiometricAttribute | <img src='tick.png' width=48 height=48 /> |  
Kernel   /BiometricType | <img src='tick.png' width=48 height=48 /> |  
Kernel   /BlacklistedWords | <img src='tick.png' width=48 height=48 /> |  
Kernel   /Device | <img src='tick.png' width=48 height=48 /> |  
Kernel   /DeviceHistory | <img src='tick.png' width=48 height=48 /> |  
Kernel   /DeviceProvider | <img src='tick.png' width=48 height=48 /> |  
Kernel   /DeviceProviderManagement | <img src='tick.png' width=48 height=48 /> |  
Kernel   /DeviceRegister | <img src='tick.png' width=48 height=48 /> |  
Kernel   /DeviceSpecification | <img src='tick.png' width=48 height=48 /> |  
Kernel   /DeviceType | <img src='tick.png' width=48 height=48 /> |  
Kernel   /DocumentCategory | <img src='tick.png' width=48 height=48 /> |  
Kernel   /DocumentType | <img src='tick.png' width=48 height=48 /> |  
Kernel   /DynamicField | <img src='tick.png' width=48 height=48 /> |  
Kernel   /ExceptionalHoliday | <img src='tick.png' width=48 height=48 /> |  
Kernel   /FoundationalTrustProvider | <img src='tick.png' width=48 height=48 /> |  
Kernel   /GenderType |   | <img src='tick.png' width=48 height=48 />
Kernel   /Holiday |   | <img src='tick.png' width=48 height=48 />
Kernel   /IdType | <img src='tick.png' width=48 height=48 /> |  
Kernel   /IndividualType |   | <img src='tick.png' width=48 height=48 />
Kernel   /Language |   | <img src='tick.png' width=48 height=48 />
Kernel   /Location |   | <img src='tick.png' width=48 height=48 />
Kernel   /LocationHierarchy | <img src='tick.png' width=48 height=48 /> |  
Kernel   /Machine | <img src='tick.png' width=48 height=48 /> |  
Kernel   /MachineHistory | <img src='tick.png' width=48 height=48 /> |  
Kernel   /MachineSpecification | <img src='tick.png' width=48 height=48 /> |  
Kernel   /MachineType | <img src='tick.png' width=48 height=48 /> |  
Kernel   /Module | <img src='tick.png' width=48 height=48 /> |  
Kernel   /MOSIPDeviceService | <img src='tick.png' width=48 height=48 /> |  
Kernel   /PacketRejectionReason | <img src='tick.png' width=48 height=48 /> |  
Kernel   /RegisteredDevice | <img src='tick.png' width=48 height=48 /> |  
Kernel   /RegistrationCenter | <img src='tick.png' width=48 height=48 /> |  
Kernel   /RegistrationCenterDevice | <img src='tick.png' width=48 height=48 /> |  
Kernel   /RegistrationCenterHistory | <img src='tick.png' width=48 height=48 /> |  
Kernel   /RegistrationCenterType | <img src='tick.png' width=48 height=48 /> |  
Kernel   /RegistrationCenterUserMachineHistory | <img src='tick.png' width=48 height=48 /> |  
Kernel   /Schema | <img src='tick.png' width=48 height=48 /> |  
Kernel   /Template |   | <img src='tick.png' width=48 height=48 />
Kernel   /TemplateFileFormat | <img src='tick.png' width=48 height=48 /> |  
Kernel   /TemplateType |   | <img src='tick.png' width=48 height=48 />
Kernel   /Title |   | <img src='tick.png' width=48 height=48 />
Kernel   /UserDetailsHistory | <img src='tick.png' width=48 height=48 /> |  
Kernel   /ValidDocument | <img src='tick.png' width=48 height=48 /> |  
Kernel   /WorkingDay | <img src='tick.png' width=48 height=48 /> |  
Kernel   /Zone | <img src='tick.png' width=48 height=48 /> |  
Kernel   /EmailNotification | <img src='tick.png' width=48 height=48 /> |  
Kernel   /SmsNotification | <img src='tick.png' width=48 height=48 /> |  
Kernel   /OtpGenerator | <img src='tick.png' width=48 height=48 /> |  
Kernel   /OtpValidator | <img src='tick.png' width=48 height=48 /> |  
Kernel   /RidGenerator | <img src='tick.png' width=48 height=48 /> |  
Kernel   /SyncData | <img src='tick.png' width=48 height=48 /> |  
ID Authentication   /AuditTest | <img src='tick.png' width=48 height=48 /> |  
ID Authentication   /Test | <img src='tick.png' width=48 height=48 /> |  
ID Authentication   /CredentialIssueanceCallback | <img src='tick.png' width=48 height=48 /> |  
ID Authentication   /Cryptomanager | <img src='tick.png' width=48 height=48 /> |  
ID Authentication   /InternalAuth | <img src='tick.png' width=48 height=48 /> |  
ID Authentication   /InternalAuthTxn | <img src='tick.png' width=48 height=48 /> |  
ID Authentication   /InternalOTP | <img src='tick.png' width=48 height=48 /> |  
ID Authentication   /InternalUpdateAuthType | <img src='tick.png' width=48 height=48 /> |  
ID Authentication   /Keymanager | <img src='tick.png' width=48 height=48 /> |  
ID Authentication   /Signature | <img src='tick.png' width=48 height=48 /> |  
ID Authentication   /WebSub | <img src='tick.png' width=48 height=48 /> |  
ID Authentication   /KycAuth |   | <img src='tick.png' width=48 height=48 />
ID Authentication   /OTP |   | <img src='tick.png' width=48 height=48 />
ID Authentication   /Auth |   | <img src='tick.png' width=48 height=48 />
ID Authentication   /StaticPin |   | <img src='tick.png' width=48 height=48 />
ID Authentication   /VID |   | <img src='tick.png' width=48 height=48 />
ID Repository   /BiometricExtractor | <img src='tick.png' width=48 height=48 /> |  
ID Repository   /CredentialRequestGenerator | <img src='tick.png' width=48 height=48 /> |  
ID Repository   /CredentialStore | <img src='tick.png' width=48 height=48 /> |  
ID Repository   /ID Repository | <img src='tick.png' width=48 height=48 /> |  
ID Repository   /Vid | <img src='tick.png' width=48 height=48 /> |  
Partner Management Service   /Misp |   | <img src='tick.png' width=48 height=48 />
Partner Management Service   /PartnerManagement |   | <img src='tick.png' width=48 height=48 />
Partner Management Service   /DeviceDetail |   | <img src='tick.png' width=48 height=48 />
Partner Management Service   /FTPChipDetail |   | <img src='tick.png' width=48 height=48 />
Partner Management Service   /RegisteredDevice |   | <img src='tick.png' width=48 height=48 />
Partner Management Service   /SecureBiometricInterface | <img src='tick.png' width=48 height=48 /> |  
Partner Management Service   /PartnerService |   | <img src='tick.png' width=48 height=48 />
Partner Management Service   /PolicyManagement |   | <img src='tick.png' width=48 height=48 />
Pre Registration   /Demographic |   | <img src='tick.png' width=48 height=48 />
Pre Registration   /Document |   | <img src='tick.png' width=48 height=48 />
Pre Registration   /GenerateQRcode |   | <img src='tick.png' width=48 height=48 />
Pre Registration   /Login |   | <img src='tick.png' width=48 height=48 />
Pre Registration  /Notification |   | <img src='tick.png' width=48 height=48 />
Pre Registration   /Transliteration |   | <img src='tick.png' width=48 height=48 />
Pre Registration   /Booking |   | <img src='tick.png' width=48 height=48 />
Pre Registration   /Captcha |   | <img src='tick.png' width=48 height=48 />
Pre Registration   /DataSync | <img src='tick.png' width=48 height=48 /> |  
Registration Processor   /BioDedupe | <img src='tick.png' width=48 height=48 /> |  
Registration Processor   /RegistrationStatus | <img src='tick.png' width=48 height=48 /> |  
Registration Processor   /RegistrationSync | <img src='tick.png' width=48 height=48 /> |  
Registration Processor   /PrintApi |   | <img src='tick.png' width=48 height=48 />
Registration Processor   /RegistrationTransaction | <img src='tick.png' width=48 height=48 /> |  
Registration Processor   /External |   | <img src='tick.png' width=48 height=48 />
Registration Processor   /QCUsers | <img src='tick.png' width=48 height=48 /> |  
Registration Processor   /QualityChecker | <img src='tick.png' width=48 height=48 /> |  
Resident Services  /Resident |   | <img src='tick.png' width=48 height=48 />
Resident Services  /ResidentVid |   | <img src='tick.png' width=48 height=48 />
