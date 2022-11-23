# COMPLIANCE TOOL KIT USER GUIDE

## LOGIN

The partners using the compliance tool kit should be registered in the system. Registered partners can login into the compliance tool kit with the same credentials as they used to register themselves into the partner management portal.

The partner needs to enter the Username/ email and Password.

<image>

## DASHBOARDS
  
Once the user logs into the compliance tool kit, they can view the Project dashboard by default and would have the option to view the Biometric data dashboard as well.
 
* Project: A project is a module that the partner wants to test. For example, if a device partner has developed a new version of his/her SBI for their fingerprint slap device, then, they can create a project in the compliance tool kit to verify this version of SBI.  

* Biometric Data: As part of the compliance tool kit, we provide an option for the partner to upload their test data which can be used to verify the partner’s software. Currently, in MOSIP, we can upload test data for an SDK or an ABIS.
  
<image>

## PROJECT DASHBOARD
  
Below are the possible activities as part of the Project Dashboard.

* View all the projects on the dashboard
* Create a new project
* View a specific project
* Archive a project
* Move to the Biometric data dashboard
  
Let us go through each of them in detail.
  
### VIEW PROJECTS
  
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
   
 ### CREATE PROJECTS
   
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
