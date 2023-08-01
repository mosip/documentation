# Steps to release Inji to Android Playstore

In this post, you will be taken through the **step-by-step process to publish an Android app in Google Play Store**.

Similar steps were followed to release the Inji app. To know more about, refer [Inji documentation](https://docs.mosip.io/inji/).

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

![](\_images/blog-image1.png) 

Add **App details** such as, 

* App name

* Language

* Game or App

* Free or Paid

Once done, accept the declaration and click **Create app** and proceed further.

![](\_images/blog-image2.png) 

#### Step 2: Application Information 

* You will be redirected to the dashboard where you can find the option to set up your app.
* Provide all the details required one by one.

![](\_images/blog-image3.png) 

* Set **Privacy Policy**- provide the privacy policy URL for the app.

![](\_images/blog-image4.png) 

* Set **App access**- Choose whether all of the app functionality is available without restriction or some are restricted.

![](\_images/blog-image5.png) 

* **Ads** - Select whether your app contains ads or not.

![](\_images/blog-image6.png)  

* **Content ratings**- For content ratings you will be asked to fill a questionnaire and based on your inputs the play console will automatically calculate the ratings. Click on “Start Questionnaire”. Enter the email address which will be used to contact you. Select the App category and click on **Next**.

![](\_images/blog-image7.png)  

Fill the questionnaire with appropriate information and click on **Save** and **Next**.

![](\_images/blog-image8.png)  

You will be shown the summary based on the information given by you. Click on **Save** and continue.

![](\_images/blog-image9.png)  

You will be able to see your application ratings based on the information you have provided.

* **Target Audience**- Select the target age groups for your application. Click on **Next** and proceed further.

![](\_images/blog-image10.png)

* **Store presence**- Select whether your application unintentionally appeals to children or not. Then click on **Next** and you will see the summary based on your answers. Save the details and proceed further.

![](\_images/blog-image11.png)

* **News apps**- Select whether your application is a news app or not. Click on **Save** once done.

![](\_images/blog-image12.png)

* **COVID-19 Apps**- Select whether your app is related to COVID-19 contact tracing or status app. Click on save and continue once done.

![](\_images/blog-image13.png)

* **Data Safety**- Select whether your app collects or shares the data. If yes, then the console will ask for more information. Fill all the information according to the data usage policy you follow. It will ask to confirm more details on the usage of the data separately. Fill it accordingly and proceed further. Once all the details are provided, it will show a summary you can verify it and save it and proceed further.

![](\_images/blog-image14.png)

* **Government apps**- Choose whether your app is a government app or not and click on save.

![](\_images/blog-image15.png)

* Selecting App category and contact details - Click on Edit on the top right corner. Select whether it’s an App or Game. Choose the category accordingly. Add tags if needed. Edit the contact details also with appropriate details.

![](\_images/blog-image16.png)

* Setting up store listing - You will be asked to provide a short and long description of your app.

![](\_images/blog-image17.png)

