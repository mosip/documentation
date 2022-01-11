# Overview

The Registration client is a thick Java-based client where the resident's demographic and biometric details are captured along with the supporting documents in online or offline mode. Data is captured in the form of registration packets and is cryptographically secured to ensure that there is no tampering. The captured information is packaged and sent to the server for further processing. <offline and online, multiple language support, transliteration>

Mosip provides a reference implementation of a java based registration client. The code, design, App setup, build documentation is available in **registration client repo**. The App may be modified according to a country's need.
  
To know more about setting up the registration client sample UI implementation, refer to [Registration client user guide](registration-client-user-manual.md).

To know more about the functions present in the Home page of the registration client, refer to [Registration client home page](registration-client-home-page.md).

## Who operates the Registration client?

The Registration client can be operated by an operator who can be either a Supervisor or an Officer. They can login to the application and perform various activities.

**Features accessible to Registration Officer and Supervisor**- Login/Logout, Onboarding, Synchronize Data, Upgrade software, Export packet, Upload packet, View Re-registration packets, Correction process, Exception authentication

**Feature exclusive to Registration Supervisor**– Approve/reject registrations (end-of-day approvals)

To know more about the roles and the onboarding process of an operator, refer to [Operator onboarding](operator-onboarding.md).

## Registration client entity diagram


## Biometrics SDK Implementation
  
  SDK integration guide
  
## Data protection

## Packets



  
## Configurations
reg client can be customized as per a country' requirements.  For details related to Registration Client configurations, refer to registration-Client configuration.
based on ID schema...

## UI Specifications
What is UI Spec, where is the sample available .. 
Default UI Specifications loaded with Sandbox installation is available [here](https://github.com/mosip/mosip-infra/blob/1.2.0-rc2/deployment/v3/mosip/kernel/masterdata/xlsx/ui_spec.xlsx)


