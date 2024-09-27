# Automation Testing

## Overview

MOSIP provides automation test repositories for the following:

* [Admin UI](https://github.com/mosip/admin-ui/tree/release-1.2.0/admintest)
* [Registration Client](https://github.com/mosip/registration-client/tree/release-1.2.0/registration/registration-test)
* [Functional Tests](https://github.com/mosip/mosip-functional-tests/tree/release-1.2.0)
* [Automation Tests](https://github.com/mosip/mosip-automation-tests/tree/release-1.2.0)

### Admin UI

Selenium webdriver-based Admin Portal Automation covers CRUD (create, read, update and delete) operation performed via UI with Chrome driver.

### Registration Client

Registration test automation covers these flows: New, Update, Correction, and Lost flows.

To know more about each, click [here](../id-lifecycle-management/).

### Functional Tests

This repository contains API automation tests. The automation is written using Java REST Assured and TestNG framework. The following modules are covered:

1. Pre-registration
2. Masterdata
3. Partner Management
4. ID Repository
5. IDA
6. Resident

Functional tests support multi-languages, i.e., the input can be provided in any of the languages configured in a given MOSIP installation.

### Automation Tests

This repository contains a test framework for end-to-end testing of MOSIP functionality. The following functionalities are covered:

* Registration
* Pre-registration + Registration
* Authentication
