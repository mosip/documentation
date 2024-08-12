# User Guide

## PMS Admin (Partner Admin)

**Partner Management Portal (PMP) is used by both; PMS Admin and Partner User.**

* Partner Administrator: Partner Admin
* Partners: Partner User

{% hint style="warning" %}
**Important**:&#x20;

While we are improving/revamping the PMS (Partner Management System) and it’s interface which we will frequently call as PMP (Partner Management Portal) this will be worth noting that there are still some dependencies on older ‘**Partner Management Portal**’ and therefore we will still be doing few activities from an older PMP interface, this we have mentioned at appropriate places as ‘**Prerequisites**’.
{% endhint %}

## What all activities does a 'Partner Admin' performs?

Being a ‘Partner Admin’ you can perform following activities:

* Upload Root CA and Sub CA Certificates
* Create Policy Group and Policy
* Approve Policy

### Upload Root CA and Sub CA (From Older PMP Interface)

Only after you 'Upload Root CA and Sub CA (From Older PMP Interface)' that a Partner will then be able to 'Upload CA signed Partner Certificate'.&#x20;

> As a process of Partner onboarding onto PMP after successful registration Partner is required to **Upload CA signed Partner Certificate** on behalf of their organisation which would be used to build a trust store in MOSIP to cryptographically validate that they are from a trusted organisation to perform authentication of citizens. Also this certificate is used to encrypt the response shared in e-KYC.

{% hint style="warning" %}
**Important:**

You will have to use older Partner Admin interface, Yes! you read it correct! before a Partner will be able to ‘**Upload ‘CA Signed Certificate**’ it is prerequisite that the ‘**Partner Admin**’ must upload the **Root CA** and **Sub CA** certificates and this you can do from ‘**Older PMP Interface’**.
{% endhint %}

#### To Upload Root CA and Sub CA (From Older PMP Interface)

1. Go to **Older PMP Interface** and click on **Upload CA Certificate** option on the left navigation pane.
2. Select the Partner Domain.
3. Choose the **Root certificate** to upload (only files with extensions as .cer or .pem).
4. Click Upload.
5. Similarly, sub/intermediate CA certificate should be uploaded by following the above steps (1-4).

<figure><img src="../../../../../.gitbook/assets/pms_upload_root_ca.png" alt=""><figcaption></figcaption></figure>

### Creating Policy Group and Policy

As Partner Admin you are required to ‘**Create Policy Group**’ and ‘**Create Policy(s)**’ which a ‘Partner’ will be able to select while self-registering on PMP.

As an admin you will also have privilege to ‘**Approve Policy Request**’ when a Partner selects a Policy and it comes to you for approval, You can read more about this <mark style="color:red;">**here**</mark>.

#### Create Policy group

* Login as Partner Admin into the PMS portal (Older PMP Interface).
* Click on **Policy** > **Policy Group**. The existing policy groups are listed on the screen and the new ones can be created.

<figure><img src="../../../../../.gitbook/assets/pms_create_policy_group.png" alt=""><figcaption><p>Create Policy Group</p></figcaption></figure>



* Click on **Create Policy Group** (+).
* Enter the ‘**Policy Group Name**’ and ‘**Description**’.
* Click **Save**.

<figure><img src="../../../../../.gitbook/assets/pms_create_policy_group_basic_details.png" alt=""><figcaption></figcaption></figure>

#### Create an Auth Policy

On successful creation of **Policy Group(s)**, Polices can be created under a respective group.

{% hint style="info" %}
**Note:**&#x20;

**MOSIP** supports two types of policies, i.e. **Auth Policy** and **Datashare Policy**. Only **Auth Policy** is used by **Authentication Partners**.
{% endhint %}

1. Click on **Policy** > **Policy Group** on the left navigation pane, The existing policy groups are listed on the screen and the new ones can be created. You can also search or filter any data pertaining to policy groups, use the filter menu.\
   <mark style="color:red;">**\<image>**</mark>
