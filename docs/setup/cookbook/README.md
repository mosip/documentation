---
hidden: true
---

# CookBook
## About this Functional Pilot Guide

The 'MOSIP Functional Pilot' Guide is a practical, step-by-step recipe for running a rapid MOSIP functional pilot in any country, end to end, in 3 to 4 months. It is written for the country implementation team --- program managers, technical leads, registration supervisors and field operators and it captures every ingredient, every step and every common mistake that the MOSIP team has seen across previous pilots.

The objective of the pilot is functional experience, not production scale. By the end of it, the country team will have deployed a complete MOSIP environment, registered up to 3,000 residents (a representative sample including children, adults, senior citizens and persons with disabilities), issued unique IDs, and exercised authentication using both OTP and biometrics through eSignet, with credentials downloaded into the INJI Wallet.

{% hint style="info" %}
**Before you start**

This cook book is intentionally country-agnostic. Wherever you see a placeholder such as "the Country Program", "the Country IT Team" or "the Pilot Authority", replace it with your local equivalent.
{% endhint %}

## Pilot Objectives

The pilot is a hands-on, end-to-end functional run-through of MOSIP. It is deliberately scoped to be small enough to complete in 3 to 4 months and large enough to surface the operational, technical and policy questions the country will face at national rollout.

## Primary objectives

* Experience the full MOSIP lifecycle --- pre-registration, registration, ID processing, ID issuance and authentication for up to 3,000 residents.
* Deploy MOSIP either on a public cloud or on the country's on-prem environment, following the hardware and software specifications in this cook book.
* Build country-team capacity through structured functional training, with operators and supervisors performing real registrations and resolving real-life edge cases.
* Exercise eSignet authentication using both OTP and biometric flows.
* Issue verifiable credentials and demonstrate them in INJI Wallet (mobile and web).
* Finalize the country-specific ID schema and master data which is the backbone of any future national rollout.
* Identify customization needs, integration touchpoints and policy decisions that must be addressed before scale.

## Out of scope for the pilot

* Production-grade sizing, performance benchmarking or load testing.
* Final commercial / costing decisions for national rollout.
* Integration with all downstream relying parties --- only a mock health portal is used.
* Multi-language UI rollout --- pilot runs in the country's official languages
* Permanent data retention --- pilot data is treated as test data and is not migrated into production systems

{% hint style="info" %}
**Success Criteria** "Up to 3,000 residents --- a representative cross-section of the population --- were registered, issued an ID and successfully authenticated using eSignet and INJI Wallet, and the country team is confident it can run MOSIP independently.
{% endhint %}

## Scope and Assumptions

### In scope

* Registration of up to 3,000 residents (representative sample of the population).
* Country-specific ID schema and master data.
* Online pre-registration and on-site registration.
* Both online and offline registration modes at the field Centers.
* Demographic and biometric deduplication via ABIS.
* Administration console and basic helpdesk operations.
* ID issuance in physical (paper format) or digital form.
* Authentication using biometric and OTP via eSignet.
* ID Credential download to INJI Wallet (mobile) and INJI Web.
* Minimal UI customisation of the registration and pre-registration screens.
* Functional training for the country team during the pilot.

### Key assumptions

* Biometric devices, ABIS and the biometric SDKs are provided by MOSIP through its biometric partner ecosystem.
* MOSIP's latest LTS version is deployed for the pilot.
* The registration rate at each kit is roughly 45 registrations per day, used for capacity planning of operators and Centers.
* High-speed internet is available at every registration Center during online registration windows; offline mode is exercised when connectivity is unavailable.
* A mock relying-party portal (health) is used to demonstrate authentication and service delivery.
* The country provides the on-prem or cloud infrastructure, network access and operational personnel; SMS and email gateway access is also provided by the country.
* The pilot cost model does not reflect national-rollout costing.
* All training, documentation and UIs run in official language of the country.

{% hint style="info" %}
\| **Decision needed early** | | | | Choose whether to host the pilot on a public cloud (faster to | | provision) or on a country on-prem environment (closer to the | | production footprint). MOSIP supplies the same hardware and | | configuration specifications for either option --- see Section 5. |
{% endhint %}

## Pilot Lifecycle at a Glance

The pilot moves through eight overlapping stages. The lifecycle is engineered so that the long-lead items biometric device shipment, infrastructure stand-up and ID schema sign-off --- start on day one and run in parallel with the build phase.

**Stage** **What happens** **Primary owner**

1. Objective alignment Confirm the why, the Country + MOSIP success criteria and\
   the participant mix.
2. End-to-end MOSIP runs a full MOSIP demonstration functional demo so the\
   country team has a\
   shared mental model.
3. Infrastructure Availability of on-prem Country readiness or cloud servers;\
   confirm sizing and\
   access.
4. Registration kit Biometric devices MOSIP + Country readiness shipped to the country\
   by MOSIP; non-biometric components (laptops,\
   printers, photo booths, cameras) procured\
   locally.
5. Minimal Country-specific ID MOSIP with Country customisation schema, master data and inputs light UI tweaks to\
   registration and\
   pre-registration\
   screens.
6. Functional training Hands-on training for MOSIP + Country technical staff,\
   operators and\
   supervisors using\
   real-world scenarios in the train-the-trainer\
   model.
7. Field registration Up to 3,000 residents Country registered across\
   Centers in online and\
   offline modes; IDs\
   issued; authentication\
   and INJI Wallet\
   exercised for a sample\
   set of residents
8. Closure and Lessons learned, Country + MOSIP reporting metrics,\
   recommendations for\
   scale; pilot sign-off.


{% hint style="info" %}
\| **Total elapsed time** | | | | 3 to 4 months from kick-off to sign-off, assuming biometric device | | shipment and country infrastructure both come online before UAT and | | operator/supervisor training. |
{% endhint %}




<!--



## Hardware Specifications and Requirements

MOSIP supplies the full hardware specification for the pilot so that the country team can provision exactly what is needed. The list below is the minimum footprint to run the pilot end to end.

### Server and infrastructure footprint

The MOSIP pilot can be deployed on a public cloud or on the country's on-prem environment. Either way, the following virtual machine footprint is recommended.

***

**Virtual Machine** **vCPU** **RAM (GB)** **SSD (GB)** **Operating System**

***

\[svr-mosip-01]{.mark} \[16]{.mark} \[64]{.mark} \[128]{.mark} \[Ubuntu 20.04 LTS]{.mark}

\[svr-mosip-02]{.mark} \[16]{.mark} \[64]{.mark} \[128]{.mark} \[Ubuntu 20.04 LTS]{.mark}

