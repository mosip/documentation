# Configuration

## Configuration for Inji Mobile

The configurable properties for Inji Mobile can be found at [inji-default.properties](https://github.com/mosip/mosip-config/blob/qa-inji/inji-default.properties). This property file is maintained as one for each deployment environment. On [this](https://github.com/mosip/mosip-config) repository, each environment configuration is placed in a corresponding branch specific to that environment.

> Refer to [inji-default.properties](https://github.com/mosip/mosip-config/blob/collab/inji-default.properties) of Collab environment.

These values will be used by Inji Mobile via Mimoto. Mimoto loads all the configurations and exposes an API which is used by the Inji Mobile application to fetch and store the configurations in the local storage.

API used to fetch these configurations: `https://api.mosip.io/v1/mimoto/residentmobileapp/allProperties`

The implementers can choose to use the existing configurations or add new configurations to them.

The properties used by Inji Mobile are:

* `mosip.inji.faceSdkModelUrl(https://${mosip.api.public.host}/inji)`: This is the path of the file server from where the face SDK model can be downloaded.
* `mosip.inji.modelDownloadMaxRetry(10)`: The maximum times the application will try to fetch the model.
* `mosip.inji.vcDownloadMaxRetry(10)`: The maximum times the application will try to download the requested VC.
* `mosip.inji.vcDownloadPoolInterval(6000)`: The waiting interval between each retry.
* `mosip.inji.audience(ida-binding)`: This is used to generate the JWT token which will be passed during online login.
* `mosip.inji.issuer(residentapp)`: This is used to generate the JWT token which will be passed during online login.
* `mosip.inji.warningDomainName(https://${mosip.api.public.host})`: This is the domain used to access all Apis.
* `mosip.inji.aboutInjiUrl(https://docs.mosip.io/inji)`: This is the url for Inji Mobile documentation used in About Inji Wallet page.
* `mosip.inji.minStorageRequiredForAuditEntry(1)`: This is threshold(minimum storage space required) in MB for storing audit entries.
* `mosip.inji.minStorageRequired(5)`: This is threshold(minimum storage space required) in MB for storing downloaded / received vc.
