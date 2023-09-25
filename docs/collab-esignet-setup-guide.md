# e-Signet Setup Guide

Welcome to the comprehensive guide on how to test and experience the various modalities of authentication that [**e-Signet**](https://docs.esignet.io/) offers in MOSIP’s [**Collab**](https://collab.mosip.net/) environment! In this guide, we will walk you through the step-by-step process of authenticating yourself on a relying party’s demo health service portal that has integrated with e-Signet and also help you explore its various modes of authentication. This will enable you to get conversant with a secure & streamlined way of authenticating yourself and accessing online services, while ensuring your identity & information remains protected. 

Let's dive into the details and embark on this informative journey of seamless authentication and exploration.

### Pre-requisites

1. **UIN credentials**

    * Issuance of [UIN](https://docs.mosip.io/1.2.0/id-lifecycle-management/identifiers#uin) (Unique identification number) as a demo credential will allow you to explore e-Signet’s capabilities and experience seamless authentication through various channels.

    * Fill the UIN generation [form](https://docs.google.com/forms/d/e/1FAIpQLSc2I0CQqlYRIrEmcJ3J3tKlYOVNcYNj88YZe4MMwU2RZTrjOA/viewform) here and we will generate the demo credentials which you can subsequently use on the e-Signet integrated health portal for authentication.

2. **Mock biometrics setup- To enable biometrics-based login**

    * Ensure that your machine is running Windows.

    * Make sure you have Java 11 or a higher version installed on your computer.

    * Download the `collab-mock-mds-auth.zip` file from the provided link here.

    * Unzip the downloaded file to extract its contents.

    * Locate the `run_auth.bat` file within the extracted folder.

    * Double-click on the `run_auth.bat` file to start the authentication MDS.

3. **Availability of Inji app for wallet/ Inji-based login**

    * To be able to use the wallet-based authentication mechanism on the portal, ensure you have the Inji app installed on your mobile device. For details on how to set up and use Inji, click [here](https://docs.mosip.io/1.2.0/collab-getting-started-guide/collab-inji-setup-guide). 

    * Make sure to have the credential downloaded in your wallet. For details on how to download the credential, click [here](https://docs.mosip.io/1.2.0/collab-getting-started-guide/collab-inji-setup-guide) (Refer step 3 in the guide). 

   * Also, ensure you have activated your credentials for online login. This step is crucial for wallet-based authentication to work smoothly. For a comprehensive guide on how to activate the VC for online login, refer [here](https://docs.mosip.io/1.2.0/modules/inji-user-guide#wallet-binding-flow) and navigate to the section titled `Wallet Binding Flow`.

   _Note_: Please use 111111 as the OTP, for any OTP-based feature in the Collab environment.

### Step-by-Step Process

To experience the various methods of login and authentication in the demo health services portal using e-Signet, follow the detailed instructions below:

**Step 1: Access the health services portal**

  Navigate to the relying party’s demo [**Health Services**](https://healthservices-esignet.collab.mosip.net/) portal in the Collab environment, and click on `Sign In with e-Signet`.

**Step 2: Explore the various authentication mechanisms**

1. OTP-Based Login & Authentication

    * Click [here](https://docs.esignet.io/esignet-end-user-guide/login-with-otp) for step-by-step instructions on how to login using OTP-based authentication.

2. Inji-Based (Wallet-Based) login With Face Authentication

    * Discover how to login using Inji (Wallet) through face authentication, by clicking on the link [here](https://docs.esignet.io/esignet-end-user-guide/login-flow-qr-code).

    * As mentioned in the pre-requisites section above, ensure that your credential is activated for online login, in Inji. Follow the instructions provided [here](https://docs.mosip.io/1.2.0/modules/inji-user-guide#wallet-binding-flow), in the section titled `Wallet Binding Flow`.

3. Biometrics-Based Login & Authentication

    * Experience the process of logging in using biometrics, by following the instructions provided [here](https://docs.esignet.io/esignet-end-user-guide/login-with-biometrics).
      
  
   _Note_: Biometric-based login with Mock MDS is currently unavailable in the Collab environment. Stay tuned to MOSIP [Community](https://community.mosip.io/) for updates!

### Additional Video Resources

* Watch the informative video titled [About e-Signet](https://www.youtube.com/watch?v=ZfUPRv71s_0,) to gain insights into e-Signet.

* Explore the [e-Signet Online Authentication Demo](https://www.youtube.com/watch?v=uNKlmw9KRFg) video for a practical demonstration of the authentication process.

* Watch [Running e-Signet Locally](https://youtu.be/nmIZl6Tmt68?si=odKFq3UUQrV1kb6H) a quick comprehensive guide for local implementation.

* Click [here](https://docs.esignet.io/) for detailed information about e-Signet.

> By adhering to these guidelines and making use of the available resources, you will have a smooth experience while experiencing the different login and authentication methods offered by e-signet. This will guarantee secure and efficient access to the services you require.

### Get in Touch

If you require any assistance or encounter any issues during the testing and integration process, kindly reach out to us through the support mechanism provided below.

* Navigate to [Community](https://www.mosip.io/community.php).

* Provide a detailed description about the support you require or provide detailed information about the issue you have encountered, including steps to reproduce, error messages, logs and any other relevant details.

_Thank you. Wishing you a pleasant experience!_
