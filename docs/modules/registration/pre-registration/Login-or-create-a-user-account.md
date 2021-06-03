#  Login/create a user account

##  Preferred Language

##  Login using email or phone number
Residents can log in to the pre-registration portal by providing their email id or mobile number. The system validates the email id or phone number, once validated sends an OTP which the resident enters. The system validates the OTP redirects the user to enter or edit the details for booking an appointment.

## Automatic user id creation on the first login 
The resident logs in to the pre-registration portal with their mobile number or email id. After successful Authentication, the system checks if the user is a first-time user or not. If the user is a first-time user, the system creates a new record in the database. All the pre-registration ids created from there on will be mapped to this user id.

## CAPTCHA support
In the login screen before requesting an OTP, the system asks the resident to provide a CAPTCHA. CAPTCHA is used to mitigate DDoS attacks. Once the challenge provided in the CAPTCHA is solved by the resident the request an OTP request is sent.

## Logout/session timeout 
If the resident wishes to log out of the pre-registration system, he/she can opt to select the Logout option. The token issued during the Authentication of user Login is deleted and the user gets logged out of the system.  If the user is inactive for X minutes (X is configurable), the system notifies the user one minute before the configured timeout limit and logs out after a minute. In such a case, the system will not save any user data.

# To Do

## API Details
 * [API Documentation](https://nayakrounak.gitbook.io/mosip-docs/v/1.2.0/modules/registration/pre-registration/Pre-Reg-API-Documentation.md)

* Configuration Parameters
    * List of parameters and how they alter the behaviour of the API

## Links to related content
* Link to design documentation,
* Links to How To articles

