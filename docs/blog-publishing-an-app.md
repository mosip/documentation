# Release an app to Android Playstore

In this post, you will be taken through the **step-by-step process to publish an Android app in Google Play Store**.

Similar steps were followed to release the **Inji** app. To know more about, refer [Inji documentation](https://docs.mosip.io/inji/).

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

#### Step 1: Application Information

Once you have the above information ready, log in to Google Play Console using _Play publisher_ credentials and Click on `Create App` on the menu (on the top right side of the screen). 

![](\_images/app-image1.png) 

Add **App details** such as, 

* App name

* Language

* Game or App

* Free or Paid

Once done, accept the declaration and click **Create app** and proceed further.

![](\_images/app-image2.png) 

#### Step 2: Add Additional details

* You will be redirected to the dashboard where you can find the option to set up your app.
* Provide all the details required one by one.

![](\_images/app-image3.png) 

* Set **Privacy Policy**- provide the privacy policy URL for the app.

![](\_images/app-image4.png) 

* Set **App access**- Choose whether all of the app functionality is available without restriction or some are restricted.

![](\_images/app-image5.png) 

* **Ads** - Select whether your app contains ads or not.

![](\_images/app-image6.png)  

* **Content ratings**- For content ratings you will be asked to fill a questionnaire and based on your inputs the play console will automatically calculate the ratings. Click on “Start Questionnaire”. Enter the email address which will be used to contact you. Select the App category and click on **Next**.

![](\_images/app-image7.png)  

Fill the questionnaire with appropriate information and click on **Save** and **Next**.

![](\_images/app-image8.png)  

You will be shown the summary based on the information given by you. Click on **Save** and continue.

![](\_images/app-image9.png)  

You will be able to see your application ratings based on the information you have provided.

* **Target Audience**- Select the target age groups for your application. Click on **Next** and proceed further.

![](\_images/app-image10.png)

* **Store presence**- Select whether your application unintentionally appeals to children or not. Then click on **Next** and you will see the summary based on your answers. Save the details and proceed further.

![](\_images/app-image11.png)

* **News apps**- Select whether your application is a news app or not. Click on **Save** once done.

![](\_images/app-image12.png)

* **COVID-19 Apps**- Select whether your app is related to COVID-19 contact tracing or status app. Click on save and continue once done.

![](\_images/app-image13.png)

* **Data Safety**- Select whether your app collects or shares the data. If yes, then the console will ask for more information. Fill all the information according to the data usage policy you follow. It will ask to confirm more details on the usage of the data separately. Fill it accordingly and proceed further. Once all the details are provided, it will show a summary you can verify it and save it and proceed further.

![](\_images/app-image14.png)

* **Government apps**- Choose whether your app is a government app or not and click on save.

![](\_images/app-image15.png)

* Selecting App category and contact details - Click on Edit on the top right corner. Select whether it’s an App or Game. Choose the category accordingly. Add tags if needed. Edit the contact details also with appropriate details.

![](\_images/app-image16.png)

* Setting up store listing - You will be asked to provide a short and long description of your app.

![](\_images/app-image17.png)

* App icon - Provide an icon for your app.

![](\_images/app-image18.png)  

* Feature Graphic - Provide a picture for your feature graphic video. This will act as a template for your video. Add a video link for the feature graphic.

![](\_images/app-image19.png)  

* Add screenshots - Add at least 2 screenshots for Phone, 7 inch tablet screenshots, 10 inch tablet screenshots and required while chromebook screenshots are optional.

![](\_images/app-image20.png)  

### Step 3: Setting up an Internal testers group to test your app

Once the setting up of the app is done in the dashboard, select `Start testing now`.

![](\_images/app-image21.png) 

* Inside that, select the testers.
* You can add the tester's email id in a list based on your preference.
* The testers with that email id will get access to download the app from the play store.
* You can also provide a feedback URL to collect the feedback from the testers.
* Then save and proceed further.

![](\_images/app-image22.png) 

### Step 4: Creating a new Internal release for your Internal testers group

* Click on `Create a new release.

* App integrity 

    * This is a signing key and it will be automatically generated and managed by google if you choose google play to manage it. 

    * This signing key is not related to the release keystore that we are using. 

    * This signing key is generated based on the keystore that we have used to sign the app while building the application.

* App bundle 

    * Generate a signed apk or app bundle and upload the same.

    * Keep the keystore safe in secrets or somewhere safe as we need to use the same keystore for future signing of the app.

![](\_images/app-image23.png) 

* **Release details**

    * Provide a Release name and Release notes for the application.

    * Release name is the version name.

    * Release notes are information on what are the changes or upgrades or bug fixes done.

    * Click on Next once done.

    * You will be taken to preview the details and confirm the changes.

    * Click on Save.
  
![](\_images/app-image25.png)

#### Step 5: Giving the app to Internal testers

Congratulations, you have successfully done all the steps needed for the Internal release. Let’s see how we can give the apk to testers.

* In the Internal testing tab, you can see your app status is active and says it is available to internal testers.

* To provide the apk to testers, click on testers in the Internal testing tab.

* You can see the list of testers, select the testers list you want to share this apk with.

* Once selected click on save and this will save the changes.

* You will be able to see the Copy link option.

* Copy the link and give it to testers, they will be able to download the app from play store.

![](\_images/app-image24.png) 

Things to keep in mind once it is uploaded to the play store,

* You will need to share the link manually to testers whenever you upload a new release.

* The testers will not get any notifications regarding the upload.

* They should access the link with the same email account they have given.

* They will be asked to accept the invite to test. Once accepted, they will be taken to the play store.

* In the play store also they should be logged in to the same email account. Otherwise they will see an empty screen inside the play store app.

**Additional Notes**:

_KEYSTORE_

* If you are using pipeline to push the app to the play store, make sure that your keystore that you have used for the first time is used to sign the app while building.
* We have encoded the keystore file (the whole file and not the contents) to base64 and stored it in secret.
* Before building the app,  get the encoded file and decode it and place it in the right folder so that you can sign the app without any issues.


_PLAY STORE LIMITATIONS_

* You may want to increment the build number/ version code every time you upload a new apk/ app bundle.
* If the app is built using the same build number/ version code of the previous app, then play store will reject that build.





