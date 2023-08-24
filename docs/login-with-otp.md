## Login flow for OTP-based authentication

Pre-requisite: The resident is issued with a unique virtual ID for a country's foundation ID. In the below demo application, the resident is registered with MOSIP and has a valid UIN or VID.

1\. Resident clicks `Sign In with e-Signet`.

![](\_images/qr-login-screen1.png)

The login screen appears and the resident is displayed with the options they can choose for login.

2\. To get started with login with OTP authentication, the resident clicks on `Log in here`.

**Login with OTP** screen is displayed to the resident.

![](\_images/esignet-loginhere.png)

3\. Resident needs to enter valid VID in the "Enter Your VID" text field and check the box 'I'm not a robot'.

With e-Signet version 1.0, the OTP-based authentication is now secured with captcha.

![](\_images/esignet-captcha-validation.png)

4\. Next, the resident clicks on the `Get OTP` button.

5\. The resident receives the OTP on the registered channel (either the phone or email).

6\. The resident needs to enter the valid OTP received and click on the `Verify` button.

![](\_images/esignet-otp-entered.png)

7\. The resident is then navigated to the Consent page. On this page, the **Essential** and **Voluntary** claims are displayed.

![](\_images/esignet-not-allowed-claims.png)

_Note_ :  The consent screen is presented solely to the resident if consent has not previously been obtained. Additionally, a timer is incorporated onto the Consent screen, allowing the resident to provide a response within the designated time frame. In the event that the allotted time elapses, residents will be redirected to the relying party user interface.

8\. The resident is given the option to choose from a list of Authorized scopes and Voluntary claims. The Essential claims are mandatory and cannot be modified. In e-Signet v1.1.1, a `master toggle button` has been added to allow residents to select all the options at once, if desired.

![](\_images/esignet-claims.png)

9\. The resident should click the `Allow` button. The system navigates the resident to the User Profile page which displays all the personal information based on the consent provided.

![](\_images/esignet-final.png)
