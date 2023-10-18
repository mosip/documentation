# Login with Biometrics

The login with biometrics is illustrated with the help of a demo health portal.

1\. On the portal, the r esident clicks on `Sign In with e-Signet`.

![](\_images/new1-healthservices.png)

2\. To get started with login using biometrics, the resident clicks `Login with Biometrics`.

![](\_images/new2-esignetLogin.png)

3\. Resident needs to enter valid VID in the `Enter Your VID` text field.

![](\_images/new3-esignetLogin-biometric.png)

4\. Next, the resident selects a device (face/ iris/ finger) and provides their biometrics.

 A new "Refresh" button has been implemented to facilitate the display of recently connected devices in the list.

![](\_images/new4-esignetLogin-biometric-loaded.png)

The resident clicks on the `Scan and Verify` button.

![](\_images/new5-esignetLogin-biometric_capture.png)

5\. The resident is then navigated to the Consent page. On this page, the **Essential** and **Voluntary** claims are displayed.

![](\_images/new6-esignetConsent.png)

{% hint style="info" %}
The consent screen is presented solely to the resident if consent has not previously been obtained. Additionally, a timer is incorporated onto the Consent screen, allowing the resident to provide a response within the designated time frame. In the event that the allotted time elapses, residents will be redirected to the relying party user interface.
{% endhint %}

6\. The resident is given the option to choose from a list of Authorized scopes and Voluntary claims. The Essential claims are mandatory and cannot be modified. In e-Signet v1.1.0, a "master toggle button" has been added to allow residents to select all the options at once, if desired.

![](\_images/new7-esignetConsent-claims.png)

7\. The resident clicks on the "Allow" button. The system navigates the resident to the User Profile page and the page displays their details based on the consent provided.

![](\_images/new8-healthServices-user-profile.png)
