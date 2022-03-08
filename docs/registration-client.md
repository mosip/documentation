# Overview

The Registration client is a thick Java-based client where the resident's demographic and biometric details are captured along with the supporting documents in online or offline mode. Data is captured in the form of registration packets and is cryptographically secured to ensure that there is no tampering. The captured information is packaged and sent to the server for further processing.

MOSIP provides a reference implementation of a Java based registration client. The code, build files for the registration client is available in **registration client repo**.

## Multiple language support
* Registration client is featured to allow operator to choose the operation language. Option to select his/her preferred language, is provided on the login screen.
* Data collection during regitration client supports more than one language at a time.
* Before starting any registration process, operator can choose the languages among the configured ones.
 
  
To know more about setting up the reference registration client, refer to [Registration client user guide](registration-client-user-guide.md).
To know more about the functions present in the Home page of the registration client, refer to [Registration client home page](registration-client-home-page.md).

## Who operates the Registration client?

The Registration client can be operated by an operator who can be either a **Supervisor** or an **Officer**. They can login to the client application and perform various activities. The Supervisor and the Officer can perform tasks like Onboarding, Synchronize Data, Upgrade software, Export packet, Upload packets, View Re-registration packets, Correction process, Exception authentication, etc. In addition to this, the Supervisor has exclusive authority to Approve/reject registrations.

To know more about the onboarding process of an operator, refer to [Operator onboarding](operator-onboarding.md).

## Registration client entity diagram
  
## Data protection

* We store registration packets and synced data in the client machine.
* Most of the synced data are stored in the derby DB. Derby DB is encrypted with the bootpassword.
* Derby DB boot password is encrypted with machine TPM key and stored under `.mosipkeys/db.conf`.
* Synced UI-SPEC/script files are saved in plain text under registration client working directory. During sync, SPEC/script file hash is stored in derby and then the files are saved in the current working directory. Everytime the file is accessed by the client performs the hash check.
* Synced pre-registration packets are encrypted with TPM key and stored under configured directory.
* Directory to store the registration packets and related registration acknowledgments is configurable. 
* Regiatration packet is an signed and encrypted ZIP.
* Regiatration acknowledgment is also signed and encrypted with TPM key.

 
## Configurations
Registration client can be customized as per a country' requirements.  For details related to Registration Client configurations, refer to registration-Client configuration.

## UI Specifications for Registration Tasks 

* Blueprint of registration forms to be displayed in registration client are created as json called as UI-SPEC.
* Every process ( NEW / LOST / UPDATE UIN / CORRECTION ) has its own UI-SPEC json.
* Kernel-masterdata-service exposes API's to create and publish UI-SPEC.
* Published UI-SPEC json are versioned.
* Only published UI-SPEC are synced into registration-client.
* UI-SPEC json files are tamper proof, client checks the stored file hash everytime it tries to load registration UI.
* UI-SPEC json will fail to load if tampered.

Default UI Specifications loaded with Sandbox installation is available [here](https://github.com/mosip/mosip-infra/blob/1.2.0-rc2/deployment/v3/mosip/kernel/masterdata/xlsx/ui_spec.xlsx)


