# ID Repository Credential Request Generator Service Developers' Guide

## Overview

[ID Repository](https://docs.mosip.io/1.2.0/modules/id-repository) contains the records of identity of an individual, and provides API based mechanism to store, retrieve and update identity details by other MOSIP modules. ID Repository is used by Registration Processor, ID Authentication and Resident Services

## Credential Request Generator Service
This service creates request for credential issuance.

<img src="_images/id-repository-credential-request-generator-service.png" width="750" height="100">

1. Key Manager encrypts/decrypts data.
2. Auth Adapter integrates with KeyCloak for authentication.

The documentation here will guide you through the prerequisites required for the developer' setup.


## Software setup

Below are a list of tools required in ID Repoistory Services:

1. JDK 11
2. Any IDE (like Eclipse, IntelliJ IDEA)
3. Apache Maven (zip folder)
4. pgAdmin
5. Postman
6. Git
7. Notepad++ (optional)
8. lombok.jar (file)
9. settings.xml (document)


Follow the steps below to set up ID Repository Services on your local system:

1. Download `lombok.jar` and `settings.xml` from [here](https://github.com/mosip/documentation/tree/1.2.0/docs/_files/resident-services-config-files).

2. Unzip Apache Maven and move the unzipped folder in ```C:\Program Files``` and `settings.xml` to "conf" folder `C:\Program Files\apache-maven-3.8.4\conf`.

3. Install Eclipse, open the `lombok.jar` file and wait for some time until it completes the scan for Eclipse IDE and then click `Install/Update`.

<img src="_images/lombok-configuration.png" width="750" height="450">

4. Check the Eclipse installation folder `C:\Users\userName\eclipse\jee-2021-12\eclipse` to see if the `lombok.jar` is added. By doing this, you don't have to add the dependency of `lombok` in your `pom.xml` file separately as it is auto-configured by Eclipse.

5. Configure the JDK (Standard VM) with your Eclipse by traversing through `Preferences → Java → Installed JREs`.

<img src="_images/installed-jre.png" width="750" height="450">
 
## Code setup

For the code setup, clone the repository and follow the guidelines mentioned in the [Code Contributions](https://docs.mosip.io/1.2.0/community/code-contributions).

### Importing and building of a project

1. Open the project folder where `pom.xml` is present.
1. Open command prompt from the same folder.
1. Run the command `mvn clean install -Dgpg.skip=true -DskipTests=true` to build the project and wait for the build to complete successfully.
1. After building of a project, open Eclipse and select `Import Projects → Maven → Existing Maven Projects → Next → Browse to project directory → Finish`.
1. After successful importing of project, update the project by right-click on `Project → Maven → Update Project`.

<img src="_images/import-project.png" width="750" height="450">

## Environment setup

1. For the environment setup, you need an external JAR that is available [here](https://oss.sonatype.org/#nexus-search;gav~~kernel-auth-adapter~1.2.0-SNAPSHOT~~) with different versions. (E.g.: You can download `kernel-auth-adapter.jar` and add to project `Libraries → Classpath → Add External JARs → Select Downloaded JAR → Add → Apply and Close`).

<img src="_images/add-external-library.png" width="750" height="450">

2. Clone [mosip-config repository](https://github.com/mosip/mosip-config).

3. Create an empty folder inside the `mosip-config` with `sandbox-local` name and then copy and paste all config files inside `sandbox-local` folder except `.gitignore, README and LICENSE`.

4. As Id Repository is using two properties files, `id-repository-default` and `application-default`, you will have to configure them according to your environment.    The same files are available [here](https://github.com/mosip/documentation/tree/1.2.0/docs/_files/resident-services-config-files) for reference.

5. To run the server, two files are required- [kernel-config-server.jar](https://oss.sonatype.org/#nexus-search;gav~~kernel-config-server~1.2.0-SNAPSHOT~~) and [config-server-start.bat](https://github.com/mosip/documentation/blob/1.2.0/docs/_files/resident-services-config-files/config-server-start.bat).

6. Put both the files in the same folder and change the location attribute to `sandbox-local` folder in `config-server-start.bat` file and also check the version of `kernel-config-server.jar` towards the end of the command. 

 Example:
 
  ```java -jar -Dspring.profiles.active=native  -Dspring.cloud.config.server.native.search-locations=file:C:\Users\myDell\mosipProject\mosip-config\sandbox-local -Dspring.cloud.config.server.accept-empty=true  -Dspring.cloud.config.server.git.force-pull=false -Dspring.cloud.config.server.git.cloneOnStart=false -Dspring.cloud.config.server.git.refreshRate=0 kernel-config-server-1.2.0-20201016.134941-57.jar```.

As mentioned in step 4, you may have to make some changes in the properties files.

For instance,

  * The value of `mosip.mosip.resident.client.secret` property need to be updated with the current password to be able to use a decrypted passcode and run it in your local machine. 
  * If you are running it on a server, then you have to use an encrypted passcode like this `mosip.mosip.resident.client.secret={cipher}1bdd7e59ca3a9dbe66b47db3ecb7025e66a6746911de2bd841c804f`.
  * Comment this out `auth.server.admin.issuer.internal.uri` in `application-default.properties` file because you already have this `auth.server.admin.issuer.uri` , and hence there is no need of `auth.server.admin.issuer.internal.uri`.
  * Check and Set value of `db.dbuser.password` in `application-default.properties`.
  * Set value of `mosip.kernel.xsdstorage-uri` in `application-default.properties` to `sandbox-local` folder location(For example: `mosip.kernel.xsdstorage-uri=file:///home/user/Desktop/tspl/mosip-config/sandbox-local/`).
  * Set value of `mosip.kernel.xsdstorage-uri` in `application-default.properties` to `sandbox-local` folder location(For example: `mosip.kernel.xsdstorage-uri=file:///home/user/Desktop/tspl/mosip-config/sandbox-local/`).
  * Check and set value for `mosip.credential.service.database.hostname` and `mosip.credential.service.database.port` in `id-repository-default.properties`.
  * Comment out all the lines containing `mosip.biometric.sdk.providers.finger`, `mosip.biometric.sdk.providers.face` and `mosip.biometric.sdk.providers.iris` in `id-repository-default.properties`.
  * Check and set value of `mosip.idrepo.db.url` and `mosip.idrepo.db.port` in `id-repository-default.properties` (For Example: `mosip.idrepo.db.url=dev.mosip.net` and `mosip.idrepo.db.port=30090`).
  * If you check the URLs present in these files, they are set to default with port no. 80 (or any other port number) but you need to use external URL to access it.

7. Run the server by opening the `config-server-start.bat` file.

<img src="_images/run-server.png" width="750" height="450">

The server should now be up and running. 

Below are the configurations to be done in Eclipse:

1. Open Eclipse and run the project for one time as `Java application`, so that it will create a Java application which you can see in debug configurations and then change its name. (e.g.: project name with environment - "Credential-request-generator-dev").

<img src="_images/create-env-in-eclipse.png" width="750" height="450">

2. Open the arguments and pass this `-Ddomain.url=dev.mosip.net -Dapplication.base.url=http://localhost:8090 -Dspring.profiles.active=default -Dspring.cloud.config.uri=http://localhost:51000/config -Dspring.cloud.config.label=master` in VM arguments. 

3. Here, the domain URL represents the environment on which you are working (eg., it can be ```dev2.mosip.net``` or ```qa3.mosip.net```).

<img src="_images/vm-arguments.png" width="750" height="450">

4. Click Apply and then debug it (starts running).

## Credential Request Generator Service API
​
* For API documentation, refer [here](https://docs.mosip.io/1.2.0/api).
​
* The APIs can be tested with the help of **Swagger-UI**. 
​
* Swagger is an interface description language for describing restful APIs expressed using JSON. You can access Swagger-UI of credential-request-generator-services for dev-environment from `https://localhost:8094/v1/credentialrequest/swagger-ui/index.html?configUrl=/v1/credentialrequest/v3/api-docs/swagger-config#/` and localhost from `https://localhost:8094/v1/credentialrequest/swagger-ui/index.html?configUrl=/v1/credentialrequest/v3/api-docs/swagger-config#/`.
