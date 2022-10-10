# Patch 1.2.0.1 Beta
_(Work in progress)_

## Overview

**Release Name**: 1.2.0.1 Beta1

**Release Version**: 1.2.0.1-B1

**Upgrade from**: 1.2.0 (Long Term Support)

**Support**: Developer Release

**Release Date**: 14-Oct 2022

The “1.2.0.1 Beta” release of MOSIP is the first patch release on top of the Long-Term Support (LTS) release 1.2.0. This patch release mainly contains the bug fixes, performance fixes, and minor feature updates. One of the major highlights of this patch release is the production-grade [V3 deployment](https://docs.mosip.io/1.2.0/deployment).

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

## Partner Management Services

* Bug fix: In PMP UI, the error message logo was missing. As a fix, error icon was added throughout the application. #MOSIP-19976
* Bug fix: In FTM details menu button, the name was "create device" instead of "create FTM". As a fix, the name of the button of resource bundle was modified to _create FTM_ instead of _create device_. #MOSIP-19918
* Bug fix: In PMP UI, filter labels were not pointing to logged in language. As a fix, support was added to display label in multi language. #MOSIP-19639
* Bug fix: In PMP UI, filter columns for partner menu was not proper. As a fix, the display label was modified. #MOSIP-19414
* Bug fix: In PMP UI, user was allowed to create SBI details without mandatory details. After the fix, without mandatory details, SBI creation is not allowed. #MOSIP-17562
* Bug fix: In FTM details page, the status should be approve/reject instead of active/de-active. After the fix, approve/reject labels were updated. #MOSIP-19823
* Bug fix: In PMP UI, the partner could be mapped to the same policy twice. After the fix, one partner can only be mapped to one policy. #MOSIP-19773
* Bugfix: In PMP UI, when a partner is registering themselves, the partner Id should be one single word with no space. After the fix, partner Id was not allowed to be created with space. #MOSIP-19404
* Bug fix: In PMP UI, partial search was not working. After the fix, partial search was working with asterisk(*). #MOISIP-19347
* Bug fix: In PMP UI, the partner admin should not be allowed to change the SBI details and FTM details after it was approved. After the fix, the SBI details and FTM details were made uneditable. #MOSIP-19309
* Bug fix: In PMP UI, the expected error message when the SBI details are added to the pending status device details was "Device details are not yet updated" instead "Device details does not exist" was seen. As a fix, label was updated. #MOSIP-19306
* Bug fix: In PMP UI, _Search_ box was case sensitive in partner policy mapping. After the fix, the _Search_ was made to be case insensitive. #MOSIP-19289
* Bug fix: In PMP UI, if a partner tries to register using an email which already exists, instead of displaying "email already registered", it was showing a blank page. After the fix, it was correctly showing the message. #MOSIP-19277

### Pre-registration 

* Bug fix: Cancel application mails from pre-registration were not being sent and email templates were not being fetched from correct template type code. After the fix, the mail contents were fetched from respective templates and cancel mails were duly sent. #MOSIP-18192
* Performance fix: Booking Slots were missing for many centers in cellbox2 env. As a fix, a code change was done in Batch Job to call master data API with sorting by "ID" instead of "createdDateTime". #MOSIP-19942
* Security_fix: The attacker could potentially see the files from the application or system. Using this, attackers can access other files as well. To mitigate the risk, the URL should not allow path manipulation. The "accept known good" input validation strategy was put in place. Also, a whitelist of acceptable inputs that strictly conforms to specifications was used. #MOSIP-14246
* Bug_fix: When a center was created without selecting lunch hours, at the center selection page it was showing lunch time as 12:00 AM to 12:00 AM. As a code fix,  a condition "if lunchStartTime!= lunchEndTime" was put in place. #MOSIP-18985




