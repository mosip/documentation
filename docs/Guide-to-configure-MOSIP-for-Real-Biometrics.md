### MOSIP Configurability for Real Biometrics
With Real Biometrics Release (RBR), MOSIP can be configured to work with multiple biometric modalities (viz. Fingerprint, Iris and Face). Below are configurations to enable biometrics in MOSIP.

#### 1. Registration Client -   
- **Enable Biometric Operator Auth** - Processes in which Operator can do biometric authentication can be enabled in `is_active` column in `mosip_master.app_authentication_method` table. List of process_ids for which biometric authentication can be enabled are -      
a. packet_auth
b. login_auth
c. exception_auth
d. eod_auth
e. onboard_auth     
Currently, username password based authentication is enabled.
- **Enable Local de-duplication** - Below properties should be enabled for local de-duplication. These properties are present in config file [registration-env.properties](https://github.com/mosip/mosip-config-mt/blob/master/config-templates/registration-env.properties)     
````
mosip.registration.mds.fingerprint.dedup.enable.flag=Y    
mosip.registration.mds.iris.dedup.enable.flag=Y    
mosip.registration.mds.face.dedup.enable.flag=Y    
````
- **Adding SDK in classpath** - Biometric Windows SDK (jar file) should be placed in `lib` folder after extracting Registration-Client zip file, and then execute `run.bat` file     
- **Enable MDS** - Below property should updated to enable MDS integration. This property is present in [registration-env.properties](https://github.com/mosip/mosip-config-mt/blob/master/config-templates/registration-env.properties) file     
`mosip.mdm.enabled=Y`     
- **Register Biometric Devices for Registration**     
   a. `Register Device Provider` - Device Provider can be registered with MOSIP using [Register Device Provider API](https://github.com/mosip/mosip-docs/wiki/Device-Management#post-deviceprovider)    
   b. `Register MDS` - MDS can be registered with MOSIP using [Register MDS API](https://github.com/mosip/mosip-docs/wiki/Device-Management#post-mds)     
   c. `Whitelist Device` - Biometric Devices can be white-listed using below steps -      
   i. Add Device Specification (like model, make, etc.) using [Device Specification API](https://github.com/mosip/mosip-docs/wiki/Device-APIs#post-devicespecifications)
   ii. Map Biometric Devices to Device Specifications using [Device API](https://github.com/mosip/mosip-docs/wiki/Device-APIs#post-devices)
   iii. Map White-listed Device to a Center ID to which Registration Client is tagged using [Registration Centre Device API](https://github.com/mosip/mosip-docs/wiki/Registration-Center-APIs#post-registrationcenterdevice)     
   d. `Register Device` - Biometric device can be registered using MOSIP using [Register Device API](https://github.com/mosip/mosip-docs/wiki/Device-Management#post-registereddevices)   
   

#### 2. Registration Processor    
- **Configure ABIS queue** - ABIS queue can be configured in [RegistrationProcessorAbis-env.json](https://github.com/mosip/mosip-config/blob/master/config-templates/RegistrationProcessorAbis-env.json) file. registration-processor-abis-middleware-stage communicates to ABIS through queue configured. It sends request to inbound queue address and receives response from outbound queue address. If there are multiple ABIS, then it can be added in same file.

#### 3. ID Authentication
- **Add SDK in classpath** - Below properties should be set in id-authentication-{env}.properties. The classes configured below will be loaded in classpath during application initialization.

````
ida.fingerprint.provider=<fully qualified classname of Biometric SDK>
ida.face.provider=<fully qualified classname of Biometric SDK>  
ida.iris.provider=<fully qualified classname of Biometric SDK>
ida.composite.biometric.provider=<fully qualified classname of Biometric SDK>
````   
- **Register Biometric Devices for Authentication**   
   a. `Register Device Provider` - Device Provider can be registered with MOSIP using [Register Device Provider API](https://github.com/mosip/mosip-docs/wiki/Device-Management#post-deviceprovider)    
   b. `Register MDS` - MDS can be registered with MOSIP using [Register MDS API](https://github.com/mosip/mosip-docs/wiki/Device-Management#post-mds)   
   c. `Register Device` - Biometric device can be registered using MOSIP using [Register Device API](https://github.com/mosip/mosip-docs/wiki/Device-Management#post-registereddevices)     
   d. Please update the code of the registered device to the serial number of the device in register_device_master
and register_device_master_h table.
- **Encrypt biometric data from MDS** - In order to capture encrypted biometrics from MDS, MDS should use Mosip Public Key. This key should be generated in MOSIP with `IDA-FIR` as reference-ID for Parter-based Individual Authentication and  'INTERNAL' as reference-ID for Internal Authentication.