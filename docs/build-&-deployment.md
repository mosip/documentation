# Build & Deployment

## Build & Deployment

### Repositories

{% embed url="https://github.com/mosip/inji" %}

### Prerequisite

* [Gradle](https://gradle.org/install/)
* [Java 8](https://www.oracle.com/ph/java/technologies/javase/javase8-archive-downloads.html)
* [Expo](https://docs.expo.dev/home/get-started/installation/)
* [Android SDK](https://developer.android.com/)
* [Node](https://nodejs.org/en/download)

## Android - Build and deployment

### Command to build

#### Step 1:

Create a `android/local.properties` file with the following data:

```
GOOGLE_NEARBY_MESSAGES_API_KEY=
sdk.dir = <location-of-the-android-sdk>
```

Alternatively, you can open the Android folder in the android studio. It will create `local.properties` file with `sdk.dir = <location-of-the-android-sdk>`. Add the `GOOGLE_NEARBY_MESSAGES_API_KEY` in it.

> Note:
>
> * Default path for MacOS: `/Users/<username>/Library/Android/sdk`
> * Default path for Linux: `/home/<username>/Android/Sdk`
> * Default path for Windows: `C:\Users\<username>\AppData\Local\Android\sdk`

#### Step 2:

Create a `google-services.json` file. Follow the below steps to generate the file:

* Sign in to [Firebase](https://console.firebase.google.com/u/0/), then click on `Add project,` and create a project with a suitable name.
* Go to the `Project settings` by clicking on the gear icon on the top left. Select `Android` platform under `Your apps` the section.
* Add `io.mosip.residentapp` in the `Android package name` section. Click. on `Register App` button. Then click on the `Download google-services.json` to download the file.

#### Step 3:

Replace the content of `android/app/google-services.json` with the newly generated `google-services.json` file.

#### Step 4:

Inji application currently supports two themes: orange and purple. The default theme of the app is orange. To change the theme of the application, go to `.env` file and change the value of `APPLICATION_THEME` to `orange` or `purple`

#### Step 5:

Go to the root folder of the project in the terminal. Install all the dependencies using `npm install`.

#### Step 6:

**Build an application:**

Run `cd android && ./gradlew :app:assembleMosipDebug && cd ..` to build the application.

**Build and run the application on the device:**

* Run `npm run android:mosip` to build and install the application on the device.
* Run `npm run android:mosip --reset-cache` to build and install the application if any change is made in the .env file.

#### Build for PlayStore

The Internal testing version of the build can be uploaded to `PlayStore` for testing. PlayStore allows the creation of internal testers group.

![Internal testers](\_images/internal_testers_android.png)

**Publishing build manually to PlayStore**

A Google play console developer account is a must to publish build in PlayStore.

1. Set the backend URL and choose a theme (orange | purple) inside the `.env` file.
2. Build the Apk or App bundle.
3. Login to PlayStore and inside Internal testers create a new release.
4. Upload the Apk or App bundle to PlayStore.

**Upload in PlayStore**

![img.png](\_images/upload_android.png)

![img.png](\_images/uploading_android.png)

5. Once the build is uploaded and saved you will be able to see the status of the release with version name, code, API level and some more details.

![img.png](\_images/uploaded_view_android.png)

6. Select the testers group you want to share with. Once saved you can copy the link and give to testers to test the Apk or App bundle.

![img.png](\_images/internal_testers_select_android.png)

7. You need to manually provide the link to testers. They will not be notified whenever a new build is uploaded.

**Publishing build via Github actions (Automation) to PlayStore**

A Google play console developer account must be configured to inji app to publish builds via PlayStore. 

> Testers must be added to internal testers group in Play console.

![img.png](\_images/internal_testers_select_android.png)

1. To deploy the Android build to playstore, Select `Android Custom Build` workflow from github actions.

![img.png](\_images/inji_android_github_actions.png)

2. Choose branch, backend url, theme and describe about build details. 

3. Click the Run workflow button.

4. Once the pipeline has done with building the app (takes around ~25-30min). 

5. You need to login to play console and verify the build version name and code in the internal testers track. 

6. Now you can share the link to testers and only those who are registered in the selected testers group will only be able to download the App from Google Play.

---
## iOS - Build and deployment

### Build process

* Install all the dependencies

```agsl
npm install
npx pod-install
```

* run Metro bundler in the background

```agsl
npm start
```

* run Inji directly to a connected device

```agsl
npm run ios -- --device
```

### Build for TestFlight

The beta version of the build can be uploaded to `TestFlight` for testing. TestFlight allows the creation of internal and external testing teams who will be notified once a new build is published.

![Testflight testers](\_images/img.png)

**Publishing build manually to TestFlight**

An Apple developer account is a must to publish builds in TestFlight.

1. Set the backend URL and choose a theme (orange | purple) inside the `.env` file.
2. Archive the build using xcode.
3. Upload the archive to Testflight.

First choose `Distribute App`.

![img.png](\_images/archive.png)

**Upload in TestFlight**

![img.png](\_images/upload.png)

![img.png](\_images/uploading.png)

4. Login to TestFlight and check for the build upload status. Once the build is uploaded successfully, add Groups to provide access to testers.

![img.png](\_images/testflight_testers_group.png)

5. All the group members will be notified about the new build. Open TestFlight and install the new version.


**Publishing build via Github actions (Automation) to TestFlight**

An Apple developer account must be configured to inji app to publish builds via TestFlight. 

> Testers must be added to group in testflight.

![img.png](\_images/testflight_testers_group.png)

1. To deploy the iOS build to testflight, Select `Inji iOS build` workflow from github actions.

![img.png](\_images/inji_ios_github_actions.png)

2. Choose branch, backend url, theme, testers group from testflight to get the build and describe about build details. 

3. Click the Run workflow button.


4. Once the pipeline has done with building the app (takes around ~25-30min), testflight notifies corresponding testers associated with testers group in email about deployed build details.


![img.png](\_images/testflight_ios_notification.png)