# Reactivation of Deactivated National ID

## **When It Can Occur**

This situation arises when an infant MOSIP ID was previously deactivated due to an incorrect birth registration, but CRVS or the designated country authorities later determine that the original deactivation was not justified. Examples include:

* Discovery that the original birth registration was valid
* New evidence confirming the accuracy of the birth record
* Administrative error corrections
* Legal reversal of the deactivation decision

## **MOSIP Recommendation:**

For such cases, MOSIP **does not recommend deactivating and then reactivating the same ID**, as this can create system confusion and potential misuse. Instead, the preferred approach is to **re-register the infant to issue a new unique digital identity**.

{% hint style="info" %}
**Note:**

* This workflow is **not part of the default CRVS–MOSIP integration**.
* Implementing countries may decide whether to enable reactivation workflows.
* For detailed guidance on handling such situations, please [refer here](../../integration-overview-and-context/integration-boundaries-and-real-world-implications.md#id-6.-automatic-reactivation-of-deactivated-infant-ids-is-not-supported-by-default).
{% endhint %}

## Learn More

* [Fraudulent Birth Registrations - National ID Deactivation Request from CRVS](fraudulent-birth-registrations-national-id-deactivation-request-from-crvs.md) - Understand the deactivation workflow that precedes reactivation. This document explains how National IDs are originally deactivated for fraud cases, providing essential context for the reactivation process.
* [Manual Adjudication and Verification](https://github.com/mosip/documentation/blob/1.2.0/docs/manual-adjudication-and-verification.md) - Learn about MOSIP's manual verification system used for reviewing reactivation requests. This details the queue-based architecture, decision workflows, and how country authorities approve or reject reactivation after reviewing evidence and fraud history.
* [Birth Registration & UIN Issuance](../integration-flows/birth-registration-and-uin-issuance.md) - Explore the standard birth registration workflow that establishes National IDs initially. Understanding this baseline process helps contextualize why reactivation after fraud-based deactivation requires such careful handling.
* [Registration Processor Configurations Details](../../prerequisites-configurations-and-operations/prerequisites/configurations-details.md) - Discover the technical configurations including Camel routes (`CRVS_fraud_birth`) and packet processing workflows that enable both deactivation and reactivation requests to be routed correctly for manual review.
