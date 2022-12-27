# IdP User Guide

In this user guide, we are taking an example of a Health services portal that acts a relying party using Idp to provide services and benefits to the residents. Also, in turn, the residents can quickly identify themselves on various websites using their country' foundation ID system (here MOSIP) thereby avoiding the hassels of repeatedly filling up their account/personal information.

There are multiple ways a user can uthenticate th Below we are illustrating different flows for login:

1. Login flow for OTP based authentication
2. Login flow for Biometrics based authentication

## LOGIN with OTP authentication

Pre-requisite: The resident is registered with MOSIP and has a valid UIN or VID.

1\. Resident clicks on `Sign in with MOSIP'. 
    The resident is navigated to the login screen.
    
2\. To get started with login with OTP authentication, resident clicks on 'Log in here`.

3\. `Login with OTP' screen displayed to the resident.

4\. Resident needs to enter valid VID in the `Enter VID' textfield. Also, they can enter the UIN here.

5\. Next, the resident clicks on `Get OTP` button.

6\. The resident receives the OTP on the registered channel(either the phone number or emailId).

7\. The resident needs to enter the valid OTP received and click on `Verify` button.

8\. The resident is then navigated to the Consent page. On this page, the Essential and Voluntary claims are displayed.

9\. The resident has the choice to select amongst the list of Voluntary claims while the Essential claims are mandatory and not editable.

10\. The resident then clicks on the 'Allow' button. The system then navigates the resident to the User Profile page and the page displays their personal information based on the consent provided.

## LOGIN with Biometrics

1\. Resident clicks on `Sign in with MOSIP'. 
    The resident is navigated to the login screen.
2\. The resident clicks on 'Log in here`.
3\. To get started with login using biometrics, the resident needs to click on 'More ways to Login'.
4\. Resident needs to enter valid VID in the `Enter VID' textfield. Also, they can enter the UIN here.
5\. Next, the resident clicks on `Get OTP` button.
6\. The resident receives the OTP on the registered channel(either the phone number or emailId).
7\. The resident needs to enter the valid OTP received and click on `Verify` button.
8\. The resident is then navigated to the Consent page. On this page, the Essential and Voluntary claims are displayed.
9\. The resident has the choice to select amongst the list of Voluntary claims while the Essential claims are mandatory and not editable.
10\. The resident then clicks on the 'Allow' button. The system then navigates the resident to the User Profile page and the page displays their personal information based on the consent provided.


1.User click on sign in with mosip.
2.User navigates to login screen
3.Clicks on login here
4.click on more ways to login
5.click on login with biometric
6.Enter valid UIN/VID.
7.Select a device based on authentication(face,iris,finger) needed and provide correct biometric
8.User clicks on "scan and verify" button
9.Then user should be navigated to consent page.
10.User is displayed with Essentials and voluntary claims .
11.User selects all voluntary claims displayed.
12.User clicks on allow button
13.Then user should be navigated to User Profile page and displayed with user information
