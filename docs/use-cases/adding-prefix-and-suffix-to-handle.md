# Adding Prefix and Suffix to Handle

## Introduction

**Login with Password** provides users with an access method for the relying party portal by entering their username or mobile number and their corresponding password. This option allows relying parties to optionally include a prefix, such as country code for mobile numbers.

**Register through Signup Portal**: Users can register for relying party portal. To register, users can visit the signup portal, provide their mobile number, and create a password. Upon successful registration and if the relying party has enabled the option to login with password, users can utilize the **Login with Password** option.

**Enabling of Login with Password option for login**

1. Create the client with `mosip:idp:acr:password` in `acr` values.
2. Add `mosip:idp:acr:password` value in the ACRS environment variable in `env-config.json`.

## Adding prefix or suffix for Login with Password

Within the `esignet-default.properties` file, users can manage how usernames are displayed by customizing specific variables within the `mosip.esignet.ui.config.key-values` object:

1. Adding a Prefix: To concatenate a prefix before usernames, set a value for the `username.prefix` variable. Example: `username.prefix=+855` would result in usernames like `+855987654321`.
2. Adding a Suffix: To append a suffix after usernames, set a value for the `username.postfix` variable. Example: `username.postfix=@phone` would yield usernames like `987654321@phone`.

**Note**: Changes to these variables affect how usernames are displayed throughout the application that uses this configuration file. Ensure any prefixes or suffixes you choose to align with your specific needs and preferences.

## Process to Login with Password

1.  If your relying party has enabled the Login with Password login flow, the application displays below mentioned screen.

    <img src="../_images/Login with Password screen.png" alt="Login with Password screen.png" data-size="original">
2.  Before proceeding to login, users can enter a username or mobile number, password, and verify the captcha.

    <img src="../_images/Login with Password filled with value.png" alt="Login with Password filled with value.png" data-size="original">
3.  Upon successful verification of user login credentials, the **Consent** page is displayed as shown below.

    ![Consent screen after Login with Password.png](<../\_images/Consent screen after Login with Password.png>)
4.  Upon successful consent, the relying party page is displayed as shown below.

    ![Relying party portal after login.png](<../\_images/Relying party portal after login.png>)
