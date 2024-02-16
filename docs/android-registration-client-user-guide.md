# ANDROID REGISTRATION CLIENT- USER GUIDE

This user guide is designed to provide assistance to operators and supervisors in successfully installing, running, and registering applicants to obtain their Unique Identification Numbers (UIN) on tablet devices.

## Prerequisites

* Reliable and consistent Internet connectivity.
* Tablets running Android version 10 to 13.
* Tablets with a minimum of 4 GB RAM.
* The tablets need to be capable of capturing fingerprints, iris, and face (photo) biometrics. Additionally, they should also have the ability to scan documents. However, if the tablets do not support these capabilities, MOCK SBI can be used as an alternative.

### How to install Android Registration Client (ARC)

1. Download and install the APK on Android tablet.

2. Once ARC is installed, long press on the logo to copy the machine details.

3. On the [Admin Portal](https://docs.mosip.io/1.2.0/modules/administration/admin-portal-user-guide), using admin credentials, login and perform the following to add the device:

    * Go to `Resources/Machine` and click on **Create machine**

    * Add a new machine and enter the machine details:

      * Add the specs as **Android**

      * Map it to a Zone and Center

      * Add the Machine spec ID as **Android**

      * Enter Device name

      * Enter Public Key

      * Enter Sign Public Key

   * Create the role `Default` in KeyCloak with all the other roles.

   * Create the Operator’s user account in KeyCloak and set the password and assign the role as `Default`, `REGISTRATION_OFFICER`, 
     `Registration Operator`, `REGISTRATION_SUPERVISOR` 

   * Login into Admin Portal to perform the following and add the user:

      * After login into Admin Portal, go to `User Zone Mapping` and add the zone for the user and activate the zone.

      * Go to `User Center Mapping` and add the center for the user and activate it.

> Note: The user should be assigned to the same Zone and Center as the device.
