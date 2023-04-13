# Resident Mobile Application User Guide

This a quick-read user guide for Inji. To refer to detailed Inji documentation, click [here](https://docs.mosip.io/inji/).

{% embed url="https://www.youtube.com/watch?v=ry6SknpGOss" %}

## Installing the MOSIP Resident Mobile Application

Prerequisite: Build `Inji` code to generate an `apk` file. Transfer the `apk` file on to a smart phone on which it is to be installed.

![](\_images/inji-install-flow.png)


## First launch of the app 

![](\_images/inji-initial-setup-flow.png)

On the **Home** screen, a few tooltips are displayed after the initial setup to guide the user with the next steps.

![](\_images/inji-home-tooltips.png)

## Downloading credentials

It is recommended to keep your digital credentials (ID) with you at all times. To get started with the app, Add IDs to your profile.

## Downloading VC

There are two ways by which one can download their VC:

1. Downloading VC using the UIN/ VID feature

2. Downloading VC using the Application ID feature

### Downloading VC using the UIN/ VID feature

Below are the steps to download the credentials using the UIN/ VID option:

![](\_images/inji-download-vc-flow.png)

![](\_images/inji-download-vc-flow2.png)

![](\_images/inji-download-vc-flow3.png)

### Viewing details of the downloaded credential and associating it with Tags

Click on the ID card generated to view the following details:

![](\_images/inji-view-card-details.png)

![](\_images/inji-view-card-details2.png)


### Viewing history of the downloaded credential


### Downloading VC using the Application ID feature

At times, when the resident/user does not have their UIN/ VID, but they possess the Registration ID or PRID, they can make use of this feature to download their digital credentials.

![](\_images/inji-application-id-flow.png)

* After entering the Application ID, click on **Get UIN/VID** and follow the steps mentioned in the flow above.

## Sharing Credentials

Prerequisites:

* Two or more devices with the Resident Mobile app installed are required for sharing credentials.
* All required permissions like Bluetooth, location and camera access are enabled on both the devices.
* The parties involved are mostly likely to be a Resident who would want to share their credentials with a Relying party (can be with a banker/ health worker/ etc).


Let us understand sharing of credentials with an example. Assuming that a Resident is wants to share their credentials with a Relying/ requesting party on the receiver's phone. The steps that both the parties have to follow is illustrated below:

1. Enable required permissions on both devices to get started.

![](\_images/inji-sv-flow1.png)

2. Connectivity details displayed on the Sharing and Requesting device.

![](\_images/inji-sv-flow2.png)

3. Once the connection is made, the `Sharing ID` screen is displayed on the Resident' phone with the name of the Requesting device. Here, the sharing party can enter the reason for sharing their credentials and tap on `Accept request and choose ID`.


![](\_images/inji-sv-flow3.png)

4. Incoming VC on requested device. Relying party can tap `Accept request and receive ID` to receive the VC.

![](\_images/inji-sv-flow4.png)

5. Success message displayed on the Sharing and Requesting device after successful VC share.

![](\_images/inji-sv-flow5.png)

6. The `History` tab on the devices displays the details of the activities performed.

For instance,

On the Resident' phone, the `History` tab displays the history of the shared credentials.

On the Relying party' phone, the `History` tab shows the history of the received credentials.

![](\_images/inji-sv-history.png)

## Face authentication flow

### Face Auth on resident's phone

Below are the steps for performing face authentication on the resident's phone using Inji.

1. Let us assume that the:

* QR code on requesting phone
* Scanner on Sharing Device

![](\_images/inji-fa-resident-flow1.png)

2. Connectivity details on both the devices : Sharing & Requesting device

![](\_images/inji-fa-resident-flow2.png)

3. Sharing screen after establishing the connection

![](\_images/inji-fa-resident-flow3.png)

4. Incoming VC on Requested Device:
 
![](\_images/inji-fa-resident-flow4.png)

5. Success pop up after successful share with face authentication on both the devices.

![](\_images/inji-fa-resident-flow5.png)

6.  History on both the devices.

![](\_images/inji-fa-resident-flow6.png)


### Face Auth on requesting phone

Below are the steps for performing face authentication on the requesting phone using Inji.

1. Let us assume that the:

* QR code is on the requesting phone
* Scanner on Sharing Device

![](\_images/inji-face-auth-flow1.png)

2. Connectivity details on both the devices: Sharing and Requesting device

![](\_images/inji-face-auth-flow2.png)

3. Sharing screen after establishing the connection
.
![](\_images/inji-face-auth-flow3.png)

4. On the Requesting Device, following is displayed:

![](\_images/inji-face-auth-flow4.png)

5. Success pop up after successful share with face auth on both the devices.

![](\_images/inji-face-auth-flow5.png)

6. History on both the devices.

![](\_images/inji-face-auth-flow6.png)


## Wallet binding flow

After successful download of VC, residents will have an option to activate VC for online login.

1. Resident clicks on `Activation pending for online login` in the home page. 
2. Resident will be taken to a detailed view page where an option to `Activate` the VC is available.
3. Further, the resident can click on `Activate` button. They will get an alert message after which they can click on `Yes, I confirm` button.

![](\_images/inji-wa-flow1.png)

4. The resident needs to enter the OTP sent on their registered number.
5. After the successful OTP match, VC will be activated for online login with the icon changing to green as shown below.

Also, the same is reflected on the home page.

![](\_images/inji-wa-flow2.png)



 





