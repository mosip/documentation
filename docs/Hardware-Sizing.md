
This document provides estimates for server machines and other hardware needed for a given production deployment.  _This is work-in-progress_.  Performance tuning of MOSIP is in progress so these figures are **rough estimates** at this point time.

# ID Authentication
* Peak load assumption:  2 million auth requests per day 
* Number of servers needed:  20  (4 CPU, 16 GB RAM)

# Registration Processor
* Peak load assumption:  200,000 registration packets per day 
* Number of servers needed:  80 (4 core, 16 GB RAM)

**Important notes**:
1.  The above are rough estimates we must add a margin of 30% for the unknowns.
1.  High availability is taken into consideration.
1.  The above estimates do not include hardware/servers needed for
    1. Data storage 
    1. Bio SDK:  compute requirements should be provided by the SDK vendor.
    1. HSM
    1. ABIS
    1. Virus scan
    1. Load balancers
    1. External IAM
    1. Disaster recovery:  Setup will be replicated, hence, double the number of servers.

# Bill of Material
The section below lists all the hardware that is needed for deploying MOSIP.  Only hardware components are listed.  Quantity will depend on specific deployments (based on above estimates).

Hardware item|Spec|Quantity
---|---|---
Compute machines (VM/Bare Metal)|4 Core, 16GB RAM
DB machines| 4 Core, 32 GB 
Storage SAN/NAS|| 
HSM (Hardware Security Module)||
Load Balancers||
Firewalls||
Routers/Software Defined Network||
IDS/IPS||
Laptops with TPM (for registrations)||
Fingerprint slap scanners||
Iris scanners||
Camera||
Document scanners (optional)||
Printers (optional)||