2. Click **Auth Policy** > **Create Policy**.
3. Add the **Name** and **Description**.
4. Select the **Policy Group** from the dropdown, (Select the **Policy Group - Auth Policy**) here under which this Policy you are creating will be added.
5. Add the <mark style="color:red;">**Policies Data**</mark>.
6. Click Save.

<figure><img src="../../../../../.gitbook/assets/pms_create_auth_policy.png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
**Note**:&#x20;

Once the policy is created, it will be in Inactive state. You have to **Activate a Policy** before a Partner will be able to select it while ‘**Requesting a Policy**’.
{% endhint %}



#### Activate/Edit Auth policy

Once you 'Create Policy' you also be required to activate it and it will reflect when a Partner wants to select a policy. You can also change the status of **Policy Group** ( Deactivate/Re-activate) or edit it using the Action menu as shown below.

1. Select the Policy you want to activate or edit.
2. From the Actions menu, select Activate/Edit.

<figure><img src="../../../../../.gitbook/assets/pms_activate_auth_policy.png" alt=""><figcaption></figcaption></figure>

### Approve Policy Request

When a Partner have chosen a 'Policy Group' and the 'Policy'an approval request will come to you and  you can approve or reject a ‘**Policy Request**’ using ‘**Request Policy**’ screen.

* Click on **Partner Policy Mapping** in the left navigation pane.
* Select the policy mapping that needs an approval.
* Click on **Manage Policy** on the ‘**Action Menu**’ appearing against a Policy.
* Click on **Approve**.

<figure><img src="../../../../../.gitbook/assets/pms_approve_policy_1.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../../../.gitbook/assets/pms_approve_policy_2.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../../../.gitbook/assets/pms_approve_policy_3.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../../../.gitbook/assets/pms_approve_policy_4.png" alt=""><figcaption></figcaption></figure>



## Partner Registration

Before an interested organization/entity can become an 'Authentication Partner' to MOSIP platform the organization will need to undergo a flow of following activites and when the organization will finally be inducted as 'Authentication Partner'.

* Self Register on PMS Interface
* Upload CA signed Certificate



### Self-Register on PMP as Auth Partner

1. The Authentication Partner can register themselves on MOSIP PMS portal by clicking **Register** on the Login Page, a form comes up.
2. Enter the Auth Partner details:
   1. Partner type (Authentication Partner)
   2. First and Last name
   3. Organization Name
   4. Address, Phone number
   5. e-mail, Username and password

<figure><img src="../../../../../_images/pms_register_as_partner.png" alt=""><figcaption></figcaption></figure>

2. Click on Register, a popup comes up which asks you to '**Choose a Policy Group**' and seeks you to '**Agree to Terms and Conditions**' before you can be considered as 'Auth Partner.
3. Select the relevant/applicable **Policy Group** on **Select Policy Group** popup using **Policy Group** dropdown which then will ask you read through ‘Terms and Condition’ and having carefully read through it you can agree and accept it.

<figure><img src="../../../../../.gitbook/assets/pms_select_policy_group.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../../../.gitbook/assets/pms_select_policy_group_2.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../../../.gitbook/assets/pms_self_register_terms_and_condition.png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
**Validations**:

* User can select only one **Policy Group** per **Partner Type**.
* Policy selected once cannot be edited later.
* Terms & Conditions: Partner consent refers to voluntary and informed agreement provided by a partner user on behalf of the Partner Organisation, to a specific action or process where the users have a clear understanding of what they are consenting to. User consent is important to ensure data privacy, where it is compliant to obtain explicit consent from partners before collecting, processing, or sharing their personal/ organisation level data.
* A detailed description explaining which of their personal and organisation data is used and for what purposes it will be used in PMP will be informed while seeking user consent.
* If the user does not wish to agree to the terms and conditions at the moment, he can , for that while, logout from the application and come back again to accept the 'Terms and Conditions' and proceed on with other activities such&#x20;
  * CA Signed Partner Certificate Upload
  * Request Policy and&#x20;
  * Setup Authentication.
{% endhint %}

