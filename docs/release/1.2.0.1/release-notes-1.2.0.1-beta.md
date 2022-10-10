# Patch 1.2.0.1 Beta
_(Work in progress)_

## Overview

**Release Name**: 1.2.0.1 Beta1

**Release Version**: 1.2.0.1-B1

**Upgrade from**: 1.2.0 (Long Trm Support)

**Support**: Developer Release

**Release Date**: 14-Oct 2022

The “1.2.0.1 Beta” release of MOSIP is the first patch release on top of the Long-Term Support (LTS) release 1.2.0. This patch release mainly contains the bug fixes, performance fixes, and feature upgrades. One of the major highlights of this patch release is the V3 deployment.

## Repository Released

| **Repositories** | **Tags Released** |
|------------------|-------------------|
| audit-manager | [v1.2.0.1-B1](https://github.com/mosip/admin-services/tree/v1.1.5.3) |
| Keymanager | [v1.2.0.1-B1](https://github.com/mosip/audit-manager/tree/v1.1.5.6) |
| khazana | [v1.1.5.5](https://github.com/mosip/keymanager/tree/v1.1.5.5) |
| packet-manager | [v1.1.5.4](https://github.com/mosip/khazana/tree/v1.1.5.4) |
| admin-services | [v1.1.5.5](https://github.com/mosip/packet-manager/tree/v1.1.5.5) |
| id-repository | [v1.1.5.5](https://github.com/mosip/commons/tree/v1.1.5.5) |
| pre-registration | [v1.1.5.5](https://github.com/mosip/mosip-openid-bridge/tree/v1.1.5.5) |
| id-authentication | [v1.1.5.3](https://github.com/mosip/durian/tree/v1.1.5.3) |
| registration | [v1.1.5.3](https://github.com/mosip/websub/tree/v1.1.5.3) |
| resident-services | [v1.1.5.3](https://github.com/mosip/pre-registration-ui/tree/v1.1.5.3) |
| admin-ui | [v1.1.5.3](https://github.com/mosip/pre-registration/tree/v1.1.5.3) |
| registration-client | [v1.1.5.5](https://github.com/mosip/mosip-ref-impl/tree/v1.1.5.5) |
| partner-management-services | [v1.1.5.5](https://github.com/mosip/registration-client/tree/v1.1.5.5) |
| mosip-config | [v1.1.5.6](https://github.com/mosip/registration/tree/v1.1.5.6) |
| print | [v1.1.5.5](https://github.com/mosip/id-repository/tree/v1.1.5.5) |
| websub | [v1.1.5.4](https://github.com/mosip/partner-management-services/tree/v1.1.5.4) |
| durian | [v1.1.5.5](https://github.com/mosip/id-authentication/tree/v1.1.5.5) |
| partner-management-portal | [v1.1.5.3](https://github.com/mosip/resident-services/tree/v1.1.5.3) |
| mosip-ref-impl | [v1.1.5.3](https://github.com/mosip/print/tree/v1.1.5.3) |
| artifactory-ref-impl | [v1.1.5.5](https://github.com/mosip/artifactory-ref-impl/tree/v1.1.5.5) |
| reporting | [v1.1.5.5](https://github.com/mosip/mosip-infra/tree/v1.1.5.5) |
| mosip-functional-tests | [v1.1.5.4](https://github.com/mosip/mosip-config/tree/v1.1.5.4) |
| mosip-automation-tests | [v1.1.5.3](https://github.com/mosip/resident-services/tree/v1.1.5.3) |
| keycloak | [v1.1.5.3](https://github.com/mosip/print/tree/v1.1.5.3) |
| biosdk-services | [v1.1.5.5](https://github.com/mosip/artifactory-ref-impl/tree/v1.1.5.5) |
| biosdk-client | [v1.1.5.5](https://github.com/mosip/mosip-infra/tree/v1.1.5.5) |
| mosip-infra | [v1.1.5.4](https://github.com/mosip/mosip-config/tree/v1.1.5.4) |
| mosip-helm | [v1.1.5.4](https://github.com/mosip/mosip-config/tree/v1.1.5.4) |
| mosip-file-server | [v1.1.5.4](https://github.com/mosip/mosip-config/tree/v1.1.5.4) |
| postgres-init | [v1.1.5.4](https://github.com/mosip/mosip-config/tree/v1.1.5.4) |
| mimoto | [v1.1.5.4](https://github.com/mosip/mosip-config/tree/v1.1.5.4) |

## Modules

### Commons

* Bug fix: Filter search was not working for the user zone and center mapping page. This error was because keycloak expected two different values for first name and last name and none of it should be null. As a fix, changes were made in keycloak. #MOSIP-18973

### Administration

* Bug fix: In the admin UI, there was a restriction on the number of drop-downs as it was hardcoded and hence it wasn’t flexible. As a fix, the property-filterValueMaxCount:{"default":${mosip.kernel.filtervalue.max_columns},"registrationcenters":50,"locations":100} was added which has the ability to configure the number of items in drop-down. #MOSIP-19978
* Bug fix: Audit logs were not listed for few transactions. After the fix, audit logs were getting listed in the DB. #MOSIP-19965
* Bug_fix: In the admin portal, the cloning feature was not working. If a template had to be cloned from English to Arabic, on Arabic login, it displayed _template not found_ error even though template was present. This issue has been fixed and cloning feature is now working. #MOSIP-19935
* Bug fix: User zone and center mapping column sort was not working as expected. As a fix, sorting for logical column was removed. #MOSIP-19934
* Bug fix: For bulk upload, the event Id in audit log was incorrectly being captured. After the fix, the audit logs displayed the expected event Id. #MOSIP-19841
*	Bug fix: In admin portal, when the center is inactive, the user should still be able to change the zone. After the fix, user was able to change the zone with an inactive center. #MOSIP-19817
*	Bug fix: In admin portal, for an active center, when a device was created in that center, on editing the device, it did not display the expected values (it was blank). After the fix, the device details are visible in edit mode. #MOSIP-19806
*	Bug fix: In Arabic language, on selecting the location on 1st level of hierarchy, the value in 3rd level of hierarchy was being populated. After the fix, the value of only 2nd level of hierarchy is populated on selecting the location on 1st level of hierarchy. #MOSIP-19699
*	Bug fix: In admin portal, when the status of a language dependant masterdata was changed or if it was decommissioned, in a particular language, it was expected to be reflecting in other languages as well. After the fix, it was reflecting in Arabic language as well. #MOSIP-19652
*	Bug fix: For language dependant masterdata, both the code and lang_code should have primary_key_constraint so that one is able to have same code in different languages. As a fix primary_key_constraint was added. #MOSIP-18682
*	Bug fix: Failure/Error messages are displayed with "!". In case of failures and errors, the exclamation symbol from the end of the text was removed to fix the issue.#MOSIP-18658
*	Bug fix: In the existing dynamic field, the "name" and "description" field were editable. After the bug fix, those were made to be non-editable. #MOSIP-18589
*	Bug fix: In the admin portal, when one adds values under an existing dynamic field, the description of that value should be pre-filled with the data in the existing dynamic field. After the fix, the description was auto-filled as expected. #MOSIP-18584
*	Feature upgrade: While creating dynamic field, initally, we used to input the data as dataType and now it is entered as text field. #MOSIP-16855
*	Bug fix: In admin portal, the pagination options were displayed in "English" language by default instead of the logged-in language. After the fix, pagination was displayed in the logged-in language.#MOSIP-16382
*	Bug fix: In admin module, <br> tags were visible in the UI. After the fix, <br> tags were removed from the UI. #MOSIP-19979
*	Bug fix: The audit logs were being logged in with incorrect event messages. As a fix, static audit logs were updated to fix the event messages. #MOSIP-19966
*	Bug fix: In admin module, packet upload was failing. As a fix, data-read role was assigned to the user. #MOSIP-19818
*	Bug fix: In Admin module, one was able to map Machine and Device to different Center ID which does not belong to that zone. As a fix, a validation was put in place to check if the center ID belongs to the given Zone or not. #MOSIP-19724

### Registration Client

* Bug fix: Crop and Delete option was not working in Scan document window. After the fix, it was possible to perform the crop and delete action. #MOSIP-19431
*	Bug fix: Capture Time not displaying in Supervisor/Operator Biometric screen in Registration Client. The “Capture Time” label is removed from UI. #MOSIP-18720
*	Bug fix: In Registration Client, ""/"" Symbol is displaying before all Registration tasks. Removed slash before the registration tasks to fix the issue.
#MOSIP-18649"
*	Bug fix: UI should be refactored with RTL support when logged in Arabic language, after fixing the issue, able to see all the pages in RTL format when logged in Arabic. #MOSIP-18641
*	Bug fix: In Registration Client, the biometric correction label was overlapping with the consent screen. As a fix, wrap text was enabled on label. #MOSIP-18077




