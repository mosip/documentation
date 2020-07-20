This document contains the bugs that were fixed as part of MOSIP 1.1 release.


JIRA ID | Summary | Module
--------|---------|-------
[MOSIP-7900](https://mosip.atlassian.net/browse/MOSIP-7900) | Kernel services are not working as kernel-masterdata-service pods are in CrashLoopBackOff | Commons
[MOSIP-7830](https://mosip.atlassian.net/browse/MOSIP-7830) | Unable to Sync Data using the role "Default" | Commons
[MOSIP-7391](https://mosip.atlassian.net/browse/MOSIP-7391) | Processing are failing at Print Service stage (PDF Signature Issue) | Commons
[MOSIP-7241](https://mosip.atlassian.net/browse/MOSIP-7241) | Proxy OTP: needs to be written into the transaction table like regular OTP | Commons
[MOSIP-7160](https://mosip.atlassian.net/browse/MOSIP-7160) | ID Repository: UIN and VID number should be string | Commons
[MOSIP-1202](https://mosip.atlassian.net/browse/MOSIP-1202) | License Key APIs are giving authentication failed | Commons
[MOSIP-1183](https://mosip.atlassian.net/browse/MOSIP-1183) | Kernel Encryption & Decryption API is not working as expected | Commons
[MOSIP-787](https://mosip.atlassian.net/browse/MOSIP-787) | Valid tokens returned from TokenHandlerUtil are marked invalid when sent to Auth Manager | Commons
[MOSIP-764](https://mosip.atlassian.net/browse/MOSIP-764) | Machine History API is returning 500 response | Commons
[MOSIP-561](https://mosip.atlassian.net/browse/MOSIP-561) | Kernel services are not working as kernel-masterdata-service pods are fauling in preprod environment | Commons
[MOSIP-534](https://mosip.atlassian.net/browse/MOSIP-534) | Updated keys are not present in Key_Store table after Master Sync in Registration Client | Commons
[MOSIP-533](https://mosip.atlassian.net/browse/MOSIP-533) | Key Manager API in preprod enviornment is failing even for a single user | Commons
[MOSIP-450](https://mosip.atlassian.net/browse/MOSIP-450) | Facing issue while deploying 1.0.6-rc in sandbox | Commons
[MOSIP-369](https://mosip.atlassian.net/browse/MOSIP-369) | Unwanted properties for KeyCloak should be removed from Kernel properties file | Commons
[MOSIP-285](https://mosip.atlassian.net/browse/MOSIP-285) | Auth Manager is throwing error in Pre Registration | Commons
[MOSIP-254](https://mosip.atlassian.net/browse/MOSIP-254) | Send OTP service of Kernel is not working | Commons
[MOSIP-131](https://mosip.atlassian.net/browse/MOSIP-131) | Global Configuration Properties - Non adequate comments per parameter | Commons
[MOSIP-116](https://mosip.atlassian.net/browse/MOSIP-116) | Global Configuration Properties - Application IDs are both in DB and global file | Commons
[MOS-31325](https://mosip.atlassian.net/browse/MOS-31325) | Send OTP is failing with type cast error | Commons
[MOS-31236](https://mosip.atlassian.net/browse/MOS-31236) | Sync configuration failing for a gap of 30 mins because of which packet was not uploading | Commons
[MOS-30494](https://mosip.atlassian.net/browse/MOS-30494) | Authentication using OTP is not working as expected | Commons
[MOS-30250](https://mosip.atlassian.net/browse/MOS-30250) | Authentication should not happen for invalid type inside digital Id | Commons
[MOS-29959](https://mosip.atlassian.net/browse/MOS-29959) | Expired kernel keys are not regenerating | Commons
[MOS-29377](https://mosip.atlassian.net/browse/MOS-29377) | Registration Client is not getting response from Kernel | Commons
[MOS-28817](https://mosip.atlassian.net/browse/MOS-28817) | Token Generator failing intermittently to parse json - requesttime format | Commons
[MOS-27597](https://mosip.atlassian.net/browse/MOS-27597) | UTC Time validation for requestTime is not implemented in kernel services | Commons
[MOS-24110](https://mosip.atlassian.net/browse/MOS-24110) | Notification channel names should be standardized in Send OTP service | Commons
[MOS-24060](https://mosip.atlassian.net/browse/MOS-24060) | Kernel services are returning 500 HTTP status in some scenarios | Commons
[MOSIP-7331](https://mosip.atlassian.net/browse/MOSIP-7331) | Update Location API is not allowing actiavte and deactivate location | Administration
[MOSIP-7247](https://mosip.atlassian.net/browse/MOSIP-7247) | Unable to logout from the Upload document page | Administration
[MOSIP-1203](https://mosip.atlassian.net/browse/MOSIP-1203) | Register Device API is not working as expected | Administration
[MOSIP-1024](https://mosip.atlassian.net/browse/MOSIP-1024) | Create and Update Machine have Issues related to optional and mandatory fields | Administration
[MOSIP-1023](https://mosip.atlassian.net/browse/MOSIP-1023) | Unable to validate document in arabic language but validation is possible with english language | Administration
[MOSIP-1021](https://mosip.atlassian.net/browse/MOSIP-1021) | Create and Update Machine API is converting Machine name to lower case | Administration
[MOSIP-977](https://mosip.atlassian.net/browse/MOSIP-977) | Unable to create the registration center as throwing "ERROR: duplicate key value violates unique constraint" | Administration
[MOSIP-803](https://mosip.atlassian.net/browse/MOSIP-803) | Unable to update the details for blacklisted words getting error KER-MSD-105 | Administration
[MOSIP-598](https://mosip.atlassian.net/browse/MOSIP-598) | Getting Technical error occurred on Admin UI when login to pre-reg on another tab of browser | Administration
[MOSIP-578](https://mosip.atlassian.net/browse/MOSIP-578) | ID and Version is coming null in response of Post/Device provider API | Administration
[MOSIP-527](https://mosip.atlassian.net/browse/MOSIP-527) | Unable to work with Admin UI as the page is appearing blank | Administration
[MOSIP-489](https://mosip.atlassian.net/browse/MOSIP-489) | Device Spec Filter API is not working | Administration
[MOSIP-464](https://mosip.atlassian.net/browse/MOSIP-464) | API for registration of Device Provider is generating a random ID | Administration
[MOSIP-435](https://mosip.atlassian.net/browse/MOSIP-435) | Unable to create the Device Type in multiple languages | Administration
[MOSIP-278](https://mosip.atlassian.net/browse/MOSIP-278) | Register MDS is allowing to create a MDS with duplicate data | Administration
[MOSIP-277](https://mosip.atlassian.net/browse/MOSIP-277) | Create Device API is not handling the invalid zone code validation | Administration
[MOSIP-276](https://mosip.atlassian.net/browse/MOSIP-276) | Filter Registration Center API is not providing data based on zone | Administration
[MOSIP-237](https://mosip.atlassian.net/browse/MOSIP-237) | Update machine: wrong error message when the zone code value is sent as blank | Administration
[MOSIP-236](https://mosip.atlassian.net/browse/MOSIP-236) | Update Reg Center API:wrong error message thrown for when Exceptional Holiday Date format is invalid | Administration
[MOSIP-235](https://mosip.atlassian.net/browse/MOSIP-235) | Update Document type API: wrong error message is displayed when the value for code is sent blank. | Administration
[MOSIP-232](https://mosip.atlassian.net/browse/MOSIP-232) | Machine is not getting created when optional field is left as blank | Administration
[MOSIP-231](https://mosip.atlassian.net/browse/MOSIP-231) | Error message and code is received as blank for getLeafZones API | Administration
[MOSIP-230](https://mosip.atlassian.net/browse/MOSIP-230) | Holiday search API: Positive response is received even though sort-type field is sent with wrong value | Administration
[MOSIP-229](https://mosip.atlassian.net/browse/MOSIP-229) | Exception Holiday dates are not getting saved in the update form of a registration center | Administration
[MOSIP-213](https://mosip.atlassian.net/browse/MOSIP-213) | Decommission APIs is not updating delete time | Administration
[MOSIP-197](https://mosip.atlassian.net/browse/MOSIP-197) | Register device API is not doing many field validations | Administration
[MOSIP-196](https://mosip.atlassian.net/browse/MOSIP-196) | Register Device API is allowing to register a device with certification as L1 and without FTPId | Administration
[MOSIP-195](https://mosip.atlassian.net/browse/MOSIP-195) | Register Device API is allowing to register a device with invalid certification and purpose | Administration
[MOSIP-193](https://mosip.atlassian.net/browse/MOSIP-193) | Register Device is allowing to Register a device with invalid Timestamp | Administration
[MOSIP-120](https://mosip.atlassian.net/browse/MOSIP-120) | Center Update Error - Secondary language details to be edited getting is not updated or saved in the center | Administration
[MOSIP-39](https://mosip.atlassian.net/browse/MOSIP-39) | UX standards Issue - UI implemented has deviations when compared to the expected standards | Administration
[MOSIP-37](https://mosip.atlassian.net/browse/MOSIP-37) | Language in the Blacklisted Detail View screen is displayed wrong when the word is other than English | Administration
[MOS-31196](https://mosip.atlassian.net/browse/MOS-31196) | Able to map devices to multiple centers | Administration
[MOS-31193](https://mosip.atlassian.net/browse/MOS-31193) | Update MDS is not giving proper message in case of inValid regDType and regDSType | Administration
[MOS-31192](https://mosip.atlassian.net/browse/MOS-31192) | Register and Update FTP and MDS is not providing proper validation messages for many scenarios | Administration
[MOS-31136](https://mosip.atlassian.net/browse/MOS-31136) | Update Device provider is allowing to update a device provider to the existing device provider | Administration
[MOS-31129](https://mosip.atlassian.net/browse/MOS-31129) | When syncbyte vendor MDS version is changing and we creating pkt with this new mds, the dpid which is deviceprovideid inside the pkt is changing | Administration
[MOS-31126](https://mosip.atlassian.net/browse/MOS-31126) | Text of few of the labels in the Admin UI screens are not displayed in the language configured(French) | Administration
[MOS-31122](https://mosip.atlassian.net/browse/MOS-31122) | Exceptional Holidays added to a center is displayed as a blank field in the center detail screen | Administration
[MOS-31120](https://mosip.atlassian.net/browse/MOS-31120) | Error on click of document Type in masterdata type | Administration
[MOS-31094](https://mosip.atlassian.net/browse/MOS-31094) | Create and Update center not handling holiday location code validation | Administration
[MOS-31055](https://mosip.atlassian.net/browse/MOS-31055) | Wrong error message displayed when Fetch Execeptional Holidays for Reg center API is executed | Administration
[MOS-31054](https://mosip.atlassian.net/browse/MOS-31054) | Wrong error messages displayed when Fetch working days for Reg center ID API is executed | Administration
[MOS-31030](https://mosip.atlassian.net/browse/MOS-31030) | Create registration Center API is creating a center even if we are not passing working-Non-Working day for all days | Administration
[MOS-31012](https://mosip.atlassian.net/browse/MOS-31012) | Wrong error messages and response when Create Device API is executed | Administration
[MOS-31008](https://mosip.atlassian.net/browse/MOS-31008) | 500 Error thrown at console at server level without auditing the UI events | Administration
[MOS-31006](https://mosip.atlassian.net/browse/MOS-31006) | Update RegCenter API allowing to update a center even if it doesn't belongs to admin zone or admin's child zones | Administration
[MOS-30915](https://mosip.atlassian.net/browse/MOS-30915) | Create and update MDS is providing wrong error code and message | Administration
[MOS-30804](https://mosip.atlassian.net/browse/MOS-30804) | Zone-code value is not available in response of update-device api | Administration
[MOS-30795](https://mosip.atlassian.net/browse/MOS-30795) | Exceptional Holiday Dates already defined for the center is not visible in the Center detail screen | Administration
[MOS-30767](https://mosip.atlassian.net/browse/MOS-30767) | Field name is not displayed in the error message when request is sent in wrong format | Administration
[MOS-30766](https://mosip.atlassian.net/browse/MOS-30766) | Wrong message is displayed when code field is sent as blank | Administration
[MOS-30764](https://mosip.atlassian.net/browse/MOS-30764) | Device Validate API is not doing deviceType and deviceSubType validation against device provider | Administration
[MOS-30763](https://mosip.atlassian.net/browse/MOS-30763) | Wrong response messages are displayed for mapping registration center~machine | Administration
[MOS-30762](https://mosip.atlassian.net/browse/MOS-30762) | Wrong messages are displayed for machine~registration center responses | Administration
[MOS-30741](https://mosip.atlassian.net/browse/MOS-30741) | Error is thrown when code field is sent as blank in document type POST request body | Administration
[MOS-30730](https://mosip.atlassian.net/browse/MOS-30730) | Fetch Packet status API is giving more than one status in many stages | Administration
[MOS-30616](https://mosip.atlassian.net/browse/MOS-30616) | Update Location API is allowing to Deactivate parent location even if child location is active | Administration
[MOS-30615](https://mosip.atlassian.net/browse/MOS-30615) | Create Machine:Wrong error message is generated in response although optional field as sent as blank in the request | Administration
[MOS-30613](https://mosip.atlassian.net/browse/MOS-30613) | Create Machine:Wrong error message is generated in the response when invalid mSpec_id is sent in request | Administration
[MOS-30612](https://mosip.atlassian.net/browse/MOS-30612) | Validation failing because of extra space in response message | Administration
[MOS-30593](https://mosip.atlassian.net/browse/MOS-30593) | Wrong validation messages shown when "MAp user-Registration Center API" is executed | Administration
[MOS-30585](https://mosip.atlassian.net/browse/MOS-30585) | Wrong validation messages are displayed when "Un-Mapping the user from registration center"API is executed. | Administration
[MOS-30548](https://mosip.atlassian.net/browse/MOS-30548) | Unmapping device~registration center is providing wrong validation messages | Administration
[MOS-30516](https://mosip.atlassian.net/browse/MOS-30516) | Wrong error messages are displayed in the response from Mapdevice to Reg center API | Administration
[MOS-30455](https://mosip.atlassian.net/browse/MOS-30455) | Register MDS is providing wrong validation messages | Administration
[MOS-30422](https://mosip.atlassian.net/browse/MOS-30422) | API_Bug:Wrong error messages received as Response which do not match the messages mentioned in acceptance criteria | Administration
[MOS-30414](https://mosip.atlassian.net/browse/MOS-30414) | Decommission center API is not allowing to decommission a deactivated center | Administration
[MOS-30399](https://mosip.atlassian.net/browse/MOS-30399) | API_Bug:The values to be updated in the statuscode is not logged in the DB tables | Administration
[MOS-30397](https://mosip.atlassian.net/browse/MOS-30397) | Register FTP service is accepting id | Administration
[MOS-30395](https://mosip.atlassian.net/browse/MOS-30395) | Register Device Provider service is accepting id field in the request | Administration
[MOS-30392](https://mosip.atlassian.net/browse/MOS-30392) | "API_Bug:Device status updated Successfully" message gets displayed even after providing the existing values for a particular device code in the request. | Administration
[MOS-30381](https://mosip.atlassian.net/browse/MOS-30381) | Register and Update Device provider Api is giving the wrong validation messages | Administration
[MOS-30314](https://mosip.atlassian.net/browse/MOS-30314) | Register FTP API is not making isActive true while creation | Administration
[MOS-30305](https://mosip.atlassian.net/browse/MOS-30305) | Field length validation is not implemented in Register/Update Foundational trust provider API | Administration
[MOS-30131](https://mosip.atlassian.net/browse/MOS-30131) | Device Validate Api is providing wrong validation messages | Administration
[MOS-29980](https://mosip.atlassian.net/browse/MOS-29980) | Applying filters for Region,Province,Zone and city are cases sensitive. Filters are not getting applied if entered in upper or lowercase letters.. | Administration
[MOS-29452](https://mosip.atlassian.net/browse/MOS-29452) | Adding filters by entering special chars in any free text fields will consider it as an valid search and displays the data. | Administration
[MOS-28187](https://mosip.atlassian.net/browse/MOS-28187) | Admin services throw java exceptions for listed scenarios | Administration
[MOS-27931](https://mosip.atlassian.net/browse/MOS-27931) | Admin apis not providing proper error message | Administration
[MOSIP-7897](https://mosip.atlassian.net/browse/MOSIP-7897) | Unable to move ahead from pre-reg demographic page - shows technical error and page keeps loading | Pre Registration
[MOSIP-7804](https://mosip.atlassian.net/browse/MOSIP-7804) | Pre-registration booking service pod is in crashbackloop | Pre Registration
[MOSIP-7736](https://mosip.atlassian.net/browse/MOSIP-7736) | The version mentioned in pre-reg UI needs to be corrected | Pre Registration
[MOSIP-7731](https://mosip.atlassian.net/browse/MOSIP-7731) | If the dependent field is not filled the other field keeps on loading | Pre Registration
[MOSIP-7730](https://mosip.atlassian.net/browse/MOSIP-7730) | The non mandatory field not filled is appearing in Pre-view page | Pre Registration
[MOSIP-7728](https://mosip.atlassian.net/browse/MOSIP-7728) | The value populating under zone and city is incorrect if the province field is delete and hierarchy is changed | Pre Registration
[MOSIP-7727](https://mosip.atlassian.net/browse/MOSIP-7727) | Unable to proceed further from Demographic page when the field is made non-mandatory using Json | Pre Registration
[MOSIP-7721](https://mosip.atlassian.net/browse/MOSIP-7721) | Getting technical error after uploading document more than the size | Pre Registration
[MOSIP-7711](https://mosip.atlassian.net/browse/MOSIP-7711) | Pr-registration fully blocked with an error "Error creating bean with name 'referenceValidator'" - impacts further Pre-reg testing | Pre Registration
[MOSIP-7679](https://mosip.atlassian.net/browse/MOSIP-7679) | To hide the discard button when the application is expired | Pre Registration
[MOSIP-7450](https://mosip.atlassian.net/browse/MOSIP-7450) | The tool tip message needs to be corrected In your application page under discard button | Pre Registration
[MOSIP-7434](https://mosip.atlassian.net/browse/MOSIP-7434) | The user is getting logout when click out side the Logout confirmation popup | Pre Registration
[MOSIP-7390](https://mosip.atlassian.net/browse/MOSIP-7390) | Under preview page the document uploaded remains same when minor is changed to Adult | Pre Registration
[MOSIP-7381](https://mosip.atlassian.net/browse/MOSIP-7381) | Allignment issue with alphabets in popup notification | Pre Registration
[MOSIP-7380](https://mosip.atlassian.net/browse/MOSIP-7380) | CAPTCHA shows broken image when left ideal for a while | Pre Registration
[MOSIP-7379](https://mosip.atlassian.net/browse/MOSIP-7379) | Unable to move ahead from demographic page on click of continue | Pre Registration
[MOSIP-7354](https://mosip.atlassian.net/browse/MOSIP-7354) | The preview page does not show the value selected by Tab | Pre Registration
[MOSIP-7353](https://mosip.atlassian.net/browse/MOSIP-7353) | UI issue found under Upload Document page | Pre Registration
[MOSIP-7352](https://mosip.atlassian.net/browse/MOSIP-7352) | Getting technical error while loading the document | Pre Registration
[MOSIP-7340](https://mosip.atlassian.net/browse/MOSIP-7340) | Getting error as while trying to get OTP using SentOTP for mobile | Pre Registration
[MOSIP-7339](https://mosip.atlassian.net/browse/MOSIP-7339) | The Open days are not coming under booking appointment page when language is selected as arabic | Pre Registration
[MOSIP-7338](https://mosip.atlassian.net/browse/MOSIP-7338) | In Pre-registration email doesn't support special characters | Pre Registration
[MOSIP-7337](https://mosip.atlassian.net/browse/MOSIP-7337) | Unable to upload file size with greater than 1.5 MB | Pre Registration
[MOSIP-7329](https://mosip.atlassian.net/browse/MOSIP-7329) | The Back button is not working under Modify document page | Pre Registration
[MOSIP-7319](https://mosip.atlassian.net/browse/MOSIP-7319) | In correct behavior click on Near By Button and Navigate to next Screen | Pre Registration
[MOSIP-7318](https://mosip.atlassian.net/browse/MOSIP-7318) | CAPTCHA disappears once an email-ID is verified | Pre Registration
[MOSIP-7185](https://mosip.atlassian.net/browse/MOSIP-7185) | The demographic page become blank when you keep the application ideal for sometime and click on continue button | Pre Registration
[MOSIP-7181](https://mosip.atlassian.net/browse/MOSIP-7181) | The demographic details are deleted user navigate back to the demographic page | Pre Registration
[MOSIP-7180](https://mosip.atlassian.net/browse/MOSIP-7180) | Not receiving OTP when the language is selected as arabic | Pre Registration
[MOSIP-7178](https://mosip.atlassian.net/browse/MOSIP-7178) | The elements are not loading on the Document update page | Pre Registration
[MOSIP-7177](https://mosip.atlassian.net/browse/MOSIP-7177) | Getting popup alert when tried to select the dropdown field after filling all the fields | Pre Registration
[MOSIP-7176](https://mosip.atlassian.net/browse/MOSIP-7176) | The dropdown list keeps on loading under Demographic page | Pre Registration
[MOSIP-7173](https://mosip.atlassian.net/browse/MOSIP-7173) | No guardian details is asked in case of Minor | Pre Registration
[MOSIP-7171](https://mosip.atlassian.net/browse/MOSIP-7171) | Page is getting inactive when user enter dob as future date | Pre Registration
[MOSIP-7169](https://mosip.atlassian.net/browse/MOSIP-7169) | Unable to view the created application if clicked on Book later or confirmed booking | Pre Registration
[MOSIP-7168](https://mosip.atlassian.net/browse/MOSIP-7168) | Unable to click on modify button as its disabled under preview page | Pre Registration
[MOSIP-7167](https://mosip.atlassian.net/browse/MOSIP-7167) | The mandatory field is missing from UI | Pre Registration
[MOSIP-7166](https://mosip.atlassian.net/browse/MOSIP-7166) | Unable to create application as getting blank page | Pre Registration
[MOSIP-7165](https://mosip.atlassian.net/browse/MOSIP-7165) | Getting technical error after login in pre-reg | Pre Registration
[MOSIP-7140](https://mosip.atlassian.net/browse/MOSIP-7140) | URL for Fetch Applicant Type has changed... but not changed in Pre-Registration | Pre Registration
[MOSIP-978](https://mosip.atlassian.net/browse/MOSIP-978) | Not receiving OTP in gmail account but received on official account | Pre Registration
[MOSIP-861](https://mosip.atlassian.net/browse/MOSIP-861) | The Header is not constant under the edge browser | Pre Registration
[MOSIP-763](https://mosip.atlassian.net/browse/MOSIP-763) | Pre registration document service not starting | Pre Registration
[MOSIP-699](https://mosip.atlassian.net/browse/MOSIP-699) | Acceptance Test Rig : Pre-Reg DSL Scenario 4 - pr_updateApplication() missing in the DSL | Pre Registration
[MOSIP-541](https://mosip.atlassian.net/browse/MOSIP-541) | Blank page is displayed on Book Appointment page and user is blocked | Pre Registration
[MOSIP-525](https://mosip.atlassian.net/browse/MOSIP-525) | Unable to view the Booking on Pre-reg UI your application dash board | Pre Registration
[MOSIP-524](https://mosip.atlassian.net/browse/MOSIP-524) | Getting Technical error after logging in pre-reg | Pre Registration
[MOSIP-264](https://mosip.atlassian.net/browse/MOSIP-264) | Pre-reg- Logout API is throwing error. | Pre Registration
[MOSIP-260](https://mosip.atlassian.net/browse/MOSIP-260) | Wrong error message for keycloak realm name in capital(Ex Mosip) | Pre Registration
[MOSIP-259](https://mosip.atlassian.net/browse/MOSIP-259) | Wrong error message for master data missing in pre-rig | Pre Registration
[MOSIP-256](https://mosip.atlassian.net/browse/MOSIP-256) | Unable to login under pre-registration UI with user already present in Keycloak | Pre Registration
[MOSIP-214](https://mosip.atlassian.net/browse/MOSIP-214) | Unable to launch pre-registration application due to techincal error | Pre Registration
[MOSIP-166](https://mosip.atlassian.net/browse/MOSIP-166) | Pre-Reg UI : Screen flicker while scrolling up and down with in any page to see data in Edge browser | Pre Registration
[MOS-31243](https://mosip.atlassian.net/browse/MOS-31243) | Automation Testing - Able To Get Response Even After Invalidating The Token | Pre Registration
[MOS-31242](https://mosip.atlassian.net/browse/MOS-31242) | Automation Testing - Trigger Notification Showing Wrong Responses For Invalid Name And Pre Reg ID | Pre Registration
[MOS-31203](https://mosip.atlassian.net/browse/MOS-31203) | Automation Testing- Trigger Notification Showing wrong response for a request | Pre Registration
[MOS-31028](https://mosip.atlassian.net/browse/MOS-31028) | Unable to upload document in Pre-reg | Pre Registration
[MOS-30946](https://mosip.atlassian.net/browse/MOS-30946) | Automation Testing - Pre Registration Not Showing any response for wrong request | Pre Registration
[MOS-30643](https://mosip.atlassian.net/browse/MOS-30643) | Wrong error code returning when the user tries to access another user's demographic data (deleteDocument) | Pre Registration
[MOS-30605](https://mosip.atlassian.net/browse/MOS-30605) | Wrong version displayed on Pre-reg UI | Pre Registration
[MOS-29650](https://mosip.atlassian.net/browse/MOS-29650) | Status is not updated properly in the dashboard when individual visits the Registration Centre and consumes the appointment. | Pre Registration
[MOS-29523](https://mosip.atlassian.net/browse/MOS-29523) | Batch jobs to update expired/consumed status are not working. | Pre Registration
[MOS-26680](https://mosip.atlassian.net/browse/MOS-26680) | Navigation to dashboard is not correct from appointment confirmed page. | Pre Registration
[MOSIP-7951](https://mosip.atlassian.net/browse/MOSIP-7951) | Update UIN- Document upload is not mandate though update uin is initiated only for document update. | Resistration client
[MOSIP-7906](https://mosip.atlassian.net/browse/MOSIP-7906) | Unable to continue to registration while clicking on back button after capturing the biometrics. | Resistration client
[MOSIP-7854](https://mosip.atlassian.net/browse/MOSIP-7854) | External Camera provided by Vendor-Syncbyte is not getting detected in a certain scenario | Resistration client
[MOSIP-7851](https://mosip.atlassian.net/browse/MOSIP-7851) | Not getting notification in Dev test env | Resistration client
[MOSIP-7803](https://mosip.atlassian.net/browse/MOSIP-7803) | Documents are not fetched while fetching Pre-reg data in reg client | Resistration client
[MOSIP-7788](https://mosip.atlassian.net/browse/MOSIP-7788) | Salt Service Showing Nginx Error while doing the initial sync from reg client | Resistration client
[MOSIP-7734](https://mosip.atlassian.net/browse/MOSIP-7734) | PRID is null in meta info.json. | Resistration client
[MOSIP-7683](https://mosip.atlassian.net/browse/MOSIP-7683) | Packet Sync Failure- Invalid Request Value - requesttime (Internal Call from Reg Client to Reg Proc). | Resistration client
[MOSIP-7682](https://mosip.atlassian.net/browse/MOSIP-7682) | Unable to enter a particular date for DOB in Registration Client | Resistration client
[MOSIP-7681](https://mosip.atlassian.net/browse/MOSIP-7681) | Unable to create an adult packet in New Version of Registration Client | Resistration client
[MOSIP-7680](https://mosip.atlassian.net/browse/MOSIP-7680) | OR/SO Onboarding - Biometric screen with Iris selected screen is blank. | Resistration client
[MOSIP-7438](https://mosip.atlassian.net/browse/MOSIP-7438) | Should throw the error pop-up if the child and parent UIN are the same in Update | Resistration client
[MOSIP-7437](https://mosip.atlassian.net/browse/MOSIP-7437) | Multiple Issues in Child Update Scenario | Resistration client
[MOSIP-7436](https://mosip.atlassian.net/browse/MOSIP-7436) | Should not be continued the Child dob update if Guardian is not selected. | Resistration client
[MOSIP-7399](https://mosip.atlassian.net/browse/MOSIP-7399) | Child Packet with Parent UIN is getting failed at Demographic Verification Stage( unknown exceptions occurred null). | Resistration client
[MOSIP-7397](https://mosip.atlassian.net/browse/MOSIP-7397) | Child packet is getting failed at OSI Stage (Unable to access API resourceRPR-RCT-001 --> Unknown resource provided; nested exception is org.springframework.web.client.HttpClientErrorException: 404 ). | Resistration client
[MOSIP-7388](https://mosip.atlassian.net/browse/MOSIP-7388) | Audit - Reg-client is not sending an audit incorrect format for all registrations | Resistration client
[MOSIP-7348](https://mosip.atlassian.net/browse/MOSIP-7348) | Unable to complete onboarding since photo capture is not working. | Resistration client
[MOSIP-7336](https://mosip.atlassian.net/browse/MOSIP-7336) | Operator onboarding - Should allow photo capture during On-boarding. | Resistration client
[MOSIP-7325](https://mosip.atlassian.net/browse/MOSIP-7325) | LOST UIN packet is getting failed at the OSI stage (Unable to Find Applicant CBEFF for Adult). | Resistration client
[MOSIP-7317](https://mosip.atlassian.net/browse/MOSIP-7317) | Error while fetching Pre-reg data from reg client | Resistration client
[MOSIP-7239](https://mosip.atlassian.net/browse/MOSIP-7239) | Child/Adult packet is failing in reg proc because of wrong subtype values in the CBEFF file ( Issue is with all types of the packet). | Resistration client
[MOSIP-7238](https://mosip.atlassian.net/browse/MOSIP-7238) | Packet is not moving post OSI stage. | Resistration client
[MOSIP-7196](https://mosip.atlassian.net/browse/MOSIP-7196) | Child Packet is Failed at OSI Stage(Auth System ExceptionRPR-AUT-03 --> Request could not be processed. Please try again). | Resistration client
[MOSIP-7192](https://mosip.atlassian.net/browse/MOSIP-7192) | Capturing bio exception photo or not should not be left to the discretion of the Officer/SO. | Resistration client
[MOSIP-7170](https://mosip.atlassian.net/browse/MOSIP-7170) | "exceptionBiometrics" : [ ] is empty in id.json file, also only face capture is getting stored in packet_meta_info.json | Resistration client
[MOSIP-7164](https://mosip.atlassian.net/browse/MOSIP-7164) | Captured the exception photo as many times it is saved. | Resistration client
[MOSIP-7163](https://mosip.atlassian.net/browse/MOSIP-7163) | New Registration is displayed in Header when capturing biometrics for UIN Update or Lost UIN. | Resistration client
[MOSIP-7162](https://mosip.atlassian.net/browse/MOSIP-7162) | Onboarding Flow -Capture all biometrics should be mandated If Exceptions are not marked. | Resistration client
[MOSIP-7161](https://mosip.atlassian.net/browse/MOSIP-7161) | schema validation - The uin field should not be mandatory for new registration | Resistration client
[MOSIP-7023](https://mosip.atlassian.net/browse/MOSIP-7023) | New,Update and Lost Flow- Applicant Biometrics screen becomes blank while clicking on the Back button. | Resistration client
[MOSIP-7020](https://mosip.atlassian.net/browse/MOSIP-7020) | Update packet does not contain anything in the id.json(For Ex- UIN and Fields which are selected for update(DOB, EMAIL ETC. )). | Resistration client
[MOSIP-7011](https://mosip.atlassian.net/browse/MOSIP-7011) | Update UIN- Capturing all the biometrics are mandate to proceed further for registrations. | Resistration client
[MOSIP-7010](https://mosip.atlassian.net/browse/MOSIP-7010) | parentOrGuardianUIN structure is Invalid in ID.json (evidence packet). | Resistration client
[MOSIP-7003](https://mosip.atlassian.net/browse/MOSIP-7003) | Able to Continue to update UIN without selecting any field for an update. | Resistration client
[MOSIP-7001](https://mosip.atlassian.net/browse/MOSIP-7001) | User has taken to Parents Biometrics screen by clicking on Modify from the Registration Preview screen. | Resistration client
[MOSIP-6998](https://mosip.atlassian.net/browse/MOSIP-6998) | Registration's data is not displayed in registration preview screen /acknowledgement receipt. | Resistration client
[MOSIP-6997](https://mosip.atlassian.net/browse/MOSIP-6997) | Update UIN Flow is Broken. | Resistration client
[MOSIP-6993](https://mosip.atlassian.net/browse/MOSIP-6993) | Unable to enter PRID to fetch the Pre-Reg data. | Resistration client
[MOSIP-6991](https://mosip.atlassian.net/browse/MOSIP-6991) | Unable to launch the registration client. | Resistration client
[MOSIP-6990](https://mosip.atlassian.net/browse/MOSIP-6990) | Its is not identical that which biometirc has to caputre and which exception has to mark and how. | Resistration client
[MOSIP-6989](https://mosip.atlassian.net/browse/MOSIP-6989) | Captured Biometrics should be retained. | Resistration client
[MOSIP-6984](https://mosip.atlassian.net/browse/MOSIP-6984) | Parent Biometrics screen should come only for Child Registrations. | Resistration client
[MOSIP-6983](https://mosip.atlassian.net/browse/MOSIP-6983) | REG - REG-SCHEMA-001-->No Schema Found | Resistration client
[MOSIP-6982](https://mosip.atlassian.net/browse/MOSIP-6982) | Unable to launch registration client (REG - File 'bin\mosip-packet-manager.jar' does not existjava.io.FileNotFoundException: File 'bin\mosip-packet-manager.jar' does not exist). | Resistration client
[MOSIP-3625](https://mosip.atlassian.net/browse/MOSIP-3625) | alphanumeric email ids are not allowed to enter in the demographic screen. | Resistration client
[MOSIP-3624](https://mosip.atlassian.net/browse/MOSIP-3624) | biometric capture pages are not loaded (Fingers and Iris) | Resistration client
[MOSIP-3066](https://mosip.atlassian.net/browse/MOSIP-3066) | Update Flow- Fields are not enabled to enter the data in demographic screen. | Resistration client
[MOSIP-810](https://mosip.atlassian.net/browse/MOSIP-810) | Unable to see audit entries for Reg client | Resistration client
[MOSIP-705](https://mosip.atlassian.net/browse/MOSIP-705) | mosip.kernel.core.util.FileUtils.copyToFile() is failing in automation testRig | Resistration client
[MOSIP-526](https://mosip.atlassian.net/browse/MOSIP-526) | Authentication Failure- While approving the packet in Reg- Client | Resistration client
[MOSIP-523](https://mosip.atlassian.net/browse/MOSIP-523) | Sync failure | Resistration client
[MOSIP-522](https://mosip.atlassian.net/browse/MOSIP-522) | Intermittent - Biometrics successful capture is not displaying the success message | Resistration client
[MOSIP-511](https://mosip.atlassian.net/browse/MOSIP-511) | Hostname is case sensitive which is leading sync failure in 1.0.7 build. | Resistration client
[MOSIP-496](https://mosip.atlassian.net/browse/MOSIP-496) | Unable to login to the Reg client app due to Sync issue | Resistration client
[MOSIP-425](https://mosip.atlassian.net/browse/MOSIP-425) | Fingerprint having a low threshold should be retained and considered as attempt-1 and it should take the best of 3. | Resistration client
[MOSIP-423](https://mosip.atlassian.net/browse/MOSIP-423) | Intermittent - Sync failures | Resistration client
[MOSIP-376](https://mosip.atlassian.net/browse/MOSIP-376) | Role having registration_operator is able to do login/onboarding. | Resistration client
[MOSIP-372](https://mosip.atlassian.net/browse/MOSIP-372) | Continue button is enabled though good face image is not found. | Resistration client
[MOSIP-371](https://mosip.atlassian.net/browse/MOSIP-371) | Unable to create packet when all biometrics are marked as exception | Resistration client
[MOSIP-370](https://mosip.atlassian.net/browse/MOSIP-370) | Error with registrationPacketUploadJob in registration client logs(Build 1.0.7 Snapshot). | Resistration client
[MOSIP-359](https://mosip.atlassian.net/browse/MOSIP-359) | Unable to launch app without connecting Bio devices | Resistration client
[MOSIP-245](https://mosip.atlassian.net/browse/MOSIP-245) | Unable to login to Reg client in 1.0.7 | Resistration client
[MOSIP-227](https://mosip.atlassian.net/browse/MOSIP-227) | Running mastersync second time fails | Resistration client
[MOSIP-219](https://mosip.atlassian.net/browse/MOSIP-219) | On click of new registration reg client is showing a message "Failed message" | Resistration client
[MOSIP-206](https://mosip.atlassian.net/browse/MOSIP-206) | Intermittent - Application makes exception photo as mandatory though no exception is marked | Resistration client
[MOSIP-191](https://mosip.atlassian.net/browse/MOSIP-191) | Deployment issue - reg client launch failed | Resistration client
[MOSIP-189](https://mosip.atlassian.net/browse/MOSIP-189) | Intermittent - Unable to navigate to next section error message is displayed after successful capture of fingerprint | Resistration client
[MOSIP-186](https://mosip.atlassian.net/browse/MOSIP-186) | Intermittent - Unable to capture individual fingerprint due to sync byte service gets stopped automatically | Resistration client
[MOSIP-185](https://mosip.atlassian.net/browse/MOSIP-185) | Application fails to retrieves age from PRID when user clicks Fetch data for two consequite time in Demo screen | Resistration client
[MOSIP-184](https://mosip.atlassian.net/browse/MOSIP-184) | Sometimes even after giving valid fingerprint biometrics, the reg client is not showing active continue button | Resistration client
[MOSIP-182](https://mosip.atlassian.net/browse/MOSIP-182) | The alert message should be standardized for same kind of issue across the application | Resistration client
[MOSIP-181](https://mosip.atlassian.net/browse/MOSIP-181) | Face authentication label is displayed as "Iris Scan" in eod authentication and notification for Re-Registration | Resistration client
[MOSIP-180](https://mosip.atlassian.net/browse/MOSIP-180) | while exception biometric capture -> after capturing face bio -> after click on capture -> successfully message not shown but photo was shown backside and the popup not closing | Resistration client
[MOSIP-178](https://mosip.atlassian.net/browse/MOSIP-178) | Black listed word validation is not handled properly | Resistration client
[MOSIP-177](https://mosip.atlassian.net/browse/MOSIP-177) | New registration -> finger bio time -> don’t give finger bio -> click on capture when streaming is ON -> now give bio click on capture -> see the behavior | Resistration client
[MOSIP-175](https://mosip.atlassian.net/browse/MOSIP-175) | Application insists the officer to re-capture the iris when user navigates back from preview | Resistration client
[MOSIP-172](https://mosip.atlassian.net/browse/MOSIP-172) | Document upload screen has "Proof of Exception" as an additional optoin | Resistration client
[MOSIP-171](https://mosip.atlassian.net/browse/MOSIP-171) | SDK Issue - Operator and Supervisor auth fails | Resistration client
[MOSIP-167](https://mosip.atlassian.net/browse/MOSIP-167) | Iris authentication functionality is not working as expected | Resistration client
[MOSIP-161](https://mosip.atlassian.net/browse/MOSIP-161) | Multiple sync failures in 0.9.1 reg-client. | Resistration client
[MOSIP-160](https://mosip.atlassian.net/browse/MOSIP-160) | The application fails to restrict the user from re-capturing when the quality >threhsold for fingerprint | Resistration client
[MOSIP-159](https://mosip.atlassian.net/browse/MOSIP-159) | Parameter to turn local deduplication check On or Off not present in config for specific Biometric devices. | Resistration client
[MOSIP-158](https://mosip.atlassian.net/browse/MOSIP-158) | Clicking on continue makes the bio-metrics stream On in packet authentication screen | Resistration client
[MOSIP-157](https://mosip.atlassian.net/browse/MOSIP-157) | Unable to create a packet if Quality score is very high (Internal Error while authenticating the packet). | Resistration client
[MOSIP-156](https://mosip.atlassian.net/browse/MOSIP-156) | ID object fails to display the secondary language values when languages are same in both side | Resistration client
[MOSIP-151](https://mosip.atlassian.net/browse/MOSIP-151) | intermittently resident eod approval is failing in the supervisor auth stage and not getting eod approved | Resistration client
[MOSIP-148](https://mosip.atlassian.net/browse/MOSIP-148) | sometime while onbording first time, at the time of iris capture -> it is showing Device not available whereas syncbyte ui is showing as active | Resistration client
[MOSIP-147](https://mosip.atlassian.net/browse/MOSIP-147) | Vendor Issue - At any point in Registration Client a given Bio-metric Capture should not take more than 10 to 15 seconds | Resistration client
[MOSIP-145](https://mosip.atlassian.net/browse/MOSIP-145) | intermittently sync configuration failure message is coming while launching the reg client and master data sync is not happening as sync has failed | Resistration client
[MOSIP-144](https://mosip.atlassian.net/browse/MOSIP-144) | IRIS image captured is not visible but quality score shown is 69 - vendor issue | Resistration client
[MOSIP-143](https://mosip.atlassian.net/browse/MOSIP-143) | Fingerprint authentication takes more time for validation say around 3 minutes | Resistration client
[MOSIP-142](https://mosip.atlassian.net/browse/MOSIP-142) | The fields in secondary language gets auto populated as soon as user enters values in primary for platform version | Resistration client
[MOSIP-141](https://mosip.atlassian.net/browse/MOSIP-141) | New registration flow blocked as IRIS capture marks it as duplicate while it is not | Resistration client
[MOSIP-139](https://mosip.atlassian.net/browse/MOSIP-139) | Display issue found while marking one iris under exception | Resistration client
[MOSIP-138](https://mosip.atlassian.net/browse/MOSIP-138) | Dedupe alert message is not displayed while dedupe check is in progress | Resistration client
[MOSIP-137](https://mosip.atlassian.net/browse/MOSIP-137) | Attempts on packet authentication screen is not getting incremented when user provides invalid match | Resistration client
[MOSIP-136](https://mosip.atlassian.net/browse/MOSIP-136) | Reg packet and Reg packet status reader jobs are getting failed in manual sync | Resistration client
[MOSIP-130](https://mosip.atlassian.net/browse/MOSIP-130) | Manual software update fails in first attempt | Resistration client
[MOSIP-129](https://mosip.atlassian.net/browse/MOSIP-129) | Not able to register the device after following the steps, so using a work around | Resistration client
[MOSIP-128](https://mosip.atlassian.net/browse/MOSIP-128) | The alert message on center remap needs to be updated properly | Resistration client
[MOSIP-124](https://mosip.atlassian.net/browse/MOSIP-124) | Updating child details with a wrong parent details is not failing | Resistration client
[MOSIP-122](https://mosip.atlassian.net/browse/MOSIP-122) | Unable to capture iris after upgrading MDS to 0.9.2 | Resistration client
[MOSIP-121](https://mosip.atlassian.net/browse/MOSIP-121) | Observation on Real bio-metrics authentication | Resistration client
[MOSIP-117](https://mosip.atlassian.net/browse/MOSIP-117) | sometime when stream is starting the green light on the fingerprint device is glowing green | Resistration client
[MOSIP-111](https://mosip.atlassian.net/browse/MOSIP-111) | Face capture screen fails to do local dedupe check when the attempt is greater than 1 | Resistration client
[MOSIP-110](https://mosip.atlassian.net/browse/MOSIP-110) | Multiple sync failures in reg-client with undocumented error code KER-FSE-003 | Resistration client
[MOSIP-109](https://mosip.atlassian.net/browse/MOSIP-109) | Unable to download pre-reg ids from reg client | Resistration client
[MOSIP-108](https://mosip.atlassian.net/browse/MOSIP-108) | mosip.registration.modeofcommunation=sms doesn't work | Resistration client
[MOS-31274](https://mosip.atlassian.net/browse/MOS-31274) | Remove Parent/Guardian Exception Photo Label | Resistration client
[MOS-31266](https://mosip.atlassian.net/browse/MOS-31266) | The Continue button in fingerprint capture is not enabled when one of the complete slap is marked as exception | Resistration client
[MOS-31265](https://mosip.atlassian.net/browse/MOS-31265) | User salt sync fails everytime when user triggers a manual sync, if app_auth table in master db is updated | Resistration client
[MOS-31252](https://mosip.atlassian.net/browse/MOS-31252) | The user with default role is unable to create packet in Reg client | Resistration client
[MOS-31246](https://mosip.atlassian.net/browse/MOS-31246) | Master sync method is giving runtime exception | Resistration client
[MOS-31241](https://mosip.atlassian.net/browse/MOS-31241) | Error On Uploading Packet (Duplicate Packet Uploaded) | Resistration client
[MOS-31238](https://mosip.atlassian.net/browse/MOS-31238) | Unable to launch registration client in offline mode. | Resistration client
[MOS-31211](https://mosip.atlassian.net/browse/MOS-31211) | Blank Screen appeared POST Password submit, UserID: 110071 | Resistration client
[MOS-31125](https://mosip.atlassian.net/browse/MOS-31125) | Intermittently Packets are stuck at Biographic_Verification stage in reg processor due to regclient sending jpg format for face instead of iso | Resistration client
[MOS-31124](https://mosip.atlassian.net/browse/MOS-31124) | Packet gets failed at OSI_Validation stage which is Iris authenticated | Resistration client
[MOS-31095](https://mosip.atlassian.net/browse/MOS-31095) | MDS vendor Issue while capturing the face biometric on change of camera from external to internal | Resistration client
[MOS-30945](https://mosip.atlassian.net/browse/MOS-30945) | intermittently officer is unable to login as login is failing with invalid username alert message, sufficient logging is not visible | Resistration client
[MOS-30828](https://mosip.atlassian.net/browse/MOS-30828) | intermittently resident exception registration is failing in the officer auth stage and not taking to supervisor auth | Resistration client
[MOS-30811](https://mosip.atlassian.net/browse/MOS-30811) | User machine mapping is still failing in reg client | Resistration client
[MOS-30808](https://mosip.atlassian.net/browse/MOS-30808) | No alert is getting generated when applicant has placed invalid finger count | Resistration client
[MOS-30620](https://mosip.atlassian.net/browse/MOS-30620) | Captured biometrics are not displayed in respective slap when it is captured more than once in user on-boarding | Resistration client
[MOS-30526](https://mosip.atlassian.net/browse/MOS-30526) | Error message displays the variable name used in code | Resistration client
[MOS-30450](https://mosip.atlassian.net/browse/MOS-30450) | iris capture attempts not showing correctly when an attempt is given is not so appropriate | Resistration client
[MOS-30434](https://mosip.atlassian.net/browse/MOS-30434) | unable to continue in reg client when incorrect biometrics are given and then correct biometrics are given | Resistration client
[MOS-30210](https://mosip.atlassian.net/browse/MOS-30210) | Field Name should be consistent in all the applications. | Resistration client
[MOS-30129](https://mosip.atlassian.net/browse/MOS-30129) | Reg client closing while capturing the biometrics | Resistration client
[MOS-30091](https://mosip.atlassian.net/browse/MOS-30091) | very first time on click of capture of fingerprints during on boarding a pop up appears with message Unable to scan the fingerprints | Resistration client
[MOS-30019](https://mosip.atlassian.net/browse/MOS-30019) | Unable to launch registration client in offline mode | Resistration client
[MOS-29983](https://mosip.atlassian.net/browse/MOS-29983) | black view is shown photo capture view in the bottom of that space a message "Face pose angle not found" is shown. | Resistration client
[MOS-29982](https://mosip.atlassian.net/browse/MOS-29982) | Syncbyte : Giving low quality less than 50 takes about 2 mins to capture biometrics and then no image is shown in the view | Resistration client
[MOS-29973](https://mosip.atlassian.net/browse/MOS-29973) | Error- Supervisor ID in OSI Data can not be null or empty (Packet creation failed due to internal error). | Resistration client
[MOS-29799](https://mosip.atlassian.net/browse/MOS-29799) | recapture without closeing the capture window when a capture attempt fails is not happening | Resistration client
[MOS-29798](https://mosip.atlassian.net/browse/MOS-29798) | It captured successfully once when three fingers are given instead of 4 fingers of left slap at the time of left slap capture without selecting any exceptions | Resistration client
[MOS-29796](https://mosip.atlassian.net/browse/MOS-29796) | in a tricky situation finger image is not shown on the window while capturing, finger image is shown after capturing | Resistration client
[MOS-29780](https://mosip.atlassian.net/browse/MOS-29780) | Able to mark iris exception though Iris is disabled in config and viceversa (i.e. First time Registration Client does not work as per config change though sync has happend). | Resistration client
[MOS-29480](https://mosip.atlassian.net/browse/MOS-29480) | Onboarding time and registration time -> when five fingers are given in left or right slap instead of four, it is capturing five fingers | Resistration client
[MOS-29391](https://mosip.atlassian.net/browse/MOS-29391) | The attempts count is not getting incremented for the first instance when user naviagates back from preview | Resistration client
[MOS-29287](https://mosip.atlassian.net/browse/MOS-29287) | UI flow for UIN update needs to updated for demo auth scenario | Resistration client
[MOS-28807](https://mosip.atlassian.net/browse/MOS-28807) | Retest - Application fails to alert the user to capture exception photo for low quality biometric exception scenario | Resistration client
[MOS-28306](https://mosip.atlassian.net/browse/MOS-28306) | Keypad is not displayed properly at RHS side. | Resistration client
[MOS-28190](https://mosip.atlassian.net/browse/MOS-28190) | Able to scan biometrics though exceptions are marked (New Registration/Update Flow). | Resistration client
[MOS-27320](https://mosip.atlassian.net/browse/MOS-27320) | Unable to modify biometrics from preview page | Resistration client
[MOS-27319](https://mosip.atlassian.net/browse/MOS-27319) | Error message is not displayed when more than one face is detected. | Resistration client
[MOS-27284](https://mosip.atlassian.net/browse/MOS-27284) | Reg client is allowing to capture any object picture in photo/exception photo which should be allowed. Only live person's picture must be allowed | Resistration client
[MOS-27238](https://mosip.atlassian.net/browse/MOS-27238) | As MOSIP system, I should allow registration of users only if there is sufficient disk space in the system | Resistration client
[MOS-27236](https://mosip.atlassian.net/browse/MOS-27236) | Acknowledgement present in the Reg Client packet store is not rendered properly in the browser | Resistration client
[MOS-27070](https://mosip.atlassian.net/browse/MOS-27070) | Sync Date and Time is not getting updated in Reg Client UI | Resistration client
[MOS-26635](https://mosip.atlassian.net/browse/MOS-26635) | Regclient services application logs are not informative, leading to delay in development | Resistration client
[MOS-26101](https://mosip.atlassian.net/browse/MOS-26101) | All the users salts are downloaded to the client machine irrespective of center id. | Resistration client
[MOS-25750](https://mosip.atlassian.net/browse/MOS-25750) | Registration Client is getting closed by clicking on top left icon above the mosip logo. | Resistration client
[MOSIP-7723](https://mosip.atlassian.net/browse/MOSIP-7723) | No enum constant exception at notification stage for the packets rejected by supervisor. | Registration Processor
[MOSIP-7668](https://mosip.atlassian.net/browse/MOSIP-7668) | The adult update packet should get rejected and triggered the notification if the auth fails in bio authentication stage validation. | Registration Processor
[MOSIP-7667](https://mosip.atlassian.net/browse/MOSIP-7667) | Adult update packet is getting failed at the biographic verification stage (Individual authentication failedUnsupported Authentication Type - bio-FIR ). | Registration Processor
[MOSIP-7449](https://mosip.atlassian.net/browse/MOSIP-7449) | Unknown Exception while fetching biometric file using MA API. | Registration Processor
[MOSIP-7447](https://mosip.atlassian.net/browse/MOSIP-7447) | Deactivate UIN packets should not for printservice. | Registration Processor
[MOSIP-7440](https://mosip.atlassian.net/browse/MOSIP-7440) | Child update packet should not be sent for Reprocess if the packet is rejected at the OSI stage stating Parent UIN/RID not found. | Registration Processor
[MOSIP-7439](https://mosip.atlassian.net/browse/MOSIP-7439) | Unable to read from IDRepo | Registration Processor
[MOSIP-7422](https://mosip.atlassian.net/browse/MOSIP-7422) | LOST UIN : infant age check condition breaking lost uin flow | Registration Processor
[MOSIP-7402](https://mosip.atlassian.net/browse/MOSIP-7402) | Update packet is getting failed at Packet Validator Stage (Packet validation failed KER-PUT-002 --> the requested file is not found in the destination). | Registration Processor
[MOSIP-7392](https://mosip.atlassian.net/browse/MOSIP-7392) | New Packet is getting failed at the Notification Stage (Unknown exception occured KER-PUT-002 --> the requested file is not found in the destination). | Registration Processor
[MOSIP-7346](https://mosip.atlassian.net/browse/MOSIP-7346) | Unable to generate VID | Registration Processor
[MOSIP-7243](https://mosip.atlassian.net/browse/MOSIP-7243) | UIN Generation failed - Failed to retrieve Identity Schema from kernel Syncdata service | Registration Processor
[MOSIP-7021](https://mosip.atlassian.net/browse/MOSIP-7021) | Packet is failed at packet validator stage (Packet validation failed io.mosip.kernel.core.idobjectvalidator.exception.IdObjectValidationFailedException). | Registration Processor
[MOSIP-7019](https://mosip.atlassian.net/browse/MOSIP-7019) | UIN to be used as string in all services of registration processor | Registration Processor
[MOSIP-1141](https://mosip.atlassian.net/browse/MOSIP-1141) | Reverse Data Sync entry made in the audit table though pre-reg fetch packet is not processed in reg proc. | Registration Processor
[MOSIP-1127](https://mosip.atlassian.net/browse/MOSIP-1127) | UIN Generation failed - Invalid Input Parameter - requesttime (INT ENV). | Registration Processor
[MOSIP-820](https://mosip.atlassian.net/browse/MOSIP-820) | DMZ stages trying to connect to hdfs during startup | Registration Processor
[MOSIP-799](https://mosip.atlassian.net/browse/MOSIP-799) | Sent notification and PDF generation failed (For input string:"10002100740001320200422063022"java.lang.NumberFormatException). | Registration Processor
[MOSIP-543](https://mosip.atlassian.net/browse/MOSIP-543) | Requests failing in ABIS. | Registration Processor
[MOSIP-542](https://mosip.atlassian.net/browse/MOSIP-542) | Reverse sync data is failed in packet-validator stage. | Registration Processor
[MOSIP-455](https://mosip.atlassian.net/browse/MOSIP-455) | Registration processor reducing code smells fix | Registration Processor
[MOSIP-389](https://mosip.atlassian.net/browse/MOSIP-389) | Bio auth for UIN update is working incorrectly | Registration Processor
[MOSIP-222](https://mosip.atlassian.net/browse/MOSIP-222) | UIN generation is not working at Reg processor | Registration Processor
[MOSIP-220](https://mosip.atlassian.net/browse/MOSIP-220) | Last 10 days packets uploaded are not available in linux system : archive location and landing zone, in both places it is not there | Registration Processor
[MOSIP-204](https://mosip.atlassian.net/browse/MOSIP-204) | NGNIX/Pod issue in registration processor DMZ service | Registration Processor
[MOSIP-153](https://mosip.atlassian.net/browse/MOSIP-153) | In reg client -> On click of synchronize data -> user machine mapping job is failing continuously | Registration Processor
[MOSIP-125](https://mosip.atlassian.net/browse/MOSIP-125) | Notification stage failing when load tested by upploading 300 packets in preprod | Registration Processor
[MOSIP-123](https://mosip.atlassian.net/browse/MOSIP-123) | "registration center device history not found" message is not clearly pointing for which device it is not there | Registration Processor
[MOSIP-118](https://mosip.atlassian.net/browse/MOSIP-118) | ABIS still having issue with gallery match (that is while doing one to one match) | Registration Processor
[MOSIP-112](https://mosip.atlassian.net/browse/MOSIP-112) | Applicant photo is not visible in UIN card | Registration Processor
[MOSIP-106](https://mosip.atlassian.net/browse/MOSIP-106) | ABIS gallery match not happening as expected | Registration Processor
[MOS-31205](https://mosip.atlassian.net/browse/MOS-31205) | Automation Testing- Wrong Response Structure while sending a wrong machine id to reprint api | Registration Processor
[MOS-30963](https://mosip.atlassian.net/browse/MOS-30963) | packets getting stuck in OSI_Validate stage in Reg proc due to request timeout from kernel are not going for reprocessing | Registration Processor
[MOS-30948](https://mosip.atlassian.net/browse/MOS-30948) | HDFS issue observed in Reg-processor in the packet validate stage (This issue has come in the OSI stage also). | Registration Processor
[MOS-30931](https://mosip.atlassian.net/browse/MOS-30931) | All packet from reg client get stuck at OSI_Validation with reason as "Reprocess" | Registration Processor
[MOS-29789](https://mosip.atlassian.net/browse/MOS-29789) | Error at message sender stage (No enum constant io.mosip.registration.processor.message.sender.utility.NotificationStageStatus.OSI_VALIDATE_REPROCESS). | Registration Processor
[MOS-29736](https://mosip.atlassian.net/browse/MOS-29736) | SFTP Operation Failed (Packet is not moving from landing zone). | Registration Processor
[MOS-29670](https://mosip.atlassian.net/browse/MOS-29670) | RPR_PRT_PDF_GENERATION_FAILEDnulljava.lang.NullPointerException. | Registration Processor
[MOS-29485](https://mosip.atlassian.net/browse/MOS-29485) | Unable to process a lost packet in reg processor | Registration Processor
[MOS-29286](https://mosip.atlassian.net/browse/MOS-29286) | Intermittent Issue - Vertex Thread Lock Exception is appearing when ActiveMQ is restarted (observable in ABIS Middle-ware & Print Stage) | Registration Processor
[MOS-29258](https://mosip.atlassian.net/browse/MOS-29258) | Packet upload to reg proc is not working in Security environment 0.9.1 | Registration Processor
[MOS-29086](https://mosip.atlassian.net/browse/MOS-29086) | Issue in Notification Stage - LOST UIN packet with unique flag set as N > such that it goes to MV > MV rejects the Packet | Registration Processor
[MOS-27714](https://mosip.atlassian.net/browse/MOS-27714) | For all rejected packets which are uploaded, the UIN is getting generated | Registration Processor
[MOS-27417](https://mosip.atlassian.net/browse/MOS-27417) | Issue in Notification Stage - When wrong URL for Email in configured, Notification Stage Failure entry in Transaction Table is missing | Registration Processor
[MOSIP-7914](https://mosip.atlassian.net/browse/MOSIP-7914) | Face data is returned as 'NULL' in ekyc | ID Authentication\ID Repository
[MOSIP-7899](https://mosip.atlassian.net/browse/MOSIP-7899) | Unable to sentOTP for authentication getting "IDA-RST-007": Server Error occurred | ID Authentication\ID Repository
[MOSIP-7871](https://mosip.atlassian.net/browse/MOSIP-7871) | Unable to process a new packet in dev-test env | ID Authentication\ID Repository
[MOSIP-7790](https://mosip.atlassian.net/browse/MOSIP-7790) | Need a service to decrypt the ekyc returned data | ID Authentication\ID Repository
[MOSIP-7729](https://mosip.atlassian.net/browse/MOSIP-7729) | Packet got stuck at the OSI stage instead of rejection if the child packet does not have valid parent's authentication. | ID Authentication\ID Repository
[MOSIP-7710](https://mosip.atlassian.net/browse/MOSIP-7710) | Child Packet is Failed at the OSI stage stating Biometric data – Finger did not match though Parent details are valid. | ID Authentication\ID Repository
[MOSIP-7707](https://mosip.atlassian.net/browse/MOSIP-7707) | eKYC API does not return an encoded response | ID Authentication\ID Repository
[MOSIP-7706](https://mosip.atlassian.net/browse/MOSIP-7706) | Able to authenticate with unmapped partner and api key | ID Authentication\ID Repository
[MOSIP-7700](https://mosip.atlassian.net/browse/MOSIP-7700) | Incorrect error message on authenticating with a deactivated policy/partner API key | ID Authentication\ID Repository
[MOSIP-7675](https://mosip.atlassian.net/browse/MOSIP-7675) | Authentication services not providing proper messages with invalid partner, Misp and ApiKey. | ID Authentication\ID Repository
[MOSIP-7673](https://mosip.atlassian.net/browse/MOSIP-7673) | Able to authenticate with an invalid biometric in multi-factor authentication | ID Authentication\ID Repository
[MOSIP-7672](https://mosip.atlassian.net/browse/MOSIP-7672) | Able to authenticate with a deactivated partner | ID Authentication\ID Repository
[MOSIP-7661](https://mosip.atlassian.net/browse/MOSIP-7661) | UIN Generation failed - Invalid Input Parameter - biometricReferenceId | ID Authentication\ID Repository
[MOSIP-7448](https://mosip.atlassian.net/browse/MOSIP-7448) | Unable to authenticate after a deactivated UIN is activated | ID Authentication\ID Repository
[MOSIP-7413](https://mosip.atlassian.net/browse/MOSIP-7413) | Auth - Bio Auth failing | ID Authentication\ID Repository
[MOSIP-7412](https://mosip.atlassian.net/browse/MOSIP-7412) | First request in ID Repo failing in ID Object validation | ID Authentication\ID Repository
[MOSIP-7407](https://mosip.atlassian.net/browse/MOSIP-7407) | Able to authenticate with inactive MISP License | ID Authentication\ID Repository
[MOSIP-7401](https://mosip.atlassian.net/browse/MOSIP-7401) | Child/Update Packet with valid Parent RID is getting failed at OSI (Unsupported Authentication Type - bio-IIR ). | ID Authentication\ID Repository
[MOSIP-7378](https://mosip.atlassian.net/browse/MOSIP-7378) | ENV Issue- Packets are getting failed at OSI (Unable to access API resourceRPR-RCT-001 --> Unknown resource provided; nested exception is org.springframework.web.client.HttpClientErrorException: 404 ). | ID Authentication\ID Repository
[MOSIP-7356](https://mosip.atlassian.net/browse/MOSIP-7356) | Unable to notify VID creation | ID Authentication\ID Repository
[MOSIP-7347](https://mosip.atlassian.net/browse/MOSIP-7347) | Unable to send OTP for auth | ID Authentication\ID Repository
[MOSIP-7344](https://mosip.atlassian.net/browse/MOSIP-7344) | ID Repo is not notifying IDA about UIN generation | ID Authentication\ID Repository
[MOSIP-1149](https://mosip.atlassian.net/browse/MOSIP-1149) | Able to do the Authentication with Locked UIN and Locked VID | ID Authentication\ID Repository
[MOSIP-1146](https://mosip.atlassian.net/browse/MOSIP-1146) | Demographic Authentication service doesn't have proper Audit log for 'ref_id_type' field | ID Authentication\ID Repository
[MOSIP-521](https://mosip.atlassian.net/browse/MOSIP-521) | sendOTP action fails to send OTP email (random but frequent) | ID Authentication\ID Repository
[MOSIP-500](https://mosip.atlassian.net/browse/MOSIP-500) | BioMetric Authentication API is not working as expected | ID Authentication\ID Repository
[MOSIP-491](https://mosip.atlassian.net/browse/MOSIP-491) | In ID Repository few services are giving "Unknown error occurred" in response | ID Authentication\ID Repository
[MOSIP-217](https://mosip.atlassian.net/browse/MOSIP-217) | Proper error message should throw for internal request with invalid UserID | ID Authentication\ID Repository
[MOSIP-216](https://mosip.atlassian.net/browse/MOSIP-216) | Auth Transaction entry should come for KYC with auth status 'false' | ID Authentication\ID Repository
[MOSIP-210](https://mosip.atlassian.net/browse/MOSIP-210) | Response should be 200 and proper error throw for request without signature in identity - Bio | ID Authentication\ID Repository
[MOSIP-165](https://mosip.atlassian.net/browse/MOSIP-165) | Request could not be processed error on providing invalid exception parent biometrics in a child packet | ID Authentication\ID Repository
[MOS-31332](https://mosip.atlassian.net/browse/MOS-31332) | IDA Key generator fixes | ID Authentication\ID Repository
[MOS-31112](https://mosip.atlassian.net/browse/MOS-31112) | Auth Transaction should be proper for failed kyc authentication | ID Authentication\ID Repository
[MOS-31109](https://mosip.atlassian.net/browse/MOS-31109) | Proper error message should come for invalid device make and model | ID Authentication\ID Repository
[MOS-30993](https://mosip.atlassian.net/browse/MOS-30993) | Unable to decrypt request error on performing IDA | ID Authentication\ID Repository
[MOS-30960](https://mosip.atlassian.net/browse/MOS-30960) | 3 packets got failed at OSI_Validate stage | ID Authentication\ID Repository
[MOS-30238](https://mosip.atlassian.net/browse/MOS-30238) | Proper error message should display for invalid device provider id, deviceprovider, make, model | ID Authentication\ID Repository
[MOS-27707](https://mosip.atlassian.net/browse/MOS-27707) | Not able to run ID Authentication tests by referring IDA wiki documentation | ID Authentication\ID Repository
[MOSIP-7235](https://mosip.atlassian.net/browse/MOSIP-7235) | Unable to update MISP details | Partner Management
[MOSIP-7028](https://mosip.atlassian.net/browse/MOSIP-7028) | Unable to update partner management policy | Partner Management
[MOSIP-7858](https://mosip.atlassian.net/browse/MOSIP-7858) | Getting error "Unable to access API resourceRES-SER-005" while running resident service API | Resident Services
[MOSIP-7400](https://mosip.atlassian.net/browse/MOSIP-7400) | Unable to revoke the "Temporary/Perpetual VID" | Resident Services
[MOSIP-7398](https://mosip.atlassian.net/browse/MOSIP-7398) | Not able to Update the UIN using resident services | Resident Services
[MOSIP-7394](https://mosip.atlassian.net/browse/MOSIP-7394) | Getting error "RES-SER-019", while executing print UIN | Resident Services
[MOSIP-7393](https://mosip.atlassian.net/browse/MOSIP-7393) | Getting "RES-SER-005" while running EUIN resident request | Resident Services
[MOSIP-7389](https://mosip.atlassian.net/browse/MOSIP-7389) | Unable to execute the resident API - 404 error | Resident Services
[MOSIP-822](https://mosip.atlassian.net/browse/MOSIP-822) | Unable to print the UIN as Machine not found error is thrown | Resident Services
[MOSIP-698](https://mosip.atlassian.net/browse/MOSIP-698) | Unable to Run the Resident Service due to "RES-SER-004" - Could not fetch public key from kernel keymanager - 502 Bad Gateway | Resident Services
[MOSIP-509](https://mosip.atlassian.net/browse/MOSIP-509) | No description found for the error code received while performing update on UIN | Resident Services
[MOSIP-506](https://mosip.atlassian.net/browse/MOSIP-506) | Unable to update the UIN using the resident service | Resident Services
[MOSIP-378](https://mosip.atlassian.net/browse/MOSIP-378) | Email received for Successful revocation of VID, however the same doesnot happened as API response has error RES-SER-004 | Resident Services
[MOSIP-375](https://mosip.atlassian.net/browse/MOSIP-375) | Resident Service Error code and Error Message update | Resident Services
[MOS-30893](https://mosip.atlassian.net/browse/MOS-30893) | Timestamp validation should perform all resident services | Resident Services
[MOS-30815](https://mosip.atlassian.net/browse/MOS-30815) | Status Check API for Resident Services is not Working as Expected | Resident Services
