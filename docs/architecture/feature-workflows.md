# Feature Workflows


### First App Launch

After installing the application for the first time, the user will be asked to set up unlock method for it. The app supports biometric or PIN-based locks. For more details, refer to the [User Guide](https://docs.mosip.io/1.2.0/modules/mobile-application/inji-mobile-app-beta).

#### Launch with passcode unlock method
![](\_images/inji\_first\_launch\_with_\passcode.png)

#### Launch with biometric unlock method
![](\_images/inji\_first\_launch\_with_\biometric.png)

### Generating and storing credentials

Residents can generate a Verifiable Credential(VC) for themselves or their family or friends on the same phone.

There are two ways residents can generate VC
* Download via UIN/VID
* Download via eSignet

#### Download via UIN/VID

![](\_images/download\_via\_uin\_vid.png)

#### Download via eSignet

![](\_images/download\_via\_esignet.png)


### Sharing of credentials

The credentials are shared in a peer-to-peer model with the verifier application. The data exchange between devices is done using the BLE Protocol. Refer to [Tuvali documentation](https://docs.mosip.io/inji/tuvali) for more information.

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
