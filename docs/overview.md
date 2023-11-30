# Overview

Inji stands as a secure, trustworthy, and dependable mobile wallet designed to fulfil the following functions:

* Download and **store verifiable credentials or ID proofs** securely within the wallet.
* Conduct **offline face authentication** against stored ID proofs to verify the user's presence.
* **Share verifiable credentials** or ID proofs with relying parties without requiring an internet connection, utilizing Bluetooth Low Energy (BLE).
* Enable users to **log in to online portals** of relying parties by scanning a QR code, facilitating seamless access to their services.

The application is constructed using the [React Native framework](https://reactnative.dev/), ensuring compatibility with both Android and iOS mobile operating systems. It leverages [Xstate state machines](https://xstate.js.org/docs/) for efficient application state management. The digital credentials produced by the mobile app adhere to the Verifiable Credentials (VC) data model. For additional information, refer [Verifiable Credentials Data Model](https://www.w3.org/TR/vc-data-model/).
.


**How does Inji work?**

* Inji users have the option to obtain their Verifiable credential by utilizing their unique ID (e.g., UIN or VID issued by the government). 
* Users are required to authenticate their request through an OTP sent to their registered mobile number or email address. 
* Only upon successful validation, the Verifiable credential will be downloaded and securely stored within the app. 
*	Once a Verifiable credential is downloaded, users can share it with relying parties via Bluetooth, using the BLE protocol. 
*	To further authenticate the digital VC, users can opt for offline face authentication during transactions. 
*	Inji also offers integration with e-Signet, allowing residents to log in to relying party portals by scanning a QR code. Users have control over the information shared with the relying party through user consent.
*	Inji is compatible with OpenID and has the capability to onboard a variety of Identity Providers (IdP). This, in turn, provides users with multiple options for Verifiable Credential (VC) issuers.
*	Inji ensures the authenticity of digital signatures provided by the issuer for each ID before downloading it to the local device. Subsequently, it generates a HASH for each digital ID stored, utilizing it to verify the integrity of the ID before displaying it within the app at any time.


#### Backend

* The app uses [Mimoto APIs](https://mosip.stoplight.io/docs/mimoto) for generating VCs, downloading and activation.
* It uses [e-Signet APIs](https://mosip.stoplight.io/docs/identity-provider) for online login.

## User Guide

### First App Launch

After installing the application for the first time, the user will be asked to set up unlock method for it. The app supports biometric or PIN-based locks. For more details, refer to the [User Guide](https://docs.mosip.io/1.2.0/modules/mobile-application/inji-mobile-app-beta).

#### Launch with passcode unlock method
![](\_images/inji\_first\_launch\_with_\passcode.png)

#### Launch with biometric unlock method
![](\_images/inji\_first\_launch\_with_\biometric.png)

### Generating and storing credentials

Residents have the ability to create a Verifiable Credential (VC) for themselves, as well as for their family or friends, using the same mobile device. There are two methods through which residents can generate VC: 

* Download via UIN/VID
* Download via eSignet

#### Download via UIN/VID

![](\_images/download\_via\_uin\_vid.png)

#### Download via eSignet

![](\_images/download\_via\_esignet.png)


### Sharing of credentials

The credentials are shared in a peer-to-peer model with the verifier application. The data exchange between devices is done using the BLE Protocol. For more information, refer to [Tuvali documentation](https://docs.mosip.io/inji/tuvali).

![](\_images/vc\_share.png)

### Online login process

* Residents can use Inji to log in to any service provider app (integrated with e-Signet) by just scanning a QR code from their portal.
* The app performs offline face auth after scanning the QR code to verify the user's presence.
* Once the presence is verified, the resident is given the option to choose the optional information to be shared with the service provider portal.
* After consent is provided, the app sends a WLA (Wallet local auth) token which is a JWT token to the relying party.
* The resident is then given the access to the portal after the token verification.

#### Step 1: VC activation process

![](\_images/vc\_activation.png)

#### Step 2: Online QR login

![](\_images/online\_qr\_login.png)

















--------------------------------------------------------------------------------------------------------------------------

Inji is a secure, trusted and reliable mobile wallet and authenticator that can be used by the residents to:

* securely **download and store digital credentials** into the wallet.
* perform **offline face authentication** against their own digital credentials to verify user presence.
* **share digital credentials** with the relying parties to avail various services.
* perform **online login** to a relying party portal by scanning a QR code to avail their services.

Additionally, it can also be used as a base to create a Verifier App by service providers to authenticate the resident's identity in order to provide them services.

The app is built using [React native framework](https://reactnative.dev/) which supports both Android and iOS mobile operating systems. It uses [Xstate state machines](https://xstate.js.org/docs/) to manage the application state. The digital credentials generated by the mobile application follow the Verifiable Credentials (**VC**) data model. To learn more, read [Verifiable Credentials Data Model](https://www.w3.org/TR/vc-data-model/).

**How does Inji work?**

* After installing Inji, residents can enter their unique ID (issued by country, e.g. the UIN or VID) on the app to generate the VC.
* Resident will now be prompted to enter the OTP sent on the registered mobile number or email address.
* After successful validation, the VC will be downloaded and stored on the app.
* Residents can also use the Application ID if their UIN or VID is not available. They can share the downloaded VC with the relying party via bluetooth to avail the services. The app uses [BLE protocol](https://www.bluetooth.org/docman/handlers/downloaddoc.ashx?doc_id=441541) to share the VCs.

Inji also supports integration with [e-Signet](https://docs.esignet.io/) wherein the resident can login to the relying party portal by scanning a QR code. They can can also choose what information needs to be shared with the relying party (user consent). However, the residents have to activate the VC before performing online login.

Inji will have upcoming support of USSD code for feature phone users as well as Open ID standard issuance and [OWF architecture](https://github.com/openwallet-foundation).

Below diagram shows how credentials are shared and the authentication process that takes place between the resident and the service provider.

![](\_images/inji-integration-page2.png)

#### Backend

* The app uses [Mimoto APIs](https://mosip.stoplight.io/docs/mimoto) for generating VCs, downloading and activation.
* It uses [e-Signet APIs](https://mosip.stoplight.io/docs/identity-provider) for online login.

## Installing the application

After installing the application, the user must set an app lock code for it. The app supports biometric or PIN-based locks. For more details, refer to the [User Guide](https://docs.mosip.io/1.2.0/modules/mobile-application/inji-mobile-app-beta).

![](\_images/inji\_first\_launch.png)

## Generating and storing credentials

Residents can generate a Verifiable Credential(VC) for themselves or their family or friends on the same phone.

Detailed steps on generating and sharing credentials are given in the [User guide](https://docs.mosip.io/1.2.0/modules/inji-user-guide). The process of generating a credential is shown below

![](\_images/generate\_and\_store\_cred.png)

## Sharing of credentials

The credentials are shared in a peer-to-peer model with the verifier application. The data exchange between devices is done using the BLE Protocol. Refer to [Tuvali documentation](https://docs.mosip.io/inji/tuvali) for more information.

## Online login process

* Residents can use Inji to log in to any service provider app (integrated with e-Signet) by just scanning a QR code from their portal.
* The app performs offline face auth after scanning the QR code to verify the user's presence.
* Once the presence is verified, the resident is given the option to choose the optional information to be shared with the service provider portal.
* After consent is provided, the app sends a WLA (Wallet local auth) token which is a JWT token to the relying party.
* The resident is then given the access to the portal after the token verification.

#### Step 1: VC activation process

![](\_images/vc\_activation.png)

#### Step 2: Online QR login

![](\_images/online\_qr\_login.png)



