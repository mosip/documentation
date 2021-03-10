# OTP Setting



* As below, to receive OTP \(one-time password\) over email and SMS set properties:
  * **SMS**
    * File:

      `kernel-mz.properties`
* Properties:

  `kernel.sms`

* **Email**
  * File:

    `kernel-mz.properties`
* Properties

  ```text
  mosip.kernel.notification.email.from=emailfrom
  spring.mail.host=smtphost
  spring.mail.username=username
  spring.mail.password=password
  ```

* You may want to run MOSIP in Proxy OTP mode if you do not have access to Email and SMS gateways, in that case you can skip Proxy OTP Settings.
* To run MOSIP in Proxy OTP mode set the following:

  ```text
    Proxy:
        File: application-mz.properties
        Properites:
            mosip.kernel.sms.proxy-sms=true
            mosip.kernel.auth.proxy-otp=true
            mosip.kernel.auth.proxy-email=true
  ```

  _**Note**_ : The default OTP is set to **111111**.

