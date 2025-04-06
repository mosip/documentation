# Configuration

## Configuration for Inji Wallet

The configurable properties for Inji Wallet can be found at [inji-default.properties](https://github.com/mosip/inji-config/blob/master/inji-default.properties). This property file is maintained as one for each deployment environment. On [this](https://github.com/mosip/inji-config) repository, each environment configuration is placed in a corresponding branch specific to that environment.

> Refer to [inji-default.properties](https://github.com/mosip/inji-config/blob/collab/inji-default.properties) of Collab environment.

These values will be used by Inji Wallet via Mimoto. Mimoto loads all the configurations and exposes an API which is used by the Inji Wallet application to fetch and store the configurations in the local storage.

API used to fetch these configurations: `https://api.collab.mosip.net/v1/mimoto/allProperties`

The implementers can choose to use the existing configurations or add new configurations to them.

The properties used by Inji Wallet are:

* `mosip.inji.faceSdkModelUrl(https://${mosip.api.public.host}/inji)`: This is the path of the file server from where the face SDK model can be downloaded.
* `mosip.inji.modelDownloadMaxRetry(10)`: The maximum times the application will try to fetch the model.
* `mosip.inji.audience(ida-binding)`: This is used to generate the JWT token which will be passed during online login.
* `mosip.inji.issuer(residentapp)`: This is used to generate the JWT token which will be passed during online login.
* `mosip.inji.warningDomainName(https://${mosip.api.public.host})`: This is the mimoto domain used to access all Apis.
* `mosip.inji.aboutInjiUrl(https://docs.inji.io/inji-wallet/inji-mobile)`: This is the url for Inji Wallet Mobile documentation used in About Inji Wallet page.
* `mosip.inji.minStorageRequiredForAuditEntry(2)`: This is threshold(minimum storage space required) in MB for storing audit entries.
* `mosip.inji.minStorageRequired(2)`: This is threshold(minimum storage space required) in MB for storing downloaded / received vc.
