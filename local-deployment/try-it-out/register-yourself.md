# Register Yourself

* Now you can self generate your own UIN Credential using the [Collab environment](https://collab.mosip.net/).
  * Click on the **Get UIN** button located at the top-right corner of the page. This will open the [Self Registration Form](https://self-register.collab.mosip.net/), Alternatively, you can simply click on this [link](https://self-register.collab.mosip.net/) to self register. You need to duly fill the self registration form.
  * On successful registration the UIN is sent to you over the email you used for registration, For more details you follow the [Generating Demo Credentials Guide](https://docs.mosip.io/1.2.0/general/collab-getting-started-guide/generating-demo-credentials).

You will be able to explore eSignet’s capabilities and experience seamless authentication through various channels.

## Step-by-Step Process

To experience the various methods of login and authentication in the demo health services portal using eSignet, follow the detailed instructions below:

### Step 1: Access the health services portal

Navigate to the relying party’s demo [**Health Services** ](https://healthservices-mosipid.collab.mosip.net/)portal in the Collab environment, and click on `Sign In with eSignet`.

### Step 2: Explore the various authentication mechanisms

#### OTP Authentication

Once you receive your UIN/VID, you can navigate to the [**health portal**](https://healthservices-mosipid.collab.mosip.net/) and try authenticating using the OTP.

{% hint style="info" %}
**Note: OTP Delivery Update for eSignet Login**\
Previously, the eSignet login flow in the MOSIP Collab (Sandbox) environment used a static OTP (`111111`) for easy self-experience by the community. As per the latest MOSIP platform deployment, OTP delivery now works as follows:

* If you registered with a **valid, accessible email address**, the **OTP will be sent to that email**. Please ensure you use a valid, accessible email ID during self-registration to receive it directly.
* If you did not add a valid email during registration, **you can still get an OTP!** Go to [smtp.collab.mosip.net](http://smtp.collab.mosip.net) **(public mailbox) to get the OTP.**  (**Important:** You must refresh/reload the public mailbox ([smtp.collab.mosip.net](http://smtp.collab.mosip.net)) to clear any previous OTPs and then click Get OTP and use the newly received one to complete login.
{% endhint %}

Please refer the end user guide [here](end-user-guide/health-portal/login-with-otp.md) to know the step by step process.

#### Biometrics-based Authentication

**Mock biometrics setup**

* To enable biometrics-based login, ensure that your machine is running Windows.
* Make sure you have Java 11 or a higher version installed on your computer.
* Download the `collab-mock-mds-auth.zip` file from the link provided [here](https://drive.google.com/drive/folders/14q7E5pZtfj0eimF3JGzlVfU4eV-MRPCQ).
* Unzip the downloaded file to extract its content.
* Locate the `run_auth.bat` file within the extracted folder.
* Double-click on the `run_auth.bat` file to start the authentication MDS.

Experience the process of logging in using biometrics, by following the instructions provided [here](end-user-guide/health-portal/login-with-biometrics.md).

{% hint style="info" %}
**Note**: Biometric-based login with Mock MDS is currently unavailable in the Collab environment. Stay tuned to the MOSIP [Community](https://community.mosip.io/) for updates!
{% endhint %}

### Additional Video Resource

* Watch this informative video [here](https://www.youtube.com/watch?v=ZfUPRv71s_0,) to gain insights into eSignet.
* Explore the [eSignet Online Authentication Demo](https://www.youtube.com/watch?v=uNKlmw9KRFg) video for a practical demonstration of the authentication process.
* Click [here](https://docs.esignet.io/) for detailed information about eSignet.

{% hint style="info" %}
**Note:** By adhering to these guidelines and making use of the available resources, you will be able to smoothly experience the different methods of login and authentication offered by eSignet. This will guarantee secure and efficient access to the services you require.
{% endhint %}

### Get in Touch

If you require any assistance or encounter any issues during the testing and integration process, kindly reach out to us through the support mechanism provided below.

* Navigate to [Community](https://community.mosip.io/).
* Provide a detailed description of the support you require or provide detailed information about the issue you have encountered, including steps to reproduce, error messages, logs, and any other relevant details.
