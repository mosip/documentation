# Resident Services Developer Setup Documentation

## Overview
Resident services are the self-services which are used by the residents themselves via a portal. Resident Portal is a web based UI application that provides residents of a country the services related to their Unique Identification Number (UIN). You can read the full documentation [here](https://docs.mosip.io/1.2.0/modules/resident-services).

This documentation will guide you to do all types of setup.

## Software setup
There are some tools which we will be use in Resident services:
1. JDK 11.
2. Any IDE (like eclipse, intellij idea).
3. Apache Maven (zip folder).
4. pgAdmin.
5. Postman.
6. Git.
7. Notepad++ (optional).
8. Lombok.jar (file).
9. settings.xml (document).

You can download Lombok.jar and settings.xml from here.

After unzipping Apache Maven, a user needs to move that unzipped folder in ```C:\Program Files``` and "settings.xml" (document file) inside this 'conf' folder ```C:\Program Files\apache-maven-3.8.4\conf```.

After installing Eclipse, a user needs to open the "Lombok.jar" file and wait for some time until it completes the scan for Eclipse IDE then click on 'Install/Update'.

![](_images/lombok-configuration.png)

Now you can check inside the eclipse installation folder ```C:\Users\userName\eclipse\jee-2021-12\eclipse```, the "Lombok.jar" is added there. Now you don't have to add the dependency of 'lombok' in your "pom.xml" file separately, it will be auto-configured by the Eclipse.

## Code setup
First you need to make a clone of a repository. Follow setps from [here](https://docs.mosip.io/1.2.0/community/code-contributions).

### Importing and building of a project
1. Open the project folder where "pom.xml" is present.
2. Open command prompt from that folder.
3. Now run this command to build the project ```mvn clean install -Dgpg.skip=true -DskipTests=true``` and wait for build to complete successfully.
4. After building of a project, open Eclipse and select import projects → Maven → Existing maven projects → Next → browse to project directory → click finish.

![](_images/import-project.png)

5.After successful importing of project, you need to update the project by right-click on project → maven → update project.

## Environment setup
