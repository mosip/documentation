# Build & Deploy

### Repositories

{% embed url="https://github.com/mosip/inji-wallet" %}

### Prerequisite

* [Gradle](https://gradle.org/install/)
* [Java 17](https://www.oracle.com/ph/java/technologies/downloads/#java17)
* [Expo](https://docs.expo.dev/home/get-started/installation/)
* [Android SDK](https://developer.android.com/)
* [Node](https://nodejs.org/en/download)
* [XCode](https://developer.apple.com/xcode/) for iOS development

To perform **offline sharing using BLE**, we recommend below:

* Devices with Bluetooth v4.2 and above
* Android v23 and above for Android

## Android - Build and Run

The below sections describe the steps for building the android application in Mac and Windows OS.

### 1a. Installation and Keystore generation on MAC

#### Step 1:

Configure Node & npm (recommended to use v16.19.0)

```
brew install nvm

nvm install 16.19.0

nvm use 16.19.0
```

#### Step 2:

Configure Yarn

```
brew install yarn
```

#### Step 3:

Configure Gradle & Java

```
curl -s "https://get.sdkman.io" | bash

sdk install gradle 7.5.1

sdk install java 17.0.13-amzn
```

#### Step 4:

Configure Expo, refer [here](https://docs.expo.dev/get-started/installation/).

#### Step 5:

Configure Android SDK, refer [here](https://developer.android.com/).

Configure environment variables in your `~/.zshrc /` or `~/.bashrc` (depending upon your shell)

```
export ANDROID_HOME="$HOME/Library/Android/sdk"

export ANDROID_PLATFORM_TOOLS="$ANDROID_HOME/platform-tools"

export ANDROID_CMDLINE_TOOLS="$HOME/Library/Android/sdk/cmdline-tools/latest/bin/"

export PATH="$PATH:$ANDROID_PLATFORM_TOOLS:$ANDROID_CMDLINE_TOOLS"
```

#### Step 6:

Generate debug keystore for building debug build.

```
keytool \
 -genkey -v \
 -storetype PKCS12 \
 -keyalg RSA \
 -keysize 2048 \
 -validity 10000 \
 -storepass 'android' \
 -keypass 'android' \
 -alias androiddebugkey \
 -keystore android/app/debug.keystore \
 -dname "CN=io.mosip.residentapp,OU=,O=,L=,S=,C=US"
```

Export keystore

```
export DEBUG_KEYSTORE_ALIAS=androiddebugkey

export DEBUG_KEYSTORE_PASSWORD=android
```

### 1b. Installation and Keystore generation on Windows

#### Step 1:

* Install Git
* Use the below link to download git

```
https://git-scm.com/download/win
```

* After installation, run Git as admin.

#### Step 2:

* Install SDKMAN
* Use the below command in Git terminal

```
curl -s "<https://get.sdkman.io>" | bash
```

* If you encounter an error while installing sdkman, please install zip on your system using your favourite package manager.

**Install zip**

1. `SDKMan` requires the installation of the zip utility, which is not included in the default installation of Windows Git Bash.
2. To address this, please visit the [website](https://sourceforge.net/projects/gnuwin32/files/).
3. Locate **zip** in the list of available files and download the **zip-3.0-bin.zip** archive. Extract the **zip.exe** file from the archive and place it in the **bin** folder. Location of bin folder `C:\Program Files\Git\usr\bin`.
4. Finally, rerun the `SDKMan` installation script.

#### Step 3:

* Install gradle
* Use the command below in Git terminal.

```
sdk install gradle 7.5.1
```

* To check the installed gradle version.

`gradle -V`

#### Step 4:

* Install Java JDK, refer [here](https://www.oracle.com/ph/java/technologies/downloads/#java17).

```
[!TIP]
Restart system
```

#### Step 5:

* Install expo

```
npm install --global expo-cli
```

#### Step 6:

* Install Android SDK, refer [here](https://developer.android.com/).

#### Step 7:

* Install Node, refer [here](https://nodejs.org/en/download).

#### Step 8:

* Install nvm

```
curl -o- <https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh> | bash
```

or

```
wget -qO- <https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh> | bash
```

update the nvm version

```
nvm install 16.19.0
nvm use 16.19.0
```

#### Step 9:

Install adb

```
https://sourceforge.net/projects/quickadb/
```

Configure ANDROID\_HOME and JAVA\_HOME in system environment variables

### 2. Command to build the application

#### Step 1:

* Clone Inji repository.

#### Step 2:

* Create an `android/local.properties` file with the following data:

```
sdk.dir = <location-of-the-android-sdk>
```

* Alternatively, you can open the Android folder in the android studio. It will create `local.properties` file with `sdk.dir = <location-of-the-android-sdk>`.

> Note:
>
> * Default path for MacOS: `/Users/<username>/Library/Android/sdk`
> * Default path for Linux: `/home/<username>/Android/Sdk`
> * Default path for Windows: `C:\Users\<username>\AppData\Local\Android\sdk`

#### Step 3:

* Inji application currently supports two themes: **orange** and **purple**.
* The default theme of the app is orange.
* To change the theme of the application, go to `.env` file and change the value of `APPLICATION_THEME` to `orange` or `purple`

#### Step 4:

* Update mimoto url as https://api.collab.mosip.net [here](https://github.com/mosip/inji/blob/main/.env#L5)
* Update esignet host as https://esignet.collab.mosip.net [here](https://github.com/mosip/inji/blob/main/.env#L7)
* To deploy mimoto in local refer [here](https://docs.mosip.io/inji/inji-mobile-wallet/build-and-deployment/local-setup#how-to-run-this-setup)

#### Step 5:

* Go to the root folder of the project in the terminal.
* Install all the dependencies using `npm install`.

#### Step 6:

**Build and run the application on the device:**

* Run `npm run android:mosip` to build and install the application on the device.
* Run `npm run android:mosip --reset-cache` to build and install the application if any change is made in the .env file.

### 3. Troubleshooting

If you encounter the below issue on Windows,

```
**FAILURE:** Build failed with an exception.

**Where:**
  Script 'C:\....\inji\node_modules\expo\scripts\autolinking.gradle' line: 2

**What went wrong:**
  A problem occurred evaluating script.
  > Could not read script 'C:\"PATH"\inji\node_modules\expo\scripts\android\autolinking_implementation.gradle' as it does not exist.
```

* Run `npm i expo-modules-autolinking@~1.1.0` and rebuild the app
* Path for debug apk in Inji directory `android/app/build/outputs/apk/mosip/debug`

### 4. Setting Up Google API Services and Client ID for Data backup & Restore

#### Step 1:

**Creating A Google Cloud Project** Refer to this documentation on setting up a Google Cloud Project - https://developers.google.com/workspace/guides/create-project

#### Step 2:

**Enabling Google Drive APIs** Go to - https://console.cloud.google.com/apis/library

![GCP API Library](../../../.gitbook/assets/gcp-api-libs.png)

Search for `Google drive API` and Select Google Drive API from the list.

Then enable the API.

![GCP Drive API Enable](../../../.gitbook/assets/drive-api.png)

#### Step 3:

**Create Google Consent Screen**

Go to - https://console.cloud.google.com/apis/credentials/consent

Create a new Consent Screen with necessary details such as - App Name, User Support Email, App Logo and Developer Info. Once added these details Save and Continue.

#### Step 4:

**Create Oauth Client ID**

Go to - https://console.cloud.google.com/apis/credentials

![GCP Create Client ID](../../../.gitbook/assets/create-CID.png)

Click on `CREATE CREDENTIALS` and choose `OAuth client ID`

![GCP Create Client ID](../../../.gitbook/assets/application-type.png)

Choose Appliation type as `Android`

![GCP Create Client ID](../../../.gitbook/assets/cid-details.png)

Add in details such as _Name_, _Package Name_ and _SHA- Fingerptint_

> Note:
>
> * SHA-1 should be of the keystore generated for signing the APK
> * Make sure you have checked `Custom URI Scheme` in `Advanced Settings`
> * The APK signing keystore needs to be unchanged for backup feature to work as the SHA-1 is 1-1 mapped for a client ID created

#### Step 5:

**Set Environment Variable**

Once the Client ID has been created copy the client ID and add it as part of `.env` file.

`GOOGLE_ANDROID_CLIENT_ID="<copied-client-id>"`

### 5. Build for PlayConsole

The Internal testing version of the build can be uploaded to `PlayConsole` for testing. PlayConsole allows the creation of internal testers group.

![Internal testers](../../../.gitbook/assets/internal\_testers\_android.png)

**Publishing build manually to PlayConsole**

A Google play console developer account is a must to publish builds in PlayConsole.

1. Set the backend URL and choose a theme (orange | purple) inside the `.env` file.
2. Build the Apk or App bundle.
3. Login to PlayConsole and create a new release inside Internal testers.
4. Upload the Apk or App bundle to PlayConsole.

**Upload in PlayConsole**

![img.png](../../../.gitbook/assets/upload\_android.png)

![img.png](../../../.gitbook/assets/uploading\_android.png)

1. Once the build is uploaded and saved you will be able to see the status of the release with version name, code, API level and some more details.

![img.png](../../../.gitbook/assets/uploaded\_view\_android.png)

2. Select the testers group you want to share with. Once saved, you can copy the link and share the same with the testers to test the APK or App bundle.

![img.png](../../../.gitbook/assets/internal\_testers\_select\_android.png)

3. You are required to manually share the link with the testers as they will not receive any notifications when a new build is uploaded.

**Publishing build via Github actions (Automation) to PlayConsole**

1. A Google PlayConsole developer account must be configured to Inji to publish builds via PlayConsole.

> Testers must be added to internal testers group in Play console.

![img.png](../../../.gitbook/assets/internal\_testers\_select\_android.png)

2. To deploy the Android build to PlayConsole, select `Android Custom Build` workflow from github actions.

![img.png](../../../.gitbook/assets/inji\_android\_github\_actions.png)

3. Choose the branch, backend url, theme and describe about build details.
4. Click the `Run` workflow button.
5. Once the pipeline has done with building the app (takes around \~25-30min), you need to login to PlayConsole and verify the build version name and code in the internal testers track.
6. Now, you can share the link to testers.

_**Note**_: Only those who are registered in the selected testers group will be able to download the App from Google Play.

***

## iOS - Build and run

The below section describes the steps build the iOS application.

### 1. Installation and Keystore generation

#### Step 1:

Follow the [Steps](./#installation-and-keystore-generation-on-mac) to configure Node & npm, Expo and generate debug keystore

#### Step 2:

Configure XCode, refer [here](https://developer.apple.com/xcode/).

#### Step 3:

Enable iCloud and create Containers, refer https://developer.apple.com/help/account/manage-identifiers/create-an-icloud-container/

### 2. Build process

* Install all the dependencies

```
npm install
npx pod-install
```

* Run Metro bundler in the background

```
npm start
```

* Run Inji directly to a connected device Command to run on simulator

```
npm run ios
```

Command to run real device

```
npm run ios -- --device
```

### 3. Build for TestFlight

The beta version of the build can be uploaded to `TestFlight` for testing. TestFlight allows the creation of internal and external testing teams who will be notified once a new build is published.

![Testflight testers](../../../.gitbook/assets/img.png)

**Publishing build manually to TestFlight**

An Apple developer account is a must to publish builds in TestFlight.

1. Set the backend URL and choose a theme (orange | purple) inside the `.env` file.
2. Archive the build using `xcode`.
3. Upload the archive to Testflight.

First choose `Distribute App`.

![img.png](../../../.gitbook/assets/archive.png)

**Upload in TestFlight**

![img.png](../../../.gitbook/assets/upload.png)

![img.png](../../../.gitbook/assets/uploading.png)

1. Login to TestFlight and check for the build upload status. Once the build is uploaded successfully, add `Groups` to provide access to testers.

![img.png](../../../.gitbook/assets/testflight\_testers\_group.png)

2. All the group members will be notified about the new build. Open TestFlight and install the new version.

**Publishing build via Github actions (Automation) to TestFlight**

An Apple developer account must be configured to Inji app to publish builds via TestFlight.

> Testers must be added to group in TestFlight.

![img.png](../../../.gitbook/assets/testflight\_testers\_group.png)

1. To deploy the iOS build to testflight, select `Inji iOS build` workflow from github actions.

![img.png](../../../.gitbook/assets/inji\_ios\_github\_actions.png)

2. Choose the branch, backend URL, theme, testers group from TestFlight to get the build and describe about build details.
3. Click the `Run` workflow button.
4. Once the pipeline has done with building the app (takes around \~25-30min), TestFlight notifies corresponding testers associated with the testers group in email about deployed build details.

![img.png](../../../.gitbook/assets/testflight\_ios\_notification.png)
