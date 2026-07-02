# Go-Live

## User Acceptance Testing

User Acceptance Testing is the country team's formal sign-off that the platform is ready for the field. It is led by the country team, supported by MOSIP, and runs in the dedicated UAT window before training and go-live.

### Exit criteria

* Every planned test scenario has been executed.
* All tests have either passed or have a documented, accepted fix/workaround.
* No major issues remain open. Issues categorized as major must be resolved before exit; minor issues can be carried forward with explicit acknowledgment.
* The country team has given a successful demo back to the MOSIP team showing they can run the platform, not just operate it.

### Test scenarios to cover

* All flows listed in Section 15 (Platform Readiness).
* Real-life scenarios from Section 14 --- senior citizen with worn fingerprints, infant with guardian, resident with no fingers, resident in a wheelchair, low-connectivity Center, ABIS duplicate, lost ID, impersonation attempt.
* End-to-end happy path: pre-register → register → ABIS → UIN → ID print → notification → eSignet auth → INJI Wallet credential download.

{% hint style="info" %}
**Demo back, don't just watch** The country team gives the demo at UAT exit. If they cannot drive the platform without MOSIP at the wheel, UAT is not done.
{% endhint %}

## Pre Go-Live Readiness

In the one to two weeks before residents start arriving, the program runs a structured readiness sweep. The objective is to make sure that every moving part --- platform, Center, communications, logistics, safety is in place and visible to the country leadership.

### Platform and end-to-end sanity

* End-to-end sanity test successful from a fresh kit through to credential in INJI Wallet.
* Platform readiness checklist (Section 15) fully ticked.
* Sandbox hardening (Section 16) completed and signed off.

### Communications and public relations

* Notifications sent to residents about appointment slots, what to bring and what to expect.
* Notifications sent to internal support teams with on-call rosters.
* Notifications sent to vendors (biometric devices, ABIS, SDK, gateways) so they have heightened support during go-live.
* MOSIP team notified and on-call across the go-live window.
* Public-facing notifications: where the Centers are, who is eligible, opening hours.
* Media engagement plan agreed with the country authority.

### Center logistics and safety

* Posters, handouts and consent forms re-stocked at every Center.
* Hygiene materials available --- sanitiser, masks, gloves --- appropriate to country health guidance.
* Emergency medical supplies on site at every Center.
* Medical responder coverage arranged within reach of every Center --- ambulance or designated medical staff identified before opening.
* Centers fumigated or cleaned to country health standards.
* Fire safety equipment present at every Center and tested.
* Temporary food and refreshment arrangements (eateries or vending) considered for high-volume days.
* All logistics --- power, network, transport, security --- re-checked the day before opening.

{% hint style="info" %}
**Run a dry day** The day before external go-live, run a half-day dry run with internal staff playing residents. It surfaces queue, signage and logistics issues that a platform UAT cannot.
{% endhint %}

## Go-Live Strategy --- Internal Then External

Going live is staged. The pilot starts with a small, internal go-live to confirm the platform is stable in real conditions. Only when that is signed off does the Center open to the public --- and even then, the first days deliberately ramp volume so issues surface while the audience is small.

### Internal go-live

* Country registers a small number of internal staff members.
* Biometric thresholds are calibrated based on the captures observed.
* Daily review at end of day: what worked, what surprised, what needs to change. It may be a good idea to pass on these information to MOSIP team on a daily basis or have a daily sync up call with the MOSIP team.
* A formal decision is taken on whether to proceed to external go-live, based on the platform's observed stability. Jointly decide with the MOSIP team.

### External go-live --- phased ramp

| Day | Audience and approach |
|---|---|
| Day 1 | A small number of internal staff registrations, in a public setting, to surface any issues that only occur with the Center fully opened. |
| Day 2 | Another small batch of registrations to confirm that the issues seen on Day 1 do not recur. |
| Day 3 | Senior staff, country bureaucrats and visible community figures --- the audience is still controlled, but the credential begins to circulate beyond the project team. |
| Day 4 onwards | Open to residents in line with the appointment plan. Volume ramps to plan; daily reports go to the steering committee. |

### Daily reporting during go-live

* Volumes by Center --- registered, in flight, failed.
* Biometric exception rate by Center and by operator.
* ABIS deduplication outcomes and adjudication queue depth.
* Authentication success rate at the mock relying party portal.
* Incident log --- what happened, what was done, what is still open.

_Figure 8 --- The phased go-live: internal first, then a deliberate Day 1 → Day N ramp into the public._

{% hint style="info" %}
**Don't skip Day 1** It is tempting to compress the phased ramp on a 3 to 4 month pilot. Don't. The phased ramp exists to find the issue you missed in UAT, while the audience is still small enough to fix things gracefully.
{% endhint %}
