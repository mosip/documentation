# Infant ID Deactivation

## When Does It Happen?

This rare scenario occurs when a civil registration authority (CRVS) determines that a previously recorded birth registration was fraudulent, incorrect, duplicated, or otherwise invalid. CRVS detects this issue post-registration and needs to notify MOSIP to flag the corresponding MOSIP ID for review and potential deactivation.

**Triggers**:

* Discovery of fraudulent birth certificate issuance
* Detection of duplicate birth registrations for the same infant
* Identification of data integrity issues in initial registration
* Legal determination of registration invalidity

{% hint style="info" %}
Note: **For detailed context on real-world consequences and design principles,** [**refer here**](../../integration-overview-and-context/integration-boundaries-and-real-world-implications.md#id-5.-automatic-deactivation-for-incorrect-birth-registrations-is-not-supported-by-default)**.**
{% endhint %}

## What Does MOSIP Do?

When MOSIP receives a request from CRVS indicating that an infant MOSIP ID was created based on an incorrect birth registration, it performs the required technical and policy validations and routes the request to a manual verification workflow. The request is reviewed by the designated country authority, and based on the outcome of this review, the request is either approved or rejected. The MOSIP ID is deactivated only after explicit manual approval by the authorized authority.

## What Does CRVS Receive?

By default, MOSIP does **not** send a change acknowledgment to CRVS upon successfully updating the deceased flag.

If required, CRVS can be onboarded as a **credential partner** and subscribe to the relevant WebSub events. In this case, MOSIP can publish notifications of successful updates, allowing CRVS to track the completion of the MOSIP ID deactivation and proceed.

{% hint style="info" %}
**Note**: Notification strategy for fraud scenarios is under consideration and may be enhanced in future implementations.
{% endhint %}

## What Is the Workflow?

#### Step 1: Deactivation Request Reported to CRVS

1. CRVS identifies that an infant MOSIP ID was created based on an incorrect birth registration and initiates a deactivation request.
2. CRVS authenticates the MOSIP ID of the informant who reported the case. In cases where CRVS itself identifies the issue, the request may be submitted by an authorized CRA official (such as a registrar or administrator) using their MOSIP ID.
3. The informant’s MOSIP ID is authenticated using eSignet.

**Information Required by MOSIP**

_(Additional fields can be included based on country requirements)_

* **Infant Information**
  * MOSIP ID (UIN) to be deactivated
  * Date of birth registration
* **Informant Information**
  * eSignet User Info Token _(Obtained upon successful eSignet authentication of Informant's MOSIP ID)_

{% hint style="info" %}
**Note:** Updating the MOSIP ID schema is a prerequisite for supporting these workflows. Each workflow requires specific attributes to be added to the ID schema to enable successful data exchange and request submission from CRVS to MOSIP. Please [refer here](../../prerequisites-configurations-and-operations/prerequisites/configurations-details.md#configuring-mosip-auth-policy) for details.
{% endhint %}

#### **Step 2: Packet Creation**

To submit a request, the CRVS system must first **create a registration packet** using the **Packet Manager Create Packet API**. Once the packet is created, it can **pushed to MOSIP for processing**. This approach ensures that all required details are included and that the request is formally registered within MOSIP’s workflow for identity status udpate.

#### Step 3: Packet Processing

After the registration packet is created and uploaded to MOSIP’s object store using the **Packet Manager Create API**, the CRVS system must **initiate processing** by calling the **Sync and Trigger APIs** of the Packet Manager.

Once initiated, MOSIP initiates certain validations before processing the packet.

{% hint style="info" %}
**Note:** Requests for deactivation of a MOSIP ID due to incorrect birth registration are applicable **only for infants** in the default CRVS–MOSIP integration.
{% endhint %}

#### Step 4: Validate Request Eligibility

1. MOSIP validates the request against eligibility, whether it is submitted within the allowed policy window.
2. If the request meets the eligibility criteria, MOSIP accepts it and initiates packet processing.
3. Requests outside the allowed window are not processed via the integration and must be handled through alternative grievance or legal channels.

{% hint style="info" %}
**Note:** The time window for accepting infant MOSIP ID deactivation requests is configurable and determined by country-specific policy requirements. MOSIP suggests that requests be received through the integration only within this defined window.
{% endhint %}

#### **Step 5: Manual Verification & Review**

1. Once the request reaches the manual verification stage, the MOSIP ID remains **active** and continues to function normally; no deactivation occurs automatically.
2. The manual verifier is provided with information such as the **deactivation reason** along with any supporting evidence submitted by CRVS.
3. MOSIP retrieves the **original packet** that was submitted for the initial creation of the infant’s MOSIP ID and makes it available to the manual verifier for reference.
4. All packet details are stored in the **Packet Manager** and **Transaction Table** for audit and traceability.
5. Responsible administrators or legally authorized officials review the supporting documentation and decide whether to **deactivate the MOSIP ID** or **reject the request**.

{% hint style="warning" %}
**Note:** If a deactivation request has already been submitted for a MOSIP ID, any subsequent requests for the same ID are not processed until the initial request completes verification. This prevents duplicate or repeated requests from being handled simultaneously.
{% endhint %}

#### Step 6: Final Decision and Action

After manual verification, the responsible administrators or legally authorized country authorities review the submitted documentation and the original packet details. Based on this review, they decide whether to **approve** or **reject** the deactivation request:

* **If approved:** The MOSIP ID (UIN) is deactivated with in MOSIP.
* **If rejected:** The request is closed, and no changes are made to the MOSIP ID.
* A notification is sent to the registered email or phone number informing the resident of the update outcome.

**Optional:** If CRVS is onboarded as a credential partner and subscribed to the relevant WebSub topic, update notifications can be shared. This is not part of the default integration.

{% hint style="info" %}
**Note:** Cases of infant death are handled through a death registration request submitted by CRVS.
{% endhint %}

## MOSIP Options: Benefits and Considerations

| Option                                              | Advantages                                                                                      | Disadvantages / Risks                                                                                                                          |
| --------------------------------------------------- | ----------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| **Automatic Online Deactivation**                   | Fast, immediate response to CRVS fraud detection                                                | High risk of misuse or wrongful deactivation; no biometric authentication for infants; downstream system disruption; legal + ethical liability |
| **Flag + Manual Verification (Recommended)**        | Ensures traceability; leverages human/legal judgement; safe for infants; audit trail maintained | Requires manual workload; may delay final resolution; depends on country administrative capacity                                               |
| **Reject All Online Fraud Requests (Offline Only)** | Simplest to implement; full control remains with authorities                                    | Loses benefit of integration; CRVS cannot leverage MOSIP automation; increased overhead and delays; reduced transparency                       |

#### Failure Handling in this Scenario

**Technical Failures:**

1. There is a possibility that some requests may fail due to failure caused by **internal MOSIP** technical problems during processing.
2. In case of internal processing issues within MOSIP, a **retry mechanism** automatically attempts reprocessing of failed requests

**Validation Failures:**

1. Missing mandatory fields
2. Incorrect/wrong MOSIP ID (UIN/VID) of the infant is provided.
3. Outside the allowed time window

## Learn More

* [Birth Registration & UIN Issuance](../integration-flows/birth-registration-and-uin-issuance.md) - Understand the standard birth registration workflow in CRVS-MOSIP integration. This provides essential context for how National IDs are initially issued to infants, which is the baseline process before fraud detection triggers deactivation requests.
* [Manual Adjudication and Verification](https://github.com/mosip/documentation/blob/1.2.0/docs/manual-adjudication-and-verification.md) - Learn about MOSIP's manual verification system that reviews fraudulent birth deactivation requests. This document details how packets are routed to manual verification queues, the decision-making workflow, and integration with external verification systems.
* [Reactivation of Deactivated National ID](reactivation-of-deactivated-national-id.md) - Explore the reverse scenario where a deactivated National ID needs to be reactivated (e.g., after wrongful deactivation). This complements the deactivation workflow and shows the complete lifecycle management of rare fraud cases.
* [Registration Processor Configurations Details](../../prerequisites-configurations-and-operations/prerequisites/configurations-details.md) - Discover the Camel route configurations (`CRVS_fraud_birth`) and packet processing workflows that enable fraud detection handling. This technical reference explains how deactivation requests are routed and processed within MOSIP's registration processor.
