# Partner Management Services Developers Guide

## Overview

[Partner Management Services](https://docs.mosip.io/1.2.0/modules/partner-management-services) are the self-services which are used by the partners themselves via a portal. Partner Management Portal is a web based UI application that provides services to various types of partners.

Partner Management module has two services:

* Policy Management service
* Partner Management service

The documentation here will guide you through the prerequisites required for the developer's setup.

## Software setup

Below are a list of tools required in Partner Management Services setup:

1. JDK 11
2. Any IDE (like Eclipse, IntelliJ IDEA)
3. Apache Maven (zip folder)
4. pgAdmin
5. Postman
6. Git
7. Notepad++ (optional)
8. lombok.jar (file)
9. settings.xml (document)

Follow the steps below to set up Partner Management Services on your local system:

* Download `lombok.jar` and `settings.xml` from [here](https://github.com/mosip/documentation/tree/1.2.0/docs/\_files/partner-management-services-config-files).
* Unzip Apache Maven and move the unzipped folder in `C:\Program Files` and `settings.xml` to `conf` folder `C:\Program Files\apache-maven-3.8.4\conf`.
* Install Eclipse, open the `lombok.jar` file and wait for some time until it completes the scan for Eclipse IDE and then click `Install/Update`.

![](../../../.gitbook/assets/lombok-configuration.png)

* Check the Eclipse installation folder `C:\Users\userName\eclipse\jee-2021-12\eclipse` to see if the `lombok.jar` is added. By doing this, you don't have to add the dependency of `lombok` in your `pom.xml` file separately as it is auto-configured by Eclipse.
* Configure the JDK (Standard VM) with your Eclipse by traversing through `Preferences → Java → Installed JREs`.

![](../../../.gitbook/assets/installed-jre.png)

## Code setup

For the code setup, clone the repository and follow the guidelines mentioned in the [Code Contributions](https://docs.mosip.io/1.2.0/community/code-contributions).

### Importing and building of a project

1. Open the project folder where `pom.xml` is present.
2. Open command prompt from the same folder.
3. Run the command `mvn clean install -Dgpg.skip=true -DskipTests=true` to build the project and wait for the build to complete successfully.
4. After building of a project, open Eclipse and select `Import Projects → Maven → Existing Maven Projects → Next → Browse to project directory → Finish`.
5. After successful importing of project, update the project by right-click on `Project → Maven → Update Project`.

![](../../../.gitbook/assets/import-project.png)

## Environment setup

* For the environment setup, you need an external JAR that is available [here](https://oss.sonatype.org/#nexus-search;gav\~\~kernel-auth-adapter\~1.2.0-SNAPSHOT\~\~) with different versions. (E.g.: You can download `kernel-auth-adapter.jar` and add to project `Libraries → Classpath → Add External JARs → Select Downloaded JAR → Add → Apply and Close`).

![](../../../.gitbook/assets/add-external-library.png)

* Clone [mosip-config repository](https://github.com/mosip/mosip-config).
* Create an empty folder inside the `mosip-config` with `sandbox-local` name and then copy and paste all config files inside `sandbox-local` folder except `.gitignore, README and LICENSE`.
* As Partner Management Services is using two properties files, `partner-management-default` and `application-default`, you will have to configure them according to your environment. The same files are available [here](https://github.com/mosip/documentation/tree/1.2.0/docs/\_files/partner-management-services-config-files) for reference.
* To run the server, two files are required- [kernel-config-server.jar](https://oss.sonatype.org/#nexus-search;gav\~\~kernel-config-server\~1.2.0-SNAPSHOT\~\~) and [config-server-start.bat](https://github.com/NagarjunaKuchi/documentation/blob/1.2.0/docs/\_files/partner-management-services-config-files/config-server-start.bat).
* Put both the files in the same folder and change the location attribute to `sandbox-local` folder in `config-server-start.bat` file and also check the version of `kernel-config-server.jar` towards the end of the command.

Example:

`java -jar -Dspring.profiles.active=native -Dspring.cloud.config.server.native.search-locations=file:C:\Users\myDell\mosipProject\mosip-config\sandbox-local -Dspring.cloud.config.server.accept-empty=true -Dspring.cloud.config.server.git.force-pull=false -Dspring.cloud.config.server.git.cloneOnStart=false -Dspring.cloud.config.server.git.refreshRate=0 kernel-config-server-1.2.0-20201016.134941-57.jar`.

As mentioned in the steps above, you may have to make some changes in the two properties files as per your environment.

* Run the server by opening the `config-server-start.bat` file.

![](../../../.gitbook/assets/run-server.png)

The server should now be up and running.

Below are the configurations to be done in Eclipse:

1\. Open Eclipse and run the project for one time as `Java application`, so that it will create a Java application which you can see in debug configurations and then change its name. (e.g.: project name with environment - "partner-management-dev").

![](../../../.gitbook/assets/partner-management-dev.PNG)

2\. Open the arguments and pass this `-Ddomain.url=dev.mosip.net -Dapplication.base.url=http://localhost:8090 -Dspring.profiles.active=default -Dspring.cloud.config.uri=http://localhost:51000/config -Dspring.cloud.config.label=master` in VM arguments.

3\. Here, the domain URL represents the environment on which you are working (eg., it can be `dev2.mosip.net` or `qa3.mosip.net`).

![](../../../.gitbook/assets/vm-arguments.png)

4\. Click Apply and then debug it (starts running). In the console, you can see a message like `"Started PartnerManagementService in 34.078 seconds (JVM running for 38.361)"`.

Policy management service also can run by following the above steps.

## Partner management services API

* For API documentation, refer [here](https://docs.mosip.io/1.2.0/api).
* The APIs can be tested with the help of **Swagger-UI** and **Postman**.
* Swagger is an interface description language for describing restful APIs expressed using JSON. Can access Swagger-UI of partner-management-services for dev-environment from `https://dev.mosip.net/v1/partnermanager/swagger-ui/index.html?configUrl=/v1/partnermanager/v3/api-docs/swagger-config` and localhost from `http://localhost:9109/v1/partnermanager/swagger-ui/index.html?configUrl=/v1/partnermanager/v3/api-docs/swagger-config`.
* Can access Swagger-UI of policy-management-services for dev-environment from `https://dev.mosip.net/v1/policymanager/swagger-ui/index.html?configUrl=/v1/policymanager/v3/api-docs/swagger-config` and localhost from `http://localhost:9107/v1/policymanager/swagger-ui/index.html?configUrl=/v1/policymanager/v3/api-docs/swagger-config`.
* Postman is an API platform for building and using APIs. Postman simplifies each step of the API lifecycle and streamlines collaboration so you can create better APIs—faster. It is widely used tool for API testing.
* Download the [JSON collection](https://github.com/mosip/mosip-onboarding) and then import it in your `postman`.
