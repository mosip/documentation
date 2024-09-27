# Registration Client Developers Guide

## Overview

[Registration Client](https://docs.mosip.io/1.2.0/modules/registration-client) is a thick Java-based client where the resident's demographic and biometric details are captured along with the supporting documents in online or offline mode.

The documentation here will guide you through the prerequisites required for the developer' setup.

## Software setup

Below are a list of tools required in Registration Client:

1. JDK 11
2. Any IDE (like Eclipse, IntelliJ IDEA)
3. Apache Maven (zip folder)
4. Git

Follow the steps below to set up Registration Client on your local system:

## Code setup

For the code setup, clone the [Registration Client](https://github.com/mosip/registration-client) repository and follow the guidelines mentioned in the [Code Contributions](https://docs.mosip.io/1.2.0/community/code-contributions).

### Importing and building of a project

1. Open the project folder where `pom.xml` is present.
2. Open command prompt from the same folder.
3. Run the command `mvn clean install -Dgpg.skip=true -DskipTests=true` to build the project and wait for the build to complete successfully.
4. After building of a project, open Eclipse and select `Import Projects → Maven → Existing Maven Projects → Next → Browse to project directory → Finish`.
5. After successful importing of project, update the project by right-click on `Project → Maven → Update Project`.

![](../../.gitbook/assets/import-project.png)

## Environment setup

1\. For the environment setup, you need an external dependency that is available [here](https://oss.sonatype.org/#nexus-search;gav\~\~mock-sdk\~1.2.0-SNAPSHOT\~\~) with different versions. (E.g.: You can download `mock-sdk.jar` and add to registration-services project `Libraries → Classpath → Add External JARs → Select Downloaded JAR → Add → Apply and Close`).

![](../../.gitbook/assets/add-mock-sdk-library.PNG)

2\. Registration Client UI is developed using JavaFX and the UI pages are fxml files which can be opened using a tool called `Scene Builder`. The JavaFX integration with the Eclipse IDE is provided with the e(fx)clipse tool. Go to `Help → Install New Software → Work with → Add`. Give Name and Location as mentioned in below image.

![](../../.gitbook/assets/efxclipse-installation.PNG)

Once the software is installed, you will be prompted to restart your IDE.

3\. Download `openjfx-11.0.2_windows-x64_bin-sdk.zip` from [here](https://github.com/mosip/documentation/tree/1.2.0/docs/\_files/registration-client-config-files), unzip and place it in your local file system. This folder contains list of javafx related jars that are necessary for running Registration Client UI.

4\. We can change the application environment in the file `registration-services\src\main\resources\props\mosip-application.properties` by modifying the property `mosip.hostname`

Below are the configurations to be done in Eclipse:

1\. Open Eclipse and run the project for one time as `Java application`, so that it creates a Java application which you can see in debug configurations.

![](../../.gitbook/assets/reg-client-create-env-in-eclipse.PNG)

2\. Open the arguments and pass this `--module-path C:\Users\<USER_NAME>\Downloads\openjfx-11.0.2_windows-x64_bin-sdk\javafx-sdk-11.0.2\lib --add-modules=javafx.controls,javafx.fxml,javafx.base,javafx.web,javafx.swing,javafx.graphics --add-exports javafx.graphics/com.sun.javafx.application=ALL-UNNAMED` in VM arguments.

![](../../.gitbook/assets/registration-client-run-configurations.PNG)

3\. Click Apply and then debug it (starts running). You can see a popup which shows informative messages of what is happening in background while Registration Client UI is loading and the application will be launched.

## Running the Registration Client Downloader Docker image

* Dockerfile is available under [registration-client repository](https://github.com/mosip/registration-client/blob/release-1.2.0.1/registration/Dockerfile).
* The concept here is to run nginx in the docker container from which registration-client.zip is hosted and also registration-client on the field will connect to this nginx to check for new updates or changes.

_Note:_ We refer this nginx server as registration-client download and upgrade server.

While running the registration-client docker container we need to pass below environment variables:

**Required**

`client_version_env` : pom version of the registration client build

`client_upgrade_server_env` : public URL of this nginx server

`reg_client_sdk_url_env` : URL to download sdk zip. Make sure to have SDK jar and its dependent jars in the zip.

artifactory\_url\_env : artifactory URL to download below mentioned runtime dependencies

“${artifactory\_url}/artifactory/libs-release-local/icu4j/icu4j.jar”

“${artifactory\_url}/artifactory/libs-release-local/icu4j/kernel-transliteration-icu4j.jar”

“${artifactory\_url}/artifactory/libs-release-local/clamav/clamav.jar”

“${artifactory\_url}/artifactory/libs-release-local/clamav/kernel-virusscanner-clamav.jar”

`keystore_secret_env` : password of the keystore.p12 file

`host_name_env` : syncdata-service public domain name

`signer_timestamp_url_env` : URL of timestamp server to timestamp registration-client jar files.

**Need to mount a volume to “/home/mosip/build\_files” with below files**

* logback.xml
* Client.crt : Signer certificate to be added in the registration-client build for jar sign verification.
* keystore.p12 : Store private key used to sign the registation-client and registration-services jar files with “CodeSigning” alias.
* maven.metadata.xml : Holds the current version of registration-client hosted in the upgrade server.

**Optional**

`reg_client_custom_impls_url_env` : URL to download scanner custom implementation jars(runtime dependency).

Finally, you can download the registration client zip from below URL. {registratiionclient download server domain name/ip}/registration-client/{client\_version}/reg-client.zip}

**References**

Run (https://github.com/mosip/mosip-infra/blob/develop/deployment/v3/mosip/regclient/create-signing-certs.sh) to generate `Client.crt` and `keystore.p12`.

To get the content of `maven-metadata.xml` and `logback.xml` check (https://github.com/mosip/mosip-helm/blob/develop/charts/regclient/templates/configmap.yaml)
