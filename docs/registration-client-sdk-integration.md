
# Usage of SDK in registration client

1. Local dedupe check between operators and operator-resident biometrics.
2. Local operator biometric authentications.
3. Extraction of biometric template from operator's raw biometrics to store in  local derby DB.
4. To get quality score for the SBI captured biometrics.


# SDK Configurations

`version : 1.1.5.*`

mosip.biometric.sdk.provider.finger.classname=io.mosip.mock.sdk.impl.SampleSDK
mosip.biometric.sdk.provider.finger.version=0.9
mosip.biometric.sdk.provider.finger.args=
mosip.biometric.sdk.provider.iris.classname=io.mosip.mock.sdk.impl.SampleSDK
mosip.biometric.sdk.provider.iris.version=0.9
mosip.biometric.sdk.provider.iris.args=
mosip.biometric.sdk.provider.face.classname=io.mosip.mock.sdk.impl.SampleSDK
mosip.biometric.sdk.provider.face.version=0.9
mosip.biometric.sdk.provider.face.args=


`version: 1.2.0 and above` supports multiple vendor SDK configurations.

mosip.biometric.sdk.providers.finger.mockvendor.classname=io.mosip.mock.sdk.impl.SampleSDK
mosip.biometric.sdk.providers.finger.mockvendor.version=0.9
mosip.biometric.sdk.providers.finger.mockvendor.args=
mosip.biometric.sdk.providers.finger.mockvendor.threshold=60
mosip.biometric.sdk.providers.iris.mockvendor.classname=io.mosip.mock.sdk.impl.SampleSDK
mosip.biometric.sdk.providers.iris.mockvendor.version=0.9
mosip.biometric.sdk.providers.iris.mockvendor.args=
mosip.biometric.sdk.providers.iris.mockvendor.threshold=60
mosip.biometric.sdk.providers.face.mockvendor.classname=io.mosip.mock.sdk.impl.SampleSDK
mosip.biometric.sdk.providers.face.mockvendor.version=0.9
mosip.biometric.sdk.providers.face.mockvendor.args=
mosip.biometric.sdk.providers.face.mockvendor.threshold=60


| Property Name | Description |
|---------------|-------------|
| classname     | SDK implementation class for finger modality |
| version     | SDK API version |
| args     | comma separated SDK implementation class consturctor args |
| threshold     | Quality threshold used by SDK to match modality |
| any string     | SDK initialization args. mosip.biometric.sdk.provider.finger.key1=value1 / mosip.biometric.sdk.providers.face.mockvendor.key1=value1 is also supported, this will be passed as initparams. |





# SDK jars and library integrations

* Registraton client bundle downloader is a docker image built using below scirpts 

```
registration/Dockerfile
```
```
registration/configure.sh
```


![image](https://user-images.githubusercontent.com/22977936/157278650-c4bc0d0e-83ac-4282-b6c1-c96581e50bbe.png)

* All the SDK related libararies and binaries should be zipped. 
* The URL to download this ZIP should be set in `reg_client_sdk_url_env` docker container.
* All the files in the downloaded zip will be added into registration client `lib` directory.
* As its part of `lib` directory, this will be available as part of registration client upgrade.



# Locating the loaded SDK in registration client logs

* On startup of registrtation client, based on the configured classname client creates an new instance of the same class.
* Created instances are cached in the factory class.
* If the cache is empty, registration client startup fails with `SDK registry emtpy` error.
* If the cache was successfully loaded for the configured modalities below log line is seen in registration.log

```
2022-03-03 09:35:37,556 INFO [JavaFX-Launcher] i.m.k.b.p.f.BioAPIFactory : Starting initialization for vendor mockvendor with params >> {FACE={args=, threshold=60, classname=io.mosip.mock.sdk.impl.SampleSDK, version=0.9}, FINGER={threshold=60, classname=io.mosip.mock.sdk.impl.SampleSDK, version=0.9, args=}, IRIS={version=0.9, threshold=60, args=, classname=io.mosip.mock.sdk.impl.SampleSDK}}
2022-03-03 09:35:37,607 INFO [JavaFX-Launcher] i.m.k.b.p.i.BioProviderImpl_V_0_9 : Successfully registered SDK : sample, BiometricFunction: EXTRACT
2022-03-03 09:35:37,607 INFO [JavaFX-Launcher] i.m.k.b.p.i.BioProviderImpl_V_0_9 : Successfully registered SDK : sample, BiometricFunction: QUALITY_CHECK
2022-03-03 09:35:37,607 INFO [JavaFX-Launcher] i.m.k.b.p.i.BioProviderImpl_V_0_9 : Successfully registered SDK : sample, BiometricFunction: MATCH
2022-03-03 09:35:37,608 INFO [JavaFX-Launcher] i.m.k.b.p.i.BioProviderImpl_V_0_9 : Successfully registered SDK : sample, BiometricFunction: EXTRACT
2022-03-03 09:35:37,608 INFO [JavaFX-Launcher] i.m.k.b.p.i.BioProviderImpl_V_0_9 : Successfully registered SDK : sample, BiometricFunction: QUALITY_CHECK
2022-03-03 09:35:37,608 INFO [JavaFX-Launcher] i.m.k.b.p.i.BioProviderImpl_V_0_9 : Successfully registered SDK : sample, BiometricFunction: MATCH
2022-03-03 09:35:37,608 INFO [JavaFX-Launcher] i.m.k.b.p.i.BioProviderImpl_V_0_9 : Successfully registered SDK : sample, BiometricFunction: EXTRACT
2022-03-03 09:35:37,608 INFO [JavaFX-Launcher] i.m.k.b.p.i.BioProviderImpl_V_0_9 : Successfully registered SDK : sample, BiometricFunction: QUALITY_CHECK
2022-03-03 09:35:37,608 INFO [JavaFX-Launcher] i.m.k.b.p.i.BioProviderImpl_V_0_9 : Successfully registered SDK : sample, BiometricFunction: MATCH

```

