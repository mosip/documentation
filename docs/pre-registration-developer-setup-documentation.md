# Pre-registration Developer Setup

## Overview
This guide helps in understanding the pre-registration developer setup. To know more, read [Pre-registration](https://docs.mosip.io/1.2.0/modules/pre-registration). 

The documentation here will guide you through the pre-requisties required for the developer setup.

## Software, Code setup

### Below are the list of tools required in pre-registration:
1. JDK 11
2. Any IDE (like Eclipse, IntelliJ IDEA)
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

2. clone the repo into local
   * `git clone https://github.com/urgithubaccname/pre-registration.git`
   * `git checkout develop`
   * `git remote add upstream https://github.com/mosip/pre-registration.git`
   * `git remote set-url --push upstream no_push`
   * `git remote -v`
   * `git fetch upstream`
   * `git rebase upstream/develop`
 	
3. Inside `settings.xml` change local repository direcory to your directory name where `.m2 folder` is located.
	ex: `<localRepository>C:/Users/M1072510/.m2/repository</localRepository>` found in 55th line

4. Add `settings.xml` inside `.m2 folder` (Maven Folder).
	ex: `C:\Users\M1072510\.m2`

5. Import the project in Eclipse IDE and it starts updating Maven projects configuration, Refreshing workspaces, project starts building (downloading sources, javadoc).

6. Add Downloaded Lombok.jar to project, click on downloaded jar and install specifying eclipse ide(eclipse.exe) location.

7. Add MOSIP pre-registration specific jar files from [Maven central](https://repo1.maven.org/maven2/io/mosip/):
   * Adding Jars to build path: Right click on service -> Build Path -> Configure Build Path. click on Classpath, Add External Jars -> Add required Jars -> Apply and close

	
8. Add `auth-adapter`, `transliteration`, `ref-idobjectvalidator`, `virusscanner`, `lombok` jar files to `pre-registration-application-service`, `pre-registration-datasync-service`  class path.

9. Add `auth-adapter`, `lombok` jar file to `pre-registration-core`, `pre-registration-batchjob`, `pre-registration-captcha-service`, `pre-registration-booking-service` class path.

10. Run `mvn clean install -Dgpg.skip=true` command to build locally and to execute test cases.

11. Update Maven dependencies: Maven syncs the Eclipse project settings with that of the pom. It downloads dependencies required for the project.

12. Build and Run Project.




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
   * In [dev.mosip.net](https://dev.mosip.net) Goto `K8s Dashboard - MZ` to access Kubernetes.
   * Sign In using Token: Get the kubernetes Sign in Token from `MOSIP Confluence Environment Details` page.
   * Get the required `Token MZ Dashboard K8` for required environment.
   * In Kubernetes goto Pods section.
   * Search Prereg ->  Restart required pre-registration Pods to get the latest Docker Image.

6. Test the changes in UI, Perform Sanity Testing.

7. Jira Status and Documentation:
   * Change Status of the Bug in Jira as Fixed.
   * Specify Root cause of the Issue.
   * Add Detailed Comments about the changes done in Code for the Bug Fix.
   * Add Documentation. 
   * once moved to QA env -> change the Status as Assigned for Testing -> change the Assignee to QA team.

