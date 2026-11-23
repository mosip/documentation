# Online Verification Partner Onboarding

## 1. Overview of Guide

This section serves as a manual for Partner Admins who need to onboard and configure an Online Verification Partner (OLV Partner) account. It covers the sequential actions required within the PMS portal — from account creation to policy activation — to enable an OLV Partner to host the ID Authentication (IDA) module and provide authentication services to other MOSIP partners.

{% hint style="info" %}
**Note on ownership:** Unlike self-service partner types (e.g., Authentication Partner, Credential Partner), the Online Verification Partner is onboarded **end-to-end by the Partner Admin**. There is no self-registration step for the OLV Partner entity itself — this mirrors how [MISP](misp-partner-onboarding.md) and [ABIS](abis-partner-onboarding-by-partner-admin.md) partners are handled in PMS.
{% endhint %}

## 2. What is an Online Verification Partner?

An **Online Verification Partner (OLV Partner)** is an authorized and entrusted entity that hosts the **ID Authentication (IDA) module** to provide authentication/verification services to other MOSIP partners (such as Authentication Partners — banks, telecom operators, government institutions, etc.). The OLV Partner is the component that actually performs identity verification — matching demographic and/or biometric data — on behalf of relying parties.

Notably, MOSIP's own reference IDA module is itself an instance of an Online Verification Partner — external OLV Partners are alternative or additional implementations of this same role within the ecosystem.

## 3. Key Responsibilities of an Online Verification Partner

* Host and operate the ID Authentication (IDA) module that stores/accesses identity data used to authenticate citizens on behalf of relying parties.
* Share a CA-signed partner certificate that MOSIP uses to build its trust store — cryptographically confirming that authentication responses genuinely originate from this OLV Partner.
* Use the shared certificate to encrypt/decrypt data exchanged during e-KYC transactions.
* Process authentication requests (demographic, OTP, biometric) routed to it from Authentication Partners, in line with the authentication policy configured for it.
* Maintain the confidentiality, integrity, and availability of citizen data throughout the verification transaction, in compliance with applicable data protection and local regulatory requirements.

## 4. Who can 'Onboard an Online Verification Partner' and What You Need to Know?

Onboarding is performed **entirely by the Partner Admin** through the PMS portal. There is no self-registration flow for OLV Partners — the Partner Admin creates the account, uploads the trust chain, configures the policy, and activates the partner on the OLV Partner's behalf.

**Before you begin**, as Partner Admin ensure you have:

* The OLV Partner organization's CA-signed certificate and its full trust chain (Root, Intermediate, and Leaf certificates), collected from the OLV Partner entity outside of PMS.
* The relevant Policy Group and Policy already defined (or ready to be defined) for the OLV Partner's use case.

## Onboarding Steps — Partner Admin (End-to-End)

1. **Create OLV Partner Account:** In the PMS portal (or Keycloak, per current PMS version), the Partner Admin creates the partner profile for the OLV Partner, assigning the appropriate Online Verification Partner role/type.
2. **Upload Certificate Trust Chain:** Partner Admin uploads the Root and Intermediate CA certificates to the certificate trust store, then uploads the OLV Partner's Leaf (partner) certificate on its behalf. This trust chain is what allows MOSIP to cryptographically validate the OLV Partner's authentication responses and e-KYC encryption.
3. **Create/Select Policy Group and Policy:** Partner Admin creates or selects the Policy Group and the specific authentication policy applicable to this OLV Partner, defining what data and authentication types it is permitted to process.
4. **Map Policy to OLV Partner:** Partner Admin maps the selected policy to the OLV Partner partner profile.
5. **Approve and Activate:** Partner Admin approves the configuration, completing the onboarding. The OLV Partner account becomes active and can begin processing authentication requests.

## **Interface Overview**

#### **Online Verification Partner - Create Partner**

1. Log in to the **PMS** portal as ‘Partner Admin’ and you will have access to the **Admin Dashboard**.

<figure><img src="../../../../.gitbook/assets/PMS Revamp - Login Screen.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../../.gitbook/assets/Partner Admin - Dashboard.png" alt=""><figcaption></figcaption></figure>

2. Click on the 'Partners' card, and navigate to the screen with list of all available partners in PMS.

<figure><img src="../../../../.gitbook/assets/Partner Admin - List of Partners.png" alt=""><figcaption></figcaption></figure>

3. Click **Create Partner** button placed on top-right (if partner records already exist) or positioned at the centre of the screen (if no records exist).

<figure><img src="../../../../.gitbook/assets/Create Partner Form.png" alt=""><figcaption></figcaption></figure>

4. Enter details in the **Create Partner** form:
   1. Select Partner Type as '**Online Verification Partner'** from the dropdown.
   2. Enter Address, Organization Name, Email Address, and other mandatory fields and select a policy group.

<figure><img src="../../../../.gitbook/assets/Create Partner - Fill Details.png" alt=""><figcaption></figcaption></figure>

5. Select the language in which the Partner Admin should receive notifications. All future notifications for this partner will be sent only in the language selected here, so choose it based on the partner's actual requirement.

<figure><img src="../../../../.gitbook/assets/Create Partner - Notification Language.png" alt=""><figcaption></figcaption></figure>

6. Click **Save/Submit**. A confirmation message appears on successful creation.

<figure><img src="../../../../.gitbook/assets/Create Partner - Submit Details.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../../.gitbook/assets/Create Partner - Success Acknowledgement.png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
**Note:** On the 'Success/Confirmation' screen itself, you are provided with an option to upload CA-Signed partner certificate or return to 'Home page'.
{% endhint %}

