# Resident Mobile Application User Guide

## Prerequisite

For Android devices, `Google Nearby Connections API` and the `Google SafetyNet Attestation API` require that the device has access to the Google Play Services and related APIs. This implies that a Google Account is set up and configured on the device.

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

Below are the steps for performing face authentication on resident' phone using Inji.

![](\_images/inji-fa-sheet1.png)

![](\_images/inji-fa-sheet2.png)

![](\_images/inji-fa-open-scanner.png)

## Wallet binding flow


## Login with QR code scan flow






