# Pre-registration Developer Setup

## Overview
This guide helps in understanding the pre-registration developer setup. To know more, read [Pre-registration](https://docs.mosip.io/1.2.0/modules/pre-registration). 

The documentation here will guide you through the pre-requisties required for the developer setup.

## Software setup

Below are the list of tools required in pre-registration:
1. JDK 11
2. Any IDE (like Eclipse, IntelliJ IDEA)
3. Apache Maven (zip folder)
4. pgAdmin
5. Postman
6. Git
7. lombok.jar (file)
8. MOSIP pre-registration specific jar:
    [kernel-auth-adapter](https://repo1.maven.org/maven2/io/mosip/kernel/kernel-auth-adapter/)
	  [kernel-transliteration-icu4j](https://repo1.maven.org/maven2/io/mosip/kernel/kernel-transliteration-icu4j/)
	  [kernel-ref-idobjectvalidator](https://repo1.maven.org/maven2/io/mosip/kernel/kernel-ref-idobjectvalidator/)
	  [kernel-virusscanner-clamav](https://repo1.maven.org/maven2/io/mosip/kernel/kernel-virusscanner-clamav/)
9. settings.xml (document)
10. Notepad++ (optional)


Follow the steps below to setup Resident services on your local system
1. Fork the MOSIP [pre-registration repository](https://github.com/mosip/pre-registration) from Github [MOSIP repo](https://github.com/mosip).

2. clone the repo into local
	git clone https://github.com/urgithubaccname/pre-registration.git
 	git checkout develop
	git remote add upstream https://github.com/mosip/pre-registration.git
	git remote set-url --push upstream no_push
	git remote -v
	git fetch upstream
	git rebase upstream/develop

3. Inside settings.xml change local repository direcory to your directory name where .m2 folder is located.
	ex: <localRepository>C:/Users/M1072510/.m2/repository</localRepository> found in 55th line

4. Add settings.xml inside .m2 folder (Maven Folder).
	ex: C:\Users\M1072510\.m2

5. Import the project in Eclipse IDE and it starts updating Maven projects configuration, Refreshing workspaces, project starts building (downloading sources, javadoc).

6. Download Lombok.jar from project lombok website (https://projectlombok.org/download), click on downloaded jar and install specifying eclipse ide(eclipse.exe) location.

7. Add MOSIP Jar files from Maven central (https://repo1.maven.org/maven2/io/mosip/)
   	MOSIP pre-reg specific jar:
	kernel-auth-adapter 		(https://repo1.maven.org/maven2/io/mosip/kernel/kernel-auth-adapter/)
	kernel-transliteration-icu4j 	(https://repo1.maven.org/maven2/io/mosip/kernel/kernel-transliteration-icu4j/)
	kernel-ref-idobjectvalidator	(https://repo1.maven.org/maven2/io/mosip/kernel/kernel-ref-idobjectvalidator/)
	kernel-virusscanner-clamav	(https://repo1.maven.org/maven2/io/mosip/kernel/kernel-virusscanner-clamav/)

 	(a)Adding Jars to build path:
	Right click on service -> Build Path -> Configure Build Path. 
	click on Classpath, Add External Jars -> Add required Jars -> Apply and close

	
8. Add auth-adapter, transliteration, ref-idobject, virusscanner, lombok jar files to pre-registration-application-service, pre-registration-datasync-service  class path.
9. Add auth-adpter jar, lombok.jar file to pre-registration-core, pre-registration-batchjob, pre-registration-captcha-service, pre-registration-booking-service class path.
10. Run "mvn clean install -Dgpg.skip=true" command to build locally and to execute test cases.
11. Update Maven dependencies: Maven syncs the Eclipse project settings with that of the pom. It downloads dependencies required for the project.
12. Build and Run Project.
