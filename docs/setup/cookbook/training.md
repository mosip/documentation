# Training

## Functional Training and Real-Life Scenarios

Training is the heart of the pilot. The country team is functionally trained through hands-on sessions, and they go through real-life examples during the pilot and how to deal with them.

### Training streams

| Stream | Topics | Audience |
|---|---|---|
| Technical training | Architecture, deployment, configuration, monitoring and incident response. | Country technical team |
| Functional training | Pre-registration, registration packet flow, ID processing, ID issuance, Lost ID issuance, ID update, eSignet, INJI Wallet, admin console. | Program managers and tech leads |
| Operator and supervisor training | End-to-end registration on the kit, exception handling, daily run-sheet, device hygiene. | Field operators and supervisors |
| Adjudicator training | Manual adjudication console, decision rationale, escalation paths. | Adjudicators |
| Helpdesk training | Stuck packets, lost credentials, biometric exceptions, complaint logging. | Backoffice and Helpdesk staff |

### Real-life scenarios to walk through

1. A senior citizen with worn fingerprints --- fall back to iris, then to OTP authentication.
2. An infant accompanied by a guardian --- biometrics deferred, guardian linkage captured, consent recorded.
3. A resident with no fingers --- exception biometric flow, missing-biometric reasons captured, supervisor approval.
4. A resident in a wheelchair --- accessibility set-up at the Center, photo booth at seated height, operator script.
5. A resident living in a low/no-connectivity area --- offline registration, packet sync the next morning, status check.
6. A duplicate detection at ABIS --- manual adjudicator reviews the case and decides whether to confirm or reject the duplicate.
7. A lost or damaged ID --- physical re-issuance at the registration center and re-download into a new INJI Wallet device.
8. An impersonation attempt at the relying-party portal --- biometric authentication fails and the helpdesk logs the incident.

<!-- 
This list can expand with more of the scenarios which are typically encountered with foundational ID syestems. 
-->

{% hint style="info" %}
**Make training stick** Pair every classroom session with a live registration of a real participant (operator, supervisor or technical team member volunteering). Theory alone never produces confident operators.
{% endhint %}
