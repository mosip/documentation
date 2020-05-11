# Overview
In the registration process we captures the demographic and biometric details of an individual along with supporting information (proof documents & information about parent/guardian/introducer) and packages the information in a secure way. The information packet is sent to the server in online or offline mode for processing. We use a thick client to perform all the above operations and call it the "Registration client". 

Important considerations are as follows. Registration client must provide the following:
* **Secure** way of capturing an individual's private demographic and biometric data. The captured data must be cryptographically secure such that the data cannot be tampered with. 
* **Interfaces to biometric devices** that comply to industry standards. This ensure that any device manufactured as per standards will work with MOSIP.
* Works in **online and offline** mode. In remote areas where internet connectivity is a challenge, the client application must work in offline mode to capture data inorder to perform uninterrupted registrations.
* **Remote software update** capability. The client application must have the ability to update itself for patch upgrades (bug fixes/enhancements) in a remote way. There could be hundreds of client instances running on laptops/desktops. Updates on all of them must be controlled by the client and a central server.
* **Tamper-proof client software**. Since the client application must work in offline mode, there is a possibility of client software itself being tampered with. There must be enough checks and balances to detect tampering and reject such packets.

# Detailed functionality
[Registration Functionality](Registration-Functionality.md)

# Process flow

## Registration officer Onboarding
![Registration Officer Onboarding](_images/registration/reg_client_registration_officer_onboarding.jpg)

## Registration preparation
![Registration Preparation](_images/registration/reg_client_registration_prep.jpg)

## Individual registration
![Registration](_images/registration/reg_client_registration.jpg)

## Packet upload
![Packet Upload](_images/registration/reg_client_registration_packet_upload.jpg)

## End of day (EOD) process
![EOD process](_images/registration/reg_client_eod_process.jpg)

## UIN update
![UIN Update](_images/registration/reg_client_uin_update.jpg)

## Lost UIN
![Lost UIN](_images/registration/reg_client_lost_uin.jpg)

## Software update
![Software Update](_images/registration/reg_client_software_update.jpg)

## Logical view
![Registration client logical view](_images/registration/reg_client_logical_architecture.png)

## Component architecture  
![Registration client component architecture](_images/registration/reg_client_component_architecture.png)

# Registration packet structure
All the registration information is zipped and encrypted in a packet and send to the server. The structure of the packet is given [here](Registration-Packet.md).

# Registration client reference application
MOSIP provides an Windows based reference implementation of the client that has UI and business logic to perform the above process flows.  The code, design, App setup, build documentation is available in [registration client repo](https://github.com/mosip/registration/tree/master/registration).  The App may be modified according to a country's need.

[Registation client setup guide](Registration-Client-Setup.md)

# First user on-boarding
TBD
