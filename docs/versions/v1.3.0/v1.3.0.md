# v 1.3.0

**Release Name**: v.1.3.0

**Upgrade From**: 1.2.0

**Release Date**: xxth March, 2024

## Overview

The 1.3.0 version of eSignet is the third release of eSignet. This release focuses on launching new features in authentication modes and support for Sign-up service:

1. **Password based Authentication**
   
   We are thrilled to share that eSignet has expanded its authentication capabilities with the introduction of password-based 
   authentication factor which is robust and reliable authentication factor secure with Captcha.

2. **Support for Sign-up service**

   Users now have the convenience of registering through our Sign-Up Service, seamlessly integrated with the ID repository 
   without complete deployment of MOSIP Identity. In isolation with the Sign-Up Service, efficiently 
   manages user registrations.
   
3. **Fixes for known VCI issues from v1.2.0**

## Features Included

Below are the features available in the release:

* Login with password
* [Sign-up service](https://docs.esignet.io/use-cases/sign-up-service)

## Repositories Released

| Repository Released                | Tags                                                                         |
| ---------------------------------- | ---------------------------------------------------------------------------- |
| keymanager                         | [1.2.0.1-B4](https://github.com/mosip/keymanager/tree/1.2.0.1-B4)           |
| id-authentication                  | [1.2.0.1-B6](https://github.com/mosip/id-authentication/tree/v1.2.0.1-B6)    |
| Artifactory-ref-impl               | [1.2.0.1-B8](https://github.com/mosip/artifactory-ref-impl/tree/v1.2.0.1-B8) |
| mosip-config                       | [1.3.0-ES](https://github.com/mosip/mosip-config/tree/v1.3.0-ES)             |
| esignet                            | [1.3.0](https://github.com/mosip/esignet/tree/v1.3.0)                        |
| esignet-mock-services              | [0.9.2](https://github.com/mosip/esignet-mock-services/tree/v0.9.2)          |
| id-repo                            | [1.2.0.1-B3](https://github.com/mosip/id-repository/tree/v1.2.0.1-B3)        |
| esignet-signup                     | [1.0.0](https://github.com/mosip/esignet-signup/tree/v1.0.0)                 |
| mosip-openid-bridge                | [1.2.0.1-B4](https://github.com/mosip/mosip-openid-bridge/tree/v1.2.0.1-B4)  |
| mosip-openid-bridge                | [1.2.0.1-B4-lite](https://github.com/mosip/mosip-openid-bridge/tree/v1.2.0.1-B4-lite)  |

For details on deployment, refer to the [helm charts](https://github.com/mosip/esignet/tree/v1.3.0/helm) in the eSignet repository.
