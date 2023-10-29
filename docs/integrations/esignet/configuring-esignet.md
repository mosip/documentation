# Configuring eSignet

This document detail steps to configure eSignet for MOSIP.

## eSignet as MISP Partner

Once, both MOSIP and eSignet are deployed, eSignet needs to be onboarded in MOSIP as a MISP partner and a new policy called the MISP policy needs to be mapped to the eSignet MISP partner.

Below is the policy that should be mapped to the eSignet MISP partner.

```json
{
  "allowAuthRequestDelegation":true,
  "allowKycRequestDelegation":true,
  "trustBindedAuthVerificationToken":true,
  "allowKeyBindingDelegation":true
}
```

Once the MISP is created and mapped to the above policy, a license key for the eSignet should be created and it should be updated in the `esignet-default.properties` against the property name : `mosip.esignet.misp.license.key`.

This license key would be used when the [MOSIP IDA APIs](ida.md#appendix-api-specifications) are called for eSignet based authentication or exchange.

