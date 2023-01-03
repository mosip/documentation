# End User Guide

In this user guide, we are taking an example of a Health services portal that acts a relying party using e-Signet to provide services and benefits to the residents. Also, in turn, the residents can quickly identify themselves using their country' foundation ID system (here MOSIP) thereby avoiding the hassels of repeatedly filling up their account/personal information.

There are multiple ways a user can be authenticated themselves.  

The two login flows supported with this release are illustrated:

1. Login flow for OTP based authentication
2. Login flow for Biometrics based authentication

## LOGIN with OTP authentication

Pre-requisite: The resident is registered with MOSIP and has a valid UIN or VID.

1\. Resident clicks `Sign In with MOSIP`. 

![](\_images/idp-login-otp-signin.png)

The login screen appears and the resident is displayed with the options they can choose for login.

2\. To get started with login with OTP authentication, resident clicks on `Log in here`. 

**Login with OTP** screen is displayed to the resident.

![](\_images/idp-login-otp-loginhere.png)

3\. Resident needs to enter valid VID in the `Enter VID` textfield. Also, they can enter the UIN here.

![](\_images/idp-login-otp-entervid.png)

4\. Next, the resident clicks on `Get OTP` button.

5\. The resident receives the OTP on the registered channel (either the phone or on email).

6\. The resident needs to enter the valid OTP received and click on `Verify` button.

![](\_images/idp-login-otp-verify.png)

7\. The resident is then navigated to the Consent page. On this page, the **Essential** and **Voluntary** claims are displayed.

![](\_images/idp-login-otp-askingconsent.png)

8\. The resident has the choice to select amongst the list of Voluntary claims while the Essential claims are mandatory and cannot be edited.

![](\_images/idp-login-otp-showingclaims.png)

9\. The resident then clicks on the `Allow` button. The system navigates the resident to the User Profile page and the page displays their personal information based on the consent provided.

![](\_images/idp-login-otp-display-pi.png)


## LOGIN with Biometrics

1\. Resident clicks on `Sign In with MOSIP`. They are navigated to the login screen where they can choose the way they want to login.

![](\_images/idp-login-otp-signin.png)

2\. The resident clicks on `Log in here`.

![](\_images/idp-login-bio-loginhere.png)

3\. To get started with login using biometrics, the resident needs to click on `More ways to Login` --> `Login with Biometric`.

![](\_images/idp-login-bio-moreways.png)

4\. Resident needs to enter valid VID in the `Enter VID` textfield. Also, they can enter the UIN here.

![](\_images/idp-login-bio-selecteddevice.png)

5\. Next, the resident selects a device based on authentication (face/ iris/ finger) needed and provide correct biometrics.

![](\_images/idp-login-bio-selectdevice.png)

6\. The resident clicks on `Scan and verify` button.

![](\_images/idp-login-bio-scan.png)

7\. The resident is then navigated to the Consent page. On this page, the **Essential** and **Voluntary** claims are displayed.

![](\_images/idp-login-bio-claims.png)

8\. The resident has the choice to select amongst the list of Voluntary claims while the Essential claims are mandatory and are cannot be edited.

![](\_images/idp-login-bio-selectclaims.png)

9\. The resident then clicks on the `Allow` button. The system then navigates the resident to the User Profile page and the page displays their personal information based on the consent provided.

![](\_images/idp-login-bio-display-pi.png)