\[svr-mosip-03]{.mark} \[16]{.mark} \[64]{.mark} \[128]{.mark} \[Ubuntu 20.04 LTS]{.mark}

\[svr-mosip-04]{.mark} \[16]{.mark} \[64]{.mark} \[128]{.mark} \[Ubuntu 20.04 LTS]{.mark}

\[svr-mosip-05]{.mark} \[16]{.mark} \[64]{.mark} \[128]{.mark} \[Ubuntu 20.04 LTS]{.mark}

\[svr-mosip-06]{.mark} \[16]{.mark} \[64]{.mark} \[128]{.mark} \[Ubuntu 20.04 LTS]{.mark}

\[svr-mosip-07]{.mark} \[16]{.mark} \[64]{.mark} \[128]{.mark} \[Ubuntu 20.04 LTS]{.mark}

\[srv-iam-01]{.mark} \[8]{.mark} \[16]{.mark} \[64]{.mark} \[Ubuntu 20.04 LTS]{.mark}

\[srv-abis-01]{.mark} \[20]{.mark} \[64]{.mark} \[256]{.mark} \[As recommended by ABIS vendor]{.mark}

\[srv-nginx-01]{.mark} \[4]{.mark} \[16]{.mark} \[64]{.mark} \[Ubuntu 20.04 LTS]{.mark}

\[srv-nginx-02]{.mark} \[4]{.mark} \[16]{.mark} \[64]{.mark} \[Ubuntu 20.04 LTS]{.mark}

\[srv-postgres]{.mark} \[16]{.mark} \[32]{.mark} \[256]{.mark} \[Ubuntu 20.04 LTS]{.mark}

\[srv-minio]{.mark} \[16]{.mark} \[32]{.mark} \[256]{.mark} \[Ubuntu 20.04 LTS]{.mark}

### \[srv-bastion]{.mark} \[4]{.mark} \[16]{.mark} \[64]{.mark} \[Ubuntu 20.04 LTS]{.mark}

#### Aggregate footprint

* \[Total RAM: \~600 GB]{.mark}
* \[Total SSD storage: \~2 TB]{.mark}
* \[vCPU sizing on physical servers can be calculated as (threads × cores) × processors per host. As a reference, an Intel Xeon E-2288G with 8 cores / 16 threads on one socket exposes 128 vCPUs.]{.mark}

{% hint style="info" %}
\| **Cloud or on-prem?** | | | | If the country plans to run the future production system on-prem, | | exercise the on-prem footprint here so that operations, networking | | and security teams rehearse the real run-book. If the production | | target is cloud, run the pilot on the same cloud provider. |
{% endhint %}

### Registration kit -- laptop specification

***

**Specification** **Recommended value**

***

Processor Multi-core, latest generation (e.g., Intel 12th-gen Core i7, 1.7 GHz up to 4.7 GHz, 12 MB L3 cache)

RAM 16 GB minimum

Operating System Windows 10 or 11, 64-bit

Storage 512 GB SSD

Display 14 inches or larger, full HD

Networking Ethernet RJ45 and Wi-Fi (IEEE 802.11 b/g/n)

Ports 2 × USB 3.0 (1.5 A each), 1 × USB 2.0 (≥1 A), HDMI for external monitor; include a powered USB hub with 4 × USB 3.0 ports

Security chip TPM 2.0 or higher

Antivirus Enterprise-grade antivirus pre-installed and patched

### Citizen-facing monitor 18 to 22 inch external display per kit

### Biometric devices and authentication devices

***

**Device** **Source** **Quantity**

***

Fingerprint slap Provided by MOSIP 1 per registration kit scanner (Registration) biometric partner\
ecosystem. Shipped to\
the country.

Dual iris scanner Provided by MOSIP 1 per registration kit (Registration) biometric partner\
ecosystem.

Face camera Country-provided. Must 1 per registration kit (Registration) meet MOSIP photo\
capture guidance.

### Single fingerprint Provided by MOSIP Approximately 5-10 device (Authentication) biometric partner across the pilot ecosystem.

{% hint style="info" %}
+----------------------------------------------------------------------+ | **Plan for shipping lead time** | | | | Procurement and international shipping of biometric devices | | typically takes 6 to 8 weeks. Start this on day one. The country | | team should pre-clear the customs process to avoid delays. | +======================================================================+
{% endhint %}

### Document scanners, printers and photo booths

#### Printer with scanner (per registration station)

+-------------------------------------+-------------------------------------+ | **Specification** | **Value** | +=====================================+=====================================+ | Type | Color | +-------------------------------------+-------------------------------------+ | Print resolution | 600 dpi | +-------------------------------------+-------------------------------------+ | Scan resolution | 300 dpi | +-------------------------------------+-------------------------------------+ | Paper size | A4 | +-------------------------------------+-------------------------------------+ | Connectivity | USB 2.0+ or wireless | +-------------------------------------+-------------------------------------+ | OS support | Windows 10/11 | +-------------------------------------+-------------------------------------+ | Driver support | TWAIN / WIA compatible | +-------------------------------------+-------------------------------------+ | Quantity | Approximately 4 units across the | | | pilot (scale with number of | | | Centers) | +-------------------------------------+-------------------------------------+ | These are regular printers available off the shelf such as HP, Epson | | Canon etc | +---------------------------------------------------------------------------+

#### Photo booth (per registration station)

***

**Specification** **Value**

***

Backdrop 3 ft (W) × 4 ft (H), white, with stand and wall mount

Lighting 2 × 30 W clear white lights (or LED equivalent), with stands and operator-controlled long cabling

### Quantity Approximately 4 stations across the pilot

### Mobile phones for INJI Wallet

Residents and operators need a small fleet of phones to exercise INJI Wallet on both ecosystems. Country team typically provisions:

* Approximately 10 Android phones (Android 12 and above).
* Approximately 10 iPhones (iPhone 12 or above)

### Helpdesk, administration and adjudication terminals\*\*

***

**Terminal** **Purpose / Source configuration**

***

Manual adjudication 1 Windows laptop or Country-provided terminal desktop (minimal\
configuration) to\
handle exceptions and\
deduplication\
adjudications.

Mock health portal A few Windows laptops Country-provided terminal or desktops (minimal\
configuration) for the\
mock relying-party\
portal used to\
demonstrate\
authentication.

Helpdesk / supervisor 1 Windows laptop or Country-provided terminal desktop per\
registration Center to\
handle citizen queries,

### Administration console 1 Windows desktop or Country-provided terminal laptop with privileged access for the country admin to manage configuration, users and master data.

## Software and Platform Requirements

