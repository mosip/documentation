# Steps to release Inji to Android Playstore

In this post, you will be taken through the **step-by-step process to publish an Android app in Google Play Store**.

### Google Play Console

Google Play Developer Console is the platform that Google provides for Google Play and Android developers to publish and monitor their app's performance in the Google Play store.

### Google Play Console Sign up

1. Go to the Google Play Developer Console and [sign up](https://play.google.com/console/signup) for an account.

2. Update new organisation account details as follows:

   * Choose Account type: 
        * personal
        * organization 

   * Update the Organization details:

        * Organization name: Enter the full, legal name of your organization. For example Google LLC.

        * Organization type: Any information we ask for to verify your organization will be tailored to your organization type

        * Organization size: Select the number of employees in your organization

        * Organization address: Select the country or region.

        * Organization phone number: Enter the main phone number associated with your organization

        * Organization website: Enter the URL of your organization's main website

3. Update `About you` section by answering the required questionaire.

4. Update Developer account details:

        * Developer account name: Enter a public name for this developer account. This will be shown on Google Play.

        * Contact name: If google need to speak to someone about your account, this is who we'll ask for. This won't be shown on Google Play.

        * Contact email address: Google only use this to contact your organization, and it won't be shown on Google Play. Get the same verified.

        * Preferred language: Select your organization's preferred language for email communications

        * Contact phone number: Google only use this to contact your organization, and it won't be shown on Google Play. Get the same verified.

    * Update apps related details:

        * Number of apps: How many apps does your organization plan to publish on Google Play in the next 12 months?

        * Earning money on Google Play: Does your organization plan to earn money from the apps you publish on Google Play? This won't affect your ability to earn money from your apps, or the features and services you can access.

        * App categories:  Does your organization plan to publish any of the following types of apps on Google Play? Select all that apply. This won't affect how your app is displayed on Google Play, and you can change this later.

5. Read and agree to the Google Play Developer distribution agreement.

6. Complete Your payment of $25 for `Developer Registration Fee`.

7. Upload the required Documents for the Organization to get the account verified and wait for verification to complete.

### Signing and Key 

Generating a release keystore

```
keytool \

 -genkey -v \

 -storetype PKCS12 \

 -keyalg RSA \

 -keysize 2048 \

 -validity 10000 \

 -storepass '<use-your-store-password>' \ 

 -keypass '<use-your-store-password>' \

 -alias <use-app-name-as-alias> \

 -keystore android/app/release.keystore \

 -dname "CN=io.mosip.residentapp,OU=,O=,L=,S=,C=US"

  ```

**NOTES (Keystore)**:

* For release, you will need a release keystore for play store to accept it. Using a debug keystore and signing our app, Play Store will reject the apk/app bundle.

* Once the release keystore is generated, you will need to keep it very safely as this is the file which is used to sign and update the app in the play store.

* You cannot create a new keystore with the same credentials to update the app since it has a timestamp associated with it. If you try to upload with that, play store will reject it saying it is signed with the wrong keystore.

* YOu can only update the app with the same keystore that you have generated and used to sign the app for the first time.

* While signing the app in the pipeline, encode the keystore file (Do not encode the file content, instead encode the file itself) using base64 and keeping it as a secret (if you are using Github) and decode it in the build time to sign the application.

* Store password and key password should be the same as we are using PKCS12 file type.

* Alias name is a label using your application name is a good practice.

  * **CN** - the full name of the person or organization that generates the `.keystore`.

  * **OU** -  Organizational Unit that creates the project, it's a subdivision of the Organization that creates it. E.g.: [](android.google.com)

  * **O** - Organization owner of the whole project. It's a higher scope than OU. E.g.: [](google.com)

  * **C** - The country's short code. E.g.: For United States is "US"

**Pre-requisites**: 

* Google play developer account (used to login to Google play console) with Play Publisher rights.

* Signed APK or App bundle.

