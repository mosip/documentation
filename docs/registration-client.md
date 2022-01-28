# Registration client

## Overview

The Registration client is a thick Java-based client where the resident's demographic and biometric details are captured along with the supporting documents in online or offline mode. Data is captured in the form of registration packets and is cryptographically secured to ensure that there is no tampering. The captured information is packaged and sent to the server for further processing.

MOSIP provides a reference implementation of a Java based registration client. The code, build files for the registration client is available in **registration client repo**.

This modules supports multiple languages.

### Who operates the Registration client?

The Registration client can be operated by an operator who can be either a **Supervisor** or an **Officer**. They can login to the client application and perform various activities. The Supervisor and the Officer can perform tasks like Onboarding, Synchronize Data, Upgrade software, Export packet, Upload packets, View Re-registration packets, Correction process, Exception authentication, etc. In addition to this, the Supervisor has exclusive authority to Approve/reject registrations.

To know more about the onboarding process of an operator, refer to [Operator onboarding](operator-onboarding.md).

### Registration client entity diagram

The relationship of Regproc with other services is explained here.

![](_images/reg-client.drawio.png)

*Note*: The numbers do not signify sequence of operations or control flow

1. Registration client connects to the Upgrade Server to check on upgrades and patch downloads.
2. All the synced packets are uploaded to packet receiver service one by one.
3. Packets ready to be uploaded meta-info are synced to sync status service and also the status of already uploaded packets are synced back to registration client.
4. Registration client always connects to external biometric devices through [SBI](secure-biometric-interface.md).
5. Registration client scans the document proofs from any document scanner.
6. Acknowledgement receipt print request is raised to any connected printers.
7. All the masterdata and configurations are downloaded from syncdata-service.

### Internal view of host machine

The image below illustrates the internal view of a Registration client host machine.

![](_images/reg-client-host-machine.drawio.png)

*Note*: The numbers do not signify sequence of operations or control flow

1. Registration client comprises of JavaFX UI, registration-services libraries and any third party biometric SDK.
2. SBI is allowed to run on loopback IP and should listen on any port within 4501-4600 range. More than one SBI can run on the host machine. Registration client scans the allowed port range to identify the available SBI.
3. Registration client connects to local Derby database (used to store all the data synced)
4. TPM- is the hardware security module used to get machine identifier, to secure DB password, prove the client authenticity on auth requests and packets created in the host machine.
5. All the completed registration packets are stored under packetstore directory.
6. `.mosipkeys` directory is used to store sensitive files. `db.conf` under this directory stores encrypted DB password. This is created on the start of registration client for the first time.
7. Bio SDKs– Third party vendors [Biometric SDKs](biometric-sdk.md) are used to extract biometric templates, check biometrics quality and match biometrics for auth and local deduplications. 

### Know your machine TPM keys
A Trusted Platform Module (TPM) is a specialized chip on a local machine that stores RSA encryption keys specific to the host system for hardware authentication. The pair is maintained inside the chip and cannot be accessed by a software. By leveraging this security feature, every individual machine would be uniquely registered and identified by the MOSIP server component with it's TPM public key.
  
To know more about setting up the reference registration client, refer to [Registration client user guide](registration-client-user-guide.md).

To know more about the functions present in the Home page of the registration client, refer to [Registration client home page](registration-client-home-page.md).

### Biometrics SDK Integration in client
  
  SDK integration guide
  
### Data protection

### Packets



  
### Configurations
Based on the ID Schema, the Registration client can be customized as per a country' requirements. For details related to Registration client configurations, refer to [Registration client configuration](registration-client-configuration.md).

### UI Specifications for Registration Tasks 
 
Default UI Specifications loaded with Sandbox installation is available [here](https://github.com/mosip/mosip-infra/blob/1.2.0-rc2/deployment/v3/mosip/kernel/masterdata/xlsx/ui_spec.xlsx)


