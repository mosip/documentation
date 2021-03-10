# Registration Client



Running your AV on the registration client machine is sufficient. Not required for integration with MOSIP.

**Server**

This is implemented as a part of _**Kernel ClamAV**_ project project. MOSIP uses this project to scan registration packets. You may integrate your anti-virus \(AV\) in the following ways:

* _Option 1_

  The registration packets are stored in Minio. Several AVs provide traffic flow analysis in line with the stream to defend against hazards. This form of implementation based on the network can be carried out without any alteration of the MOSIP code. But to ensure that network traffic passes through your AV, a careful network configuration is required.

* _Option 2_

  To support your AV at the code level, the following Java code has to be altered. In `VirusScannerImpl.java`, the `scanFile/scanFolder/scanDocument` API must be implemented with your AV SDK.

**BioSDK Integration**

In `reg client`, `reg proc`, and `ida`, the biosdk library is included. The guide offers steps for these integrations to be enabled here.

**Integration with IDA** 

It is expected that Biosdk will be available as an HTTP service for IDA. The ID Authentication module then calls this service. To build such a service, refer to the _reference implementation_. `/service` contains service code; while `/client` contains client code that is combined with the IDA that connects to the service. This service can be operated as a pod or hosted outside the cluster within the Kubernetes cluster.

It is important to compile the client code into biosdk.zip and copy it to Artifactory. It is currently available at the following address:`/artifactory/libs-release-local/biosdk/mock/0.9/biosdk.zip`. This zip is downloaded by IDA dockers and installed during docker startup.

**Integration with Reg Proc**

The above service works for `regproc` as well.

**Integration of External Postgres DB**

**Sandbox Parameters**

```text
    TBD
```

\*\*\*\*

Make sure the Postgres is configured as 'UTC' for the time zone. This configuration is set to `postgresql.conf` when you install Postgres.

**Integration with External Print Service**

_**Introduction**_

MOSIP provides a reference implementation of print service that interfaces with the MOSIP system.

**Integration Steps**

Ensure the Following: 

1.  Compliant libraries, is reqartifactoryervices to link to HSM. MOSIP services install the same thing before the services start. The HSM vendor must have this library. The 1. Websub runs as [`https://{sandbox`](https://{sandbox) `domain name}/websub` on MOSIP and is accessible externally via Nginx. Websub runs on DMZ and nginx in the sandbox as configured for this access 
2.  Your service is able to register a topic with Websub with a callback url  
3. The callback url is accessible from MOSIP websub 
4. The print policy was established \(be careful about enabled/disabled encryption\) 
5. Print partner created and certs uploaded **DB Timezone**6. The private and certificate of print partner is converted to p12 keystore format. You may use the following command:

```text
    $ $ openssl pkcs12 -export -inkey pvt_key.pem  -in cert.pem  -out key.p12
```

1. This _p12_ key and password is used in your print service
2. Your print service reads the relevant \(expected\) fields from received credentials
3. Your print service is able to update MOSIP data share service after successfully reading the credentials.