MOSIP supplies the platform and integrates the third-party components. The country team is responsible for the operating environment, gateways and identity-related accounts.

_Figure 2 --- Pilot system components and how the resident, registration client, MOSIP core, ABIS, eSignet, INJI Wallet and_ _the mock relying party portal connect._

***

**Component** **Purpose** **Owner**

***

Operating system and A secure on-prem or Country VMs cloud sandbox onto\
which MOSIP will be\
deployed.

Databases and object Provisioned and managed MOSIP store as part of the MOSIP\
deployment.

Hardware Security Stores cryptographic MOSIP Module (HSM) keys used for\
encryption and\
decryption. A software\
HSM is used for the\
pilot.

Biometric SDKs and ABIS Used for biometric MOSIP quality check,\
authentication and\
deduplication. Provided through the MOSIP\
biometric partner\
ecosystem.

SMS and email gateway Required to send Country notifications to\
residents' phones and\
email addresses.

Mock relying-party Bundled with eSignet; MOSIP portal (health) used to demonstrate\
authentication and\
service delivery.

INJI Wallet (mobile and Bundled in the pilot MOSIP web) deployment for\
residents to download\
and present\
credentials.

GitHub and Docker Private accounts that Country accounts the country team uses\
to access source code,\
container images and\
configuration\
repositories.

### SSL certificates Provisioned for the MOSIP pilot environment.

## Project Execution Plan (Week-by-Week)

The plan below compresses the pilot into approximately 14 weeks. Pre-week 0 activities --- particularly biometric device procurement and infrastructure approvals --- should begin as soon as the pilot is approved.

+-------------------------+-------------------------+-------------------------+ | **Window** | **Theme** | **Activities** | +=========================+=========================+=========================+ | Week 0 | Kick-off, MOSIP | MOSIP introduction; | | | introduction and | high-level demo of | | | \*migration prep | MOSIP, INJI and | | | | eSignet; _acquire | | | | source data and | | | | database structure for | | | | any legacy migration in | | | | scope._ | +-------------------------+-------------------------+-------------------------+ | Week 1 | Infrastructure | Begin procurement and | | | readiness | shipping of biometric | | | | devices; readiness | | | | check of on-prem or | | | | cloud hardware | | | | (compute, storage, | | | | networking); \*continue | | | | acquiring legacy source | | | | data. | +-------------------------+-------------------------+-------------------------+ | Weeks 2--3 | ID schema, master data, | Define country ID | | | customisation | schema and master data; | | | | identify customisation | | | | needs; obtain SMS / | | | | email gateway details; | | | | start customisation; | | | | deploy MOSIP onto the | | | | country environment; | | | | \*start data quality | | | | analysis for any legacy | | | | migration. | +-------------------------+-------------------------+-------------------------+ | Week 4 | Customisation, | Publish data quality | | | configuration and | analysis; complete | | | platform readiness | customisation; finalise | | | | email and SMS | | | | configuration. | +-------------------------+-------------------------+-------------------------+ | Weeks 5--6 | Integration and | Build the legacy | | | \*migration utility | migration utility; | | | | integrate biometric | | | | components into the | | | | country environment; | | | | deploy ABIS, SDKs and | | | | the manual adjudication | | | | system; configure SMS | | | | in the platform. | +-------------------------+-------------------------+-------------------------+ | Weeks 7--8 | Pilot system readiness | User acceptance | | | | testing; functional | | | | training for the | | | | country technical | | | | staff; biometric | | | | functional training. | +-------------------------+-------------------------+-------------------------+ | Weeks 9--10 | Field readiness | Operator and supervisor | | | | training; migration | | | | training; field pilot | | | | preparation; | | | | calibration of | | | | registration Centers | | | | for go-live. | +-------------------------+-------------------------+-------------------------+ | Weeks 11--14 | Pilot go-live | Field execution: legacy | | | | migration, new | | | | registrations up to | | | | 3,000 residents, | | | | authentication | | | | exercises, INJI Wallet | | | | usage, helpdesk | | | | operation; pilot | | | | closure and report | | | | preparation. | +-------------------------+-------------------------+-------------------------+ | _This is just an indicative execution plan. The actual execution plan with | | dates to be prepared based understanding and agreement between the country | | and MOSIP team_ | | | | \*_For brown-field pilots only ; A brown-field pilot re-uses issued | | National ID from a legacy system by migrating the ID data into MOSIP._ | +-----------------------------------------------------------------------------+

### Critical dependencies

* On-prem or cloud infrastructure and the necessary access for installation must be ready before the start of Week 1 or 2.
* Biometric device procurement and shipping typically takes 6 to 8 weeks. The country team supports the customs clearance process.
* The country lead finalises the ID schema and provides the master data inputs.
* SMS and email gateway access is configured ahead of customisation completion in Week 4.
*

{% hint style="info" %}
\| **If you only do one thing in week 0** | | | | Place the biometric device order and lock the infrastructure | | environment. Everything downstream depends on these two long-lead | | items. |
{% endhint %}

_Figure 3 --- Indicative 14-week schedule. Country-led streams (navy), MOSIP-led / shared streams (teal) and critical-path / gate items (orange)._

## Roles and Responsibilities

Responsibilities are split between the country program and the MOSIP team. The matrix below covers technical resources, setup, rollout, management and procurement.

***

**Category** **Activity** **Responsibility**

***

Technical resources Country technical team Country & field staff

```
                  MOSIP pilot deployment team      MOSIP

                  Government resource for ID       Country
                  schema and master data           
                  preparation                      

                  Functional training; operator    MOSIP + Country
                  and supervisor training          

                  Field staff for registration     Country
```

Pilot setup GitHub private account, Docker Country account creation and access

```
                  ID schema, master data           Country + MOSIP

                  MOSIP deployment in the country  MOSIP with Country
                  environment                      support

                  Customisation                    MOSIP
```

Rollout Resident pre-registration Country

```
                  Resident registration at         Country
                  Centers, ID issuance             

                  ID authentication using          Country
                  relying-party portal and INJI    

                  Feedback, metrics collection,    Country
                  report generation                

                  Pilot closure sign-off           Country + MOSIP
```

Management Initial pilot plan MOSIP

```
                  Pilot plan finalisation          Country

                  Pilot project management         Country + MOSIP

                  Governance structure             Country + MOSIP
```

Procurement On-prem / cloud environment Country

```
                  ABIS, biometric SDKs, manual     MOSIP
                  adjudication system              

                  SMS / email gateway              Country

                  SSL certificates                 Country or MOSIP

                  Biometric devices for            MOSIP
                  registration and authentication  
                  (fingerprint slap scanner, dual  
                  iris scanner, fingerprint        
                  authentication device)           

                  Face camera for registration     Country

                  PCs / laptops, printers and      Country
                  scanners                         
```

