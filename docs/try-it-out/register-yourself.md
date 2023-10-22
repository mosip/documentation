# Register Yourself

You can get your credentials added to Collab by filling out [this form](https://docs.google.com/forms/d/e/1FAIpQLSc2I0CQqlYRIrEmcJ3J3tKlYOVNcYNj88YZe4MMwU2RZTrjOA/viewform). We generally take 1-2 working days to create your credentials.

Once your credentials are generated, you will receive a VID (Virtual ID) from our collab environment at your registered email ID. After which, you will be able to explore eSignet’s capabilities and experience seamless authentication through various channels.

## Steps to test eSignet

We have built a mock health portal that acts as a relying party web portal. Here, as an end user, you are trying to avail online health services by logging into the health portal using your national ID.

You can visit the Collab health portal using [this link](https://healthservices-esignet.collab.mosip.net/).

### OTP Authentication

Once you receive your VID, you can navigate to the [health portal](https://healthservices-esignet.collab.mosip.net/) and try authenticating using your VID and the default OTP, i.e. "111111" (six ones).

A detailed step-by-step guide on how to log in with OTP using eSignet is also available [here](../end-user-guide/login-with-otp/).

### Authentication using Wallet

For our testing, we have integrated with [MOSIP's digital wallet - Inji](https://docs.mosip.io/inji), which we can use as an authenticator.

In order to get your credentials onboarded on Inji and enable them for authentication, follow the below steps,

1. Install the Inji APK on your mobile device using [this guide to set up and use Inji](https://docs.mosip.io/1.2.0/collab-getting-started-guide/collab-inji-setup-guide)
2. Download your credentials on Inji. For details on how to download the credential, click [here](https://docs.mosip.io/1.2.0/collab-getting-started-guide/collab-inji-setup-guide) (Refer to step 3 in the guide)
3. Ensure that you have activated your credentials for online login. This step is crucial for wallet-based authentication to work smoothly. For a comprehensive guide on how to activate the VC for online login, refer [here](https://docs.mosip.io/1.2.0/modules/inji-user-guide#wallet-binding-flow) and navigate to the section titled **Wallet Binding Flow**.

Once you are done with the above steps, you can use the Inji wallet to log into the health portal. The detailed steps to log into the health portal using the Inji wallet are available [here](../end-user-guide/login-with-qr-code/).