### CA Signed Partner Certificate Upload / Download or Re-Upload

Once registered as a process of Partner onboarding onto PMP after successful registration, user is required to perform upload CA signed Partner Certificate on behalf of their organisation which would be used to build a trust store in MOSIP to cryptographically validate that they are from a trusted organisation to perform authentication of citizens. Also this certificate is used to encrypt the response shared in e-KYC.

{% hint style="info" %}
**Tips**:

Later when required a Partner can also ‘Download Certificate’ and ‘Re-Upload Certificate’ (As the need may be).
{% endhint %}



{% hint style="info" %}
Important:&#x20;

Before a Partner can upload a ‘CA Signed Certificate’ it is prerequisite that the ‘Partner Admin’ should have already had uploaded the **Root CA** and **Sub CA** certificates (From older PMP interface).
{% endhint %}

#### To Upload CA signed Certificate

1. Go to Authentication Partner (new UI) > Dashboard, Click on Partner Certificate option, User can upload the partner certificate signed by CA by clicking on the upload button.

<figure><img src="../../../../../.gitbook/assets/pms_upload_partner_vertificate_1.png" alt=""><figcaption></figcaption></figure>

2. &#x20;Select the CA signed partner certificate from local system by tapping on the upload section (blue area)

<figure><img src="../../../../../.gitbook/assets/pms_upload_partner_vertificate_2.png" alt=""><figcaption></figcaption></figure>

3. Certificate is successfully fetched from local system.

<figure><img src="../../../../../.gitbook/assets/pms_upload_partner_vertificate_3.png" alt=""><figcaption></figcaption></figure>

4. Partner Certificate is uploaded successfully on clicking Submit.

<figure><img src="../../../../../.gitbook/assets/pms_upload_partner_vertificate_4.png" alt=""><figcaption></figcaption></figure>

5. On closing the popup, The user can view the uploaded certificate details in the form of a list view.

<figure><img src="../../../../../.gitbook/assets/pms_upload_partner_vertificate_5.png" alt=""><figcaption></figcaption></figure>

#### Download Certificate

There is also an option to download initially uploaded CA signed certificate and also MOSIP Signed Certificate.

#### Re-Upload Certificate

Content to be updated..



### Request Policy

**Pre-Requisite**: **Policy Manager** must have created a **Policy Group** and then created a **Policy** within it for the Partner to be able to ‘**Request a Policy**’.

#### To Request a Policy

1. Go to **Request Policy** On PMP Interface. You can also use search to filter data.
   1. Each policy is provided with policy description, You can make a suitable policy selection. You can provide appropriate request comments and submit the policy request details. A message conveying Policy request submitted successfully to admin is displayed.

<figure><img src="../../../../../.gitbook/assets/pms_request_policy_1.png" alt=""><figcaption></figcaption></figure>

2. This newly created policy request will be in ‘Pending for Approval’ status. You can also click on action menu to see all the submitted policy details irrespective of its status. The details will also display the comments by admin, if any.

<figure><img src="../../../../../.gitbook/assets/pms_request_policy_2.png" alt=""><figcaption></figcaption></figure>

