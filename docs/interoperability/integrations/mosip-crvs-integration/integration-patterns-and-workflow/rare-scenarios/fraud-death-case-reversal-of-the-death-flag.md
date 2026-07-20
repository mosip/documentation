# Reversal of Death Declaration

## When Does It Happen

This scenario occurs when CRVS identifies that a person previously marked as deceased is actually alive. Such situations may arise due to reporting errors, mistaken identity, communication delays, or new evidence discovered during re-verification. CRVS notifies MOSIP to reverse the deceased flag on the corresponding MOSIP ID.

**Triggers:**

* Discovery that a previously reported death was erroneous
* Detection of mistaken identity, displacement of individual or diaster scenarios
* Legal or administrative corrections affecting the death record

{% hint style="info" %}
**Note:** For detailed context on implications and design principles, [refer](../../integration-overview-and-context/integration-boundaries-and-real-world-implications.md#id-7.-automatic-reversal-of-deceased-flag-is-not-supported-by-default) here.
{% endhint %}

#### What Does MOSIP Do

When MOSIP receives a request from CRVS to reverse a death declaration, it performs the required technical and policy validations and routes the request to **manual verification**. The request is reviewed by the designated country authority, and based on the outcome of this review, the deceased flag is either reversed or left unchanged.

#### What Does CRVS Receive

By default, MOSIP does not send an automatic acknowledgment to CRVS upon flag reversal. If required, CRVS can be onboarded as a **credential partner** and subscribe to the relevant WebSub events. In that case, MOSIP can publish notifications of successful flag reversal, allowing CRVS to track the completion of the process.

#### What Is the Workflow

**Step 1: Death Flag Reversal Request Reported to CRVS**

* CRVS identifies that a MOSIP ID previously marked as deceased should have the flag reversed.
* CRVS authenticates the MOSIP ID of the informant reporting the case. In cases where CRVS itself initiates the request, an authorized CRA official (such as a registrar or administrator) may submit the request using their MOSIP ID.
* The informant’s MOSIP ID is authenticated via eSignet.

**Information Required by MOSIP** _(Additional fields may be included based on country requirements)_

**Individual Information**

* MOSIP ID (UIN) for which the deceased flag is to be reversed

**Informant Information**

* MOSIP ID
* eSignet User Info Token (obtained upon successful eSignet authentication)

{% hint style="info" %}
**Note:** Updating the MOSIP ID schema is a prerequisite for supporting this workflow. Required attributes must be added to enable successful data exchange and request submission. Please refer [here](../../prerequisites-configurations-and-operations/prerequisites/configurations-details.md#configuring-mosip-auth-policy-1) for details.
{% endhint %}

**Step 2: Packet Creation**

* CRVS creates a registration packet using the **Packet Manager Create Packet API**.
* Once created, the packet is pushed to MOSIP for processing, ensuring all required details are included and formally registered for the death flag reversal workflow.

**Step 3: Packet Processing**

* After upload to MOSIP’s object store, CRVS initiates processing by calling the **Sync and Trigger APIs** of the Packet Manager.
* MOSIP performs technical validations and checks the **current deceased status** of the MOSIP ID before proceeding.

**Step 4: Validate Request Eligibility**

* MOSIP validates whether the request is submitted within the allowed policy window.
* If eligible, the request proceeds to manual verification; otherwise, it must be handled through alternative grievance or legal channels.

{% hint style="info" %}
**Note:** The time window for accepting death flag reversal requests is configurable and determined by country-specific policy requirements. MOSIP suggests that requests be received through the integration only within this defined window.
{% endhint %}

**Step 5: Manual Verification & Review**

* While in manual verification, the MOSIP ID remains active with the original deceased flag unchanged.
* The manual verifier is provided with the reversal reason, any supporting evidence submitted by CRVS, and the original death registration packet for reference.
* Packet details are stored in the **Packet Manager** and **Transaction Table** for audit and traceability.
* Responsible administrators or legally authorized officials review the documentation and decide whether to reverse the deceased flag or take no action.

{% hint style="info" %}
**Note:** If a reversal request has already been submitted for a MOSIP ID, any subsequent requests for the same ID are not processed until the initial request completes verification.
{% endhint %}

**Step 6: Final Decision and Action**

* **If approved:** The deceased flag on the MOSIP ID (UIN) is reversed.
* **If rejected:** No changes are made to the MOSIP ID, and the request is closed.
* A notification is sent to the registered email or phone number informing the resident of the outcome.

Optional: If CRVS is onboarded as a credential partner and subscribed to the relevant WebSub topic, update notifications can be shared. This is not part of the default integration.

#### Failure Handling

**Technical Failures:**

* Requests may fail due to internal MOSIP technical issues. A retry mechanism automatically attempts reprocessing.

**Validation Failures:**

* Missing mandatory fields
* Incorrect or non-existent MOSIP ID (UIN/VID) of the deceased
* Request submitted outside the allowed policy window

## MOSIP Options: Benefits and Considerations

| Option                                                 | Advantages                                                                                             | Disadvantages / Risks                                                                                                                                                    |
| ------------------------------------------------------ | ------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Automatic Online Reversal**                          | Fast; immediate response                                                                               | Very risky: could unmark deceased individuals without legal confirmation; prone to misuse; impacts downstream services without verification; legal and ethical liability |
| **Accept Request + Manual Verification (Recommended)** | Legally safe; aligns with civil registration practices; maintains audit trail; ensures human judgement | Requires administrative involvement; may delay final resolution                                                                                                          |
| **No Online Reversal Allowed (Offline Only)**          | Maximum safety; full control remains with authorities                                                  | Reduces transparency; delays correction for genuine cases; loses benefit of integration                                                                                  |

***

## Learn More

* [Death Registration & Identity Status Update](../integration-flows/death-registration-and-identity-status-update.md) - Understand the standard death registration workflow in CRVS-MOSIP integration, which is the baseline process from which fraud death case reversals deviate. This provides context on how deceased flags are originally set.
* [Manual Adjudication and Verification](https://github.com/mosip/documentation/blob/1.2.0/docs/manual-adjudication-and-verification.md) - Learn about MOSIP's manual verification system used for reviewing fraud death reversals. This document details the queue-based architecture, decision workflows, and integration points that enable country authorities to approve or reject reversal requests.
* [Registration Processor Configurations Details](../../prerequisites-configurations-and-operations/prerequisites/configurations-details.md) - Explore the ID schema fields (`declaredAsDeceased`, `deceasedDeclarationDate`, `typeOfDeath`) and Camel route configurations (`CRVS_Fraud_Death`) that enable death-related packet processing and reversal workflows.
* [Reactivation of Deactivated National ID](reactivation-of-deactivated-national-id.md) - Compare fraud death reversal with another rare scenario involving National ID reactivation. Both follow similar manual verification patterns but apply to different identity lifecycle events (death vs. birth fraud).
