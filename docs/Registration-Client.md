# Registration

## Overview

The registration client is a thick Java-based client where the resident's demographic and biometric details are captured along with the supporting documents in online or offline mode. The captured information is packaged in a secure tamper-proof way and send to the server for processing.

Registration client must provide the following :

* **Secure** way of capturing an individual's demographic and biometric data. The captured data must be cryptographically secure such that the data cannot be tampered with. This is called a registration packet.
* **Interfaces to biometric devices** that comply to industry standards. This ensure that any device manufactured as per standards will work with MOSIP.
* Works in **online and offline** mode. In remote areas where internet connectivity is a challenge, the registration client must work in offline mode.
* **Remote software update** capability. There must be a way to self-update to latest patches/upgrades (bug fixes/enhancements) in a remote way. There could be hundreds of client instances running on laptops/desktops. Updates on all of them must be controlled a central server.
* **Tamper-proof client software**. The registration client must have an ability to validate the structure of the information captured so that it could detect any anomoly due to a possible manual tampering and reject the captured packet.

## Detailed functionality

[Registration Functionality](Registration-Functionality.md)

## Process flow

### Registration officer Onboarding

![Registration Officer Onboarding](\_images/registration/reg\_client\_registration\_officer\_onboarding.jpg)

### Registration preparation

![Registration Preparation](\_images/registration/reg\_client\_registration\_prep.jpg)

### Individual registration

![Registration](\_images/registration/reg\_client\_registration.jpg)

### Packet upload

![Packet Upload](\_images/registration/reg\_client\_registration\_packet\_upload.jpg)

### End of day (EOD) process

![EOD process](\_images/registration/reg\_client\_eod\_process.jpg)

### UIN update

![UIN Update](\_images/registration/reg\_client\_uin\_update.jpg)

### Lost UIN

![Lost UIN](\_images/registration/reg\_client\_lost\_uin.jpg)

### Software update

![Software Update](\_images/registration/reg\_client\_software\_update.jpg)

### Logical view

![Registration client logical view](\_sources/registration/reg\_client\_architecture\_v0.1.png)

### Component architecture

![Registration client component architecture](\_images/registration/reg\_client\_component\_architecture.png)

## Registration packet structure

All the registration information is zipped and encrypted in a packet and sent to the server. The structure of the packet is given [here](Registration-Packet.md).

## Registration client reference application

MOSIP provides an Windows-based reference implementation of the client that has a UI and the business logic to perform the above process flows. The code, design, App setup, build documentation is available in [registration client repo](https://github.com/mosip/registration/tree/master/registration). The App may be modified according to a country's need.

[Registation client setup guide](Registration-Client-Setup.md)

## First user on-boarding

TBD