3. Once the request is approved (Partner Admin will [**Approve Policy Request**](end-user-guide.md#approve-policy-request)). Once the request is approved you can view the status turns to ‘Approved’ status.\


<figure><img src="../../../../../.gitbook/assets/pms_request_policy_3.png" alt=""><figcaption></figcaption></figure>



## Authentication Service

After you have self registered, selected a policy group, requested for policy and also got approval now you can 'Setup Authentication Services':

* OIDC Client: Create OIDC Client for approved policy
* API Key : Generate API Key for approved policy

**Prerequisites**: Policy requested by the **Partner** must be already approved by **Policy Manager**.

#### Creating OIDC Client

* The authentication partner needs to provide the following details to create OIDC Client
  * Select suitable Authentication policy for OIDC Client creation. Only the policies that are APPROVED by admin will be available in dropdown for selection.
  * Enter the public key in JWK format, name or label for OIDC Client, LogoURI and one or more Redirect URI.
  * On successful submission, user can find this record in tabular list of submitted OIDC Client details in ‘Activated’ status. Tabular list and individual view of submitted OIDC Client details along with OIDC Client ID, Edit OIDC Client details and Deactivate OIDC Client can also be seen from here.

<figure><img src="../../../../../.gitbook/assets/OIDC_client_creation_1.png" alt=""><figcaption></figcaption></figure>

* Once the details are in Activated status, user will be able to view the OIDC Client ID generated, by clicking on the eye icon ( ). clicking on the OIDC Client ID eye icon, opens a popup window which displays the Client ID and a copy button.
* This Client ID can then be consumed in eSignet to perform authentication. Client ID can be accessed by clicking on eye icon

<figure><img src="../../../../../.gitbook/assets/OIDC_client_creation_3.png" alt=""><figcaption></figcaption></figure>

* User can utilize this OIDC Client ID to perform eSignet based authentication of citizens.

<figure><img src="../../../../../.gitbook/assets/OIDC_client_creation_4.png" alt=""><figcaption></figcaption></figure>

* The user can also view every OIDC Client detail individually using the View option

<figure><img src="../../../../../.gitbook/assets/OIDC_client_creation_5.png" alt=""><figcaption></figcaption></figure>

* The user can also edit the OIDC Client details in Activated (only OIDC Client Name, LogoURI and RedirectURI are editable) by selecting the edit option in Action Menu.

<figure><img src="../../../../../.gitbook/assets/OIDC_client_creation_6.png" alt=""><figcaption></figcaption></figure>

* User can deactivate the OIDC Client ID by clicking on deactivate option . The deactivate popup window appears and on clicking confirm, the OIDC Client record is changed to Deactivated status. **Once deactivated, the client ID can not be used anymore for authentication**.

<figure><img src="../../../../../.gitbook/assets/OIDC_client_creation_7.png" alt=""><figcaption></figcaption></figure>

#### API Key Generation

The authentication partner needs to provide the following details to generate API Key

* Select suitable Authentication policy for API Client. Only the policies that are **Approved** by admin will be available in dropdown for selection.

1. Enter an appropriate name or label for API Key to be generated and submit, On successful submission, a popup window displays API Key along with a copy button.

<figure><img src="../../../../../.gitbook/assets/pms_generating_api_key_1.png" alt=""><figcaption></figcaption></figure>

2.  This API Key can be viewed by user in PMS application only once due to security reasons, hence the user is well notified with an appropriate message in the same API Key popup window to avoid closing the window unless user has not copied the API Key.\


    <figure><img src="../../../../../.gitbook/assets/pms_generating_api_key_2.png" alt=""><figcaption></figcaption></figure>
3.  User can find this record in tabular list of submitted API details in ‘Activated’ status.\


    <figure><img src="../../../../../.gitbook/assets/pms_generating_api_key_3.png" alt=""><figcaption></figcaption></figure>
4. User can either view individual API Key entries or view the consolidated list in tabular view.

<figure><img src="../../../../../.gitbook/assets/pms_generating_api_key_4.png" alt=""><figcaption></figcaption></figure>

5. You also have an option to deactivate an API Key, which thereafter cannot be used for authentication. On clicking confirm, the API Key record is changed to Deactivated status. Once deactivated, it cannot be activated again. You may need to generate a new API key as per requirement.

<figure><img src="../../../../../.gitbook/assets/pms_generating_api_key_5.png" alt=""><figcaption></figcaption></figure>



................................................................................................................................................................................

## Interface Overview

PMP (Partner Management Portal) is going under a comprehensive overhaul. This revamp includes improving usability and elevate the overall user experience (UX). The focus is to bring user centered design to PMP, make the PMP more intuitive, efficient, and aligned with our partners' evolving needs.

Card view presentation for each functionality with brief description to help you understand the services offered in Partner User Dashboard:

After successfully registering you can access the Home Page / Dashboard and based on your Partner Type you will be able to view the features and functionalities in the dashboard.

Note: You can access the partner dashboard only when you are duly registered and have selected the 'Policy Group'.

Each functionality that the user can perform is displayed in each card so that there is independent navigation for each tasks.


The PMP Interface 'Card View' for 'Auth Partner' presents you with following features, These features can also be accessed by clicking on side panel (in the form of icons) or clicking on the hamburger menu on the top left which is available across all screens of PMP to help user to easily navigate.


- Partner Certificate: Upload or Reupload CA Signed Partner Certificate and Download CA Signed Partner Certificate & corresponding MOSIP Signed Certificate

- Policies: Request for a policy within the selected policy group, tabular list of requested policies along with status of admin approval, view requested policy details along with admin comments/status.

- Authentication Services: 

  - OIDC Client :  Create OIDC Client for approved policy, tabular list and individual view of submitted OIDC Client details along with OIDC Client ID, Edit OIDC Client details and Deactivate OIDC Client
  - API Key : Generate API Key for approved policy, tabular list and individual view of submitted API Key details and Deactivate API Key.


You can view your organisation name and username on the top right called 'User Profile', logout options is also placed here only.


Open image-20240719-134912.png
image-20240719-134912.png


\<image>



## Reupload a new partner certificate through the following steps

* Login to PMP and Go to Dashboard.

* Click on Partner Certificate option in the dashboard/ side panel / hamburger menu, you will be redirected to list view of partner certificate. 

* Click on Re-Upload button of Authentication Partner Type.

<figure><img src="../../../../../.gitbook/assets/pms_reupload_partner_certificate_1.png" alt=""><figcaption></figcaption></figure>

*   Re-upload certificate pop-up window appears. The time and date of previous certificate upload is also displayed for user reference.\
    ![](../../../../../.gitbook/assets/pms\_reupload\_partner\_certificate\_2.png)

    \
    ![](../../../../../.gitbook/assets/pms\_reupload\_partner\_certificate\_3.png)\

* Click on the certificate upload section (blue area) to upload a new partner certificate from the local system. After selecting the certificate from local system , the fetched certificate name is displayed:

<figure><img src="../../../../../.gitbook/assets/pms_reupload_partner_certificate_4.png" alt=""><figcaption></figcaption></figure>

Click on Submit, Partner certificate upload success message is displayed.\
<mark style="color:red;">**\<image>**</mark>

* Click on Close to come back to list view of partner certificate.

<figure><img src="../../../../../.gitbook/assets/pms_reupload_partner_certificate_5.png" alt=""><figcaption></figcaption></figure>




### Forgot Password

You can retrieve password in case you are unable to recall.

Click on **Forgot Password** link displayed on login page to reset his password.


<figure><img src="../../../../../.gitbook/assets/pms_forgot_password_2.png" alt=""><figcaption></figcaption></figure>

* Enter registered email address and submit, a message is displayed informing user that further instructions to reset password has been sent on te email address entered.

<figure><img src="../../../../../.gitbook/assets/pms_forgot_password_3.png" alt=""><figcaption></figcaption></figure>

* Click on the Reset password link received on his email address, you will be redirected to Change Password screen.

* Enter a new password that adheres to password policy and reenter to confirm before you save it.

<figure><img src="../../../../../.gitbook/assets/pms_forgot_password_4.png" alt=""><figcaption></figcaption></figure>

* After clicking submit, This new password will be further used in subsequent logins.

<figure><img src="../../../../../.gitbook/assets/pms_forgot_password_5.png" alt=""><figcaption></figcaption></figure>


