# Platform Readiness

## Platform Readiness --- Functional Capabilities to Verify

Before the country team puts a real resident in front of the registration kit, the platform must be exercised end to end on every functional capability the pilot will use. Ownership of this verification is shared between the country team and the MOSIP team. The objective is not to test exhaustively --- that is UAT --- but to be certain that every flow the pilot will hit has been seen working at least once.

### Pre-registration and registration flows

* Operator onboarding and login.
* Pre-registration of residents (online appointment booking and demographic capture).
* New adult registration, end to end.
* New child registration, including guardian linkage.
* Update flows for adults and children --- both demographic data update and biometric update.
* Biometric correction for an in-flight registration.

### ID processing and issuance

* Demographic and biometric deduplication via ABIS.
* Biometric manual adjudication for ABIS-flagged matches.
* Biometric exception handling and capture.
* Unique Identification Number (or UIN) generation.
* ID card printing as PDF, ready for the dedicated print station.
* ID card delivery to the resident's email.
* Lost ID re-issuance flow.

### Authentication and notifications

* Biometric authentication via fingerprint through eSignet.
* OTP authentication through eSignet.
* Notifications to residents over email.
* Notifications to residents over SMS.
* Notifications to residents over WhatsApp (where supported in country).

### Reporting and administration

* Registration dashboard --- daily volumes, success rates, exception rates.
* Pre-registration dashboard --- appointments booked vs. consumed.
* Consolidated dashboard for the steering committee.
* Authentication dashboard --- OTP and biometric success and failure trends.
* Admin console with packet upload status and queue health.

{% hint style="info" %}
**Sign off as you go** Treat each capability above as a small gate. The country technical lead and the MOSIP deployment lead jointly tick it off the readiness register. No capability is allowed to be 'probably working' on go-live day.
{% endhint %}

\| **Pre-registration inside registration center** | | | | It may be pertinent, but not mandatory, to have a pre-registration | | kiosk where a resident perform per-registration by providing the | | demographic details, upload documents and get registration ID issued | | prior to actual registration. This can reduce the time to register a | | resident by capturing only biometrics and verifying the documents | | uploaded. |

## Sandbox Hardening Before the Pilot

The pilot environment is built up incrementally during demos, training and UAT. By the time real residents arrive, that same environment is full of test packets, stale messages, demo accounts and broad access. Before go-live the MOSIP team with country support performs a structured hardening pass so that the pilot runs on a clean, narrowly-scoped platform.

### Cleaning the runtime

* Clear the Kafka cache so no test events are reprocessed during the pilot.
* Clear residual packets from the landing zone inside the platform pods.
* Clear ActiveMQ queues to avoid replaying dummy notifications.

### Tightening access

* Audit Wireguard (or equivalent VPN) access --- every client machine should be deliberately authorised, not inherited from a demo phase.
* Remove Wireguard access from people who no longer need it.
* Audit Keycloak users; remove demo accounts and any user no longer participating in the pilot.
* Reduce admin role membership in Keycloak to one or two named individuals; everyone else is moved to a least-privilege role.
* Capture and file the revocation list --- it becomes part of the pilot audit trail.

{% hint style="info" %}
**Treat hardening as a gate** Hardening is a prerequisite for the internal go-live. If it has not been completed and signed off, the pilot does not start.
{% endhint %}
