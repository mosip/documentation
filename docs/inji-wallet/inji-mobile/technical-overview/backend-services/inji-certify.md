# Inji Certify

## Inji Certify

The Inji Certify service is utilized by Inji Wallet for downloading the VC.

#### Download VC

The user is currently on the `Add new card` screen and chooses an issuer(For example, Republic of Veridonia National ID Department).

* Inji Wallet utilizes the `react-native-app-auth` library for authorization flow.
  * It first redirects the user to the authorization server configured respective to the Issuer (For example, e-Signet).
  * The user performs authentication (For example, on the eSignet UI, the input the necessary information such as a unique ID and OTP (One-time Password)).
  * Post successful authentication, the user is redirected back to the Inji Wallet app with an authorization code.
  * Inji Wallet then exchanges the authorization code for an access token.
* Using the access token, Inji Wallet makes a request to the credential endpoint from Inji Certify to download the credential.

For credential request, refer credential\_endpoint attribute in issuer's configuration response.
