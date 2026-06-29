# Services in MOSIP

This document defines the public and private services of MOSIP.

**Public Services**: MOSIP services available to the general public and can be accessed by UI or user token.

**Private Services**: MOSIP services available for service to service call and should be accessed by service token or restricted user.

| MOSIP Service                                          |            Private Service           |            Public Service            |
| ------------------------------------------------------ | :----------------------------------: | :----------------------------------: |
| Admin   /Bulk Upload                                   | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Admin   /Login                                         | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Admin   /AuditManager                                  | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Admin   /PacketUpdateStatus                            | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Commons   /PacketReader-Writer                         | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /AuditManager                                 | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /AuthManager                                  | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /Login                                        | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /Refresh                                      |                                      | ![](<.gitbook/assets/tick (97).png>) |
| Kernel   /Jasperreport                                 | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /ClientCrypto                                 | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /CryptoManager                                | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /KeyManager                                   | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /LicenceKey                                   | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /PartnerCertManager                           | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /Signature                                    | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /TokenIDGenerator                             | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /ZKCryptoManager                              | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /ApplicantType                                | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /ApplicantValidDocument                       | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /Application                                  | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /BiometricAttribute                           | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /BiometricType                                | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /BlacklistedWords                             | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /Device                                       | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /DeviceHistory                                | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /DeviceProvider                               | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /DeviceProviderManagement                     | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /DeviceRegister                               | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /DeviceSpecification                          | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /DeviceType                                   | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /DocumentCategory                             | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /DocumentType                                 | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /DynamicField                                 | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /ExceptionalHoliday                           | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /FoundationalTrustProvider                    | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /GenderType                                   |                                      | ![](<.gitbook/assets/tick (97).png>) |
| Kernel   /Holiday                                      |                                      | ![](<.gitbook/assets/tick (97).png>) |
| Kernel   /IdType                                       | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /IndividualType                               |                                      | ![](<.gitbook/assets/tick (97).png>) |
| Kernel   /Language                                     |                                      | ![](<.gitbook/assets/tick (97).png>) |
| Kernel   /Location                                     |                                      | ![](<.gitbook/assets/tick (97).png>) |
| Kernel   /LocationHierarchy                            | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /Machine                                      | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /MachineHistory                               | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /MachineSpecification                         | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /MachineType                                  | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /Module                                       | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /MOSIPDeviceService                           | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /PacketRejectionReason                        | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /RegisteredDevice                             | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /RegistrationCenter                           | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /RegistrationCenterDevice                     | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /RegistrationCenterHistory                    | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /RegistrationCenterType                       | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /RegistrationCenterUserMachineHistory         | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /Schema                                       | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /Template                                     |                                      | ![](<.gitbook/assets/tick (97).png>) |
| Kernel   /TemplateFileFormat                           | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /TemplateType                                 |                                      | ![](<.gitbook/assets/tick (97).png>) |
| Kernel   /Title                                        |                                      | ![](<.gitbook/assets/tick (97).png>) |
| Kernel   /UserDetailsHistory                           | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /ValidDocument                                | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /WorkingDay                                   | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /Zone                                         | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /EmailNotification                            | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /SmsNotification                              | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /OtpGenerator                                 | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /OtpValidator                                 | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /RidGenerator                                 | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Kernel   /SyncData                                     | ![](<.gitbook/assets/tick (97).png>) |                                      |
| ID Authentication   /AuditTest                         | ![](<.gitbook/assets/tick (97).png>) |                                      |
| ID Authentication   /Test                              | ![](<.gitbook/assets/tick (97).png>) |                                      |
| ID Authentication   /CredentialIssueanceCallback       | ![](<.gitbook/assets/tick (97).png>) |                                      |
| ID Authentication   /Cryptomanager                     | ![](<.gitbook/assets/tick (97).png>) |                                      |
| ID Authentication   /InternalAuth                      | ![](<.gitbook/assets/tick (97).png>) |                                      |
| ID Authentication   /InternalAuthTxn                   | ![](<.gitbook/assets/tick (97).png>) |                                      |
| ID Authentication   /InternalOTP                       | ![](<.gitbook/assets/tick (97).png>) |                                      |
| ID Authentication   /InternalUpdateAuthType            | ![](<.gitbook/assets/tick (97).png>) |                                      |
| ID Authentication   /Keymanager                        | ![](<.gitbook/assets/tick (97).png>) |                                      |
| ID Authentication   /Signature                         | ![](<.gitbook/assets/tick (97).png>) |                                      |
| ID Authentication   /WebSub                            | ![](<.gitbook/assets/tick (97).png>) |                                      |
| ID Authentication   /KycAuth                           |                                      | ![](<.gitbook/assets/tick (97).png>) |
| ID Authentication   /OTP                               |                                      | ![](<.gitbook/assets/tick (97).png>) |
| ID Authentication   /Auth                              |                                      | ![](<.gitbook/assets/tick (97).png>) |
| ID Authentication   /StaticPin                         |                                      | ![](<.gitbook/assets/tick (97).png>) |
| ID Authentication   /VID                               |                                      | ![](<.gitbook/assets/tick (97).png>) |
| ID Repository   /BiometricExtractor                    | ![](<.gitbook/assets/tick (97).png>) |                                      |
| ID Repository   /CredentialRequestGenerator            | ![](<.gitbook/assets/tick (97).png>) |                                      |
| ID Repository   /CredentialStore                       | ![](<.gitbook/assets/tick (97).png>) |                                      |
| ID Repository   /ID Repository                         | ![](<.gitbook/assets/tick (97).png>) |                                      |
| ID Repository   /Vid                                   | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Partner Management Service   /Misp                     |                                      | ![](<.gitbook/assets/tick (97).png>) |
| Partner Management Service   /PartnerManagement        |                                      | ![](<.gitbook/assets/tick (97).png>) |
| Partner Management Service   /DeviceDetail             |                                      | ![](<.gitbook/assets/tick (97).png>) |
| Partner Management Service   /FTPChipDetail            |                                      | ![](<.gitbook/assets/tick (97).png>) |
| Partner Management Service   /RegisteredDevice         |                                      | ![](<.gitbook/assets/tick (97).png>) |
| Partner Management Service   /SecureBiometricInterface | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Partner Management Service   /PartnerService           |                                      | ![](<.gitbook/assets/tick (97).png>) |
| Partner Management Service   /PolicyManagement         |                                      | ![](<.gitbook/assets/tick (97).png>) |
| Pre Registration   /Demographic                        |                                      | ![](<.gitbook/assets/tick (97).png>) |
| Pre Registration   /Document                           |                                      | ![](<.gitbook/assets/tick (97).png>) |
| Pre Registration   /GenerateQRcode                     |                                      | ![](<.gitbook/assets/tick (97).png>) |
| Pre Registration   /Login                              |                                      | ![](<.gitbook/assets/tick (97).png>) |
| Pre Registration  /Notification                        |                                      | ![](<.gitbook/assets/tick (97).png>) |
| Pre Registration   /Transliteration                    |                                      | ![](<.gitbook/assets/tick (97).png>) |
| Pre Registration   /Booking                            |                                      | ![](<.gitbook/assets/tick (97).png>) |
| Pre Registration   /Captcha                            |                                      | ![](<.gitbook/assets/tick (97).png>) |
| Pre Registration   /DataSync                           | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Registration Processor   /BioDedupe                    | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Registration Processor   /RegistrationStatus           | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Registration Processor   /RegistrationSync             | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Registration Processor   /PrintApi                     |                                      | ![](<.gitbook/assets/tick (97).png>) |
| Registration Processor   /RegistrationTransaction      | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Registration Processor   /External                     |                                      | ![](<.gitbook/assets/tick (97).png>) |
| Registration Processor   /QCUsers                      | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Registration Processor   /QualityChecker               | ![](<.gitbook/assets/tick (97).png>) |                                      |
| Resident Services  /Resident                           |                                      | ![](<.gitbook/assets/tick (97).png>) |
| Resident Services  /ResidentVid                        |                                      | ![](<.gitbook/assets/tick (97).png>) |
