# References

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

## Appendix A

**Registration Center Setup Checklist**

Print this page and do an audit with a supervisor before the first registration. Tick everything before opening to residents.

+----------------------------+-----------------------------------------+ | **Area** | **Checks** | +============================+=========================================+ | Power and connectivity | Power outlets sufficient for laptop, | | | monitor, printer/scanner, lights and | | | devices. Surge protection in place. | | | | | | Wired or stable Wi-Fi tested at the | | | kit. Offline-mode fallback verified end | | | to end. | +----------------------------+-----------------------------------------+ | Registration kit | Laptop (specs per Section 5.2) up to | | | date, antivirus current. | | | | | | Citizen-facing monitor connected. | | | | | | Fingerprint slap scanner, dual iris | | | scanner and face camera tested with | | | sample captures. | +----------------------------+-----------------------------------------+ | Documents and printers | Printer/scanner installed. | | | | | | A4 paper, ink/toner stocked. | | | | | | Document scanner tested with a sample | | | identity document. | +----------------------------+-----------------------------------------+ | Photo booth | Backdrop and lights set up; framing | | | tested with a person of average height. | | | | | | Lighting uniform; no shadow on the | | | face. | | | | | | A chair placed at a distance from the | | | camera to get a good photograph | +----------------------------+-----------------------------------------+ | Helpdesk and admin | Supervisor terminal logged in with | | | helpdesk role. | | | | | | Admin terminal accessible only by the | | | country admin. | | | | | | Incident log template available. | +----------------------------+-----------------------------------------+ | Resident experience | Signage and queueing arranged with | | | accessibility in mind. | | | | | | Seating available, including for senior | | | citizens and residents with | | | disabilities. | | | | | | Drinking water and rest areas | | | signposted. | +----------------------------+-----------------------------------------+ | Compliance | Consent forms printed in the | | | language(s) used by participants. | | | | | | Data-handling poster displayed. | | | | | | Incident contact details visible at | | | every kit. | | | | | | Good, average and poor quality | | | biometrics printed and pasted in | | | various locations in the center with | | | copies circulated to supervisor and | | | operators | +----------------------------+-----------------------------------------+

## Appendix B

**Day-of-Pilot Operator Run Sheet**

A condensed run sheet for an operator on a registration day. Localise it for your Center.

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
