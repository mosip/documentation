# Registration client

## Overview

The Registration client is a thick Java-based client where the resident's demographic and biometric details are captured along with the supporting documents in online or offline mode. Data is captured in the form of registration packets and is cryptographically secured to ensure that there is no tampering. The captured information is packaged and sent to the server for further processing.

MOSIP provides a reference implementation of a Java based registration client. The code, build files for the registration client is available in **registration client repo**.

Multiple language support

### Know your machine TPM keys
A Trusted Platform Module (TPM) is a specialized chip on a local machines that stores RSA encryption keys specific to the host system for hardware authentication. The pair is maintained inside the chip and cannot be accessed by a software. By leveraging this security feature, every individual machine would be uniquely registered and identified by the MOSIP server component with it's TPM public key.
  
To know more about setting up the reference registration client, refer to [Registration client user guide](registration-client-user-guide.md).

To know more about the functions present in the Home page of the registration client, refer to [Registration client home page](registration-client-home-page.md).

### Who operates the Registration client?

The Registration client can be operated by an operator who can be either a **Supervisor** or an **Officer**. They can login to the client application and perform various activities. The Supervisor and the Officer can perform tasks like Onboarding, Synchronize Data, Upgrade software, Export packet, Upload packets, View Re-registration packets, Correction process, Exception authentication, etc. In addition to this, the Supervisor has exclusive authority to Approve/reject registrations.

To know more about the onboarding process of an operator, refer to [Operator onboarding](operator-onboarding.md).

### Registration client entity diagram


### Biometrics SDK Integration in client
  
  SDK integration guide
  
### Data protection

### Packets



  
### Configurations
reg client can be customized as per a country' requirements.  For details related to Registration Client configurations, refer to registration-Client configuration.
based on ID schema.

### UI Specifications for Registration Tasks 
 
Default UI Specifications loaded with Sandbox installation is available [here](https://github.com/mosip/mosip-infra/blob/1.2.0-rc2/deployment/v3/mosip/kernel/masterdata/xlsx/ui_spec.xlsx)


