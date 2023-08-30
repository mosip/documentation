# Resident Services Developers Guide

## Overview

[Resident Services](https://docs.mosip.io/1.2.0/modules/resident-services) are the self-services which are used by the residents themselves via a portal. Resident Portal is a web based UI application that provides residents of a country the services related to their Unique Identification Number (UIN).

The documentation here will guide you through the pre-requisites required for the developer' setup.

## Software setup

Below are a list of tools required in Resident Services:

1. JDK 11
2. Any IDE (like Eclipse, IntelliJ IDEA)
3. Apache Maven (zip folder)
4. pgAdmin
5. Postman
6. Git
7. Notepad++ (optional)
8. lombok.jar (file)
9. settings.xml (document)

Follow the steps below to set up Resident Services on your local system:

1. Download `lombok.jar` and `settings.xml` from [here](https://github.com/mosip/documentation/tree/1.2.0/docs/\_files/resident-services-config-files).
2. Install Apache Maven.
3. Copy the `settings.xml` to ".m2" folder `C:\Users\<username>\.m2`.
4. Install Eclipse.
5. Open the `lombok.jar` file and wait for some time until it completes the scan for Eclipse IDE and then click `Install/Update`. Specify the eclipse installation location if required by clicking the ‘Specify location…’ button. Then, click `Install/Update` button to proceed.

![](\_images/lombok-configuration.png)

6. Check the Eclipse installation folder `C:\Users\userName\eclipse\jee-2021-12\eclipse` to see if the `lombok.jar` is added. By doing this, you will not have to add the dependency of `lombok` in your `pom.xml` file separately as it is auto-configured by Eclipse.
2. Configure the JDK (Standard VM) with your Eclipse by traversing through `Preferences → Java → Installed JREs`.

![](\_images/installed-jre.png)

## Code setup

For the code setup, clone the repository and follow the guidelines mentioned in the [Code Contributions](https://docs.mosip.io/1.2.0/community/code-contributions).

### Importing and building of a project

1. Open the project folder where `pom.xml` is present.
2. Open command prompt from the same folder.
3. Run the command `mvn clean install -Dgpg.skip=true -DskipTests=true` to build the project and wait for the build to complete successfully.
4. After building of a project, open Eclipse and select `Import Projects → Maven → Existing Maven Projects → Next → Browse to project directory → Finish`.

![](\_images/import-project.png)

5. After successful importing of project, update the project by right-click on `Project → Maven → Update Project`.

## Environment setup

1. For the environment setup, you need an external JAR that is available [here](https://oss.sonatype.org/#nexus-search;gav\~\~kernel-auth-adapter\~1.2.0-SNAPSHOT\~\~) with different versions.
   Download below mentioned JARs with appropriate latest/appropriate versions. You will need to input appropriate artifact id and version and other inputs.
   
    a. `icu4j.jar`
   
    b. `kernel-auth-adapter.jar`
   
    c. `kernel-ref-idobjectvalidator.jar`
   
    d. `kernel-transliteration-icu4j.jar`
   
   For e.g.: You can download `kernel-auth-adapter.jar` and add to project `Libraries → Classpath → Add External JARs → Select Downloaded JAR → Add → Apply and Close`).

``![](\_images/add-external-library.png)

2. Clone [mosip-config repository](https://github.com/mosip/mosip-config).
   
   a. As Resident Services is using two properties files- `resident-default.properties` and `application-default.properties`. But for local running of the application, you need to provide additional/overriding properties such as secrets, passwords and properties passed by the environment which can be added in new files `application-dev-default.properties` (common properties for all modules) and `resident-dev-default.properties` (Resident service specific properties).
   b.  You will have to create both the property files according to your environment and put them in `mosip-config folder` (cloned). The same files are available below for reference.

   These two files are loaded by application by specifying the application names in the Application VM arguments like- `Dspring.cloud.config.name=application,resident,application-dev`, `resident-dev`  (also detailed in later section).
   
3. To run the server, two files are required- `kernel-config-server.jar` and `config-server-start.bat`.

4. Put both the files in the same folder and point the property- `Dspring.cloud.config.server.native.search-locations` to `mosip-config` folder in `config-server-start.bat` file and also check the version of `kernel-config-server.jar` towards the end of the command.
   
Example:

```
java -jar -Dspring.profiles.active=native  -
Dspring.cloud.config.server.native.search-
locations=file:C:\Users\myDell\mosipProject\mosip-config -
Dspring.cloud.config.server.accept-empty=true  -
Dspring.cloud.config.server.git.force-pull=false -
Dspring.cloud.config.server.git.cloneOnStart=false -
Dspring.cloud.config.server.git.refreshRate=0 kernel-config-server-1.2.0-20201016.134941-57.jar
```

* As mentioned in step 2, you will have to create property files according to your environment like `resident-env-default` and `application-env-default` (here env represents environment name). Both files will contain different configurations such as `resident-env-default` will have config properties (e.g., secrets, passcodes, etc) used for resident-services module only and `application-env-default` is used for environment specific changes and can be used for other modules as well. 

* In this example, currently, these two files are created for dev environment and hence the files have suffix of `-dev`. If you want to run it for a different environment such as qa, create these two files with `-qa` suffix and then you will also need to provide the appropriate VM argument for that referring to qa environment.

For instance,

* Add `mosip.resident.client.secret=pqrst768465` property to be able to use a decrypted passcode and run it in your local machine.

* If you check the URLs present in `application-default` file, they are set to module specific URLs, but you need to use internal/external environment URLs to access the APIs by using application-dev-default file.

* In `application-dev-default` file, assign environment domain URL to `mosipbox.public.url` and change all other URLs with ${mosipbox.public.url}.

* It results in `mosipbox.public.url=internal/externalAPI` (e.g., mosipbox.public.url=https://api-internal.dev.mosip.net) and it will connect with the Development environment.

1. Run the server by opening the config-server-start.bat file.

   ![](\_images/resident-dev-img1.png)


2. Open the Arguments tab and specify Application VM arguments: For example, for dev environment:
   
    -Dspring.profiles.active=default -
     Dspring.cloud.config.uri=http://localhost:51000/config -
     Dspring.cloud.config.label=master -Dsubdomain=dev -
     Dspring.cloud.config.name=application,resident,application-dev,resident-dev --illegal-access=permit.

   Save this run configuration as ‘Resident-dev’ .
   
For `qa` environment, you can create `Resident-qa` run configuration with VM argument as below. 
Example:

-Dspring.profiles.active=default -
Dspring.cloud.config.uri=http://localhost:51000/config -
Dspring.cloud.config.label=master -Dsubdomain=qa -
Dspring.cloud.config.name=application,resident,application-qa,resident-qa --illegal-access=permit

<<imggg>>>

3. Click Apply and then debug it (starts running). In the console, you can see a message like `Started ResidentBootApplication in 34.078 seconds (JVM running for 38.361)`.


### Resident services API

* For API documentation, refer [here](https://mosip.github.io/documentation/1.2.0/1.2.0.html).

* The APIs can be tested with the help of Postman or Swagger-UI.

* Postman is an API platform for building and using APIs. Postman simplifies each step of the API lifecycle and streamlines collaboration so you can create better APIs—faster. It is widely used tool for API testing. Below you will find the APIs postman collection of resident-services.

* Swagger is an interface description language for describing restful APIs expressed using JSON. You can access Swagger-UI of resident-services for dev-environment from `https://api-internal.dev.mosip.net/resident/v1/swagger-ui.html` and localhost from `http://localhost:8099/resident/v1/swagger-ui.html`.

* Download the JSON collection available below and import in your postman.
Resident-Service-APIs.postman_collection-latest.json    << check with Ritik>>


<<img>>

* Create an environment as shown in the image below.

This environment is created for dev. Give the variable name as `url` and set both the values as `https://api-internal.dev.mosip.net`.

<<img>

* In the similar way, create another environment as shown below.

This environment is created for localhost. Give the variable name as `url` and set both the values as `http://localhost:8099`.

<<img>>










-------------------------------------------------------------------------------------------------------------------

7. As Resident Services is using two properties files, `resident-default` and `application-default`, you will have to configure them according to your environment. The same files are available [here](https://github.com/mosip/documentation/tree/1.2.0/docs/\_files/resident-services-config-files) for reference.
8. To run the server, two files are required- [kernel-config-server.jar](https://oss.sonatype.org/#nexus-search;gav\~\~kernel-config-server\~1.2.0-SNAPSHOT\~\~) and [config-server-start.bat](\_files/resident-services-config-files/config-server-start.bat).
9. Put both the files in the same folder and change the location attribute to `sandbox-local` folder in `config-server-start.bat` file and also check the version of `kernel-config-server.jar` towards the end of the command.

Example:

`java -jar -Dspring.profiles.active=native -Dspring.cloud.config.server.native.search-locations=file:C:\Users\myDell\mosipProject\mosip-config\sandbox-local -Dspring.cloud.config.server.accept-empty=true -Dspring.cloud.config.server.git.force-pull=false -Dspring.cloud.config.server.git.cloneOnStart=false -Dspring.cloud.config.server.git.refreshRate=0 kernel-config-server-1.2.0-20201016.134941-57.jar`.

As mentioned in step 4, you may have to make some changes in the two properties files.

For instance,

* Add `mosip.mosip.resident.client.secret=xyz789` property to be able to use a decrypted passcode and run it in your local machine.
* If you are running it on a server, then you have to use an encrypted passcode like this `mosip.mosip.resident.client.secret={cipher}1bdd7e59ca3a9dbe66b47db3ecb7025e66a6746911de2bd841c804f`.
* Comment this out `auth.server.admin.issuer.internal.uri` in `application-default` file because you already have this `auth.server.admin.issuer.uri` , and hence there is no need of `auth.server.admin.issuer.internal.uri`.
* If you check the URLs present in these files, they are set to default with port no. 80 (or any other port number) but you need to use external URL to access it.
* In the beginning of `resident-default` file, add `mosipbox.public.url=https://${domain.url}` and change all other URLs with `${mosipbox.public.url}`.
* This is because you will pass this domain URL in Eclipse VM arguments like this `-Ddomain.url=dev.mosip.net` which results in `mosipbox.public.url=https://dev.mosip.net` and it will connect with the Development environment.

1. Run the server by opening the `config-server-start.bat` file.

![](\_images/run-server.png)

The server should now be up and running.

Below are the configurations to be done in Eclipse:

1. Open Eclipse and run the project for one time as `Java application`, so that it will create a Java application which you can see in debug configurations and then change its name. (e.g.: project name with environment - "Resident-dev").

![](\_images/create-env-in-eclipse.png)

1. Open the arguments and pass this `-Ddomain.url=dev.mosip.net -Dapplication.base.url=http://localhost:8090 -Dspring.profiles.active=default -Dspring.cloud.config.uri=http://localhost:51000/config -Dspring.cloud.config.label=master` in VM arguments.
2. Here, the domain URL represents the environment on which you are working (eg., it can be `dev2.mosip.net` or `qa3.mosip.net`).

![](\_images/vm-arguments.png)

1. Click Apply and then debug it (starts running). In the console, you can see a message like `"Started ResidentBootApplication in 34.078 seconds (JVM running for 38.361)"`.

## Resident services API

* For API documentation, refer [here](https://docs.mosip.io/1.2.0/api).
* The APIs can be tested with the help of **Swagger-UI** and **Postman**.
* Swagger is an interface description language for describing restful APIs expressed using JSON. You can access Swagger-UI of resident-services for dev-environment from `https://dev.mosip.net/resident/v1/swagger-ui/index.html?configUrl=/resident/v1/v3/api-docs/swagger-config` and localhost from `http://localhost:8099/resident/v1/swagger-ui/index.html?configUrl=/resident/v1/v3/api-docs/swagger-config`.
* Postman is an API platform for building and using APIs. Postman simplifies each step of the API lifecycle and streamlines collaboration so you can create better APIs—faster. It is widely used tool for API testing. Below you will find the APIs postman collection of resident-services.
* Download the [JSON collection](\_files/resident-services-config-files/Resident-Service-APIs.postman\_collection.json) and then import it in your `postman`.

![](\_images/import-apis-in-postman.png)

* Create an environment as shown in the image below.

This environment is created for dev. Give the variable name as `url` and set both the values as `https://dev.mosip.net`.

![](\_images/dev-env-postman.png)

* In the similar way, create another environment as shown below.

This environment is created for localhost. Give the variable name as `url` and set both the values as `http://localhost:8099`.

![](\_images/localhost-env-postman.png)
