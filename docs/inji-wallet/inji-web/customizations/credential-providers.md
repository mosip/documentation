# Credential Providers

Inji Web currently provides support for following credential providers:

**Download VC using OpenID for VC Issuance Flow (eSignet)**

* National ID
* Insurance

To set up a new provider that can issue VC, it can be accomplished by making a few configuration changes. 

**Steps:**

1. The configuration details can be found in the `mimoto-issuers-config.json` property file. This file is maintained separately for each deployment environment. In this repository, each environment's configuration is stored in a dedicated branch specific to that environment.

> Refer to [mimoto-issuers-config.json](https://github.com/mosip/mosip-config/blob/collab1/mimoto-issuers-config.json) of Collab environment.

These values will be used by Inji Wallet via Mimoto. Mimoto exposes APIs which is used by the Inji Wallet application to fetch, store the issuers and their configurations in the local storage.

* API used to fetch issuers: `https://api.mosip.io/v1/mimoto/residentmobileapp/issuers`
* API used to fetch issuer's configuration: `https://api.mosip.io/v1/mimoto/residentmobileapp/issuers/${issuerId}`

2. In `mimoto-issuers-config.json`, new providers can be added as per the `well-known` schema defined by OpenID4VCI standards.

After adding the provider in configuration, it will be displayed on the UI on `Add new card` screen.

* If new provider supports [OpenID4VCI](https://openid.net/specs/openid-4-verifiable-credential-issuance-1\_0.html) protocol, it is recommended to use `issuerMachine.ts` and `EsignetMosipVCItemMachine.ts` for workflow to download VC.
* If it doesn't support `OpenID4VCI` protocol, new state machine needs to be added. Please refer to `issuerMachine.ts` and `EsignetMosipVCItemMachine.ts`.

3. At present, Inji Wallet supports verification of VCs which has RSA proof type. If VC is issued with any other proof type, verification will fail and VC will not be downloaded. To bypass this VC verification, we need to use issuer id as "Sunbird".

> Refer https://github.com/mosip/mosip-config/blob/collab1/mimoto-issuers-config.json#L71 as reference. Here, credential_issuer should be "Sunbird" and then add all the configuration.

4. Token endpoint should also use same issuer id. Refer https://github.com/mosip/mosip-config/blob/collab1/mimoto-issuers-config.json#L143
   
5. Onboarding Mimoto as OIDC Client for a new Issuer:

* Mimoto OIDC client is now added as an optional partner, which can be onboarded through partner onboarder as per requirement.
* In [mosip-onboarding](https://github.com/mosip/mosip-onboarding) itself, there is a script by the name `create-signing-certs.sh` which creates the certificates as well as the `oidckeystore.p12`.
* Client ID is created randomly by using the PMS API, and there is no client Secret for that.
* Clients can be renewed upon request, however, this will require some manual adjustments. It is recommended to create a client only once per environment as they do not expire.
* Modifications were made to the `install.sh` script within the Mimoto software, along with adjustments to the helm charts in the Mimoto repository, in order to facilitate the storage and mounting of the `oidckeystore.p12` file.
* For Onboarding the new issuer, the same steps have to be followed and p12 has to be generated.
* Once the p12 file is generated, the existing keystore file should be exported from the Mimoto pod. The newly created p12 file must then be imported and remounted in the Mimoto POD.
