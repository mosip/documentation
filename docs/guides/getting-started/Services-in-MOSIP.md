This document defines the public and private services of MOSIP.

**Public Services**: MOSIP services available to the general public and can be accessed by UI or user token.

**Private Services**: MOSIP services available for service to service call and should be accessed by service token or restricted user.

MOSIP Service | Private Service | Public Service
--------------|-----------------|----------------
Admin   /Bulk Upload | <img src='_images/tick.png' width=48 height=48 /> |  
Admin   /Login | <img src='_images/tick.png' width=48 height=48 /> |  
Admin   /AuditManager | <img src='_images/tick.png' width=48 height=48 /> |  
Admin   /PacketUpdateStatus | <img src='_images/tick.png' width=48 height=48 /> |  
Commons   /PacketReader-Writer | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /AuditManager | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /AuthManager | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /Login | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /Refresh |   | <img src='_images/tick.png' width=48 height=48 />
Kernel   /Jasperreport | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /ClientCrypto | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /CryptoManager | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /KeyManager | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /LicenceKey | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /PartnerCertManager | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /Signature | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /TokenIDGenerator | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /ZKCryptoManager | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /ApplicantType | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /ApplicantValidDocument | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /Application | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /BiometricAttribute | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /BiometricType | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /BlacklistedWords | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /Device | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /DeviceHistory | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /DeviceProvider | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /DeviceProviderManagement | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /DeviceRegister | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /DeviceSpecification | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /DeviceType | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /DocumentCategory | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /DocumentType | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /DynamicField | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /ExceptionalHoliday | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /FoundationalTrustProvider | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /GenderType |   | <img src='_images/tick.png' width=48 height=48 />
Kernel   /Holiday |   | <img src='_images/tick.png' width=48 height=48 />
Kernel   /IdType | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /IndividualType |   | <img src='_images/tick.png' width=48 height=48 />
Kernel   /Language |   | <img src='_images/tick.png' width=48 height=48 />
Kernel   /Location |   | <img src='_images/tick.png' width=48 height=48 />
Kernel   /LocationHierarchy | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /Machine | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /MachineHistory | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /MachineSpecification | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /MachineType | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /Module | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /MOSIPDeviceService | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /PacketRejectionReason | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /RegisteredDevice | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /RegistrationCenter | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /RegistrationCenterDevice | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /RegistrationCenterHistory | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /RegistrationCenterType | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /RegistrationCenterUserMachineHistory | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /Schema | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /Template |   | <img src='_images/tick.png' width=48 height=48 />
Kernel   /TemplateFileFormat | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /TemplateType |   | <img src='_images/tick.png' width=48 height=48 />
Kernel   /Title |   | <img src='_images/tick.png' width=48 height=48 />
Kernel   /UserDetailsHistory | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /ValidDocument | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /WorkingDay | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /Zone | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /EmailNotification | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /SmsNotification | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /OtpGenerator | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /OtpValidator | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /RidGenerator | <img src='_images/tick.png' width=48 height=48 /> |  
Kernel   /SyncData | <img src='_images/tick.png' width=48 height=48 /> |  
ID Authentication   /AuditTest | <img src='_images/tick.png' width=48 height=48 /> |  
ID Authentication   /Test | <img src='_images/tick.png' width=48 height=48 /> |  
ID Authentication   /CredentialIssueanceCallback | <img src='_images/tick.png' width=48 height=48 /> |  
ID Authentication   /Cryptomanager | <img src='_images/tick.png' width=48 height=48 /> |  
ID Authentication   /InternalAuth | <img src='_images/tick.png' width=48 height=48 /> |  
ID Authentication   /InternalAuthTxn | <img src='_images/tick.png' width=48 height=48 /> |  
ID Authentication   /InternalOTP | <img src='_images/tick.png' width=48 height=48 /> |  
ID Authentication   /InternalUpdateAuthType | <img src='_images/tick.png' width=48 height=48 /> |  
ID Authentication   /Keymanager | <img src='_images/tick.png' width=48 height=48 /> |  
ID Authentication   /Signature | <img src='_images/tick.png' width=48 height=48 /> |  
ID Authentication   /WebSub | <img src='_images/tick.png' width=48 height=48 /> |  
ID Authentication   /KycAuth |   | <img src='_images/tick.png' width=48 height=48 />
ID Authentication   /OTP |   | <img src='_images/tick.png' width=48 height=48 />
ID Authentication   /Auth |   | <img src='_images/tick.png' width=48 height=48 />
ID Authentication   /StaticPin |   | <img src='_images/tick.png' width=48 height=48 />
ID Authentication   /VID |   | <img src='_images/tick.png' width=48 height=48 />
ID Repository   /BiometricExtractor | <img src='_images/tick.png' width=48 height=48 /> |  
ID Repository   /CredentialRequestGenerator | <img src='_images/tick.png' width=48 height=48 /> |  
ID Repository   /CredentialStore | <img src='_images/tick.png' width=48 height=48 /> |  
ID Repository   /ID Repository | <img src='_images/tick.png' width=48 height=48 /> |  
ID Repository   /Vid | <img src='_images/tick.png' width=48 height=48 /> |  
Partner Management Service   /Misp |   | <img src='_images/tick.png' width=48 height=48 />
Partner Management Service   /PartnerManagement |   | <img src='_images/tick.png' width=48 height=48 />
Partner Management Service   /DeviceDetail |   | <img src='_images/tick.png' width=48 height=48 />
Partner Management Service   /FTPChipDetail |   | <img src='_images/tick.png' width=48 height=48 />
Partner Management Service   /RegisteredDevice |   | <img src='_images/tick.png' width=48 height=48 />
Partner Management Service   /SecureBiometricInterface | <img src='_images/tick.png' width=48 height=48 /> |  
Partner Management Service   /PartnerService |   | <img src='_images/tick.png' width=48 height=48 />
Partner Management Service   /PolicyManagement |   | <img src='_images/tick.png' width=48 height=48 />
Pre Registration   /Demographic |   | <img src='_images/tick.png' width=48 height=48 />
Pre Registration   /Document |   | <img src='_images/tick.png' width=48 height=48 />
Pre Registration   /GenerateQRcode |   | <img src='_images/tick.png' width=48 height=48 />
Pre Registration   /Login |   | <img src='_images/tick.png' width=48 height=48 />
Pre Registration  /Notification |   | <img src='_images/tick.png' width=48 height=48 />
Pre Registration   /Transliteration |   | <img src='_images/tick.png' width=48 height=48 />
Pre Registration   /Booking |   | <img src='_images/tick.png' width=48 height=48 />
Pre Registration   /Captcha |   | <img src='_images/tick.png' width=48 height=48 />
Pre Registration   /DataSync | <img src='_images/tick.png' width=48 height=48 /> |  
Registration Processor   /BioDedupe | <img src='_images/tick.png' width=48 height=48 /> |  
Registration Processor   /RegistrationStatus | <img src='_images/tick.png' width=48 height=48 /> |  
Registration Processor   /RegistrationSync | <img src='_images/tick.png' width=48 height=48 /> |  
Registration Processor   /PrintApi |   | <img src='_images/tick.png' width=48 height=48 />
Registration Processor   /RegistrationTransaction | <img src='_images/tick.png' width=48 height=48 /> |  
Registration Processor   /External |   | <img src='_images/tick.png' width=48 height=48 />
Registration Processor   /QCUsers | <img src='_images/tick.png' width=48 height=48 /> |  
Registration Processor   /QualityChecker | <img src='_images/tick.png' width=48 height=48 /> |  
Resident Services  /Resident |   | <img src='_images/tick.png' width=48 height=48 />
Resident Services  /ResidentVid |   | <img src='_images/tick.png' width=48 height=48 />
