# User Guide

This guide will help the partners in using the Compliance Took Kit portal.

Below are simple steps to use this portal:

1. The partners using the compliance tool kit should be registered partners in the system.
2. Login into CTK with the same credentials.
3. Partner can also select their preferred language while logging-in.
4. Create a project of type SBI / SDK / ABIS.
5. Create a collection by selecting the test cases that you want to test.
6. Provide the necessary details to connect to your device / SDK / ABIS service.
7. Execute the Test Run by running the collection.
8. For executing each test case, follow the instructions on the screen.
9. Once the entire collection is run, the results of the number of test cases passed or failed will be displayed.
10. You can see all the Test Run details as well. For example, the request sent to SBI, the response received from SBI, validations performed on the response and the result.
11. Test runs previously executed will be available in the Test Run history.
12. More collections can be created as per the test cases required.

{% embed url="https://www.youtube.com/playlist?list=PLJH-POb_55z8YYS_qAk_QNBQeiQ2VrtZD" %}

## Login

The partners using the compliance tool kit should be registered in the system. Registered partners can log in to the compliance tool kit with the same credentials as they used to register themselves into the [Partner Management Portal](https://docs.mosip.io/1.2.0/modules/partner-management-services/partner-management-portal).

The partner needs to enter the registered username or e-mail and password to log in.

The partner can select the language of their preference from the dropdown in the top-right corner of the screen. Thereafter, the application is displayed in the selected language. By default, CTK supports the following languages:

* English
* French
* Arabic

![CTK login page](\_images/ctk-toolkit-login.png)

## Dashboards

Once the partner logs into the compliance tool kit, they can view the `Project Dashboard` by default and would have the option to view the `Biometric Data Dashboard` and `My Reports Dashboard` as well.

* `Project`: A project is a module that the partner wants to test. For example, if a device partner has developed a new version of their SBI for the fingerprint slap device, then, they can create a project in the compliance tool kit to verify this version of SBI.

![CTK Project Dashboard](\_images/ctk-toolkit-dashboard.png)

* `Biometric Data`: As a part of the CTK, there is an option for the partner to upload their test data which can be used to verify the partner’s software. Currently, in MOSIP, we can upload test data for an SDK and ABIS.

![CTK Biometric Data](\_images/ctk-toolkit-biometric-data.png)

* `My Reports`: Partners of CTK will be able to view the reports that they have submitted for review as well as the status of those reports.

![CTK My Reports](\_images/ctk-toolkit-myreport.png)

## Project dashboard

Below are the possible activities as part of the Project Dashboard.

* View all the projects on the dashboard
* Create a new project
* View a specific project
* Archive a project
* Move to the biometric data dashboard

Let us go through each of them in detail.

### View projects

Once the partner logs into the compliance tool kit, they can view all the existing projects in the dashboard.

The project dashboard will display the following attributes of a project:

* Name of the project
* Project Type
* Total number of collections in the project
* Creation date and time of the project
* Last time a collection in the project was run
* Status of the last run on the project

![CTK Project Dashboard](\_images/ctk-toolkit-projectdashboard.png)

The filter option in the dashboard will filter based on the name of the project, project type and the creation date and time.

![CTK filter](\_images/ctk-toolkit-filter.png)

### Create a project

* On the Projects Dashboard, select the `+Add Project` button.
* The page will redirect the partner to the ‘Add a new Project’ page as shown below.

![CTK create a Project](\_images/ctk-toolkit-create-project.png)

* Enter a unique Project Name and select the Project Type. Currently, MOSIP supports three types of projects: SBI, SDK and ABIS
* Based on the project type selected, the partner needs to enter the mandatory configurations before saving the project.
* When the project type selected is SBI, the partner needs to provide/select the below configurations:
  * _Spec Version_: MOSIP SBI specification for which the SBI is built
  * _Purpose_: The purpose of the device
  * _Device Type_: The type of device
  * _Device SubType_: The Subtype of the device
  * _SBI Hash_: Encoded hash of SBI installation file
  * _Website URL_: Partner website URL
  * _Device Images_: The image of the device

| Purpose        | Device Type | Device SubType |
| -------------- | ----------- | -------------- |
| Registration   | Iris        | Double         |
| Registration   | Iris        | Single         |
| Registration   | Face        | Full Face      |
| Authentication | Finger      | Single         |
| Authentication | Finger      | Touchless      |
| Authentication | Iris        | Single         |
| Authentication | Iris        | Double         |
| Authentication | Face        | Full Face      |

![](\_images/ctk-toolkit-create-sbi-project.png)

* When the project type selected is SDK, the partner needs to provide the below configurations:
  * Base URL: URL where the SDK is deployed
  * Spec Version: MOSIP SDK specification for which the SDK is built
  * Purpose: Purpose of the SDK
  * _SDK Hash_: Encoded hash of SDK installation file
  * _Website URL_: Partner website URL
  * Test Data: Input data needed for the run

![](\_images/ctk-creating-sdk-project.png)

* When the project type selected is ABIS, the partner needs to provide the below configurations:
  * Active MQ URL: URL where the ABIS is deployed
  * Modality: Combinations of different modality
  * Username: Username of Active MQ URL
  * Password: Password of Active MQ URL
  * Request Queue Name: Outbound Queue Name
  * Response Queue Name: Inbound Queue Name
  * Spec Version: MOSIP ABIS specification for which the ABIS is built
  * _ABIS Hash_: Encoded hash of ABIS installation file
  * _Website URL_: Partner website URL
  * Test Data: Input data needed for the run

_Note_: ABIS partner can only create ABIS project.

![](\_images/ctk-creating-abis-project.png)

* After entering data, partners can click `Save Project`. Popup ask's partner to confirm the hash value and website URL before proceeding. Click on the `Save` again to confirm if values are correct.

![](\_images/ctk-hash-verification.png)

* Once the project is saved, a successful message is displayed and a popup appears on the screen which when closed redirects the partner to the project dashboard (home).

![](\_images/ctk-sdk-project-created.png)

Possible values for the Purpose attribute in SDK are:

* Matcher
* Check Quality
* Extract Template
* Convert Format

### Download Encryption Key

* Once the project is created by the partner, they can download the **encryption key**.
* Partner can download encryption key for **Auth** devices.

![](\_images/ctk-encryptionkey.png)

### View a specific project

Details of a specific project can be viewed

* By clicking on the name of the project, or,
* By clicking on the option `View` in the options section of the project row.

![](\_images/ctk-view-specifi-project.png)

Once you click on the above-mentioned link, you will be redirected to the project details page of the specific project.

### Move to the biometric data dashboard

* Click on the `Biometric Data` button on the projects dashboard screen.
* The partner will now navigate to the Biometric Test Data screen where they can add multiple biometric test data files.

## Biometric data dashboard

Possible activities as a part of the Biometric Data Dashboard are:

* View all the biometric data collected on the dashboard
* Upload new biometric data
* Download biometric data
* Delete biometric data
* Move to the project dashboard

### View all the biometric data

To view the biometric test data collection, click on `Biometric Data` on the Dashboard.

The biometric data dashboard should display the below attributes of a biometric data

* Name of the biometric data
* Type of data
* Purpose of the data
* The file name of the data
* Creation date and time of the biometric data

![](\_images/ctk-biometric-data-collected.png)

Filter in the dashboard should be able to perform filter based on the name of the biometric data, type, purpose and creation date and time.

![](\_images/ctk-filter-bio-data.png)

### Upload new biometric data

* On the `Biometric Test Data` page, click `+Add Biometric data`, it redirects the partner to the `Upload Biometrics Test Data` screen.
* Provide a unique name for the biometric data
* Based on the type selected, the partner needs to enter the respective mandatory details before saving the biometric data.
* When the project type SDK is selected, the partner needs to provide the below details:
  * Purpose: The purpose of the test (SDK test type)
  * Test Data: The test data is to be uploaded as a ZIP
* When the project type ABIS is selected, the partner needs to provide the below details:
  * Test Data: The test data is to be uploaded as a ZIP

The Test Data section has two options `Browse` and `Download Sample File`.

The `Browse` button will be the file explorer in the system for the partner to select the test data ZIP to be uploaded.

The `Download Sample File` button will download a blank ZIP file with instructions in the README of the test case so that the partner can prepare and add biometric test data.

![](\_images/ctk-upload-bio-data.png)

### Download test data

* Once the test data is uploaded to the server it can be downloaded by the partner,
  * Clicking on the name of the biometric data in the biometric data, or,
  * Clicking on the `Download Zip` in the options menu of the biometric data.

![](\_images/ctk-dowload-testdata.png)

### My Reports Dashboard

In this dashboard, users have the capability to view reports that have been submitted for review and they can download the submitted reports and check the current status of submiited report, providing a streamlined and efficient way to manage their submissions.

The My Reports Dashboard will display the following attributes of a report:

* Project Type
* Name of the project
* Comments added by user while submitting report
* Date when report was submitted
* Date when report was approved/rejected
* Comments of reviewer
* Download or view the report document
* Current status of the report

![CTK My Report Dashboard](\_images/ctk-myReportsDashboard.png)

The filter option in the dashboard will filter based on the name of the project, project type and the creation date and time.

![CTK My Report Dashboard](\_images/ctk-myReports-filter.png)

Users have the option to click on the `Project Name`, allowing them to navigate directly to the view project dashboard for the respective project.

![CTK My Report Dashboard](\_images/ctk-myReportsDashboard.png)

Users can simply click on the `Download` button to retrieve the report submitted for the respective project.

![CTK My Report Dashboard](\_images/ctk-myReports-downloadReport.png)

## Collections

A collection is a group of test cases selected by the partner for a particular project configuration. Inside a project, they can create multiple collections based on their choice of test cases selected. As part of the collection, they can perform the below activities:

* Create a collection
* View a collection
* Run a collection
* View the run history of a collection
* Generate Draft Report for Compliance Collection
* Archive a collection

### Create a Collection

*   To create a collection for a project:

    * Navigate to the project details page by clicking on the project name or View option in the options list.

    ![](\_images/ctk-add-collection.png)

    * By default, application will create a `Compliance Collection` for the project, and it includes all the test cases that are based on project details.
    * `Quality Assessment Collection` will only be added by default for **SBI** projects, and it includes only quality assessment testcases.
    * Click on the `Add Collection` button and you will be redirected to the Add Collection screen.
* Enter a unique name for the collection.
* Select the test cases to be added to the collection
  * The test cases will be displayed in a tabular format with ID, Name, Description and Validator details.
  * Beside every test case, there will be a check box which needs to be selected by the partner.

![](\_images/ctk-create-collection.png)

* After selecting the test cases, the partner can click on the **Save Collection** button to save the collection.
* Once a collection is successfully created, there is a success popup shown and the partner is redirected to the Project details page.
* Once a collection is created it is displayed on the Collection Dashboard which is available on the Project details page.

![](\_images/ctk-collection-details.png)

**Few points to note**:

* A collection cannot be saved if no test cases are selected.
* A collection name cannot be empty, the partner needs to provide a unique collection name before saving the collection.
* Every collection row in the dashboard has the option to view the name of the collection, the number of test cases selected as a part of the collection, the creation date, the View Report, the Last Test Run and the Run history of the collection.

### View a Collection

Once the partner creates a collection, they can view the collection details by clicking on the collection name.

![](\_images/ctk-view-collection.png)

### Run an SBI Collection

* Before running a collection in SBI, the partner needs to connect to a device without which they cannot proceed with testing.
* The partner should click on the `Scan Device` button in the Collection Dashboard as shown below.

![](\_images/ctk-scan-device.png)

* This triggers a scan of all the configured ports in the system where the SBI is connected.
* If any device connected with an SBI is found, the application asks the partner to select an available port and the device for running the test.

![](\_images/ctk-scan-device-selection.png)

* If any device is not found, an error popup is displayed to the partner with an option to `Scan Again`.

![](\_images/ctk-scan-failed.png)

* Once the device is selected, the partner can click on the `Save` button.
* After the device is selected and saved in memory, the `Run` button for the collections is enabled.

![](\_images/ctk-run-button.png)

* If a device is already scanned and selected before running the collection, the partner can choose to re-scan and select another device for running the test case.
* If a device is selected, the partner can click on the `Run` button to run the test case.
* If the partner selects a Fingerprint Slap device but the collection is for a Double Iris device, then the test case is not executed. The partner will be shown an error message and asked to re-select the correct device. The combination validated here is for Purpose, Device Type and Sub Type as displayed below.

![](\_images/ctk-combination-validation.png)

* If the correct device is selected and the partner initiates the test run, the test case execution should start.
* During the test run,
  * A progress bar will be shown with the percentage of tests execution completed
  * A timer to show the time elapsed during the execution
  * Option to close or cancel the test run
  * Option to initiate capture for a test case or resume run after completing the operation.

![](\_images/ctk-test-run.png)

* The test run also shows,
  * The total test cases getting executed for that run
  * The current test case name
  * Instructions (if any) for the partner to follow
* Once the test execution is completed, the partner can see,
  * A high-level result with the number of test cases executed- with the number of test cases failed and the number of test cases passed in the run.

![](\_images/ctk-run-result.png)

* The partner can also see the time elapsed
* They can also view the detailed test run report

![](\_images/ctk-run-details.png)

### Run an SDK Collection

Before running the SDK collection, the partner can change the `Test Data`, the `Base URL` and the `SDK Hash` in the project settings

![](\_images/ctk-sdk-change-url-testdata.png)

* Click the `Run` button of the specific collection.
* The application now checks if the URL shared by the partner is accessible or not. If not accessible, the application shows an error message to the partner.

![](\_images/ctk-sdk-url-notaccessible.png)

* Once the run initiates with the proper URL, the execution should complete on its own and during the run, the partner can see:
  * A progress bar with the percentage of test execution completed.
  * A timer to show the time elapsed during the execution.
  * Option to close or cancel the test run.

![](\_images/ctk-sdk-run.png)

* Once the test execution is completed, the partner can see:
  * A high-level result with the number of test cases executed- with the number of test cases failed and the number of test cases passed in the run.
  * They can also see the time elapsed.
  * They also have the option to view the detailed `Test Run` report.

![](\_images/ctk-sdk-run-result.png)

_Note_: For a test run, the partner can select their data or MOSIP’s default data. But let us assume that the partner chooses their data, but in the ZIP file, they have missed adding data for a particular test case, then the system should take MOSIP’s data for the test case' execution.

![](\_images/ctk-testdata-selecting.png)

### Run an ABIS Collection

Before running the ABIS collection, the partner can change the `Username`, `Password`, `Queue names`, `Test Data`, `ABIS Hash` and the `Actice MQ URL` in the project settings

![](\_images/ctk-abis-change-project-settings.png)

* Click the `Run` button of the specific collection.
* Once the run initiates with the proper URL, the execution should complete on its own and during the run, the partner can see:
  * A progress bar with the percentage of test execution completed.
  * A timer to show the time elapsed during the execution.
  * Option to close or cancel the test run.

![](\_images/ctk-abis-run.png)

* Once the test execution is completed, the partner can see:
  * A high-level result with the number of test cases executed- with the number of test cases failed and the number of test cases passed in the run.
  * They can also see the time elapsed.
  * They also have the option to view the detailed `Test Run` report.

![](\_images/ctk-abis-run-result.png)

_Note_: For a test run, the partner can select their data or MOSIP’s default data. But let us assume that the partner chooses their data, but in the ZIP file, they have missed adding data for a particular test case, then the system should take MOSIP’s data for the test case' execution.

![](\_images/ctk-ABIS-testdata-selecting.png)

### View the run history of the Collection

The partner after completing a successful test run can view the detailed run by,

* Clicking on the `View Test Run` button once the test execution is completed.

![](\_images/ctk-sdk-run-result.png)

![](\_images/ctk-test-results.png)

* Clicking on the `View Last Test Run` option in the options section of the collection as shown below.

![](\_images/ctk-viewlast-testrun.png)

Once the partner selects the `View Last Test Run` option, the application will redirect the partner to display the test run details as shown.

* Clicking on the `Test Run History` option in the options section of the collection and then click on the `Details` button of the test run that they want to view

![](\_images/ctk-testrun-history.png)

Once the partner clicks on `Details`, it redirects the partner to the test details as shown above.

* On the Test Run History page, the partner can view:
  * Run date
  * Overall run status
  * Total test cases in the collection
  * Test cases passed
  * Test cases failed

The partner will be able to view the details of any test run they wish.

* On the Test Run details page, the partner can view,
  * List of the test cases in the collection
  * Test case ID
  * Test case Name
  * Status of the test case (Pass or Failed)
  * Execution status of the test case (Complete or Incomplete)
  * Option to view details of the test case
* The details of the test case contain,
  * The request that was sent
  * The response that was received
  * The detailed status of validators that ran in the test case

![](\_images/ctk-testcase-details.png)

### Generate Draft Report for Compliance Collection

The partner can only generate a Draft Report after running `Compliance Collection`.

* By default, `Compliance Collection` will be added when the project was created.

![](\_images/ctk-compliance-collection-created.png)

* Click the `Run` button of the Compliance Collection.

![](\_images/ctk-compliance-collection-run.png)

* Once the test execution is completed, the partner can see,
  * A high-level result with the number of test cases executed- with the number of test cases failed and the number of test cases passed in the run.
  * They also have the option to view the detailed `Test Run` report.

![](\_images/ctk-compliance-collection-testrun.png)

* Partner can create a Draft Report by clicking the `Generate Draft Report` button.
* Once the report is downloaded, the partner can view:
  * The downloaded draft report, which uses the project name as its filename.
  * A popup will appear to submit the report for review.

![](\_images/ctk-download-report.png)

* Partners need to check the downloaded Draft Report, which contains their details, project specifics, test cases, and the complete test run results. These results include the number of test cases executed, passed, and failed.
* After reviewing the downloaded report, the partner can submit it for review by checking the checkbox in the popup window. They can then proceed by clicking the `Send For Review` button to finalize the submission.

![](\_images/ctk-send-for-review.png)

* Once submitted the report, the `Compliance Collection` cannot be rerun for the project. The partner can download the submitted report by clicking on the download icon.

![](\_images/ctk-report-submitted.png)

## Partner Reports Dashboard

When users with the special CTK Admin role access the application, they are granted access to the Partner Reports Dashboard. This dashboard serves as a centralized hub, offering a comprehensive overview of partner reports.

![CTK Partner Report Dashboard](\_images/ctk-partnerReportsDashboard.png)

Below are the possible activities as a part of Partner Reports Tab of the Admin Dashboard.

* Explore a comprehensive list of all reports that have been submitted.
* Efficiently sort and examine reports based on their current status.
* Download and view report submitted.
* Access a preview of the project's test run associated with the submitted report.
* Take decisive action on submitted reports by either approving or rejecting them.

### View reports

Upon logging into the compliance toolkit and navigating to the Partner Reports Dashboard, the admin will be presented with a _default view_ showcasing reports submitted for review.

The Partner Reports Dashboard will display the following attributes of a report:

* Name of the partner
* Organization name to which partner belongs to.
* Type of project
* Name of the project
* Partner's comments about the report
* Date when report was submitted
* Current status of the report
* Download or view the report document.
* Access associated test runs and results.
* Approve the report.
* Reject the report.

![CTK Partner Report Dashboard](\_images/ctk-partnerReportsDashboard.png)

### Filter Reports for Efficient Navigation

The dropdown option in the tab allows you to filter reports based on their current status. There are three available options

* `Review (Default)`: Displays reports that are currently under review.
* `Approved`: Shows reports that have been approved.
* `Rejected`: Displays reports that have been rejected.

![CTK Partner Report Dashboard](\_images/ctk-partnerReports-dropdown.png)

The filter option in the dashboard will filter based on the name of the project, project type and the creation date and time.

![CTK Partner Report Dashboard](\_images/ctk-partnerReports-filter.png)

### Download reports

When you click on the download icon, the report will be downloaded. Admins can then view the downloaded report and make decisions based on the information it contains.

![CTK Partner Report Dashboard](\_images/ctk-partnerReports-downloadReport.png)

### Preview test run details

Admin can click on the `View Test Run` link to access detailed information about the test run associated with the report.

![CTK Partner Report Dashboard](\_images/ctk-partnerReportsDashboard.png)

### Approve/Reject Report

After reviewing the downloaded report and verifying its content, the admin can choose to either approve or reject the report. Optionally, comments can be added to provide additional context or feedback during the decision-making process.

![CTK Partner Report Dashboard](\_images/ctk-partnerReportsDashboard.png)

`Approve Report`: After reviewing the downloaded report, if it meets the criteria and is deemed satisfactory, the admin can proceed to click on the `Approve` button.

* After selecting the `Approve` button, a confirmation popup will be displayed to verify the approval action. Admins should review the information provided and, if satisfied, proceed by selecting the checkbox within the popup to finalize the approval.

![CTK Partner Report Dashboard](\_images/ctk-partnerReports-approvePopup.png)

* After selecting the checkbox, the admin will be presented with an option to add optional comments, if needed, after that the admin can proceed by clicking the `Approve` button to officially approve the report.

![CTK Partner Report Dashboard](\_images/ctk-partnerReports-approve.png)

`Reject Report`: After reviewing the downloaded report, if it does not meet the criteria, the admin can initiate the rejection process by clicking on the `Reject` button.

* After clicking the `Reject` button, a popup will appear to confirm the rejection action. After reviewing the information, and once satisfied with the decision, the admin can proceed by checking the checkbox within the popup to finalize the rejection.

![CTK Partner Report Dashboard](\_images/ctk-partnerReports-rejectPopup.png)

* After selecting the checkbox, the admin will be presented with a comment box to add mandatory comments, specifying the reason for rejection. After providing the required comments, the admin can proceed by clicking the `Reject` button to officially reject the report.

![CTK Partner Report Dashboard](\_images/ctk-partnerReports-reject.png)
