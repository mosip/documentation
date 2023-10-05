# Configuring Packet Manager for priority-based fetch

A priority-based search function in the [Packet Manager](https://docs.mosip.io/1.2.0/modules/packet-manager) was introduced in MOSIP 1.1.5 version. This feature allows us to retrieve data from external sources based on prioritized criteria for validating an applicant's information. These data packets are stored in the [Object Store](https://docs.mosip.io/1.2.0/modules/persistence/object-store) in a specific format. 

This functionality becomes particularly relevant in cases where a country has implemented a portal for residents to rectify any discrepancies or incomplete information in their registration process. With the priority-based search capability, we can ensure that the most important and relevant source of data is accessed first, enabling a more efficient and accurate data validation process.

## Scenario

In the context of a country utilizing MOSIP for resident registration, it is possible that during the validation process, discrepancies may arise. This could include instances where a required document is missing or certain applicant data does not align with the provided documentation. In order to address such scenarios, it would be prudent for the country to establish an online system or portal, hereafter referred to as "PORTAL," through which residents can submit correction packets to MOSIP. This would allow individuals to rectify any errors or update their data before the generation or allocation of their Unique Identification Number (UIN).

### Procedure

1. First and foremost, it is necessary for the country to develop a customized packet reader and writer for the purpose of implementing the packet manager for the correction packet. Alternatively, they may also utilize the default packet reader and writer provided by MOSIP and configure it accordingly in the `application-mz.properties` file.

```
NOTE: Example: Here, we are planning to add a new source called PORTAL for CORRECTION packet we have mapped the req. reader and writer here.

# Reader Configurations

provider.packetreader.mosip=source:REGISTRATION_CLIENT,process:NEW|UPDATE|LOST,classname:io.mosip.commons.packet.impl.PacketReaderImpl
provider.packetreader.resident=source:RESIDENT,process:RES_UPDATE|LOST|RES_REPRINT,classname:io.mosip.commons.packet.impl.PacketReaderImpl
provider.packetreader.portal=source:PORTAL,process:CORRECTION,classname:io.mosip.commons.packet.impl.PortalPacketReaderImpl

# Writer Configurations

provider.packetwriter.mosip=source:REGISTRATION_CLIENT,process:NEW|UPDATE|LOST,classname:io.mosip.commons.packet.impl.PacketWriterImpl
provider.packetwriter.resident=source:RESIDENT,process:RES_UPDATE|LOST|RES_REPRINT,classname:io.mosip.commons.packet.impl.PacketWriterImpl
provider.packetwriter.portal=source:PORTAL,process:CORRECTION,classname:io.mosip.commons.packet.impl.PortalPacketWriterImpl

```

2. The next step is to configure the priority for packet retrieval. Prioritizing packets in the Packet Manager can be accomplished through two types of configurations:

    a. **Default priority**: When the stage level priority is not configured, the Packet Manager will utilize the default configurations specified in the `application.mz` property file. This entails that the Packet Manager will make API calls without the inclusion of source and process information. The selection of source and process will be based on the configuration defined in MOSIP's `application-mz.properties` file.

    ```
    # If source is not passed, packetmanager supports below default strategy,
    # 1.If the value for the below property is set as, 'exception' - it will throw exception.
    # 2.If the value for the below property is seta as, 'defaultPriority' - packet manager will use the property packetmanager.default.priority
    packetmanager.default.read.strategy=defaultPriority
    packetmanager.default.priority=source:PORTAL\/process:CORRECTION,source:REGISTRATION_CLIENT\/process:NEW|UPDATE|LOST,source:RESIDENT\/process:RES_UPDATE|RES_REPRINT
    ```

    Here, source "PORTAL" and process "CORRECTION" will have top priority. Followed by source "REGISTRATION_CLIENT" and process "NEW" followed by source REGISTRATION_CLIENT and process "UPDATE" and so on.

    b. **Stage-specific priority**: It is necessary to establish a prioritization specific to each stage. To determine the priority for each stage, the ID attribute stated in the priority at the stage level must be referred to. This configuration is to be done in the properties defined in `registration-processor-mz.properties`.

    The attributes mentioned here should be the same as the values defined in the [ID Schema]().

    ```
    # To define priority for respective stages use below stage names. 
    # packetreceiver,packetuploader,packetvalidator,qualitychecker,osivalidator,demodedupe,classification,classifier,bioauth,manualverification,uingenerator,messagesender
    # For example, field 'gender' has priority in uin-generator-stage. The key for uin-generator-stage is 'uingenerator'. So the key would be 'packetmanager.provider.uingenerator.gender'
    packetmanager.provider.uingenerator.lastName=source:PORTAL\/process:CORRECTION,source:REGISTRATION_CLIENT\/process:NEW|UPDATE|LOST,source:RESIDENT\/process:RES_UPDATE|RES_REPRINT
    packetmanager.provider.uingenerator.gender=source:PORTAL\/process:CORRECTION,source:REGISTRATION_CLIENT\/process:NEW|UPDATE|LOST,source:RESIDENT\/process:RES_UPDATE|RES_REPRINT
    packetmanager.provider.uingenerator.city=source:PORTAL\/process:CORRECTION,source:REGISTRATION_CLIENT\/process:NEW|UPDATE|LOST,source:RESIDENT\/process:RES_UPDATE|RES_REPRINT
    ```

    Key for different stages are specified below:

    * regproc-packet-receiver-stage - packetreceiver

    * regproc-packet-uploader-stage - packetuploader

    * reproc-packet-validator-stage - packetvalidator

    * regproc-quality-checker-stage - qualitychecker

    * regproc-osi-validator-stage - osivalidator

    * regproc-demo-dedupe-stage - demodedupe

    * regproc-classification-stage - classification

    * regproc-bio-dedupe-stage - classifier

    * regproc-bio-auth-stage - bioauth

    * regproc-manual-verification-stage - manualverification

    * regproc-uin-generator-stage - uingenerator

    * regproc-message-sender-stage - messagesender
    
    _Note_: For regproc-abis-handler-stage and regproc-abis-middleware-stage the key is same as regproc-biodedupe-stage

3. After these changes are done, the Packet Manager and the respective stage needs to be restarted.

    **Special Case: For Biometrics (as multiple biometrics needs to merge a single document)**

    In certain situations, it may occur that biometric data is received from multiple systems, such as system A and system B. However,     it is necessary to combine and process both sets of data into a single Common Biometric Exchange Format Framework (CBEFF). This        merging and processing task can be accomplished through a specialized stage level configuration. It should be noted that the 
    default configurations are not capable of handling the merging of biometrics.

    For example, let's consider a scenario where an individual has experienced an accident resulting in a bandaged right hand. In this 
    case, the operator has designated the right hand as an exception and has captured other biometric data instead. Now, the Manual 
    Verifier, who is a registered officer responsible for verifying exception packets in the registration processor, determines that 
    this situation does not qualify as a biometric exception. Consequently, the residents are informed to visit the center and provide 
    their biometrics through a correction portal. As a result, the system will contain two sets of data: one from the Registration 
    Client and one from the correction portal. Due to this, it is necessary to appropriately allocate the biometrics in their 
    respective stages.
    
    This can be set as shown below:

```
packetmanager.provider.uingenerator.individualBiometrics[Finger]=source:PORTAL\/process:CORRECTION,source:REGISTRATION_CLIENT\/process:NEW|UPDATE|LOST,source:RESIDENT\/process:RES_UPDATE|RES_REPRINT
packetmanager.provider.uingenerator.individualBiometrics[Iris]=source:PORTAL\/process:CORRECTION,source:REGISTRATION_CLIENT\/process:NEW|UPDATE|LOST,source:RESIDENT\/process:RES_UPDATE|RES_REPRINT
packetmanager.provider.uingenerator.individualBiometrics[Face]=source:PORTAL\/process:CORRECTION,source:REGISTRATION_CLIENT\/process:NEW|UPDATE|LOST,source:RESIDENT\/process:RES_UPDATE|RES_REPRINT
```

### Points to consider

The process in the packet needs to be unique, stating the process being followed for the packet. In MOSIP by default, there are few processes defined,

* NEW for registering an individual on-field using a Registration Client

* UPDATE for updating details of a UIN holder on the field using a Registration Client

* LOST for finding a resident’s UIN by collecting their biometrics using a Registration Client

* RES_UPDATE for updating details of a UIN holder when a request comes from Resident portal

The source tells us about the source of origin, from where the packet is created. Registration-Client is considered as the source. NEW, UPDATE or LOST are different processes, whereas Resident Portal is considered for process as UPDATE and source as Resident Portal.
