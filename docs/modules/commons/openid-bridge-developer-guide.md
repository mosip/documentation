# OpenID-Bridge Developers Guide

## Overview

[OpenID-Bridge](https://docs.mosip.io/1.2.0/modules/commons) module provides AutnN and AuthZ related funtionalities.

Below is a list of tools required in OpenID Bridge:

1. JDK 11
2. Any IDE (like Eclipse, IntelliJ IDEA)
3. Apache Maven (zip folder)
4. PostgreSQL
5. Any DB client (like DBeaver, pgAdmin)
6. Postman (any HTTP Client)
7. Git
8. Any Editor (like Vscode, Notepad++ etc optional)
9. lombok.jar (jar file)
10. settings.xml (document)

### Software setup

1. Download [lombok.jar](https://projectlombok.org/download) and [settings.xml](https://github.com/mosip/documentation/tree/1.2.0/docs/\_files/commons/settings.xml).
2. Unzip Apache Maven and move `settings.xml` to "conf" folder `<apache maven unzip path>\conf`.
3.  Install Eclipse, open the `lombok.jar` file and then click `Install/Update`.

    ![](../../.gitbook/assets/lombok-configuration.png)
4. Check the Eclipse installation folder to see if the `lombok.jar` is added.
5. Configure the JDK (Standard VM) with your Eclipse by traversing through `Preferences → Java → Installed JREs`.

![](../../.gitbook/assets/installed-jre.png)

### Source code setup

For the code setup, clone the repository and follow the guidelines mentioned in the [Code Contributions](https://docs.mosip.io/1.2.0/community/code-contributions).

### Importing and building

1. Open the project folder where `pom.xml` is present.
2. Open the command prompt from the same folder.
3. Run the command `mvn clean install -Dgpg.skip=true -DskipTests=true` to build the project .
4. After building, open Eclipse and select `Import Projects → Maven → Existing Maven Projects → Next → Browse to project directory → Finish`.
5. After successful importing of project, update the project by right-click on `Project → Maven → Update Project`.

![](../../.gitbook/assets/import-project.png)

## Environment setup

1\. Clone [mosip-config repository](https://github.com/mosip/mosip-config).

2\. OpenID Bridge uses two property files, `kernel-default` and `application-default`, configure them accordingly. For instance,

* OpenID bridge connects to an IAM which supports Openid and Oauth. For integration with our keycloak, Please reach out to our team.
* Update `mosip.iam.open-id-url` property to update iam url.
* Secrets can be encrypted using [config server](https://cloud.spring.io/spring-cloud-config/reference/html/#\_encryption\_and\_decryption)
* Update Url's in property files.(It can be either pointed to any remotely or locally deployed services)

3\. Download [kernel-config-server.jar](https://oss.sonatype.org/#nexus-search;gav\~\~kernel-config-server\~1.2.0-SNAPSHOT\~\~). For Windows, download [config-server-start.bat](../../\_files/commons/config-server-start.bat), Linux users can run

`java -jar -Dspring.profiles.active=native -Dspring.cloud.config.server.native.search-locations=file:{mosip-config-mt_folder_path}/config -Dspring.cloud.config.server.accept-empty=true -Dspring.cloud.config.server.git.force-pull=false -Dspring.cloud.config.server.git.cloneOnStart=false -Dspring.cloud.config.server.git.refreshRate=0 {jarName}` .

4\. Run the server by opening the `config-server-start.bat` file. ![](../../.gitbook/assets/run-server.png)

5\. To verify the config-server, hit the below URL: `http://localhost:51000/config/{spring.profiles.active}/{spring.cloud.config.name}/{spring.cloud.config.label}` for instance `http://localhost:51000/config/kernel/env/master`

## Initialization and utilization of module

1. Audit REST service consists of `bootstrap.properties` file in `src/main/resources`.
2.  Below properties needed to be modified in order to connect to the config server:

    ```
    spring.cloud.config.uri=<config server uri>
    spring.cloud.config.label=<branch of config repo>
    spring.profiles.active=default
    ```
3. Services can be run using `Run As -> Spring Boot App/Java Application`.
4. For API documentation, refer [here](https://docs.mosip.io/1.2.0/api).
5. The API's can be tried with the help of **Swagger-UI** and **Postman**.
6. Swagger-UI service can be accessed from `(https/http)://(<domain>/<host>:<port>)/<context-path>/swagger-ui/index.html?configUrl=<contect-path>/v3/api-docs/swagger-config` for instance `https://dev2.mosip.net/v1/auditmanager/swagger-ui/index.html?configUrl=/v1/auditmanager/v3/api-docs/swagger-config`.
7. The API's can be tried using postman. URLs and Body structures can be found in Swagger or curl command can be copied and imported in Postman.

![](../../.gitbook/assets/postman-import-curl.png)
