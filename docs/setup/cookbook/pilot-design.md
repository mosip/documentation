# Pilot Design

## Designing the Participant Mix

The point of the pilot is to feel what MOSIP behaves like for real residents, not for an idealised, average user. Aim for a participant pool that mirrors the country's population mix, with deliberate inclusion of harder edge cases.

### Recommended demographic distribution

The following distribution is recommended as a starting point. The country team owns the final mix and can adjust to reflect the local population profile and the coverage they want to validate during the pilot.

| Group | Why include them | Suggested share |
|---|---|---|
| Adult males | Reference registration path; surfaces the most common workflow. | ≈ 50% of adult registrations |
| Adult females | Validates the same reference path with diverse face capture conditions. | ≈ 25% of adult registrations |
| Elderly residents (60+) | Lower fingerprint quality is common; iris and face fall-back paths are exercised; OTP-based authentication is deliberately tested. | ≈ 25% of adult registrations |
| Children below 5 years | Biometric thresholds differ; guardian linkages and consent flows are tested. | ≈ 5% of total population |
| Adults with biometric exceptions | Residents who cannot present fingerprints, iris or both. Exception biometric flow, missing-biometric reason capture and supervisor approval are exercised. | ≈ 5% of total population |
| Minors (6--17 years) | Fingerprint and iris capture works but operators must handle consent and guardian linkage flows. | Country to decide |
| Persons with disabilities | Includes residents in wheelchairs, with limited mobility, or low vision. Validates Center accessibility and operator scripts. | Country to decide |

{% hint style="info" %}
**Consent and ethics** Residents participating in the pilot must give informed consent. Make sure the consent form makes clear that this is a pilot, what data is collected, how long it is retained and whether the credential will continue to work after pilot closure.
{% endhint %}