***

## Resourcing the Country Team

The country team is the Center of gravity of the pilot. They run the deployment, register residents, and inherit the system at sign-off --- so resourcing them well is the single biggest predictor of success.

***

**Role** **Count** **Responsibilities**

***

Project Manager 1 Owns the country program. Reports to the steering committee, manages dependencies, and signs off the pilot.

Senior Technical 1 or more Functional and technical owner of Lead MOSIP within the country team. First point of contact for field issues. Becomes the in-house MOSIP expert for future scale.

Junior Technical 3 or more Hands-on engineers handling Engineers deployment support, configuration, integrations and incident response.

Field Operators 5 or more Run the registration kits at the Centers. Identified, trained and certified by the country team.

Field Supervisors 1 per registration Supervise operators, manage Center exceptions and run the day-to-day helpdesk.

Adjudicators 1 or more Handle manual adjudication for biometric duplicates and quality exceptions.

### Communications 1 Coordinates resident outreach, focal point appointment scheduling and notification content for SMS and email.

{% hint style="info" %}
\| **Identify operators and supervisors early** | | | | Operators and supervisors must be identified by the country team well | | before the training window. Onboarding is hands-on and assumes | | participants are available for a continuous training block, not | | part-time. |
{% endhint %}

## Designing the Participant Mix

The point of the pilot is to feel what MOSIP behaves like for real residents, not for an idealised, average user. Aim for a participant pool that mirrors the country's population mix, with deliberate inclusion of harder edge cases.

### Recommended demographic distribution

The following distribution is recommended as a starting point. The country team owns the final mix and can adjust to reflect the local population profile and the coverage they want to validate during the pilot.

***

**Group** **Why include them** **Suggested share**

***

Adult males Reference registration path; ≈ 50% of adult surfaces the most common registrations workflow.

Adult females Validates the same reference ≈ 25% of adult path with diverse face capture registrations conditions.

Elderly residents Lower fingerprint quality is ≈ 25% of adult (60+) common; iris and face fall-back registrations paths are exercised; OTP-based\
authentication is deliberately\
tested.

Children below 5 Biometric thresholds differ; ≈ 5% of total years guardian linkages and consent population flows are tested.

Adults with Residents who cannot present ≈ 5% of total biometric fingerprints, iris or both. population exceptions Exception biometric flow,\
missing-biometric reason\
capture and supervisor approval are exercised.

Minors (6--17 Fingerprint and iris capture Country to decide years) works but operators must handle consent and guardian linkage\
flows.

### Persons with Includes residents in Country to decide disabilities wheelchairs, with limited mobility, or low vision. Validates Center accessibility and operator scripts.

{% hint style="info" %}
\| **Consent and ethics** | | | | Residents participating in the pilot must give informed consent. Make | | sure the consent form makes clear that this is a pilot, what data is | | collected, how long it is retained and whether the credential will | | continue to work after pilot closure. |
{% endhint %}

## Online and Offline Registration

MOSIP supports registration in both connected (online) and disconnected (offline) modes. The pilot exercises both so the country team understands the trade-offs before national rollout.

### Online registration

* The Registration Client communicates with the central MOSIP environment in real time over the country network or VPN.
* Residents may pre-register online (basic demographics and an appointment slot) and complete biometric capture at the Center.
* Used at Centers that have reliable, high-speed internet for the duration of the registration window.

### Offline registration

* The Registration Client captures demographics and biometrics locally; packets are synced to the central system once connectivity returns.
* Used at Centers with intermittent or no internet, or as a fall-back when the online path is degraded.
* Operators must understand sync windows, packet status and the helpdesk steps for stuck packets.

{% hint style="info" %}
\| **Exercise both modes deliberately** | | | | Schedule at least one full day of offline registration at one Center, | | even if connectivity is good. The point is to build muscle memory for | | the offline run-book before scale-up exposes the country to it for | | real. |
{% endhint %}

## Authentication with eSignet (OTP and Biometrics)

eSignet is the authentication front door for residents. The pilot uses a mock relying-party (RP) portal --- typically a sample health portal bundled with eSignet to demonstrate authentication flows end to end.

### OTP authentication

1. Resident enters their ID at the mock RP portal.
2. eSignet sends a one-time password to the resident's registered mobile or email.
3. Resident enters the OTP and is authenticated.
4. Resident gives consent by allowed a set of attributes (claims) to the RP.
5. RP receives an authentication assertion and grants access to the demo service.

### Biometric authentication

6. Resident enters their ID at the mock RP portal.
7. Operator captures a single fingerprint (or iris) on the authentication device.
8. eSignet matches the live capture against the stored biometric template.
9. Resident gives consent by allowed a set of attributes (claims) to the RP.
10. RP receives an authentication assertion and grants access to the demo service.

{% hint style="info" %}
\| **Real-life scenarios to rehearse** | | | | Run at least one OTP-only flow (resident has no fingerprint), one | | biometric flow, one fingerprint failure that falls back to OTP, and | | one deliberate impersonation attempt that should fail. These are the | | cases the country team will see at scale. |
{% endhint %}

## Issuing and Using INJI Wallet

INJI Wallet is the resident-side companion to MOSIP. It allows the resident to download a verifiable credential of their ID and present it back to relying parties without having to repeat the registration process. The pilot exercises both INJI Wallet (mobile) and INJI Web.

### Method

* Resident installs INJI Wallet on Android or iPhone (or opens INJI Web).
* Resident authenticates to the country MOSIP environment using their ID and an OTP via eSignet.
* MOSIP issues a verifiable credential into the wallet.
* Resident presents the credential to the mock health portal; the portal verifies the credential cryptographically and grants the demo service.

### Edge cases worth rehearsing

* Resident loses the phone and re-issues the credential on a new device.
* Resident has no smartphone --- INJI Web is used from a shared kiosk.
* Credential is revoked centrally and the wallet refuses presentation at the Relying Party.

## Functional Training and Real-Life Scenarios

Training is the heart of the pilot. The country team is functionally trained through hands-on sessions, and they go through real-life examples during the pilot and how to deal with them.

### Training streams

***

**Stream** **Topics** **Audience**

***

Technical Architecture, deployment, Country technical training configuration, monitoring team and incident response.

Functional Pre-registration, Program managers training registration packet flow, and tech leads ID processing, ID\
issuance, Lost ID\
issuance, ID update,\
eSignet, INJI Wallet,\
admin console.

