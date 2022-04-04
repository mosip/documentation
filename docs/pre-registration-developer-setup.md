# Pre-registration Developer Setup

## Overview
The documentation here will guide you through the pre-requisites required for pre-registration developer setup. To know more, read [Pre-registration](https://docs.mosip.io/1.2.0/modules/pre-registration). 


## Software setup

### Below are the list of tools required in pre-registration:
1. JDK 11
2. Any IDE (Eclipse, IntelliJ IDEA)
3. Apache Maven (zip folder)
4. pgAdmin
5. Postman
6. Git
7. [lombok.jar](https://projectlombok.org/download) (file)
8. MOSIP pre-registration specific jar:
   * [kernel-auth-adapter](https://repo1.maven.org/maven2/io/mosip/kernel/kernel-auth-adapter/) 
   * [kernel-transliteration-icu4j](https://repo1.maven.org/maven2/io/mosip/kernel/kernel-transliteration-icu4j/)
   * [kernel-ref-idobjectvalidator](https://repo1.maven.org/maven2/io/mosip/kernel/kernel-ref-idobjectvalidator/)
   * [kernel-virusscanner-clamav](https://repo1.maven.org/maven2/io/mosip/kernel/kernel-virusscanner-clamav/)
9. [settings.xml](https://github.com/aihamh/documentation/blob/1.2.0/docs/_files/pre-registration-config-files/settings.xml)
10. Notepad++ (optional)


### Follow the steps below to setup pre-registration on your local system:
1. Fork the MOSIP [pre-registration repository](https://github.com/mosip/pre-registration) from Github [MOSIP repo](https://github.com/mosip).

2. Clone the repo into local.
   * `git clone https://github.com/urgithubaccname/pre-registration.git`
   * `git checkout develop`
   * `git remote add upstream https://github.com/mosip/pre-registration.git`
   * `git remote set-url --push upstream no_push`
   * `git remote -v`
   * `git fetch upstream`
   * `git rebase upstream/develop`
 	
3. Inside `settings.xml` change local repository directory to your directory name where `.m2 folder` is located.
	ex: `<localRepository>C:/Users/M1072510/.m2/repository</localRepository>` found in 55th line

4. Add `settings.xml` inside `.m2 folder` (Maven Folder).
	ex: `C:\Users\M1072510\.m2`

5. Import the project in Eclipse IDE and it starts updating Maven projects configuration, Refreshing workspaces, project starts building (downloading sources, javadoc).

6. Add Downloaded Lombok.jar to project, click on downloaded jar and install specifying eclipse ide(eclipse.exe) location.

 <img src="_images/lombok-configuration.png" width="750" height="450">
 
7. Configure the JDK (Standard VM) with your Eclipse by traversing through `Preferences → Java → Installed JREs`.

<img src="_images/installed-jre.png" width="750" height="450">

8. Add MOSIP pre-registration specific jar files from [Maven central](https://repo1.maven.org/maven2/io/mosip/):
   * Adding Jars to build path: Right click on service -> Build Path -> Configure Build Path. click on Classpath, Add External Jars -> Add required Jars -> Apply and close.
  
 <img src="_images/add-external-library.png" width="750" height="450">

	
9. Add `auth-adapter`, `transliteration`, `ref-idobjectvalidator`, `virusscanner`, `lombok` jar files to `pre-registration-application-service`, `pre-registration-datasync-service`  class path.

10. Add `auth-adapter`, `lombok` jar file to `pre-registration-core`, `pre-registration-batchjob`, `pre-registration-captcha-service`, `pre-registration-booking-service` class path.

11. Run `mvn clean install -Dgpg.skip=true` command to build locally and to execute test cases.

12. Update Maven dependencies: Maven syncs the Eclipse project settings with that of the pom. It downloads dependencies required for the project.

13. Build and Run Project.



## Installation docs for MOSIP Pre-registration UI:

1. Fork the [Pre-reg UI repo](https://github.com/mosip/pre-registration-ui) and checkout "develop" branch.
2. Install all dependencies with `npm install`.
3. Install angular js `npm install -g @angular/cli`.
4. Start the angular js server "ng serve".
5. Open `http://localhost:4200` to access the application.
6. You will face CORS issue since API Services are hosted on `https://dev.mosip.net`.


#### Using the Angular CLI proxy solution to get around CORS issue

1. Update the API services `BASE_URL` in `config.json`:
   * `config.json` is found inside assets directory.
   * ex : `C:\MOSIP\pre-registration-ui\pre-registration-ui\src\assets\config.json`

	`{
	"BASE_URL": "https://localhost:4200/proxyapi/",
	"PRE_REG_URL": "preregistration/v1/"
	}`

2. Create a new file named `proxy.conf.json`:
   * location should be in project folder: 
   * ex: `C:\MOSIP\pre-registration-ui\pre-registration-ui\proxy.conf.json`

    * `{
     "/proxyapi": {
      "target": "https://dev.mosip.net/",
      "secure": true,
      "changeOrigin": true,
      "pathRewrite": {
        "^/proxyapi": ""
          }
        }
      }`

3. Now start the server by typing `ng serve --proxy-config proxy.conf.json --ssl true`.

4. Open the browser, load the app with `https://localhost:4200`.



## Raising PR, Updating Jira for Bug Fix:

1. If we want to create a new local branch for particular fix:
   * `git checkout -b [branchname]`
   * ex: `git checkout -b MOSIP-20940-sonar-bug-fix`

2. Push the changes:
   * `git add .`
   * `git commit -m "Jira ID and Description"`
   * ex: `git commit -m "[MOSIP-19845] Fixed Sonar Bug"`
   * `git push -f origin [branchName]`
	
3. Create PR in Github to merge code into `mosip/pre-registration repo`.

4. Once PR is merged check Github Actions to see if build is Successful.

5. Restart Kubernetes Pods:
   * In `env` Goto `K8s Dashboard - MZ` to access Kubernetes.

6. Test the changes in UI, Perform Sanity Testing.

7. Jira Status and Documentation:
   * Change Status of the Bug in Jira as Fixed.
   * Specify Root cause of the Issue.
   * Add Detailed Comments about the changes done in Code for the Bug Fix.
   * Add Documentation. 
   * once moved to QA env -> change the Status as Assigned for Testing -> change the Assignee to QA team.


## Pre-registration API

1. For API documentation, refer [here](https://docs.mosip.io/1.2.0/api).

2. The APIs can be Tested with the help of **Swagger-UI** and **Postman**. 

3. Swagger is an interface description language for describing restful APIs expressed using JSON. You can access Swagger-UI of pre-registration here:
   * Pre-registration Application service : https://{env}/preregistration/v1/application-service/swagger-ui.html
   * Pre-registration Datasync Service : https://{env}/preregistration/v1/sync/datasync-service/swagger-ui.html
   * Pre-registration Captcha service : https://{env}/preregistration/v1/captcha/swagger-ui.html
   * Pre-registration Booking service : https://{env}/preregistration/v1/appointment/booking-service/swagger-ui.html


 
