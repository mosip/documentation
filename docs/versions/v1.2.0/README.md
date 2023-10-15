# v1.2.0

**Release Name**: e-Signet

**Upgrade From**: 1.0.0

**Release Date**: 22nd September 2023

## Overview

The 1.1.0 version of e-Signet is the third release of e-Signet which mainly focuses on the **Consent Registry** feature.

Consent Registry is designed to store user consent on claims and scopes requested during login into a relying party application using e-Signet or the Wallet application ([Inji](https://docs.mosip.io/inji/)).

Key highlights of this feature are:

* Storage of user consent against the requested claims and scopes in the database.
* If the consent is already provided, the consent screen is bypassed when the user logs in using e-Signet (v1.1.0).
* Recapture consent in case of changes in requested claims or scopes.

_Note_ : Consent management is not applicable in this release as it solely focuses on the storage of user consent. The functionalities of editing, revoking, updating, or viewing the consent after it has been given by the user are considered beyond the scope of this release.

## Features Included

Below are the features available in the release,

* Login with OTP
* Login with biometrics
* Wallet based authentication
* Multi-language support
* Captcha validation
* Consent storage

## Repositories Released

* e-Signet: [v1.1.0](https://github.com/mosip/esignet/tree/v1.1.0)
* artifactory-ref-impl: [v1.2.0.1-B5](https://github.com/mosip/artifactory-ref-impl/tree/v1.2.0.1-B5)
* mosip-config: [v1.1.0-ES](https://github.com/mosip/mosip-config/releases/tag/v1.1.0-ES)

For details for deployment go through the [helm charts in e-Signet repository](https://github.com/mosip/esignet/tree/v1.1.0/helm).

## Documentation

* [Feature Documentation](../../overview/features/)
* [Integration Guides](../../integration-guides/)
* [End User Guide](../../end-user-guide/)
* [QA Report](test-report/)
