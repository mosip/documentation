# Overview

The Registration Client is a thick Java-based client where the resident's demographic and biometric details are captured along with the supporting documents in online or offline mode. The captured information is packaged and sent to the server for further processing.

## Registration Client features

1.	**Secure** - Registration Client captures an individual’ demographic and biometric data in a secure manner. Data is captured in the form of registration packets and is  cryptographically secured to ensure that there is no tampering. 
2.	**Interfaces with Biometric Devices** – It interfaces with biometric devices that comply with the industry standards. 
3.	Works in **Offline and online** modes - In remote areas where internet connectivity is a challenge, the registration client works in offline mode as well. 
4.	**Remote Software updates**  – Registration Client has the capability of updating itself to the latest patches/upgrades in a remote manner. There could be multiple client instances running on laptops or desktops. Updates on all of them is controlled by a central server.
5.	**Tamper-proof client software** - The registration client must have the ability to validate the structure of the information captured and be able to detect any anomaly due to a possible manual tampering and reject the captured packet.

## Who operates the Registration Client?

The Registration Client can be operated by an operator who can be either a Supervisor or an Officer. They can login to the application and perform various activities.
To know more about the roles and the on-boarding process of an operator, click here.

Guide for First user creation https://docs.mosip.io/platform/modules/registration-client/first-user-registration-and-onboarding
Operator Onboarding

## What does a registration Client do?

Registration client collects the demographic and biometric details of a resident at the registration centers and sends the data to the Registration Processor for generating the UIN.
Below is a sample UI implementation of the Registration Client and the various functionalities involved.

<<Reg client entity diagram>>

### Operational Tasks

* Synchronize Data: 
* Download Pre-Registration Data:
* Update Operator Biometrics: 
* Application Upload:
* Center Remap Sync:
* Check Updates:

### Registration Tasks

* New Registration:
* Update UIN:
* Lost UIN:
* Biometric Correction:

For <refer to ID lifecycle management page>

### End of day processes

* Pending Approval:
* Notification for Re-registration:
* Dashboard:

## Biometrics SDK Implementation
  
  SDK integration guide
  

## Packets


## UI reference Implementation
MOSIP provides a Windows-based reference implementation of the REgistration client that has a UI and the business logic to perform the above process flows. The code, design, App setup, build documentation is available in **registration client repo**. The App may be modified according to a country's need.

## Configurations
For details related to Registration Client configurations, refer to registration-Client configuration.


## UI Specifications
  What is UI Spec, where is the sample available .. 
Default UI Specifications loaded with Sandbox installation is available [here](https://github.com/mosip/mosip-infra/blob/1.2.0_v3/deployment/v3/mosip/kernel/masterdata/xlsx/ui_spec.xlsx)


