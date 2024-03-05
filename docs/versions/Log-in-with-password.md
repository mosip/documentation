# Login with Password 

## Introduction

**Login with Password** provides users with an access method for the relying party portal by entering their username or mobile number and their corresponding password. This option allows relying parties to optionally include a prefix, such as country code for mobile numbers.

**Register through Signup Portal**: Users can register for relying party portal. To register, users can visit the signup portal, provide their mobile number, and create a password. Upon successful registration and if the relying party has enabled the option to login with password, users can utilize the **Login with Password** option.

**Enabling of Login with Password option for login**

1. Create the client with ``mosip:idp:acr:password`` in ``acr`` values.
2. Add ``mosip:idp:acr:password`` value in the ACRS environment variable in ``env-config.json``.

## Adding prefix or suffix for Login with Password

Within the ``esignet-default.properties`` file, users can manage how usernames are displayed by customizing specific variables within the ``mosip.esignet.ui.config.key-values`` object:

1. Adding a Prefix: To concatenate a prefix before usernames, set a value for the ``username.prefix`` variable. Example: 
   ``username.prefix=+855`` would result in usernames like ``+855987654321``.
2. Adding a Suffix: To append a suffix after usernames, set a value for the ``username.postfix`` variable. Example: 
   ``username.postfix=@phone`` would yield usernames like ``987654321@phone``.

**Note**: Changes to these variables affect how usernames are displayed throughout the application that uses this configuration file. Ensure any prefixes or suffixes you choose to align with your specific needs and preferences.

## Process to Login with Password

1. If your relying party has enabled Login with Password login flow, application displays below mentioned screen.
2. Before proceeding to login, users can enter username or mobile number, password, and verify captcha.
3. Upon successful verification of user login credentials, **Consent** page is displayed as shown below.
4. Upon successful consent, relying party page is displayed as shown below.
   
