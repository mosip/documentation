# Api Test Commons Releases

**Release Name**: Api Test Commons Releases

**Release version**: 1.2.1

**Release Date**: 5th August, 2024

The 1.2.1 release incorporates new features and enhancements to improve the functionality, usability, and performance of the MOSIP Functional Tests. This update addresses several critical issues to ensure a more seamless user experience.

## Major Highlights:

## New Features

1. Biometric Data Handling:

* Implemented the retrieval of biometric data from mockmds, enhancing the testing capabilities for biometric-related modules.

1. Authentication Certificates:

* Added functionality to generate authentication certificates, providing better security and compliance features.

1. Auth API Enhancements:

* Enabled running the Auth API without the dependency on authdemo services, simplifying the authentication process and reducing external dependencies.

## Enhancements

1. Report Generation:

* Enhanced the reporting module to provide more detailed and comprehensive reports, improving the visibility and traceability of test results.

## Pre-requisites

Ensure the following software is installed on the machine from where the automation tests will be executed:

* Java 11
* Maven 3.6.0 or higher
* Lombok (Refer to[ Lombok Project](https://projectlombok.org/))

#### For Windows

* Git Bash 2.18.0 or higher
* settings.xml needs to be present in the .m2 folder.

#### For Linux

* settings.xml file needs to be present in two places:
* Regular Maven conf folder
* Copy the same settings.xml under /usr/local/maven/conf

#### Access Test Automation Code

**1. From Browser**

1. Clone or download the repository as a zip file from[ GitHub](https://github.com/mosip/mosip-functional-tests).
2. Unzip the contents.
3. Continue with the steps below from a terminal (Linux) or command prompt (Windows).

**2. From Git Bash**

1. Copy the git link:  https://github.com/mosip/mosip-functional-tests
2. On your local system, open Git Bash at any location.
3. Run the following command:\
   sh git clone [https://github.com/mosip/mosip-functional-tests](https://github.com/mosip/mosip-functional-tests)

**Build Test Automation Code**

1. Navigate to the apitest-commons directory:\
   sh cd ../apitest-commons
2. Build the project:\
   sh mvn clean install -Dgpg.skip=true -Dmaven.gitcommitid.skip=true

{% hint style="info" %}
* Ensure all prerequisites are met before running the updated tests.
* Refer to the updated README file for detailed setup and execution instructions.
{% endhint %}

For any issues or further assistance, please open an issue on[ GitHub](https://github.com/mosip/mosip-functional-tests/issues).
