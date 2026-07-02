# Infrastructure and Requirements

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
**Cloud or on-prem?** If the country plans to run the future production system on-prem, exercise the on-prem footprint here so that operations, networking and security teams rehearse the real run-book. If the production target is cloud, run the pilot on the same cloud provider.
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
**Plan for shipping lead time** Procurement and international shipping of biometric devices typically takes 6 to 8 weeks. Start this on day one. The country team should pre-clear the customs process to avoid delays.
{% endhint %}

### Document scanners, printers and photo booths

#### Printer with scanner (per registration station)

+-------------------------------------+-------------------------------------+ | **Specification** | **Value** | +=====================================+=====================================+ | Type | Colour | +-------------------------------------+-------------------------------------+ | Print resolution | 600 dpi | +-------------------------------------+-------------------------------------+ | Scan resolution | 300 dpi | +-------------------------------------+-------------------------------------+ | Paper size | A4 | +-------------------------------------+-------------------------------------+ | Connectivity | USB 2.0+ or wireless | +-------------------------------------+-------------------------------------+ | OS support | Windows 10/11 | +-------------------------------------+-------------------------------------+ | Driver support | TWAIN / WIA compatible | +-------------------------------------+-------------------------------------+ | Quantity | Approximately 4 units across the | | | pilot (scale with number of | | | Centers) | +-------------------------------------+-------------------------------------+ | These are regular printers available off the shelf such as HP, Epson | | Canon etc | +---------------------------------------------------------------------------+

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