Operator and End-to-end registration on Field operators supervisor the kit, exception and supervisors training handling, daily run-sheet, device hygiene.

Adjudicator Manual adjudication Adjudicators training console, decision\
rationale, escalation\
paths.

### Helpdesk training Stuck packets, lost Backoffice and credentials, biometric Helpdesk staff exceptions, complaint logging.

### Real-life scenarios to walk through

1. A senior citizen with worn fingerprints --- fall back to iris, then to OTP authentication.
2. An infant accompanied by a guardian --- biometrics deferred, guardian linkage captured, consent recorded.
3. A resident with no fingers --- exception biometric flow, missing-biometric reasons captured, supervisor approval.
4. A resident in a wheelchair --- accessibility set-up at the Center, photo booth at seated height, operator script.
5. A resident living in a low/no-connectivity area --- offline registration, packet sync the next morning, status check.
6. A duplicate detection at ABIS --- manual adjudicator reviews the case and decides whether to confirm or reject the duplicate.
7. A lost or damaged ID --- physical re-issuance at the registration center and re-download into a new INJI Wallet device.
8. An impersonation attempt at the relying-party portal --- biometric authentication fails and the helpdesk logs the incident.

{% hint style="info" %}
\| **Make training stick** | | | | Pair every classroom session with a live registration of a real | | participant (operator, supervisor or technical team member | | volunteering). Theory alone never produces confident operators. |
{% endhint %}

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
\| **Sign off as you go** | | | | Treat each capability above as a small gate. The country technical | | lead and the MOSIP deployment lead jointly tick it off the readiness | | register. No capability is allowed to be 'probably working' on | | go-live day. |
{% endhint %}

\| **Pre-registration inside registration center** | | | | It may be pertinent, but not mandatory, to have a pre-registration | | kiosk where a resident perform per-registration by providing the | | demographic details, upload documents and get registration ID issued | | prior to actual registration. This can reduce the time to register a | | resident by capturing only biometrics and verifying the documents | | uploaded. |

## Sandbox Hardening Before the Pilot

The pilot environment is built up incrementally during demos, training and UAT. By the time real residents arrive, that same environment is full of test packets, stale messages, demo accounts and broad access. Before go-live the MOSIP team with country support performs a structured hardening pass so that the pilot runs on a clean, narrowly-scoped platform.

### Cleaning the runtime

* Clear the Kafka cache so no test events are reprocessed during the pilot.
* Clear residual packets from the landing zone inside the platform pods.
* Clear ActiveMQ queues to avoid replaying dummy notifications.

### Tightening access

* Audit Wireguard (or equivalent VPN) access --- every client machine should be deliberately authorized, not inherited from a demo phase.
* Remove Wireguard access from people who no longer need it.
* Audit Keycloak users; remove demo accounts and any user no longer participating in the pilot.
* Reduce admin role membership in Keycloak to one or two named individuals; everyone else is moved to a least-privilege role.
* Capture and file the revocation list --- it becomes part of the pilot audit trail.

{% hint style="info" %}
\| **Treat hardening as a gate** | | | | Hardening is a prerequisite for the internal go-live. If it has not | | been completed and signed off, the pilot does not start. |
{% endhint %}

## Registration Center --- Operations and Logistics

A registration Center is more than a room with laptops. It is a small operations environment that has to receive residents, route them through a queue, capture their data accurately, manage exceptions and end the visit with a printed credential. The components below should be in place at every Center, scaled to the expected daily throughput.

_Figure 6 --- Indicative top-down layout of a registration Center. Adjust to the building you actually have, but keep the flow: entry → reception → registration → print → exit._

### What a registration Center comprises

* One or more registration stations --- typically three registration kits --- with one extra laptop available as a hot standby.
* Biometric devices and printer/scanner attached to each registration workstation.
* A trained registration operator, and a registration supervisor, present at all times.
* A dedicated print station for ID cards, with its own color printer (not shared with the registration stations).
* Sufficient seating in a waiting area for residents and their accompanying family members.
* A tokenisation mechanism for batching walk-in residents into registration slots.
* Handouts that explain the flow of activities so residents know what to expect.
* Posters at the entrance about what may and may not be carried into the Center.
* Pre-printed consent forms for residents to fill in and sign.
* Power backup sized to keep all kits running through any expected outage window.
* Security measures appropriate to the location, agreed with the country authority.
* A large screen in the reception area playing a short video that explains the registration process while residents wait.
* A helpdesk with one or two dedicated staff members to answer queries.
* Staff identification through a uniform or badge, so residents always know who to ask.

### Registration staff per Center

***

**Role** **Coverage**

***

Registration One trained operator per registration workstation. operator

Standby registration At least one extra operator on shift to absorb operator absences and breaks.

Supervisor One trained supervisor present whenever the Center is open.

Standby supervisor One additional supervisor available, particularly for the first weeks of go-live.

Helpdesk officer One or two officers --- first line for resident queries; escalates to the supervisor.

Print-station One operator dedicated to ID card printing and operator handover.

### Documentation A printed copy of the Registration Client Operations handbook is distributed to every operator and supervisor.

### Per-kit configuration

Each registration kit must be prepared and locked down before the Center opens. The supervisor walks the kit checklist with the operator at the start of each day.

#### Workstation

* Laptop matches the specification in Section 5.2.
* Latest Windows updates applied; Windows Update is then disabled until pilot closure to avoid mid-day reboots.
* Antivirus or Windows Defender installed and current; verified not to conflict with the Registration Client.
* Unrelated applications removed so the kit boots clean.
* External monitor for the resident is connected and tested.

#### Biometric devices

* Fingerprint slap scanner connected and recognized by the kit.
* Iris scanner connected and recognized.
* Face camera connected, framed correctly with the photo booth.
* If devices are connected through a USB hub, the hub is a powered hub.
* Each device is registered with its vendor and the registration is not scheduled to expire during the pilot window.

#### SBI software

* SBI L0 (registration) software installed and running on each registration workstation; device drivers installed.
* Devices verified to work end to end from the Registration Client.
* SBI L1 (authentication) software installed and running on the workstations dedicated to authentication, with the corresponding drivers in place.

#### Printer and scanner

* Each workstation has its own printer/scanner, never shared.
* Print and scan are tested with sample output before opening to residents.
* A4 paper stocked, with backup paper readily available.
* Toner or ink stock checked; a spare cartridge is on site.

#### Photo booth

* White background --- a stand with white cloth, or a clean white standee.
* Adjustable focus light, angled to remove shadows from the face.
* The seating position is marked and aligned with the camera so the framing is consistent across operators.
* Standby laptop is fully provisioned and ready to take over from any kit that fails during the day.

