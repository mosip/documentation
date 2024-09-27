# Identifiers

## Overview

In the context of MOSIP, identifiers are alphanumeric digital handles for identities in the system. While a person's identity is represented as a collection of biographic and biometric attributes that can uniquely identify the person, the identity is referred to using identifiers.

### UIN

Unique Identification Number (UIN), as the name suggests, is a unique number assigned to a resident. UIN never changes and is non-revocable. UIN is randomized such that one should not be able to derive any Personal Identifiable Information (PII) from the number itself.

The rules that govern generation of a UIN are listed [here](https://github.com/mosip/commons/blob/release-1.2.0/kernel/kernel-idgenerator-service/README.md).

### VID

The VID / Virtual ID is an alias identifier that can be used for authentication transactions. The key characteristic of such an identifier is that it expires. This allows for free disclosure and usage of this identifier in various contexts. It is privacy friendly in a way such that it can be revoked, configured for one time usage and is not linkable. Since these are used for authentication transactions, such identifiers are to be known to the user only or generated with their participation.

### RID / AID

The Application ID (AID) refers to the unique identifier given to a resident during any ID lifecycle event, such as ID Issuance, ID Update, or Lost ID retrieval, at the registration center. It serves as a distinguishing factor for each specific event and can later be utilized by the resident to check the progress or status of the event.
Previously, in MOSIP, the Application ID was referred to as the RID (Registration ID) and/or PRID (Pre-registration ID).

### PRID

The PRID is a specialized RID used in the pre-registration system.

### Token ID (PSUT - Partner Specific User Token)

The Token identifier/PSUT is a system provided customer reference number for relying parties to uniquely identify the users in their system. The token identifier is an alias meant for the partner/relying party typically unique (Configured through PMS policy, in case uniqueness is not the need then partner policy can be set to provide random number) to them. This identifier is included in the response of the authentication transactions. One key differentiator is that the PSUT is not accepted as an identifier for authentication transactions. This ensures that the partner who has the PSUT can not reauthneticate.
