# Login with Biometrics

The login with biometrics is illustrated with the help of a demo health portal.

1\. On the portal, the resident clicks on _**Sign In with eSignet**_.

<figure><img src="../../.gitbook/assets/Health services home page otp.png" alt=""><figcaption><p>Health Portal login page</p></figcaption></figure>

2\. To get started with login using biometrics, the resident clicks _**Login with Biometrics**_.

<figure><img src="../../.gitbook/assets/enter with biometrics.png" alt=""><figcaption><p>Login with Biometrics</p></figcaption></figure>

3\. The resident needs to enter a valid VID in the _**Enter Your VID**_ text field.

<figure><img src="../../.gitbook/assets/biometrics scanning.png" alt=""><figcaption><p>Scanning Devices for Biometric</p></figcaption></figure>

4\. Next, the resident selects a device (face/ iris/ finger) and provides their biometrics.

A new "Refresh" button has been implemented to facilitate the display of recently connected devices in the list.

![](\_images/new4-esignetLogin-biometric-loaded.png)

The resident clicks on the _**Scan and Verify**_ button.

5\. The resident is then navigated to the Consent page. On this page, the **Essential** and **Voluntary** claims are displayed.

![](\_images/new6-esignetConsent.png)

{% hint style="info" %}
The consent screen is presented solely to the resident if consent has not previously been obtained. Additionally, a timer is incorporated into the consent screen, allowing the resident to respond within the designated time frame. If the allotted time elapses, residents will be redirected to the relying party user interface.
{% endhint %}

6\. The resident is given the option to choose from a list of authorized scopes and voluntary claims. The essential claims are mandatory and cannot be modified. In eSignet, a "**master toggle button**" has been added to allow residents to select all the options at once if desired.

![](\_images/new7-esignetConsent-claims.png)

7\. The resident clicks on the _**Allow**_ button. The system navigates the resident to the User Profile page and the page displays their details based on the consent provided.

![Profile page](\_images/new8-healthServices-user-profile.png)
