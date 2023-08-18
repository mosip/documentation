# Version 1.1.0

**Release Name**: e-Signet

**Upgrade From**: 1.0.0

**Release Date**: August 2023

## Overview

The 1.1.0 version of e-Signet is the third release which mainly focuses on the **Consent Registry** feature.

Consent Registry is a module that is designed to store user consent on claims and scopes requested during login into e-Signet using either `oidc-ui` or the Wallet application ([Inji](https://docs.mosip.io/inji/)). 

Key highlights of this feature are:
* Storage of user consent against the requested claims and scopes in the database.
* If the consent is already provided, it will bypass the consent screen when the user logs in using e-Signet(v1.1.0).
* Recapture consent in case of changes in requested claims or scopes.

## Features Included

Below are the features available in the release,

* Login with OTP
* Login with biometrics
* Wallet based authentication
* Multi-language support
* Captcha validation
* Consent

## Documentation

* [Feature Documentation](architecture/features.md)
* [Integration Guides](integration-guides/)
* [End User Guide](esignet-end-user-guide.md)
* [QA Report](test-report-1.1.0.md)
