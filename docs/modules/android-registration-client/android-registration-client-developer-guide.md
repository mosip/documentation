# Developer Guide

The documentation here will guide you through the pre-requisites and the other necessary details required for Android Registration Client developer setup.

The android-registration-client repository contains the Android Registration Client software for MOSIP. The feature-flutter branch focuses on integrating Flutter into the client.

## Setup

To set up the Android Registration Client with Flutter and Android Studio, follow the steps below:

#### Prerequisites

* Flutter SDK (3.10.4): Install Flutter by following the official [Flutter installation guide](https://flutter.dev/docs/get-started/install).
* Android Studio (or Any IDE of your choice): Download and install Android Studio from the official [Android Studio website](https://developer.android.com/studio).

#### Step 1: Clone the Repository

The `develop` branch of android-reg-client is currently being actively developed. If you wish to access this branch, you can clone the repository by executing the following command in your terminal. Alternatively, you can download one of the releases available in the repository's release section.

```
git clone -b feature-flutter https://github.com/mosip/android-registration-client.git
```

**Active Branches**:

* [release-0.11.x](https://github.com/mosip/android-registration-client/tree/release-0.11.x)(developer release branch)
* [develop](https://github.com/mosip/android-registration-client/tree/develop)(active development branch)

#### Step 2: Set up Flutter in Android Studio

1. To begin, launch Android Studio.
2. Next, select **Open an existing Android Studio project** and navigate to the cloned repository.
3. Open the `android-registration-client` directory as a project in Android Studio.
4. In order to integrate Flutter with Android Studio, install the Flutter plugin by accessing `File > Settings > Plugins` and searching for **Flutter**. Proceed to click on **Install** to install the plugin.
5. To ensure proper functionality, configure the Flutter SDK path by navigating to `File > Settings > Languages & Frameworks > Flutter` and specifying the Flutter SDK path as the location where you have installed Flutter.
6. Finally, save the changes by clicking on the "Apply" button.

**Customizing the Registration Client**

* Styling of the application can be configured by modifying these files `lib/utils/app_style.dart, lib/utils/app_config.dart`
* Application language bundles can be added to this path `lib/l10n` After adding the bundle run the below command to generate Localization data (Required for the first time).

```
flutter gen-l10n
```

* The label and application logo can be changed here android/app/src/main/AndroidManifest.xml

#### Step 3: Build and Run the Application

* The `pigeon.sh` file consists of the necessary commands for downloading dependencies and generating Flutter - Android native communication code. Please execute the `pigeon.sh` file or execute the commands within the file separately.
* Ensure you have connected an Android device or initiated an Android emulator.
* Open the terminal within Android Studio or use an external terminal.
* Navigate to the `android-registration-client` directory.
* Run the following command to build and execute the application:

```
flutter run
```

#### Step 4: Build, debug, and release APK

Execute the commands below to debug and release the APK

```
// Debug APK
flutter build apk --debug

// Release APK
flutter build apk --release
```

### Set up Mock MDS for Biometric Scan

The Mock MDS tool can be utilized to simulate the functionalities of biometric devices. The Mock MDS application is compliant with CTK standards and can serve as a substitute for Android SBI modules during testing and validation.

1. Install the Mock MDS application.
2. Access the **Settings** menu.
3. Under Device Configuration, choose **Registration** from the dropdown menu.
4. In P12 Configuration:
   * Enter the necessary credentials for the Device Key and upload the Device P12 file.
   * Enter the required credentials for the FTM Key and upload the FTM P12 file.
   * Complete all fields in MOSIP IDA Configuration.
5. In Modality Configuration, specify the quality score for Face, Finger, and Iris scans(these values can also be adjusted during testing).
6. Click on the **Save** button.
7. Go back to the Home Page and select `LOAD AND VALIDATE CERTIFICATES`.

A toast message will be displayed indicating the success of the validation process.

**Note**: To view the released version of the Mock SBI APK, click [here](https://github.com/mosip/android-camera-mds/releases/tag/vDP1).

To download the Mock SBI APK, click on `camera-mds.zip`.

### Contributions

If you would like to contribute to the Android Registration Client, please follow the guidelines outlined [here](https://docs.mosip.io/1.2.0/community/code-contributions).

### License

The Android Registration Client is licensed under the [MIT License](https://github.com/mosip/android-registration-client/blob/develop/LICENSE).

### Support

If you encounter any issues or have any questions, please open an issue on the [GitHub repository](https://github.com/mosip/android-registration-client/issues).

### Sources

* [GitHub- mosip/android-registration-client](https://github.com/mosip/android-registration-client): Reference Android Registration Client Software - WIP
* [Flutter- Get started: Install](https://flutter.dev/docs/get-started/install)
* [Android Studio- Download](https://developer.android.com/studio)
