# Build & Deployment

### Repositories

{% embed url="https://github.com/mosip/inji" %}

### Prerequisite

* [Gradle](https://gradle.org/install/)
* [Java 8](https://www.oracle.com/ph/java/technologies/javase/javase8-archive-downloads.html)
* [Expo](https://docs.expo.dev/home/get-started/installation/)
* [Android SDK](https://developer.android.com/)
* [Node](https://nodejs.org/en/download)
* [XCode](https://developer.apple.com/xcode/) for iOS development

## Android - Build and run

### Installation and Keystore generation on MAC

#### Step 1:

Configure Node & npm (We have to use v16.19.0) 
```
brew install nvm

nvm install 16.19.0

nvm use16.19.0
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

sdk install gradle 8.0.2

sdk install java11.0.18-amzn
```

#### Step 4:

Configure Expo, refer https://docs.expo.dev/get-started/installation/

#### Step 5:

Configure Android SDK, refer https://developer.android.com/

Configure environment variables in your ~/.zshrc / or ~/.bashrc (depending upon your shell)
```
export ANDROID_HOME="$HOME/Library/Android/sdk"

export ANDROID_PLATFORM_TOOLS="$ANDROID_HOME/platform-tools"

export ANDROID_CMDLINE_TOOLS="$HOME/Library/Android/sdk/cmdline-tools/latest/bin/"

export PATH="$PATH:$ANDROID_PLATFORM_TOOLS:$ANDROID_CMDLINE_TOOLS"
```

#### Step 6:

Generate debug keystore for building debug build
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

 -dname"CN=io.mosip.residentapp,OU=,O=,L=,S=,C=US"
```

export keystore
```
export DEBUG_KEYSTORE_ALIAS=androiddebugkey

export DEBUG_KEYSTORE_PASSWORD=android
```

### Installation and Keystore generation on Windows

#### Step 1:

Install Chocolatey, refer https://chocolatey.org/install
```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```
Allow global confirmation to avoid providing confirmations for avoiding confirmation in each installation (Optional)
```
choco feature enable -n=allowGlobalConfirmation
```

#### Step 2:

Configure Git
```
choco install git
```

#### Step 3:

Configure Node & npm (We have to use v16.19.0)
```
choco install nodejs --version=16.19.0

npminstall-gnpm@8.19.3
```

#### Step 4:

Configure Gradle & Java
Gradle - https://community.chocolatey.org/packages/gradle
```
choco install gradle
```
Java - https://community.chocolatey.org/packages/openjdk/11.0
```
choco install openjdk --version=11.0
```

#### Step 5:

Configure Android SDK, refer https://developer.android.com/

Set up adb shell
```
choco install adb
```

#### Step 6:

Generate debug keystore for building debug build
```
keytool -genkey -v -storetype PKCS12 -keyalg RSA -keysize 2048 -validity 10000 -storepass 'android'  -keypass 'android'  -alias androidreleasekey  -keystore android/app/release.keystore -dname "CN=io.mosip.residentapp,OU=,O=,L=,S=,C=US"
```

### Prerequisites for running on device

1.  It requires bluetooth v4.2 and above 
2. Android v23 and above for Android


### Command to build

#### Step 1:

Clone Inji repo

#### Step 2:

Create a `android/local.properties` file with the following data:

```
sdk.dir = <location-of-the-android-sdk>
```

Alternatively, you can open the Android folder in the android studio. It will create `local.properties` file with `sdk.dir = <location-of-the-android-sdk>`.

> Note:
>
> * Default path for MacOS: `/Users/<username>/Library/Android/sdk`
> * Default path for Linux: `/home/<username>/Android/Sdk`
> * Default path for Windows: `C:\Users\<username>\AppData\Local\Android\sdk`

#### Step 3:

Inji application currently supports two themes: orange and purple. The default theme of the app is orange. To change the theme of the application, go to `.env` file and change the value of `APPLICATION_THEME` to `orange` or `purple`

#### Step 4:

Go to the root folder of the project in the terminal. Install all the dependencies using `npm install`.

#### Step 5:

**Build an application:**

Run `cd android && ./gradlew :app:assembleMosipDebug && cd ..` to build the application.

**Build and run the application on the device:**

* Run `npm run android:mosip` to build and install the application on the device.
* Run `npm run android:mosip --reset-cache` to build and install the application if any change is made in the .env file.

### Build for PlayConsole

The Internal testing version of the build can be uploaded to `PlayConsole` for testing. PlayConsole allows the creation of internal testers group.

![Internal testers](\_images/internal_testers_android.png)

**Publishing build manually to PlayConsole**

A Google play console developer account is a must to publish builds in PlayConsole.

1. Set the backend URL and choose a theme (orange | purple) inside the `.env` file.
2. Build the Apk or App bundle.
3. Login to PlayConsole and create a new release inside Internal testers.
4. Upload the Apk or App bundle to PlayConsole.

**Upload in PlayConsole**

![img.png](\_images/upload_android.png)

![img.png](\_images/uploading_android.png)

1. Once the build is uploaded and saved you will be able to see the status of the release with version name, code, API level and some more details.

![img.png](\_images/uploaded_view_android.png)

2. Select the testers group you want to share with. Once saved, you can copy the link and give to testers to test the Apk or App bundle.

![img.png](\_images/internal_testers_select_android.png)

3. You need to manually provide the link to testers. They will not be notified whenever a new build is uploaded.

**Publishing build via Github actions (Automation) to PlayConsole**

1. A Google play console developer account must be configured to Inji to publish builds via PlayConsole. 

> Testers must be added to internal testers group in Play console.

![img.png](\_images/internal_testers_select_android.png)

2. To deploy the Android build to PlayConsole, Select `Android Custom Build` workflow from github actions.

![img.png](\_images/inji_android_github_actions.png)

3. Choose the branch, backend url, theme and describe about build details. 

4. Click the `Run` workflow button.

5. Once the pipeline has done with building the app (takes around ~25-30min), you need to login to play console and verify the build version name and code in the internal testers track. 

6. Now, you can share the link to testers.

 _Note_: Only those who are registered in the selected testers group will be able to download the App from Google Play.

---
## iOS - Build and run

### Installation and Keystore generation

#### Step 1:

Follow [Steps](#installation-and-keystore-generation-on-mac) to configure Node & npm, Expo and generate debug keystore

#### Step 2:

Configure XCode, refer https://developer.apple.com/xcode/

### Build process

* Install all the dependencies

```
npm install
npx pod-install
```

* Run Metro bundler in the background

```
npm start
```

* Run Inji directly to a connected device
Command to run on simulator
```
npm run ios
```
Command to run real device
```
npm run ios -- --device
```

### Build for TestFlight

The beta version of the build can be uploaded to `TestFlight` for testing. TestFlight allows the creation of internal and external testing teams who will be notified once a new build is published.

![Testflight testers](\_images/img.png)

**Publishing build manually to TestFlight**

An Apple developer account is a must to publish builds in TestFlight.

1. Set the backend URL and choose a theme (orange | purple) inside the `.env` file.
2. Archive the build using `xcode`.
3. Upload the archive to Testflight.

First choose `Distribute App`.

![img.png](\_images/archive.png)

**Upload in TestFlight**

![img.png](\_images/upload.png)

![img.png](\_images/uploading.png)

1. Login to TestFlight and check for the build upload status. Once the build is uploaded successfully, add `Groups` to provide access to testers.

![img.png](\_images/testflight_testers_group.png)

2. All the group members will be notified about the new build. Open TestFlight and install the new version.


**Publishing build via Github actions (Automation) to TestFlight**

An Apple developer account must be configured to inji app to publish builds via TestFlight. 

> Testers must be added to group in testflight.

![img.png](\_images/testflight_testers_group.png)

1. To deploy the iOS build to testflight, Select `Inji iOS build` workflow from github actions.

![img.png](\_images/inji_ios_github_actions.png)

2. Choose branch, backend url, theme, testers group from testflight to get the build and describe about build details. 

3. Click the `Run` workflow button.

4. Once the pipeline has done with building the app (takes around ~25-30min), Testflight notifies corresponding testers associated with the testers group in email about deployed build details.

![img.png](\_images/testflight_ios_notification.png)