#### Operator tooling

* Each operator is given a notepad to record the Registration ID (RID), resident name and phone number --- a manual back-pocket reference if a resident has to be called back.

### Print station for ID cards

* A dedicated desk away from the registration queue.
* A laptop or desktop with adequate configuration for PDF rendering.
* A color printer connected to the workstation, exclusively for ID card printing on A4 sheets.

{% hint style="info" %}
\| **One printer per kit** | | | | Plan one printer/scanner per registration workstation, plus one | | separate, exclusive printer for ID cards. |
{% endhint %}

## The Registration Workflow, Step by Step

Operators do not invent the flow on the spot, they follow a consistent script. The steps below are the country-agnostic recipe for one resident moving through one registration station, from greeting to acknowledgment.

### Greeting and consent

* Receive the resident at the kit; explain the process briefly in their preferred language.
* Confirm that the consent form has been filled in and signed (per country policy).
* Verify the proof of identity documents and confirm that the demographic data on the evidence matches what will be entered.

### Demographic and document capture

* Capture demographics into the agreed schema; read each entry back to the resident for confirmation.
* Scan the supporting documents; check on screen that the scanned image is legible before saving.

### Biometric capture

* Capture fingerprints, iris and face following the best-practice guidelines in Section 19.
* Watch the on-screen biometrics and quality scores; repeat captures whose score is below the configured threshold.
* Where a biometric exception applies, mark the missing-biometric and call the supervisor for a second pair of eyes.
* Ask the resident whether they are satisfied with the captures before moving on.

### Preview, submit and acknowledge

* Walk the resident through the preview page; ask them to look for any errors in spelling, dates or contact information.
* Submit the registration packet. In offline mode, queue the packet for sync and note the packet ID on the manual log.
* Print the acknowledgment slip and hand it to the resident.
* Explain what is on the acknowledgment slip and the importance of keeping it; ask the resident to note down the registration ID.
* If the resident has a smartphone, suggest taking a photo of the slip as a back-up.

### Closing the visit

* Make a manual entry in the operator notebook --- RID, name, phone --- for fall-back reference.
* Tell the resident what happens next and when to return to collect the physical ID card.
* Explain the notifications they will receive over SMS, email or WhatsApp.
* If the resident later receives a failed-registration notification, ask them to come back to the Center immediately.
* Inform the supervisor that the registration is complete; invite the next person in the queue.

### Supervisor responsibilities during the day

* Review every registration packet before approval.
* Run random spot-checks at registration desks to confirm operators are following the script.
* Compare successful registrations against total registrations attempted at end of day.
* Collect operator feedback on the difficulties they faced and address them before the next day.
* Upload registration data at regular intervals --- typically twice a day --- so back-end processing has time to keep up.

_Figure 7 --- The operator workflow as a flowchart. Captures that miss the quality threshold loop back; everything else flows through to supervisor approval._

{% hint style="info" %}
\| **One thing every operator should remember** | | | | If anything feels off during a capture --- quality score, fingerprint | | placement, face framing --- stop and redo it. A few extra seconds at | | the kit saves an hour in adjudication later. |
{% endhint %}

## Best Practices for Biometric Capture

Biometric quality is the single largest determinant of authentication success later in the resident's life with the credential. The minute spent doing it well at the registration kit pays off across every future authentication, every issuance and every adjudication. The practices below should be drilled into every operator during training and reinforced by supervisors on the floor.

### General hygiene

* Clean the biometric device before every capture.
* Show the resident how to position their fingers, hands or eyes; do not assume they know.
* Help the resident press gently --- not hard --- against the slap scanner.
* **Do not assume the first capture is good. Take multiple attempts and keep the best.**
* Watch the on-screen biometric score for every capture. Aim above 40 and redo anything below threshold.
* Watch the on-screen biometrics that shows up at the time of capture and after the capture is complete to assess the quality of biometrics captures
* Watch out for smudged fingerprints, light fingerprints, half closed or 3/4th open eyes etc

### Fingerprint capture

* Ask the resident to press the fingers gently and evenly on the scanner.
* Re-calibrate the slap scanner per vendor guidance --- typically every \~10 captures --- and clean the surface before each calibration.
* If a finger is damaged, note the exception clearly and capture the remaining fingers.

### Iris capture

* Confirm the iris scanner is held the right way up --- operators sometimes hand a binocular device to the resident upside down and it may not be caught as an issue on the registration client.
* Ask the resident to open their eyes wide and not to blink during capture.

### Face capture

* Look straight into the camera, not at the screen.
* Do not smile.
* Do not cover the face with a mask.
* Do not slant or tilt the head.
* Do not blink during capture.
* Do not wear a cap or any head covering not required for religious or medical reasons.
* No one should stand directly behind the resident while the photo is taken.
* Lighting on the face should be even, with no harsh shadows.
* The result should be ICAO-compliant photo quality --- train operators against ICAO references during training.

### Capturing exceptions

* When recording a biometric exception, show the resident which biometric type is being marked as an exception, in their language.
* When capturing an exception photo (for a missing biometric), make sure the physical reason is visibly captured in the image.
* Get a supervisor to co-sign exception captures so the audit trail is clean.

{% hint style="info" %}
\| **Quality over throughput** | | | | It is always better to spend an extra two minutes at the kit than to | | send a low-quality packet downstream. Low-quality biometrics | | translate directly into ABIS false positives, manual adjudication | | backlogs and authentication failures after issuance. |
{% endhint %}

{% hint style="info" %}
\| **Display aample good and bad biometrics posters** | | | | MOSIP team can generate synthetic biometrics (good, bad ugly) that | | can be printed and displayed in the registration center at a | | prominent place. |
{% endhint %}

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
\| **Demo back, don't just watch** | | | | The country team gives the demo at UAT exit. If they cannot drive the | | platform without MOSIP at the wheel, UAT is not done. |
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
\| **Run a dry day** | | | | The day before external go-live, run a half-day dry run with internal | | staff playing residents. It surfaces queue, signage and logistics | | issues that a platform UAT cannot. |
{% endhint %}

## Go-Live Strategy --- Internal Then External

Going live is staged. The pilot starts with a small, internal go-live to confirm the platform is stable in real conditions. Only when that is signed off does the Center open to the public --- and even then, the first days deliberately ramp volume so issues surface while the audience is small.

### Internal go-live

* Country registers a small number of internal staff members.
* Biometric thresholds are calibrated based on the captures observed.
* Daily review at end of day: what worked, what surprised, what needs to change. It may be a good idea to pass on these information to MOSIP team on a daily basis or have a daily sync up call with the MOSIP team.
* A formal decision is taken on whether to proceed to external go-live, based on the platform's observed stability. Jointly decide with the MOSIP team.

