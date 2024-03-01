# UI Test Rig Automation

## Introduction

The UI test rig is a comprehensive automation framework designed to validate the functionality and user interface of various modules within web-based applications. This robust framework encompasses modules tailored for specific functionalities, ensuring thorough testing and validation of essential components. Below are the modules covered:

1. **AdminUI**: Admin Service module facilitates the creation of machines and performs user, center, and device mapping. Additionally, it supports master data bulk upload and retrieval of lost RIDs.
2. **PMPUI (Partner Management Services)**: PMPUI is a web-based UI application offering services for partner onboarding and management. It includes functionalities for Partner Management Service and Policy Management Service.
3. **ResidentUI**: Resident service is a web-based UI application that enables users to perform various operations related to their UINs / VIDs. Users can utilize these services to view, update, manage, and share their data. Additionally, they can report issues in case of grievances.

## Execution Components

**Test Script**

* **Description**: The test script is the Java code that defines the steps and actions to be executed during the UI automation.
* **Implementation**: Written in Java, it utilizes Selenium WebDriver commands to interact with the web elements of the application.

**Selenium WebDriver**

* **Description**: The core component of Selenium that provides a programming interface for interacting with web browsers.
* **Implementation**: Instantiate WebDriver (for example, ``ChromeDriver``, ``FirefoxDriver``) to control the browser and navigate through the application.

**Test Data**

* **Description**: Input data required for the test, such as login credentials, file paths for document upload, or any other data necessary for the test scenario.
* **Implementation**: Defined in the test script or loaded from the external sources like kernel files.

**Logging and Reporting**

* **Description**: Capture and log relevant information during the execution for debugging and reporting purposes.
* **Implementation**: Utilize logging frameworks (for example, ``Log4j``) and generate test reports (for example, ``TestNG`` ).

## Execution Flow

   **Setup Phase**

   * **Initialize WebDriver**: Set up the Selenium WebDriver by instantiating the appropriate browser driver (for example, ChromeDriver).
   * **Navigate to URL**: Open the browser and navigate to the URL of the document-based application.
   
 **Test Execution Phase**

 * **User Authentication (if required)**: If the application requires login, provide the necessary credentials using Selenium commands.
 * **Interact with UI Elements**: Use WebDriver commands to locate and interact with UI elements (for example, buttons, input fields, dropdowns).
 * **Perform Actions**: Execute actions such as uploading and downloading documents, entering data, or triggering events.
 * **Data Validation**: Implement assertions to validate that the application behaves as expected.

## Local Execution:

**Clone Repository**

