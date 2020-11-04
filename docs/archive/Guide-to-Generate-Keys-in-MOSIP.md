This document provides detailed steps to generate keys in MOSIP using MOSIP's Key Manager Service.

# Pre-requisites
1. The Key Manager API should be up and running.
2. The Key Manager database should have pre-populated data for the application ids in MOSIP with there key validity duration. The possible Application IDs are,
	1. ROOT (mandatory)
	2. KERNEL
	3. PRE_REGISTRATION
	4. REGISTRATION
	5. REGISTRATION_PROCESSOR
	6. ID_REPO
	7. IDA
	8. PMS
	9. BASE (mandatory)

# Steps
1. Using the Key Manager's Generate Master Key API, we should first generate the a Master Key for ROOT.
	1. In case of ROOT, make sure that the reference_id is null.
	2. Data to be entered for generating the Root key are,
		1. Application ID: ROOT
		2. Common Name: The fully qualified domain name (FQDN) of the server.
		3. Country: The two-letter ISO code for the country where the organization is location.
		4. State: The state/region where the organization is located.
		5. Location: The city where the organization is located.
		6. Organization: The legal name of the organization.
		7. Organization Unit: The division of the organization handling the certificate.
2. Added new ROOT & Base key policy in key policy table.