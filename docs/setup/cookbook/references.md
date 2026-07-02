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

| Risk | Impact | Mitigation |
|---|---|---|
| Biometric devices delayed at customs | Compresses or cuts the field window. | Country pre-clears customs; MOSIP ships in two waves so a partial shipment can start training. |
| On-prem environment not ready | Deployment slips, downstream training and customisation cascade. | Have a public cloud fallback environment pre-approved as a contingency (depends on country's sovereign principles). |
| Operator attrition during the pilot | Loss of trained operators forces re-training mid-flight. | Train at least 1.5× the operators required and rotate them through Centers. |
| ID schema changes late into the pilot preparation | Triggers re-customisation and re-test of the registration UI. | Freeze the schema by end of Week 3; treat post-freeze changes as scope changes needing committee approval. |
| Connectivity outage at a Center | Online registration grinds to a halt. | Offline mode is enabled, exercised during training, and used as the default fall-back. |
| Low resident turnout | Cannot reach 3,000 registrations in the window. | Communications focal point runs structured outreach via campaigns and partner channels; Centers open extended hours in the last week and may be use weekends. |

## Appendix A

**Registration Center Setup Checklist**

Print this page and do an audit with a supervisor before the first registration. Tick everything before opening to residents.

| Area | Checks |
|---|---|
| Power and connectivity | Power outlets sufficient for laptop, monitor, printer/scanner, lights and devices. Surge protection in place. Wired or stable Wi-Fi tested at the kit. Offline-mode fallback verified end to end. |
| Registration kit | Laptop (specs per Section 5.2) up to date, antivirus current. Citizen-facing monitor connected. Fingerprint slap scanner, dual iris scanner and face camera tested with sample captures. |
| Documents and printers | Printer/scanner installed. A4 paper, ink/toner stocked. Document scanner tested with a sample identity document. |
| Photo booth | Backdrop and lights set up; framing tested with a person of average height. Lighting uniform; no shadow on the face. A chair placed at a distance from the camera to get a good photograph. |
| Helpdesk and admin | Supervisor terminal logged in with helpdesk role. Admin terminal accessible only by the country admin. Incident log template available. |
| Resident experience | Signage and queueing arranged with accessibility in mind. Seating available, including for senior citizens and residents with disabilities. Drinking water and rest areas signposted. |
| Compliance | Consent forms printed in the language(s) used by participants. Data-handling poster displayed. Incident contact details visible at every kit. Good, average and poor quality biometrics printed and pasted in various locations in the center with copies circulated to supervisor and operators. |

## Appendix B

**Day-of-Pilot Operator Run Sheet**

A condensed run sheet for an operator on a registration day. Localise it for your Center.

| Phase | What the operator does |
|---|---|
| Start of day | Power on the kit. Verify the operator login and date/time. Run a self-test capture on the fingerprint, iris and face devices. Print a calibration page from the printer. |
| Pre-registration check | Look up the resident's pre-registration appointment. Confirm identity documents match. Confirm consent. |
| Demographic capture | Capture demographics in the country language, in the agreed schema. Re-read each entry to the resident before saving. |
| Biometric capture | Capture fingerprints (slap), iris (dual) and face. Repeat captures whose quality score is below threshold. For exceptions, mark the missing-biometrics and call the supervisor. |
| Document scan | Scan the supporting document at 300 dpi. Confirm legibility before saving. |
| Submit packet | Submit the packet. In offline mode, queue it for sync and note the packet ID on the manual log. |
| Authentication exercise | If the resident is part of the authentication sample, walk them through eSignet OTP or biometric flow at the mock RP portal. Demonstrate INJI Wallet credential download if requested. |
| End of day | Sync any offline packets. Power down devices. Lock kit. Hand the daily metrics sheet to the supervisor. |

## Appendix C

**Experiencing Security and Privacy during the Pilot**

The MOSIP pilot is deliberately designed so that security and privacy are not theoretical. Every step of the pilot --- from configuring network rules on Day 1 to watching the consent screen during authentication --- is an opportunity for the country team to build the operational instincts needed to govern a national identity system responsibly at scale.

### What the Team Experiences

| Layer | What you experience / observe | Security / privacy principle at work |
|---|---|---|
| **Biometric capture** | Biometric data leaves the device encrypted. The operator never sees raw fingerprint or iris data on screen --- only a quality score. | Data-at-capture encryption via SBI device; hardware-bound keys in TPM on the registration laptop. |
| **Registration packet** | Every packet uploaded from the Registration Client is encrypted before it travels over the network. Even if intercepted, it is unreadable. | AES-256 encryption; hybrid key wrapping with RSA. Packet is signed with the machine's TPM key, binding it to the physical hardware. |
| **MOSIP core platform** | Observe in the Admin Console that each resident's UIN is never stored in plain text. Identity and biometric data are stored in separate encrypted stores. | Zero-Knowledge encryption on biometric templates; UIN hashing and encryption; AES keys per data category stored in HSM / SoftHSM. |
| **Deduplication (ABIS)** | Watch biometric deduplication run without any human operator seeing the templates being compared. Results return as match / no-match only. | Biometric templates are shared with ABIS in encrypted form. ABIS returns a score --- never the raw template back to MOSIP. |
| **eSignet authentication** | Authenticate using OTP and fingerprint. Observe that the relying party (mock health portal) receives only a pseudonymous token --- not the resident's real ID number. | Partner Specific User Token (PSUT) --- each service gets a different identifier for the same resident. Cross-service profiling is cryptographically prevented. |
| **INJI Wallet** | Download a credential to a phone. The credential is a signed Verifiable Credential that can be verified offline --- no call back to MOSIP needed. | W3C Verifiable Credential with cryptographic proof. Credential is bound to the wallet's hardware key (Android Keystore / iOS Secure Enclave). |
| **Consent** | See the consent screen appear before any data is shared with a relying party. The resident explicitly approves what is shared. | Consent is recorded as an artifact with a unique ID. No data leaves MOSIP without a valid consent record. |

### Key privacy behaviors observed during Registration

During the pilot, specifically observe and discuss the following with your team:

* The operator never sees the resident's biometric data in raw form --- only a quality indicator (green / amber / red). This is enforced by the SBI device driver, not just policy.
* The citizen-facing screen shows the resident their own data before submission, giving them the opportunity to correct errors --- a built-in data accuracy and consent mechanism.
* Acknowledgement slips printed for residents contain only the Application ID, not the resident's full biometric or demographic record.
* The deduplication process (ABIS) never returns the matching resident's data to an operator --- only a match / no-match flag routes to manual adjudication.
* eSignet consent screen lists exactly which data fields a relying party is requesting. The resident can see and refuse before any data is shared.
* The INJI Wallet credential shows the resident's data but the verifier's QR scan returns only a cryptographic validity result --- the verifier cannot harvest and store the resident's data from the scan.

### Questions to guide your team's security discussion

| For the Technical Team | For the Policy Team |
|---|---|
| What happens to a registration packet if the network drops mid-upload? Is it lost, or stored securely and retried? | Which government authority will be the data controller for resident biometrics at national scale? |
| Who in MOSIP has the ability to decrypt a stored biometric? What prevents misuse? | What data retention policy will apply to packets and logs once ID is generated? |
| How would we detect if a rogue operator was registering fictitious residents? | Under what legal authority can a third-party service request a resident's eSignet authentication? |
| What is the process for rotating the signing keys after the pilot? | How will residents exercise their right to correction or deletion under the country's data protection law? |
| How do we ensure the SoftHSM seed material is protected, and what replaces it in production? | What audit trail must be maintained for each resident's data access events? |