### External go-live --- phased ramp

***

**Day** **Audience and approach**

***

Day 1 A small number of internal staff registrations, in a public setting, to surface any issues that only occur with the Center fully opened.

Day 2 Another small batch of registrations to confirm that the issues seen on Day 1 do not recur.

Day 3 Senior staff, country bureaucrats and visible community figures --- the audience is still controlled, but the credential begins to circulate beyond the project team.

### Day 4 Open to residents in line with the appointment plan. Volume onwards ramps to plan; daily reports go to the steering committee.

### Daily reporting during go-live

* Volumes by Center --- registered, in flight, failed.
* Biometric exception rate by Center and by operator.
* ABIS deduplication outcomes and adjudication queue depth.
* Authentication success rate at the mock relying party portal.
* Incident log --- what happened, what was done, what is still open.

_Figure 8 --- The phased go-live: internal first, then a deliberate Day 1 → Day N ramp into the public._

{% hint style="info" %}
\| **Don't skip Day 1** | | | | It is tempting to compress the phased ramp on a 3 to 4 month pilot. | | Don't. The phased ramp exists to find the issue you missed in UAT, | | while the audience is still small enough to fix things gracefully. |
{% endhint %}

## Governance and Review Cadence

A lightweight, predictable governance structure keeps decisions moving without burying the technical team in meetings.

***

**Forum** **Membership** **Cadence**

***

Pilot Governance Country representatives, Pilot kick-off and Committee MOSIP, key stakeholders. Set at major milestones. up during kick-off.

Weekly technical Country and MOSIP technical Weekly or as review Leads discussed in the kick-off meeting, throughout the pilot

Steering committee Executive members from the Bi-weekly or at gate country and MOSIP. decisions.

Pilot readiness Members of the Streering After User review commitee, Tech leads from the Acceptance Testing country and MOSIP

### Closure meeting All stakeholders After registrations are completed; final sign-off.

{% hint style="info" %}
\| **Always close with lessons learned** | | | | Block the last 30 minutes of each weekly review for 'what surprised | | us this week'. The compiled list becomes the lessons-learned annex of | | the closure report. It also helps in mid-course corrections during | | the pilot. |
{% endhint %}

## Critical Success Factors and Risks\*\*

### Success factors

* Country infrastructure (on-prem or cloud) is available at the earliest possible time, with the access and security approvals MOSIP needs to deploy.
* Country project team --- program, technical, field is identified, trained and available full time during the registration window.
* Non-biometric components of the registration kit (laptop, photo booth, printer/scanner, monitor, helpdesk and admin terminals) are procured and tested before training begins.
* Biometric devices arrive on time and pass acceptance testing at first delivery.
* ID schema and master data are signed off at the beginning of the pilot, anything later cascades into the registration window.
* Participant pool reflects the population mix, including children, minors, senior citizens and persons with disabilities.
* Functional training is paired with real registrations; no operator goes to the field untested. Some countries have even conducted examinations and grading to operators.

### Top risks and mitigations

***

**Risk** **Impact** **Mitigation**

***

Biometric devices Compresses or cuts the Country pre-clears delayed at customs field window. customs; MOSIP ships in two waves so a partial shipment can start training.

