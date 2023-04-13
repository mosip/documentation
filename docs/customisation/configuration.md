# Configuration

The configurable properties for Inji can be found at [inji-default.properties](https://github.com/mosip/mosip-config/blob/qa-1201-B2/inji-default.properties). This property file is maintained as one for each deployment environment. On [this](https://github.com/mosip/mosip-config) repository, each environment configuration is placed in a corresponding branch specific to that environment.

> Refer to [inji-default.properties](https://github.com/mosip/mosip-config/blob/collab/inji-default.properties) of Collab environment.

These values will be used by Inji via Mimoto. Mimoto loads all the configurations and exposes an API which is used by the Inji application to fetch and store the configurations in the local storage.

API used to fetch these configurations: `https://api.mosip.io/residentmobileapp/allProperties`

The implementers can choose to use the existing configurations or add new configurations to them.

The properties used by Inji are:

* `mosip.inji.faceSdkModelUrl(https://${mosip.api.public.host}/inji)`: This is the path of the file server from where the face SDK model can be downloaded.
* `mosip.inji.modelDownloadMaxRetry(10)`: The maximum times the application will try to fetch the model.
* `mosip.inji.vcDownloadMaxRetry(10)`: The maximum times the application will try to download the requested VC.
* `mosip.inji.vcDownloadPoolInterval(6000)`: The waiting interval between each retry.
* `mosip.inji.audience(ida-binding)`: This is used to generate the JWT token which will be passed during online login.
* `mosip.inji.issuer(residentapp)`: This is used to generate the JWT token which will be passed during online login.
