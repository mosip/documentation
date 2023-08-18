# Release an app to iOS AppStore

In this post, you will be taken through the step-by-step process to release an app to iOS AppStore (content is updated as per process followed until 11 April'23).

Similar steps were followed to release the **Inji** app. To know more about Inji, refer [Inji documentation](https://docs.mosip.io/inji/).


**_App Store Connect_**: 

* An Apple portal to manage artifacts/builds, AppStore distribution, TestFlight (beta test) distribution, Analytics, Trends, Payments and financial reports, etc

**_Developer Certificate, Identifier & Profiles_**: 

An Apple portal to manage Developer certificates like APNs certificates, Provisioning profile, devices for adhoc distribution, APNs key, etc.

**Pre-requisites**

* Apple ID (email & password used to login to any apple’s portal)

* Ensure the targeted users of your app are public, otherwise you may lead to rejection from Apple’s app review team. For example, if your targeted users are employees of an organization, you have to go with Apple Developer Enterprise Program rather than Apple Developer Program.
  
* Go through different type of memberships of Apple, refer [Choosing a Membership - Support - Apple Developer](https://developer.apple.com/support/compare-memberships/).

* [Custom Apps - Apple Developer](https://developer.apple.com/custom-apps/)

Ensure you get fee waivers or not

* [Apple Developer Program Membership Fee Waivers - Support - Apple Developer](https://developer.apple.com/support/membership-fee-waiver/)

If your app is intended for AppStore distribution, you need **Apple Developer Program** membership. Check the eligibility by login into [Apple Developer](http://developer.apple.com/).

If you have relevant access, you will be able to see `Certificates, Identifiers & Profiles` under the `Program resources` section. If you do not have an eligible **Apple Developer Program**, please do the enrollment.

[Before You Enroll - Apple Developer Program](https://developer.apple.com/programs/enroll/)  (payment is involved, about 99 USD or 8,700 INR per year, you may need to add this amount to your Apple ID).

![](\_images/appstore-image1.png)

*If the client already has an organization type Apple Developer Program. Your Apple ID can be added as an admin user to get all the necessary access to do all the process. Client/AccountHolder can add you as an admin from “Users and Access” section in [App Store Connect](https://appstoreconnect.apple.com/).

* Xcode IDE or pipeline setup for uploading xcarchive file to [App Store Connect](https://appstoreconnect.apple.com/).

### Configure your app details in AppStoreConnect

* Login to [App Store Connect](https://appstoreconnect.apple.com/)

* Click on `My Apps`

 ![](\_images/appstore-image2.png)

* Click on “New App”

* Fill the form

 ![](\_images/appstore-image3.png)

 ![](\_images/appstore-image4.png)

**Platforms** (_Mandatory_): Select at least one platform for your app. iPadOS and watchOS apps are considered part of the iOS platform.

**Name** (_Mandatory, character limit 30, can edit later_): The name of your app as it will appear on the App Store. This can't be longer than 30 characters.

**Primary Language**: If localized app information isn’t available in an App Store country or region, the information from your primary language will be used instead. [Learn more](https://developer.apple.com/help/app-store-connect/manage-app-information/localize-app-store-information).

**Bundle ID** (_Mandatory_): The bundle ID must match the one you used in Xcode. It can't be changed after you upload your first build. If you couldn’t find the bundle ID, register a new bundle ID by clicking the link.

**SKU** (_Mandatory, can edit later_): A unique ID for your app that is not visible on the App Store.

### 1.0 Prepare for Submission section

![](\_images/appstore-image5.png)

Screenshots must be in the JPG or PNG format, and in the RGB color space. App previews must be in the M4V, MP4, or MOV format and can’t exceed 500 MB. [Learn More](https://developer.apple.com/help/app-store-connect/manage-app-information/upload-app-previews-and-screenshots).

Screenshots dimensions for 6.7” display (mandatory): 1290x2796 (portrait) or 2796x1290 (landscape)

![](\_images/appstore-image6.png)


![](\_images/appstore-image7.png)

Screenshots dimensions for 6.5” display (can re-use 6.7” screenshots): 1242 x 2688 (portrait) or 2688 x 1242 (landscape), 1284 x 2778 (portrait), 2778 x 1284 (landscape)

![](\_images/appstore-image8.png)

Screenshots dimensions for 5.5” display (mandatory): 1242 x 2208 (portrait) or 2208 x 1242 (landscape)

Screenshots dimensions for iPad Pro (6th Gen) 12.9" display (only required if you support iPad screens): 2048 x 2732 (portrait) or 2732 x 2048 (landscape)

![](\_images/appstore-image9.png)



















**Promotional text** (optional, character limit 170): 

Promotional text lets you inform your App Store visitors of any current app features without requiring an updated submission. This text will appear above your description on the App Store for customers with devices running iOS 11 or later, and macOS 10.13 or later.

**Description** (mandatory, character limit 4000):

A description of your app, detailing features and functionality.

**Keywords** (mandatory, character limit 100) : Include one or more keywords that describe your app. Keywords make App Store search results more accurate. Separate keywords with an English comma, Chinese comma, or a mix of both.

**Support URL** (mandatory):

A URL with support information for your app. This URL will be visible on the App Store.

**Marketing URL** (optional):

A URL with marketing information about your app. This URL will be visible on the App Store.

**Version** (mandatory):

The version number of the app you are adding. Numbering should follow software versioning conventions.

**Copyright** (mandatory):

The name of the person or entity that owns the exclusive rights to your app, preceded by the year the rights were obtained (for example, "2008 Acme Inc."). Do not provide a URL.

**Routing App Coverage File** (optional): Specify the geographic regions supported by your app. The file must be in the .geojson format and can only contain one MultiPolygon element. Learn More

**AppClip section** (applicable only if you need to support AppClip for your app)

**iMessage app section** (applicable only if you support iMessage app)

**Apple Watch** section (applicable only if you support apple watch app)

**Game Center** (applicable only for games)

_Sign-in information for Apple review team (applicable only if your app needs credential to access)_: This is a user name and password you can use to sign in to your app, so you can review all of its features. If users sign in using social media, provide information for an account that can be use. Credentials must be valid and active for duration of review.

> If it has 2 factor authentication like OTP, bypass it for Apple review team.

**Contact Information** (mandatory):

* The person in your organization who should be contacted if the App Review team has any questions or needs additional information.

* Notes for Apple review team (optional, character limit 4000):

* Additional information about your app that can help during the review process. Include information that may be needed to test your app, such as app-specific settings.

**Attachment for Apple review team** (optional):

You can attach specific app documentation, demo videos, and other items to help prevent delays during the app review process. Make sure you use files with the following extensions: .pdf, .doc, .docx, .rtf, .pages, .xls, .xlsx, .numbers, .zip, .rar, .plist, .crash, .jpg, .png, .mp4, or .avi.

### Release options

![](\_images/appstore-release1.png)


**App Information section**

_Name (mandatory, character limit 15)_: 

![](\_images/appstore-release2.png)

The name will be reviewed before it is made available on the App Store.

Subtitle (optional, character limit 30): The subtitle will be reviewed before it is made available on the App Store.

**Primary Category** (mandatory):

![](\_images/appstore-release3.png)

**Secondary Category** (optional):

![](\_images/appstore-release4.png)

**Content Rights** (mandatory):

![](\_images/appstore-content.png)

**Age Rating** (mandatory):

![](\_images/appstore-age1.png)


![](\_images/appstore-age2.png)


![](\_images/appstore-age3.png)

**Pricing and Availability section** (Pricing mandatory):


![](\_images/appstore-pricing.png)


![](\_images/appstore-regionprices.png)


![](\_images/appstore-app-pricing.png)


![](\_images/appstore-sampleone.png)


**Country or Region Availability** (mandatory)

![](\_images/appstore-country.png)

**Tax Category** (mandatory, already pre-filled as ‘App Store software’)

![](\_images/appstore-tax1.png)

**Pre-Orders** (Optional)

![](\_images/appstore-preorders.png)

**App Privacy section**

![](\_images/appstore-privacy.png)

_Privacy Policy URL (mandatory):_

A URL that links to your privacy policy. A privacy policy is required for all apps.

_User Privacy Choices URL (optional):_

A URL where users can modify and delete the data collected from the app, or decide how their data is used and shared.

**Data collection practices** (mandatory):

![](\_images/appstore-data1.png)

![](\_images/appstore-data2.png)

![](\_images/appstore-data3.png)

**TestFlight Section**

Once the artifacts/ builds are uploaded to App Store Connect, it will appear under this section:

![](\_images/appstore-testflight1.png)

Once the build is uploaded, and post that `Missing Compliance` is seen on the screen, click on the yellow warning icon.

![](\_images/appstore-testflight2.png)

![](\_images/appstore-testflight3.png)

Once the build is ready in the TestFlight section, under “1.0 Prepare for Submission” -> Build, a button will appear to choose the build. Once it’s done, click on “Add for Review”, if there is any error on metadata, it will throw a detailed error. Submit for Review in the new window. And that’s it!!! Wait for the review team to respond. If you want to notice each state of the app in mobile, install [AppStore Connect](https://apps.apple.com/us/app/app-store-connect/id1234793120) app in your device. Even after submitting, you might be able to change some fields.

![](\_images/appstore-testflight4.png)

#### Steps to upload an iOS app using Xcode IDE 

> This is not recommended. The recommended way is to automate the uploading process using pipeline or Xcode Cloud).


* Ensure Version is matching with App Store Connect portal, Also ensure, there is no build exist with the same number in TestFlight section of App Store Connect portal.

![](\_images/appstore-xcode1.png)

* Select the target device as `Any iOS Device`.

![](\_images/appstore-xcode2.png)  

* Product -> Archive

![](\_images/appstore-xcode3.png)  

* Click on `Distribute App`

![](\_images/appstore-xcode4.png)  