* **AdminUI**: Clone the repository from [Admin UI](https://github.com/mosip/admin-ui).
* **ResidentUI**: Clone the repository from [Resident UI](https://github.com/mosip/resident-ui).
* **PMPUI**: Clone the repository from [Partner Management Portal](https://github.com/mosip/%20partner-management-portal).

## Configure Properties

   Navigate to the cloned repository directory.
   * Navigate to the directory of the cloned repository.
   * Update the properties file with the following changes:
     * Verify that the client ID and secret key are accurately configured for the target environment.
     * Confirm the existence of the 'globaladmin' user in the Database.
     * Ensure all VM arguments mentioned above are correctly passed and executed.  
   * Update the kernel.properties file with the correct values for the client ID and secret key.
   * Configure environment-specific secret keys in the Kernel.properties file located at: [Kernel.properties](https://github.com/mosip/mosip-automation-tests/blob/develop/mosip-acceptance-tests/ivv-orchestrator/src/main/resources/config/Kernel.properties)
   * Set environment variables for each unique URL corresponding to different environments (for example, development, test, production).

## Execution from docker

**Setup**
For the docker setup of uitestrig we need to deploy uitestrig in a docker then we can directly run it using 
   RUN button then after execution we will get report in uitestrig folder in minio.

## Pre-requisite data

   **Application and URL Information**
   
   * **Application URL**: Ensure you have the correct URL of the application under test. This is crucial for navigating to 
         the relevant web page during test execution. The application URL is sourced from ``kernel.properties``.
   * **Login Credentials**: If the application necessitates authentication, ensure you possess valid login credentials for 
       testing purposes. During test execution, user accounts are created to facilitate login credential management.
     
  **Test Data**
   
   * **Positive Test Data**: Positive test data is generated dynamically during the execution of uitestrig via APIs.
   * **Document Files (if applicable)**: If your automation includes document uploads or downloads, ensure you have sample document files (e.g., PDFs, Word documents) prepared for testing purposes. These files will be utilized during the testing process.
     
## Configuration and Properties

   * **Configuration Files**: Ensure all necessary configuration files for your project are prepared. These files may include browser configurations, test environment settings, or other parameters essential for the execution of your tests.
   * **Environment Variables**: Consider utilizing environment variables if your application URL or other settings vary across different environments. This approach provides flexibility and allows for easier management of environment-specific configurations during testing.

## Analyse the report

   1. **Generate TestNG Reports**: Ensure your Selenium and Java project is configured to generate TestNG reports. Utilize build automation tools like Maven or Gradle to execute tests and automatically generate TestNG reports.
   2. **Locate the TestNG Reports**: After test execution, locate the TestNG reports directory. Typically, TestNG generates HTML reports in the testng-report or uitestrig directory within your project's directory structure.
   3. **Reviewing TestNG HTML Reports**:
        * **Overview Page**: Open the index.html or emailable-report.html file to access the test suite overview. Look for 
          summary information such as total tests run, passed, failed, and skipped.
        * **Suite Information**: Navigate to the "Suite" section to examine details about individual test suites, including 
          start and end times.
        * **Test Information**: Check the "Tests" section for detailed information about each test, including start and end times, test duration, and a summary of passed, failed, and skipped methods.
        * **Methods Information**: Explore the "Methods" section to obtain detailed information about each test method. This includes the class name, method name, description, status (pass/fail/skip), and time taken.
        * **Logs and Output**: TestNG reports often include logs and output links. These contain additional information about test execution, such as console logs, error messages, or stack traces.
   4. **Analyzing Failed Tests**:
      
      * **Failed Tests Section**: Focus on the "Failed tests" section within the TestNG report. Here, you'll find detailed information about the failed tests, including the class name, method name, and the reason for the failure. This section provides a concise overview of which tests encountered issues during execution.
      * **Screenshots**: Uitestrig  framework captures screenshots on test failure. Analyzing screenshots can help identify UI rendering problems, layout issues, or unexpected behaviour that may not be evident from the test logs alone.

## Automate a new UI flow

To automate a new UI flow for the three modules (AdminUI, PMPUI, and ResidentUI), you can follow these steps:

1. **Understand the New Flow**:
   
   * **Requirement Analysis**: Thoroughly review the documentation, user stories, or specifications related to the new functionality to gain a clear understanding of the flow.
   * **Test Scenarios**: Identify specific test scenarios for each module's UI flow. Break down the flow into individual steps that can be automated.
   
2. **Design Test Cases**:
   * **Test Case Definition**: Define test cases for each identified scenario, outlining the expected behaviour, input data, and verification points.
   * **Use Page Object Model (POM)**: Implement the Page Object Model to structure your automation framework. Create separate classes representing each page or component within the modules
3. **Write Automation Scripts**:
   * **Script Structure**: Write automation scripts using Java and Selenium WebDriver, following a modular and maintainable structure.
   * **Implement Test Cases**: Translate the defined test cases into executable scripts. Utilize Selenium WebDriver commands to interact with web elements, perform actions, and validate the expected behavior.
  
For each module (AdminUI, PMPUI, and ResidentUI), create separate sets of automation scripts that cover the identified test scenarios. Each script should focus on a specific test case, interacting with the respective UI elements and validating the expected outcomes.

Utilize the Page Object Model to encapsulate the interaction with web elements within separate page classes. This approach enhances maintainability and reusability of your automation scripts by separating the UI logic from the test scripts.

Lastly, ensure thorough testing and validation of the implemented automation scripts to verify the accuracy and reliability of the automated UI flows for each module

This documentation provides comprehensive guidance for utilizing and expanding the UI Test Rig functionalities effectively.
