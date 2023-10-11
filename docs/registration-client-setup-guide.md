# Registration Client Setup Guide

## Overview

This guide helps the operator in setting up the registration client.

{% embed url="https://www.youtube.com/watch?v=V4pV3uyPEuI&list=PLF83tgjxrJvh6QVM27lxIYq5nlZx8rY8Z&index=5" %}

## Know your machine TPM keys

A Trusted Platform Module (TPM) is a specialized chip on a local machines that stores RSA encryption keys specific to the host system for hardware authentication.The pair is maintained inside the chip and cannot be accessed by software. By leveraging this security feature every individual machine would be uniquely registered and identified by the MOSIP server component with it's TPM public key.

To extract the TPM public key, use the [TPM key extractor utility](https://github.com/mosip/mosip-infra/blob/develop/deployment/sandbox-v2/utils/tpm/key\_extractor/README.md).

## Prerequisites

To onboard the machine and the operator, the Admin needs to:

1. Create and activate the registration client machine using Admin portal.
2. Create a user/operator account in Keycloak
3. Assign the operator a role of either the Supervisor or Officer using the Admin portal.
4. Finally, perform the **User Zone mapping** and **User Center mapping** in the Admin portal.

**System prerequisites:**

* CPU - Dual Core Processor - 2GHZ
* RAM - 16 GB
* Local Storage Disk Space - 500 GB
* USB 2.0 ports or equivalent hub.
* Physical machine with TPM 2.0 facility.
* Windows OS \[10 v]

## Registration client setup

To setup the registration client:

1. Download the `reg-client.zip` from the hosted server.
2. Unzip the client. You can see the directory structure below.
3. Click `run.bat` to launch registration client.

![](\_images/reg-client-unzip.png)

### Launching the registration client

The client always launches with the pre-loader screen which displays the information about the network status, build status verification, online status, etc.

![](\_images/reg-client-pre-loader-success.png)

1. **First time launch**

* After the pre-loader, the login screen is displayed.
* Any valid operator credentials can be provided to authenticate and start the initial sync.
* On successful intial sync, the operator will be prompted to **restart** the application.
* After the first launch, the operator can notice .**mosipkeys** and **db** folders created under the registration client setup folder.

![](\_images/reg-client-restart.png)

**Note**: Deletion of either the **.mopsipkeys** or the **db** folder makes the application get into an invalid state and hence will fail to launch. To be able to launch the client again, the operator should make sure that both the folders are removed and then re-launch the client.

![](\_images/reg-client-folder.png)

1. **On the next launch after the initial sync**,

* The registration client login page provides the operator an option to select the language for viewing the registration client UI.
* After successful login, the operator either lands into the operator onboard page or the home page.

![](\_images/reg-client-language-selection.png)

For more details on operator onboarding, refer to [Operator onboarding guide](operator-onboarding.md).

For more details on Home page, refer to [Registration client home page](registration-client-home-page.md).

### Modes of operation

* **Offline**- Operator can use the registration client in offline mode to only do the registrations and EOD process. During offline mode, the operator authentication will be based on locally saved password hash. An operator can work in offline mode only if they have logged into to the registration client being online atleast once.
* **Online**- Machine must be online for the registration client first launch. For any server-client sync or vice-versa, the registration client must be online. In the online mode, the client reaches out to the server for password authentication.

**Note**: On successful onboard of the operator, biometric templates of the operator are stored locally. Biometric authentication does not reach out to the server everytime, instead it is validated based on the locally stored templates on the registration client machine.

### Setting up MOCK SBI (MDS)

In the development environment, Registration client can be tested using mock SBI. Find the instructions to build and run the mock SBI, click [here](https://github.com/mosip/mosip-mock-services/blob/master/MockMDS/README.md).

### Troubleshooting

**1. Incorrect username/password**

```
-> Cross-check the machine keys mapping in server ('Machine not found' error in logs)

-> Cross-check machine status

-> 'Invalid Request' error in log - Check your machine time, it shouldnt be less or greater than local timezone datetime (usually accepted lag is +5/-5 minutes)

-> check logs/registration.log for more details
```

**2. Configuration / masterdata Sync failed**

```
-> check if kernel-syncdata-service is up.
```
