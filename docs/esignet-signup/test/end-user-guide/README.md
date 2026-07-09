# End User Guide

{% hint style="warning" %}
**Note**: The Signup service is not available in the MOSIP Collab as of now for self experience.
{% endhint %}

### Use Case Overview

This guide covers a scenario where a user does **not** have a pre-existing digital ID and wants to create one on the go, then use it to log in and access a service via eSignet. It walks through creating a new ID using the Signup Portal, logging in to a relying party service, and completing identity verification when requested by that service.

### How the Signup Flow Works

#### 1. Creating a New ID via the Signup Portal

When a user does not have an existing ID, they can use the **eSignet Signup Portal** to create one. The Signup Portal uses the **Profile Registry plugin**, integrated with a National ID system (or any other trusted ID system), to register the user and create a new digital ID with minimal information.

#### 2. Logging in to a Service Using the New ID

Once the ID is created, the user can log in using this newly created ID through **eSignet** to access a service. This flow is demonstrated in this guide using a **dummy Health Portal** integrated with eSignet as an example relying party.

#### 3. Identity Verification Requested by the Service

Before allowing the user to avail the service, the Health Portal requires the user's identity to be verified. The user is prompted to go through an **identity verification** step.

{% hint style="warning" %}
**Note: Mock SDK Used for Identity Verification**

This user guide uses a **mock SDK** for the identity verification step, intended purely to show the flow end-to-end.

* The identity verification (e.g. biometric/liveness capture) in this guide is **simulated** and does not perform actual verification against real biometric or document data.
* Any capture, response, or "success" shown during this step is for **demonstration purposes only** and should **not** be treated as a validation of the actual identity verification capability or security posture of the platform.
* **For production deployments**, a certified/verified identity verification SDK must be integrated by a **third-party vendor**, as MOSIP/eSignet does not ship a production-grade identity verification SDK out of the box.
{% endhint %}

#### 4. Redirection to the Signup Portal for Identity Verification

If the user agrees to proceed, they are redirected back to the **eSignet Signup Portal**, where the identity verification flow is initiated and completed. Once verification is successful, the user is redirected back to the Health Portal to continue availing the service.

### **Why This Integration Matters** <a href="#why-this-integration-matters" id="why-this-integration-matters"></a>

Integrating the **eSignet Signup Service** with the eSignet Auth Service enables a seamless identity verification experience for users signing in to any relying party (RP) portal — such as a health services portal — using a new identity created via the Signup Portal. When a user attempts to log in, eSignet checks whether the relying party requires identity verification, as pre-configured by the RP in line with the **Identity Assurance 1.0** specification. If verification is required, the user is redirected to the Signup Portal to complete it before being returned to continue with the relying party. This integration between Signup and eSignet enables trusted digital onboarding and simplifies access to government and health services by leveraging the country's foundational ID system.

[Refer to the User Guide](signup-and-login-with-otp-for-verified-claims.md).