On-prem environment not Deployment slips, Have a public cloud ready downstream training and fallback environment customisation cascade. pre-approved as a contingency (depends on country's sovereign principles)

Operator attrition Loss of trained Train at least 1.5× the during the pilot operators forces operators required and re-training mid-flight. rotate them through Centers.

ID schema changes late Triggers Freeze the schema by into the pilot re-customisation and end of Week 3; treat preparation re-test of the post-freeze changes as registration UI. scope changes needing committee approval.

Connectivity outage at Online registration Offline mode is a Center grinds to a halt. enabled, exercised during training, and used as the default fall-back.

### Low resident turnout Cannot reach 3,000 Communications focal registrations in the point runs structured window. outreach via campaigns and partner channels; Centers open extended hours in the last week and may be use weekends.

## Pilot Closure and Hand-Off

Closure is not just turning the lights off. It is the moment the country team formally takes ownership of MOSIP and decides what to keep, what to redo and what to scale. The closure activities below are a structured way to make sure no lesson learned in the pilot is lost in the transition.

### Formal closure

* Inform the country authorities, in writing, that the pilot has been completed.
* Generate the formal pilot reports from the reporting console --- registration, authentication, exceptions, dashboards.

### Capturing field experience

* Interview every registration field operator and supervisor; record their experience in their own words.
* Interview the country technical leads and program managers.
* Hold a closure meeting with the MOSIP team to discuss outcomes, surprises and recommendations.
* Send a formal pilot closure report to the MOSIP team.

### Closure deliverables

* Registration metrics: total registered, breakdown by demographic group, on-line vs off-line split, biometric exception rates, average registration time per kit.
* Authentication metrics: OTP and biometric success rates, helpdesk incident counts.
* Lessons-learned register, captured weekly across the pilot.
* Configuration baselines: ID schema, master data, customisation diff, infrastructure footprint as actually deployed.
* Recommendations for scale: sizing, integrations, capacity, governance.
* Final sign-off from the Pilot Governance Committee.

{% hint style="info" %}
\| **Cost note** | | | | The pilot platform is provided at no cost (open source). The country | | invests in infrastructure, country-side hardware, gateways, personnel | | and travel. Production costing for a national rollout is a separate | | exercise and is not represented by the pilot footprint. |
{% endhint %}

## Appendix A

**Registration Center Setup Checklist**

Print this page and do an audit with a supervisor before the first registration. Tick everything before opening to residents.

+----------------------------+-----------------------------------------+ | **Area** | **Checks** | +============================+=========================================+ | Power and connectivity | Power outlets sufficient for laptop, | | | monitor, printer/scanner, lights and | | | devices. Surge protection in place. | | | | | | Wired or stable Wi-Fi tested at the | | | kit. Offline-mode fallback verified end | | | to end. | +----------------------------+-----------------------------------------+ | Registration kit | Laptop (specs per Section 5.2) up to | | | date, antivirus current. | | | | | | Citizen-facing monitor connected. | | | | | | Fingerprint slap scanner, dual iris | | | scanner and face camera tested with | | | sample captures. | +----------------------------+-----------------------------------------+ | Documents and printers | Printer/scanner installed. | | | | | | A4 paper, ink/toner stocked. | | | | | | Document scanner tested with a sample | | | identity document. | +----------------------------+-----------------------------------------+ | Photo booth | Backdrop and lights set up; framing | | | tested with a person of average height. | | | | | | Lighting uniform; no shadow on the | | | face. | | | | | | A chair placed at a distance from the | | | camera to get a good photograph | +----------------------------+-----------------------------------------+ | Helpdesk and admin | Supervisor terminal logged in with | | | helpdesk role. | | | | | | Admin terminal accessible only by the | | | country admin. | | | | | | Incident log template available. | +----------------------------+-----------------------------------------+ | Resident experience | Signage and queueing arranged with | | | accessibility in mind. | | | | | | Seating available, including for senior | | | citizens and residents with | | | disabilities. | | | | | | Drinking water and rest areas | | | signposted. | +----------------------------+-----------------------------------------+ | Compliance | Consent forms printed in the | | | language(s) used by participants. | | | | | | Data-handling poster displayed. | | | | | | Incident contact details visible at | | | every kit. | | | | | | Good, average and poor quality | | | biometrics printed and pasted in | | | various locations in the center with | | | copies circulated to supervisor and | | | operators | +----------------------------+-----------------------------------------+

## Appendix B

**Day-of-Pilot Operator Run Sheet**

A condensed run sheet for an operator on a registration day. Localize it for your Center.

***

**Phase** **What the operator does**

***

Start of day Power on the kit. Verify the operator login and date/time. Run a self-test capture on the fingerprint, iris and face devices. Print a calibration page from the printer.

Pre-registration Look up the resident's pre-registration appointment. check Confirm identity documents match. Confirm consent.

Demographic Capture demographics in the country language, in the capture agreed schema. Re-read each entry to the resident before saving.

Biometric capture Capture fingerprints (slap), iris (dual) and face. Repeat captures whose quality score is below threshold. For exceptions, mark the missing-biometrics and call the supervisor.

Document scan Scan the supporting document at 300 dpi. Confirm legibility before saving.

Submit packet Submit the packet. In offline mode, queue it for sync and note the packet ID on the manual log.

Authentication If the resident is part of the authentication sample, exercise walk them through eSignet OTP or biometric flow at the mock RP portal. Demonstrate INJI Wallet credential download if requested.

### End of day Sync any offline packets. Power down devices. Lock kit. Hand the daily metrics sheet to the supervisor.

## Appendix C

**Experiencing Security and Privacy during the Pilot**

The MOSIP pilot is deliberately designed so that security and privacy are not theoretical. Every step of the pilot --- from configuring network rules on Day 1 to watching the consent screen during authentication --- is an opportunity for the country team to build the operational instincts needed to govern a national identity system responsibly at scale.

### What the Team Experiences

***

**Layer** **What you experience / Security / privacy observe principle at work**

***

**Biometric Biometric data leaves the Data-at-capture encryption capture** device encrypted. The via SBI device; operator never sees raw hardware-bound keys in TPM fingerprint or iris data on on the registration laptop. screen --- only a quality\
score.

**Registration Every packet uploaded from AES-256 encryption; hybrid packet** the Registration Client is key wrapping with RSA. encrypted before it travels Packet is signed with the over the network. Even if machine's TPM key, binding intercepted, it is it to the physical hardware. unreadable.

**MOSIP core Observe in the Admin Console Zero-Knowledge encryption on platform** that each resident's UIN is biometric templates; UIN never stored in plain text. hashing and encryption; AES Identity and biometric data keys per data category are stored in separate stored in HSM / SoftHSM. encrypted stores.

**Deduplication Watch biometric Biometric templates are (ABIS)** deduplication run without shared with ABIS in any human operator seeing encrypted form. ABIS returns the templates being a score --- never the raw compared. Results return as template back to MOSIP. match / no-match only.

**eSignet Authenticate using OTP and Partner Specific User Token authentication** fingerprint. Observe that (PSUT) --- each service gets the relying party (mock a different identifier for health portal) receives only the same resident. a pseudonymous token --- not Cross-service profiling is the resident's real ID cryptographically prevented. number.

**INJI Wallet** Download a credential to a W3C Verifiable Credential phone. The credential is a with cryptographic proof. signed Verifiable Credential Credential is bound to the that can be verified offline wallet's hardware key --- no call back to MOSIP (Android Keystore / iOS needed. Secure Enclave).

### **Consent** See the consent screen Consent is recorded as an appear before any data is artifact with a unique ID. shared with a relying party. No data leaves MOSIP without The resident explicitly a valid consent record. approves what is shared.

### Key privacy behaviors observed during Registration

\| **During the pilot, specifically observe and discuss the following | | with your team:** | | | | - The operator never sees the resident's biometric data in raw form | | --- only a quality indicator (green / amber / red). This is | | enforced by the SBI device driver, not just policy. | | | | - The citizen-facing screen shows the resident their own data before | | submission, giving them the opportunity to correct errors --- a | | built-in data accuracy and consent mechanism. | | | | - Acknowledgement slips printed for residents contain only the | | Application ID, not the resident's full biometric or demographic | | record. | | | | - The deduplication process (ABIS) never returns the matching | | resident's data to an operator --- only a match / no-match flag | | routes to manual adjudication. | | | | - eSignet consent screen lists exactly which data fields a relying | | party is requesting. The resident can see and refuse before any | | data is shared. | | | | - The INJI Wallet credential shows the resident's data but the | | verifier's QR scan returns only a cryptographic validity result --- | | the verifier cannot harvest and store the resident's data from the | | scan. |

### Questions to guide your team's security discussion

+---+---------------------------------+---------------------------------+ | | **FOR THE TECHNICAL TEAM** | **FOR THE POLICY TEAM** | | | | | | | - What happens to a | - Which government authority | | | registration packet if the | will be the data controller | | | network drops mid-upload? Is | for resident biometrics at | | | it lost, or stored securely | national scale? | | | and retried? | | | | | - What data retention policy | | | - Who in MOSIP has the ability | will apply to packets and | | | to decrypt a stored | logs once ID is generated? | | | biometric? What prevents | | | | misuse? | - Under what legal authority | | | | can a third-party service | | | - How would we detect if a | request a resident's eSignet | | | rogue operator was | authentication? | | | registering fictitious | | | | residents? | - How will residents exercise | | | | their right to correction or | | | - What is the process for | deletion under the country's | | | rotating the signing keys | data protection law? | | | after the pilot? | | | | | - What audit trail must be | | | - How do we ensure the SoftHSM | maintained for each | | | seed material is protected, | resident's data access | | | and what replaces it in | events? | | | production? | | +===+=================================+=================================+



-->