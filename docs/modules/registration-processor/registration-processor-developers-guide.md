# Registration Processor Developers Guide

## Overview

[Registration Processor](https://docs.mosip.io/1.2.0/modules/registration-processor)(Regproc) is a backend processing engine to enable the ID Lifecycle management. It has several stages and services, registration packet flows through various stages depending on the type of flow.

The documentation here will guide you through the prerequisites required for the developer's setup.

## Software setup

Below are a list of tools required in Registration Processor:

1. JDK 11
2. Any IDE (like Eclipse, IntelliJ IDEA)
3. Apache Maven (zip folder)
4. pgAdmin
5. Git
6. Notepad++ (optional)
7. lombok.jar (file)
8. settings.xml (document)

Follow the steps below to set up Registration Processor on your local system:

1\. Download `lombok.jar` and `settings.xml` from [here](https://github.com/mosip/documentation/tree/1.2.0/docs/\_files/registration-processor-config-files).

2\. Unzip Apache Maven and move the unzipped folder in `C:\Program Files` and `settings.xml` to `conf` folder `C:\Program Files\apache-maven-3.8.4\conf`.

3\. Install Eclipse, open the `lombok.jar` file and wait for some time until it completes the scan for Eclipse IDE and then click `Install/Update`.

![](../../.gitbook/assets/lombok-configuration.png)

4\. Check the Eclipse installation folder `C:\Users\userName\eclipse\jee-2021-12\eclipse` to see if the `lombok.jar` is added. By doing this, you don't have to add the dependency of `lombok` in your `pom.xml` file separately as it is auto-configured by Eclipse.

5\. Configure the JDK (Standard VM) with your Eclipse by traversing through `Preferences → Java → Installed JREs`.

![](../../.gitbook/assets/installed-jre.png)

## Code setup

For the code setup, clone the [registration](https://github.com/mosip/registration.git) repository from and follow the guidelines mentioned in the [Code Contributions](https://docs.mosip.io/1.2.0/community/code-contributions).

### Importing and building of a project

1. Open the project folder where `pom.xml` is present.
2. Open command prompt from the same folder.
3. Run the command `mvn clean install -Dgpg.skip=true -DskipTests=true` to build the project and wait for the build to complete successfully.
4. After building of a project, open Eclipse and select `Import Projects → Maven → Existing Maven Projects → Next → Browse to project directory → Finish`.
5. After successful importing of project, update the project by right-click on `Project → Maven → Update Project`.

![](../../.gitbook/assets/import-project.png)

## Environment setup

1\. For the environment setup, you need an external JAR that is available [here](https://oss.sonatype.org/#nexus-search;gav\~\~kernel-auth-adapter\~1.2.0-SNAPSHOT\~\~) with different versions. (E.g.: You can download `kernel-auth-adapter.jar` and add to project `Libraries → Classpath → Add External JARs → Select Downloaded JAR → Add → Apply and Close`).

![](../../.gitbook/assets/add-external-library.png)

2\. Clone [mosip-config repository](https://github.com/mosip/mosip-config).

3\. Create an empty folder inside the `mosip-config` with `sandbox-local` name and then copy and paste all the config files inside `sandbox-local` folder except `.gitignore, README and LICENSE`.

4\. As Registration Processor is using two properties files, `registration-processor-default` and `application-default`, you will have to configure them according to your environment. The same files are available [here](https://github.com/mosip/documentation/tree/1.2.0/docs/\_files/registration-processor-config-files) for reference.

5\. To run the server, two files are required- [kernel-config-server.jar](https://oss.sonatype.org/#nexus-search;gav\~\~kernel-config-server\~1.2.0-SNAPSHOT\~\~) and [config-server-start.bat](../../\_files/registration-processor-config-files/config-server-start.bat).

6\. Put both the files in the same folder and change the location attribute to `sandbox-local` folder in `config-server-start.bat` file and also check the version of `kernel-config-server.jar` towards the end of the command.

Example:

`java -jar -Dspring.profiles.active=native -Dspring.cloud.config.server.native.search-locations=file:C:\Users\myDell\mosipProject\mosip-config\sandbox-local -Dspring.cloud.config.server.accept-empty=true -Dspring.cloud.config.server.git.force-pull=false -Dspring.cloud.config.server.git.cloneOnStart=false -Dspring.cloud.config.server.git.refreshRate=0 kernel-config-server-1.2.0-20201016.134941-57.jar`.

7\. Run the server by opening the `config-server-start.bat` file.

![](../../.gitbook/assets/run-server.png)

The server should now be up and running.

8\. Before running any application of Registration Processor, replace the below properties in `bootstrap.properties`:

`spring.cloud.config.uri=http://localhost:51000/config`

`spring.cloud.config.label=master`

`spring.profiles.active=default`

`spring.profiles.active can be dmz or mz(default)`

9\. An alternative approach to start the application is to place the dependency of application to be executed in the pom of `MOSIP stage executor` update maven and place above mentioned properties in the `bootstrap.properties` and then start `MOSIP stage executor`.
