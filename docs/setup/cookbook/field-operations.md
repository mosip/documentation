# Field Operations

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
**Exercise both modes deliberately** Schedule at least one full day of offline registration at one Center, even if connectivity is good. The point is to build muscle memory for the offline run-book before scale-up exposes the country to it for real.
{% endhint %}

## Registration Center --- Operations and Logistics

A registration Center is more than a room with laptops. It is a small operations environment that has to receive residents, route them through a queue, capture their data accurately, manage exceptions and end the visit with a printed credential. The components below should be in place at every Center, scaled to the expected daily throughput.

_Figure 6 --- Indicative top-down layout of a registration Center. Adjust to the building you actually have, but keep the flow: entry → reception → registration → print → exit._

### What a registration Center comprises

* One or more registration stations --- typically three registration kits --- with one extra laptop available as a hot standby.
* Biometric devices and printer/scanner attached to each registration workstation.
* A trained registration operator, and a registration supervisor, present at all times.
* A dedicated print station for ID cards, with its own colour printer (not shared with the registration stations).
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

| Role | Coverage |
|---|---|
| Registration operator | One trained operator per registration workstation. |
| Standby registration operator | At least one extra operator on shift to absorb absences and breaks. |
| Supervisor | One trained supervisor present whenever the Center is open. |
| Standby supervisor | One additional supervisor available, particularly for the first weeks of go-live. |
| Helpdesk officer | One or two officers --- first line for resident queries; escalates to the supervisor. |
| Print-station operator | One operator dedicated to ID card printing and handover. |

### Documentation

A printed copy of the Registration Client Operations handbook is distributed to every operator and supervisor.

### Per-kit configuration

Each registration kit must be prepared and locked down before the Center opens. The supervisor walks the kit checklist with the operator at the start of each day.

#### Workstation

* Laptop matches the specification in Section 5.2.
* Latest Windows updates applied; Windows Update is then disabled until pilot closure to avoid mid-day reboots.
* Antivirus or Windows Defender installed and current; verified not to conflict with the Registration Client.
* Unrelated applications removed so the kit boots clean.
* External monitor for the resident is connected and tested.

#### Biometric devices

* Fingerprint slap scanner connected and recognised by the kit.
* Iris scanner connected and recognised.
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
* A colour printer connected to the workstation, exclusively for ID card printing on A4 sheets.

{% hint style="info" %}
**One printer per kit** Plan one printer/scanner per registration workstation, plus one separate, exclusive printer for ID cards.
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
**One thing every operator should remember** If anything feels off during a capture --- quality score, fingerprint placement, face framing --- stop and redo it. A few extra seconds at the kit saves an hour in adjudication later.
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
**Quality over throughput** It is always better to spend an extra two minutes at the kit than to send a low-quality packet downstream. Low-quality biometrics translate directly into ABIS false positives, manual adjudication backlogs and authentication failures after issuance.
{% endhint %}

{% hint style="info" %}
**Display aample good and bad biometrics posters** MOSIP team can generate synthetic biometrics (good, bad ugly) that can be printed and displayed in the registration center at a prominent place.
{% endhint %}
