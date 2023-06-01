# How to make CTK publicly available

## Prerequisite

Ensure that all the deployment steps are followed as mentioned in the README.md files of the below repositories:

1. [mosip-compliance-toolkit](https://github.com/mosip/mosip-compliance-toolkit)
2. [mosip/mosip-compliance-toolki-ui](https://github.com/mosip/mosip-compliance-toolkit-ui)


### Instructions to be followed in your deployment environment

#### DNS Mapping changes

`onboarder.sandbox.mosip.net ----> public ip of nginx server`

`sandbox.mosip.net ----> public ip of nginx server`

`pmp.sandbox.mosip.net ----> public ip of nginx server`

`iam.sandbox.mosip.net ----> public ip of nginx server`

#### Nginx Server changes

Add the below mentioned domains in `server_name` section of pubic nginx server.

1. sandbox.mosip.net

2. api.sandbox.mosip.net

3. compliance.sandbox.mosip.net

4. pmp.sandbox.mosip.net

*Note*: Replace “sandbox”  appropriately.

#### Istio changes

1. Update the gateways for below mentioned modules to point to public:

* pmp
* compliance
* iam
* landing

2. Update the following virtual service to point to public ip:

* partnermanager
* policymanager
* toolkit-service

3. Update Istio gateway in compliance toolkit envoyFilter compliance-toolkit-set-cookie-header to public gateway.

```
  workloadSelector:
    labels:
      istio: ingressgateway
```
      
### Config map changes for UI part

* Update `compliance-toolkit-ui.json to point` to `api.sandbox.mosip.net` instead of `api-internal.sandbox.mosip.net`.

* Update `pmp config.json` to point to `api.sandbox.mosip.net` instead of `api-internal.sandbox.mosip.net`.

### Configuration changes for pmp UI and compliance UI

* [[MOSIP-25173] · mosip/mosip-config@3282666](https://github.com/mosip/mosip-config/commit/3282666bd7d8ffb855ee15d474a7b7033563f8b4)

* [[MOSIP-25173] · mosip/mosip-config@3282666](https://github.com/mosip/mosip-config/commit/3282666bd7d8ffb855ee15d474a7b7033563f8b4)

* [[MOSIP-25173] updated to enable compliance over public channel · mosip/mosip-config@af284e4](https://github.com/mosip/mosip-config/commit/af284e4905374d44afa4f376507f9f078cec6396)

* [[MOSIP-25173] · mosip/mosip-config@fee9071](https://github.com/mosip/mosip-config/commit/fee9071d28a17d18445495f2c55d7a328f8a560d)

* [[MOSIP-25173] · mosip/mosip-config@962b89f](https://github.com/mosip/mosip-config/commit/962b89fa38b0232413b07fa7ece10407e67c194f)

 