7. Click **Upload Certificate** to proceed with uploading the 'CA Signed Partner Certificate'.

<figure><img src="../../../../.gitbook/assets/Partner Admin - Upload Certificate.png" alt=""><figcaption></figcaption></figure>

8. Click the upload area and select the 'CA Signed Certificate' file from local folder in .cer or .pem format.

<figure><img src="../../../../.gitbook/assets/Partner Admin - Partner Certificate.png" alt=""><figcaption></figcaption></figure>

9. On success, you (admin) receives a confirmation and the partner row should show the certificate upload date/status along with status as 'ACTIVE'.

<figure><img src="../../../../.gitbook/assets/Partner Admin - Successful Certificate Upload.png" alt=""><figcaption></figcaption></figure>

#### **Partner Policy Linking (Requesting and Approving OLV Partner Policies)**

1. Go to **Partner Policy Linking** (dashboard card or from left side menu)

<figure><img src="../../../../.gitbook/assets/Partner Admin - Policy Linking Home.png" alt=""><figcaption></figcaption></figure>

2. Click ‘**Request Policy’** to submit a policy request for the selected **Online Verification Partner ID**. Once the Partner ID is selected, the **Policy Group** associated during partner creation is **auto-populated**, after which an applicable policy can be selected and submitted.

{% hint style="info" %}
**Note:** For **OLV partners**, only **Data Share Policies** must be selected.The available policies are automatically filtered based on the Policy Group linked to the selected Partner ID.
{% endhint %}

<figure><img src="../../../../.gitbook/assets/Partner Admin - Policy Linking - List View (1).png" alt=""><figcaption></figcaption></figure>

3. Requesting a policy for online verification partner involves 3 steps. To start with, add the policy Details: Select a required policy from the available list as per policy group linked to the partner and clicks “Save and Proceed“ to continue to next step.

{% hint style="info" %}
**Note:** Online Verification Partner onboarding requires mandatory mapping of **Biometric Extractors** and **Credential Types** as part of the policy request workflow. To support this, two additional steps have been introduced in the policy request process for configuring these mappings.
{% endhint %}

<figure><img src="../../../../.gitbook/assets/Partner Admin - Request Policy (1).png" alt=""><figcaption></figcaption></figure>

4. **Map Biometric Extractor Provider Configuration:** As second step partner admin will map a biometric extractor provider configuration to the policy selected in first step. During mapping biometric extractor configuration, choose modality and select a configuration from the list and click “Save and Proceed“ to continue to last step.

{% hint style="warning" %}
**Pre-requisite:** Ensure that Partner Admin has created the Biometric extraction provider configurations. This ensures the correct options are available in your dropdown menu during the policy request step.
{% endhint %}

<figure><img src="../../../../.gitbook/assets/Partner Admin - Map Biometric Extractor 1.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../../.gitbook/assets/Partner Admin - Map Biometric Extractor 2.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../../.gitbook/assets/Partner Admin - Save Biometric Extractor Mapping .png" alt=""><figcaption></figcaption></figure>

5. **Map Credential type:** As last step online verification partner will map a credential type to the policy selected in first step. During mapping credential type, partner will select a credential type from the dropdown list. Partner clicks on the **“Submit”** button to complete the policy request. Once the policy request is submitted, it will be added to the queue to be approved by Partner Admin.

{% hint style="info" %}
**Note**:As part of the current release, editing an existing policy request is not supported. Once a policy request has been created and approved, the associated **Biometric Extractor** and **Credential Type** mappings cannot be modified for that policy. If changes to these mappings are required, a new policy request must be created with the updated configuration.
{% endhint %}

{% hint style="info" %}
**Note**: For a given partner, mapping the same **Credential Type** multiple times is not supported. Each Credential Type can be associated only once per partner.
{% endhint %}

<figure><img src="../../../../.gitbook/assets/Partner Admin - Map Credential Type 1.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../../.gitbook/assets/Partner Admin - Map Credential Type 2.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../../.gitbook/assets/Partner Admin - Submit Policy.png" alt=""><figcaption></figcaption></figure>

6. Once the policy request is submitted, partner admin can view the list of pending request by clicking on “Partner-Policy Linking“ card. Partner admin can see the list of the request submitted with status as “Pending for approval“.

<figure><img src="../../../../.gitbook/assets/Partner Admin - Policy Pending For Approval.png" alt=""><figcaption></figcaption></figure>

7. Partner admin can approve or reject the policy by clicking the “Approve/Reject“ option from the actions menu.

<figure><img src="../../../../.gitbook/assets/Partner Admin - Policy Approval 1.png" alt=""><figcaption></figcaption></figure>

8. The Partner Admin can review the full details of each policy request, including the selected Biometric Extractor configuration and the specific Credential Type mappings.

{% hint style="info" %}
**Note:** Partner admin cannot approve any policy request that does not have credential type and biometric extractor provider configurations added.
{% endhint %}

<figure><img src="../../../../.gitbook/assets/Partner Admin - Policy Approval 2 (1).png" alt=""><figcaption></figcaption></figure>

9. Clicking on the “Approve“ button completes the process and the status of the policy is changed to “Active“.

<figure><img src="../../../../.gitbook/assets/Partner Admin - Policy Approved.png" alt=""><figcaption></figcaption></figure>

Once the policy is approved and linked the onboarding for the OLV partner is completed.
