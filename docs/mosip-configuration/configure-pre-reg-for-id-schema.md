# Configure Pre-Reg for ID Schema

The sandbox comes with its default ID Schema \(in Master DB, `identity_schema` table\) and Pre-Reg UI Schema pre-registration-`demographic.json`. In order to use different schemas, do the following:

1. Ensure new ID Schema is updated in Master DB, _`identity_schema`_ `table`
2. Replace _`mosip-config/sandbox/pre-registration`-`demographic.json`_ with new Pre-Reg UI Schema
3. Map values in `pre-registration-identity-mapping.json` to `pre-registration-demographic.json` as below:

   ```text
         {
     "identity": {
         "name": {
             "value":< id of name field in your demograhic json >
             "isMandatory" : true
         },\
         "proofOfAddress": {
             "value" : < id of proof of address field in your demographic json>
         },
         "postalCode": {
              "value" : <  id of postal code field in your demographic json>
         }
     }
     }
   ```

4. Update the following properties in pre-registration-`mz.properties preregistartion.identity.name=< identity.name.value (above)>          preregistration.notification.nameFormat=< identity.name.value>`
5. Restart the Pre-Reg Application service

### Registration Client with Mock MDS and Mock SDK

**Download Reg Client:**

* Download zip file from:

  ```text
  https://{sandbox domain name}/registration-client/1.1.3/reg-client.zip
  ```

* Unzip the file and launch registered client by running _`run.bat`_
* Reg client will generate public/private keys in the following folder

  ```text
    c:\Users\<user name>\.mosipkeys
  ```

* You will need the public key and key index mentioned in _`readme.txt`_ for the later step to update master DB

**Run MDS:**

* Run mock MDS as per procedure give here: Mock MDS
* Pickup device details from this repo. You will need them for device info updates in the later step

**Add Users in Keycloak:**

* Make sure keycloak admin credentials are updated in **`config.py`**
* Add users like registration officers and supervisors in **`csv/keycloak_users.csv`** with their roles
* Run

  ```text
        **$ ./keycloak_users.py**
  ```

  **Update Master Data:**

* In the master DB DML directory, change the following CSVs. The DMLs are located in the `sandbox at /home/mosipuser/mosip-infra/deployment/sandbox-v2/tmp/commons/db-scripts/mosip-master/dml`
  * master-device\_type.csv
  * master-device\_spec.csv
  * master-device\_master.csv
  * master-device\_master\_h.csv
  * master-machine\_master.csv
  * master-machine\_master\_h.csv
  * master-user\_detail.csv
  * master-user\_detail\_h.csv
  * master-zone\_user.csv
  * master-zone\_user\_h.csv
* Run 

  ```text
  *update_masterdb.sh
  ```

  Example:

  ```text
        $ ./update_masterdb.sh /home/mosipuser/mosip-infra/deployment/sandbox-v2/tmp/commons/db_scripts/mosip_master
  ```

* _**CAUTION**_ : The above will reset entire DB and load it fresh
* You may want to maintain the DML directory separately in your repo
* It is assumed that all other tables of master DB are already updated

Device Provider Partner Registration:

* Update the following CSVs in PMS DML directory. On sandbox the DMLs are located at `/home/mosipuser/mosip-infra/deployment/sandbox-v2/tmp/partner-management-services/db_scripts/mosip_pms/dml`
  * pms-partner.csv
  * pms-partner\_h.csv
  * pms-policy\_group.csv
* Run _`update_pmsdb.sh`_. Example:

  ```text
    $ ./update_regdevicedb.sh /home/mosipuser/mosip-infra/deployment/sandbox-v2/tmp/commons/db_scripts/mosip_regdevice
  ```

* _**CAUTION\***_: The above will reset entire DB and load it fresh
* Some example CSVs are located at `csv/regdevice`

**IDA Check:**

Disable IDA check in registration-`mz.properties`:

```text
mosip.registration.onboarduser_ida_auth=N
```

**Launch Reg Client:**

1. Set Environment Variable `mosip.hostname` to {sandbox domain name}
2. Login as a user \(e.g. 110011\) with password \(MOSIP\) to login into the client

**Integrations**

_**Guide to Work with Real HSM**_

**Introduction:**

The default sandbox uses simulator of HSM called SoftHSM. To connect to a real HSM you need to do the following:

1. Create `client.zip`
2. Update MOSIP properties
3. Point MOSIP services to HSM

**client.zip:**

The HSM connects over the network. _`Client.zip`_, which is a package of self-dependent **PKCS11**_`client.zip`_ file is extracted from the artifactory when Dockers launch, unzipped, and install.sh is executed.

The zip must fulfil the following:

* Contain an `install.sh`
* Available in the artifactory

**`install.sh`**

This script must fulfil the following:

* Have executable permission
* Set up all that is needed to connect to HSM
* Able to run inside Dockers that are based on Debian, inherited from OpenJDK Dockers
* Place HSM client configuration file in `mosip.kernel.keymanager.softhsm.config-path` \(see below\)
* Not set any environment variables. If needed, they should be passed while running the MOSIP service Dockers

**Properties:**

Update the following properties in Kernel and IDA property files:

```text
mosip.kernel.keymanager.softhsm.config-path=/config/softhsm-application.conf
mosip.kernel.keymanager.softhsm.keystore-pass={cipher}<ciphered password>
mosip.kernel.keymanager.softhsm.certificate.common-name=www.mosip.io
mosip.kernel.keymanager.softhsm.certificate.organizational-unit=MOSIP
mosip.kernel.keymanager.softhsm.certificate.organization=IITB
mosip.kernel.keymanager.softhsm.certificate.country=IN
```

Ensure you restart the services after this change.

**Caution:** The password is highly critical. To encrypt it, make sure you use a really strong password \(using Config Server encryption\). In addition, Config Server access should be very tightly regulated.

**Artifactory:**

Artifactory is built as a Docker in the sandbox and accessed via services. In that Docker, replace the _`client.zip`_. The changed Docker can be uploaded to your own Docker Hub registry for subsequent use.

**HSM URL**

HSM is used by Kernel and IDA services. Point the TCP URL of these services to new HSM host and port:

```text
hsmUrl: tcp://{hsm host}:{port}
```

The above parameter is available in the Helm Chart of respective service.

**Integrating Antivirus Scanner**

In MOSIP, virus scanners can be implemented at different levels. ClamAV is used as an antivirus scanner by default. If you want your anti-virus \(AV\) to be incorporated, the same can be achieved as follows:

**Registration Client**

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
3. Your print service is able to update MOSIP data share service after successfully reading the credentials

