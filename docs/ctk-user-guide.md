# COMPLIANCE TOOL KIT (CTK) USER GUIDE

This guide will help the partners in using the Compliance Took Kit online portal. The word "user" in this document refers to a partner or anyone using the CTK portal.

Below are simple steps to use this portal:

1.	The partners who are going to use the compliance tool kit should be registered partners in the system.
2.	Login into CTK with the same credentials.
3.	Create a project of type SBI / SDK / ABIS.
4.	Create a collection by selecting testcases that you want to test.
5.	Provide necessary details to connect to your device / SDK service / ABIS queue.
6.	Execute the test run by running the collection.
7.	For executing each testcase, follow the instructions on the screen.
8.	Once entire collection is run, results of number of testcases passed or failed will be displayed.
9.	You can see all test run details as well for example request sent to SBI, response received from SBI, validations performed on the response and the result.
10.	Test runs previously executed will be available in test run history.
11.	More collections can be created as per testcases required.
 
## Login

The partners using the compliance tool kit should be registered in the system. Registered partners can login into the compliance tool kit with the same credentials as they used to register themselves into the partner management portal.

The partner needs to enter the Username/ email and Password.

<image>

## Dashboards
  
Once the user logs into the compliance tool kit, they can view the Project dashboard by default and would have the option to view the Biometric data dashboard as well.
 
* Project: A project is a module that the partner wants to test. For example, if a device partner has developed a new version of his/her SBI for their fingerprint slap device, then, they can create a project in the compliance tool kit to verify this version of SBI.  

* Biometric Data: As part of the compliance tool kit, we provide an option for the partner to upload their test data which can be used to verify the partner’s software. Currently, in MOSIP, we can upload test data for an SDK or an ABIS.
  
<image>

## Project dashboard
  
Below are the possible activities as part of the Project Dashboard.

* View all the projects on the dashboard
* Create a new project
* View a specific project
* Archive a project
* Move to the Biometric data dashboard
  
Let us go through each of them in detail.
  
### View projects
  
Once the user logs into the compliance tool kit, user can view all the existing projects in the dashboard.
The project dashboard will display the following attributes of a project:
* Name of the project
* Project Type
* Total number of collections in the project
* Creation date and time of the project
* Last time a collection in the project was run
* Status of the last run on the project

  < image >
 
Filter option in the dashboard will filter based on the name of the project, project type and the creation date and time.
    
 < image >
   
 ### Create a project
   
 * On the Projects Dashboard, select `+Add Project` button.
 * The page will redirect the user to ‘Add a new Project’ page as shown below.
  
   <image>
     
 * Enter a unique Project Name and select the Project Type. Currently MOSIP supports only two types of projects: SBI, SDK
 * Based on the project type selected, the user needs to enter the mandatory configurations before saving the project.
 * When the project type selected is SBI, the user will need to provide/select the below configurations:
    * _Spec Version_: MOSIP SBI specification for which the SBI is built
    * _Purpose_: The purpose of the device
    * _Device Type_: The type of device
    * _Device SubType_: The Subtype of the device
     
|Purpose|Device Type|Device SubType|
|---|---|---|
|Registration|Iris|Double|
|Registration|Iris|Single|
|Registration|Face|Full Face|
|Authentication|Finger|Single|
|Authentication|Finger|Touchless|
|Authentication|Iris|Single|
|Authentication|Iris|Double|
|Authentication|Face|Full Face|
     
         
     <image>
     
 * When the project type selected is SDK, the partner will need to provide the below configurations:
    * Base URL: URL where the SDK is deployed
    * Spec Version: MOSIP SDK specification for which the SDK is built
    * Purpose: Purpose of the SDK 
    * Test Data: Input data needed for the run

<image>
  
* Once the data is entered by the user, the user can click on the **Save Project** button to save the project.
* Once the project is saved, a successful message is displayed and a popup appears on the screen which when closed redirects the user to the project dashboard (home).

 <image>

 Possible values for the Purpose attribute in SDK are:
 
* Matcher
* Check Quality
* Extract Template
* Convert Format
* Segment

### View a specific project  
   
Details of a specific project can be viewed 
* By clicking on the name of the project, or,
* By clicking on the option “View” in the options section of the project row
   
 <image>

Once you click on the above-mentioned link, you will be redirected to the project details page of the specific project.

### Move to the biometric data dashboard
   
* Click on `Biometric Data` button on projects dashboard screen. 
* The user will navigate to Biometric Test Data screen where they can add multiple biometric test data files.
   
 <image>
   
## Biometric data dashboard
   
Possible activities as a part of the Biometric Data Dashboard are:
* View all the biometric data collected on the dashboard
* Upload new biometric data
* Download biometric data
* Delete biometric data
* Move to the project dashboard

### View all the biometric data
   
To view the biometric test data collection, click on `Biometric Data` on Dashboard.
   
The biometric data dashboard should display the below attributes of a biometric data
* Name of the biometric data
* Type of data
* Purpose of the data
* The file name of the data
* Creation date and time of the biometric data
   
 <image>
   
Filter in the dashboard should be able to perform filter based on the name of the biometric data, type, purpose and creation date and time.

<image>   

 ### Upload new biometric data
 
 * On the `Biometric Test Data` page, click `+Add Biometric data`, it redirects the user to the “Upload Biometrics Test Data” screen.
 * Provide a unique name for the biometric data
 * Based on the type selected, the user needs to enter the respective mandatory details before saving the biometric data.
 * When the project type SDK is selected, the user needs to provide the below details
    * Purpose: The purpose of the test (SDK test type)
    * Test Data: The test data to be uploaded as a ZIP

The Test Data section has two options `Browse` and `Download Sample File`.

The `Browse` button will be the file explorer in the system for the user to select the test data ZIP to be uploaded

The `Download Sample File` button will download a blank ZIP file with instructions in the README of the test case so that the partner can prepare and add biometric test data.
 
 <image>
  
 ### Download test data
  
* Once the test data is uploaded to the server it can be downloaded by the partner,
    * Clicking on the name of the biometric data in the biometric data, or, 
    * Clicking on the `Download Zip` option in the actions menu (three vertical dots menu) of the biometric data
  
  <image>
   
 ## Collections
   
A collection is a group of test cases selected by the user for a particular project configuration. Inside a project, the user can create multiple collections based on their choice of test cases selected. As part of the collection, the user can perform the below activities:
* Create a collection
* View a collection
* Run a collection
* View the run history of a collection
* Generate report from a run
* Archive a collection
   
### Create a collection

* To create a collection for a project, first navigate to the project details page by clicking on the project name or View option in the options list.
* Click on `Add Collection` button and you will be redirected to the Add Collection screen.
* Enter a unique name for the collection.
* Select the test cases to be added to the collection
    * The test cases will be displayed in a tabular format with ID, Name, Description and Validator details
    * Beside every test case, there will be a check box which needs to be selected by the user
