1.  Overview Page -
    <https://mosip.atlassian.net/wiki/spaces/PROD/pages/1239416846/Inji+Mobile+Overview> -
    <https://github.com/mosip/documentation/pull/782>

2.  Features Page -
    <https://mosip.atlassian.net/wiki/spaces/PROD/pages/1711538327/Inji+Mobile+Features>

3.  Release Notes v0.17.0 - In-progress [sanchi
    singh](https://mosip.atlassian.net/secure/ViewProfile.jspa?accountId=712020%3A2de6f5c6-cffd-487a-a40e-f1a6917fdea4)
    PR to be raised

4.  **Technical Section :**

**Integration Guide**
<https://docs.inji.io/inji-wallet/inji-mobile/technical-overview/integration-guide>

1.  The first point needs to be updated - SDK can be implemented in one
    of the ways mentioned below

    - npm module to get easily integrated with the React Native
      framework

    - For the Android app, the Maven dependency can be integrated

    - For the iOS app, SPM is supported

2.  OpenID4VP is missing in the content. Let\'s make the order
    consistent here to the w.r.t components page

**Secure Keystore**

1.  <https://docs.inji.io/inji-wallet/inji-mobile/technical-overview/integration-guide/secure-keystore#artifacts>

    - Refer to Maven Central instead of the snapshot

    keshav - here? - https://central.sonatype.com/artifact/io.mosip/secure-keystore

2.  <https://docs.inji.io/inji-wallet/inji-mobile/technical-overview/integration-guide/secure-keystore#android-kotlin>

    - Remove this
      maven(\"<https://oss.sonatype.org/content/repositories/snapshots/>\")

      Keshav - Whole line from the code?

      Add the following in your `settings.gradle.kts`:

```kotlin
dependencyResolutionManagement {
  repositories {
    google()
    mavenCentral()
    maven("https://oss.sonatype.org/content/repositories/snapshots/")
  }
}
```



**VCI Client**

1.  <https://docs.inji.io/inji-wallet/inji-mobile/technical-overview/integration-guide/vci-client#android-kotlin-package-for-vci-client>

    - Refer to Maven Central instead of the snapshot

    keshav - here? - https://central.sonatype.com/artifact/io.mosip/secure-keystore


2.  Add a link for example folder
    <https://docs.inji.io/inji-wallet/inji-mobile/technical-overview/integration-guide/vci-client#more-details>

    - for kotlin
      <https://github.com/mosip/inji-vci-client/tree/master/kotlin/example>

    - for ios
      <https://github.com/mosip/inji-vci-client-ios-swift/tree/master/SwiftExample>

Keshav - To add the above links below this line - "More details - An example app is added under /example folder which can be referenced for more details."


3.  APIs and Exception sections can be combined, as we have maintained
    the same in both Android and iOS. It\'s redundant right now




**Tuvali**

1.  Maven Central link update -
    <https://central.sonatype.com/artifact/io.mosip/tuvali>

Keshav -

Only for this line? , "tuvali contains the artefacts in maven."


**OpenId4VP**

1.  The first paragraph, need to update the draft version to 23 instead
    of 21

2.  Update the second point of library functionality

    - Validates the received Authorization Request to check if the
      required details are present or not, and then returns the
      Authorization Request to the consumer application once all the
      validations are successful.

3.  **Supported feature**

    - **Device flow:** Cross-Device and Same Device flow

    - Authorization Response mode: direct_post and direct_post.jwt

    - Supported Verifiable Presentations for Online sharing - Credential
      format: ldp_vc and mso_mdoc

4.  <https://docs.inji.io/inji-wallet/inji-mobile/technical-overview/integration-guide/openid4vp#android-kotlin-package-for-openid4vp>

    - Installation mention central link not snapshot
      <https://central.sonatype.com/artifact/io.mosip/inji-openid4vp>

5.  <https://docs.inji.io/inji-wallet/inji-mobile/technical-overview/integration-guide/openid4vp#apis>

    - It will be updated in readme by [Alka
      Prasad](https://mosip.atlassian.net/secure/ViewProfile.jspa?accountId=70121%3A386ddcfc-17a9-4d1a-a8fc-bfb82f486497)
      and then we can refer here

6.  The diagram at bottom - will be updated as\
    Wallet -\> OVP Library -\> Verifier

**BLE Verifier**

1.  We have to mention that it\'s not maintained any more. This wrapper
    was written for Tuvali 0.4.9 version

2.  <https://docs.inji.io/inji-wallet/inji-mobile/technical-overview/integration-guide/ble-verifier#installation>

    - I don\'t think, we can mention as WIP as it\'s not maintained

Inji Mobile Wallet Documentation Review

**Architecture page** -
<https://docs.inji.io/inji-wallet/inji-mobile/technical-overview/architecture>
I will provide new content [Swati
Goel](https://mosip.atlassian.net/secure/ViewProfile.jspa?accountId=557058%3Acc7f3f06-5f70-4e7e-a2e3-4de09e09e29b)

**Technology Stack**
<https://docs.inji.io/inji-wallet/inji-mobile/technical-overview/technical-stack>

- React Native - 0.74.5

- Typescript - 5.3.3

- Jest - 29.7.0

- Android - minSDk 24 compileSDK 34 targetSDK 34

- iOS - 14

**Technology Stack - Native Libraries**
<https://docs.inji.io/inji-wallet/inji-mobile/technical-overview/technical-stack#native-libraries>

- Kotlin - 2.0.0, Java 17

- Android - minSDk 23 compileSDK 34

- iOS - 14

**Components Page**
<https://docs.inji.io/inji-wallet/inji-mobile/technical-overview/components>

This sentence needs to be rephrased These libraries are accessible as
NPM modules, allowing seamless integration with other mobile wallets.\
We don\'t have much NPM libraries now. All the libraries are native. So
we should mention something like These library are accessible as AAR for
Android app and SPM(Swift Package Manager) for iOS App. Android
libraries are written Kotlin and can be easily integrated with cross
platform applications like React Native or Flutter. This makes seamless
integration with other mobile wallets.

Let\'s update the order for the library

1.  Secure Keystore SDK

2.  VCI Client SDK

3.  PixelPass SDK

4.  Tuvali - Sharing via BLE SDK

5.  OpenID4VP - Online Sharing SDK

6.  Face Match SDK

7.  Telemetry SDK(coming soon)

I will share the updated components diagram based on the above order
[Swati
Goel](https://mosip.atlassian.net/secure/ViewProfile.jspa?accountId=557058%3Acc7f3f06-5f70-4e7e-a2e3-4de09e09e29b)

**The details section will be updated based on the above order.**

1.  <https://docs.inji.io/inji-wallet/inji-mobile/technical-overview/components#id-3.-secure-keystore-sdk>

    - link to component page is broken. It should refer to Secure
      Keystore module under Integration

    - Instead of maven snapshot link, we should provide maven central
      repository link. It is
      <https://central.sonatype.com/artifact/io.mosip/secure-keystore>

2.  <https://docs.inji.io/inji-wallet/inji-mobile/technical-overview/components#id-5.-vci-client-sdk>

    - link for kotlin repo should be
      <https://github.com/mosip/inji-vci-client>

    - maven central link -
      <https://central.sonatype.com/artifact/io.mosip/inji-vci-client>

3.  <https://docs.inji.io/inji-wallet/inji-mobile/technical-overview/components#id-4.-pixelpass-sdk>

    - Kotlin link
      <https://github.com/mosip/pixelpass/tree/master/kotlin>

    - Js link <https://github.com/mosip/pixelpass/tree/master/js>

    - maven central link

      - <https://central.sonatype.com/artifact/io.mosip/pixelpass-aar>
        for Android

      - <https://central.sonatype.com/artifact/io.mosip/pixelpass-jar>
        for Java

4.  <https://docs.inji.io/inji-wallet/inji-mobile/technical-overview/components#id-1.-tuvali-sharing-via-ble-sdk>

    - no need to mention by react native library. React native is no
      more supported. We can rephrase the sentence something like This
      library facilitates the transfer of downloaded Verifiable
      Credential from the Wallet to Verifier

    - Tuvali implentation link need to be updated

    - Tuvali\'s permission and requirement link need to be updated

    - Tuvali API integration link need to be updated

    - Maven central link -
      <https://central.sonatype.com/artifact/io.mosip/tuvali>

5.  <https://docs.inji.io/inji-wallet/inji-mobile/technical-overview/components#id-6.-openid4vp-online-sharing-sdk>

    - second point need to be rephrase. It should be \`Validates the
      received Authorization Request to check if the required details
      are present or not and then returns the Authorization Request to
      the consumer application once all the validations are successful.

    - API integration link need to be updated

    - Maven central link -
      <https://central.sonatype.com/artifact/io.mosip/inji-openid4vp>

6.  <https://docs.inji.io/inji-wallet/inji-mobile/technical-overview/components#id-2.-face-match-sdk>

    - second paragraph needs update. We don\'t need file server any more
      as it\'s bundled in app. And It already exists in npm module. Here
      is the link -
      <https://www.npmjs.com/package/@iriscan/biometric-sdk-react-native>

    - When we have defined two scenarios. The first one is During
      Offline VC Sharing. It can be During Offline/Online VC sharing as
      we support both now

    - We don\'t need this line now Upon the initial launch of Inji
      Wallet, the model is downloaded in the background and stored in
      the cache as it\'s bundled within the app now

7.  <https://docs.inji.io/inji-wallet/inji-mobile/technical-overview/components#id-7.-telemetry-sdk>

Need to update the integration guide link
