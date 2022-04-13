# Auth/ Credential Partner

## Overview
Below is the workflow that includes the registration process for an Auth/ Credential partner and the steps that needs to be followed for using the partner portal.

*  Partner self-registers through the portal.
*	Partner selects the relevant Policy Group.
*	Partner admin uploads CA certificate.
*	Partner admin/ Partner uploads the partner certificate.
*	Partner admin/ Partner maps the partner policy.
*	Partner admin approves/rejects partner policy mapping.
*	Partner logins after the approval and generates the API key for the approved partner policy mapping using an unique label.


### Self-registration

* The Auth/ Credential partner can register themselves on MOSIP PMS portal by clicking **Register** on the landing page.
* They need to fill up a form with the details below:
    * First and Last name
    * Organization Name
    * Partner type (Authentication Partner/ Credential Partner)
    * Address, e-mail, phone number
    * Username and password

![](_images/auth-partner-self-register.PNG)

To view the details entered, click **Home** to see the dashboard.


![](_images/auth-partner-map-policy-page.PNG)



### Policy group mapping

On successful registration, the partner can see their username displayed on the top right corner.

1. Partner selects the relevant Policy Group from **Map Policy Group** dropdown. 
2. Clicks **Save**.

![](_images/auth-partner-dashboard.PNG)

### Uploading of Certificates

#### CA Certificate upload

The Partner admin needs to upload the CA certificate to enable the partner for using the portal. To do so, the Partner admin:

1. Clicks **Upload CA Certificate** option on the left navigation pane of the partner portal.
2. Selects the Partner Domain.
3. Chooses the certificate to upload (only files with extensions as .cer or .pem).
4. Clicks **Upload**. 

![](_images/ca-cert-data-upload.PNG)

![](_images/ca-cert-data-success.PNG)

The uploaded certificates can be viewed by clicking on `View Certificates-> View`.

![](_images/auth-partner-view-cert.PNG)

#### Partner Certificate upload

Similarly, the Partner certificates can be added by the Partner admin/ partner.

![](_images/auth-partner-upload-cert-page1.PNG)


![](_images/auth-partner-upload-cert-page2.PNG)


![](_images/auth-partner-upload-cert-success.PNG)


### Mapping policy to the Policy group

Once the CA certificate is uploaded by the partner admin, 

1. Partner maps the policy to the Policy group by clicking on **Partner Policy Mapping** on the left navigation pane.
2. Partner enters the Partner Name.
3. Selects the Auth Policy Name from the dropdown.
4. Enters a value for the Request Details (unique value) and clicks **Save**.


![](_images/auth-partner-upload-cert-success.PNG)

Once this is done, you will see a message saying "policy maapin grequest submitted successfully." Also, the status is displayed as "In progress" and this means that the partner cannot generate the API key until the request is approved by the Partner admin.

### Approval/ Rejection of partner policy mapping

Once the partner policy mapping request is raised by the partner, the Partner admin has the privilege to approve/ reject the mapping.



### Generating the API Key













