# Credential Provider customization

Inji is supporting two credential providers as of today
* Download via UIN/VID
* Download via eSignet

To configure new provide which can issue VC, it can be achieved with few configuration change.

Configuration can be found at `mimoto-issuers-config.json`. This property file is maintained as one for each deployment environment. On this repository, each environment configuration is placed in a corresponding branch specific to that environment.

> Refer to [mimoto-issuers-config.json](https://github.com/mosip/mosip-config/blob/collab/mimoto-issuers-config.json) of Collab environment.

These values will be used by Inji via Mimoto. Mimoto exposes APIs which is used by the Inji application to fetch and store the issuers and their configurations in the local storage.

* API used to fetch issuers: `https://api.mosip.io/v1/mimoto/residentmobileapp/issuers`
* API used to fetch issuer's configuration: `https://api.mosip.io/v1/mimoto/residentmobileapp/issuers${issuerId}`

In mimoto-issuers-config.json, new providers can be added as per well-known schema.

After adding provider in configuration, it will be displayed on UI on `Add new card` screen.

* If new provider supports `OpenId4VCI` protocol, please use issuerMachine.ts and EsignetMosipVCItemMachine.ts for workflow to download VC.
* If it doesn't support `OpenId4VCI` protocol, new state machine needs to be added. Please refer to issuerMachine.ts and EsignetMosipVCItemMachine.ts