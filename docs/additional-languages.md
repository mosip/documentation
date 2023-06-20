# Language Support in Compliance Toolkit (CTK)

* Partners can select their preferred language while logging into CTK. By default, CTK supports three languages namely- English, French and Arabic.

![](\_images/ctk-lang1.png)

* To add support for an additional language, below are the steps to be followed:
    * Step 1: Add an additional language to the CTK login page.
    * Step 2: Add a new resource bundle (i18n JSON) file for the new language.
    * Step 3: Translate each page label.
    * Step 4: Translate validator description.
    * Step 5: Translate every testcase in the resource bundle.
    * Step 6: Translate all the service-generated validator messages.
    * Step 7: Translate all the service errors.
    * Step 8: Build and deploy the code.
 
Let us understand the steps mentioned above with more details.

### Step 1: Add an additional language to the CTK login page.

* The user can add a new language support to CTK via Keycloak.
* to do so, create a locale for a new language in localization.
* Add a new locale in the supported locales field.

For example: New locale `es` for Spanish language.

![](\_images/ctk-lang2.png)


* It will be added to the CTK login page once the changes have been saved.

### Step 2: Add a new resource bundle (i18n JSON) file for the new language.

The i18n folder is available under assets folder in UI codebase.

![](\_images/ctk-lang3.png)

* Create a new JSON file in the folder.
* For example: In Spanish language, the file name should be `es.json`.
* Copy the `eng.json` data and paste it in `es.json`.

### Step 3: Translate each page label.

* When translating into a new language, we should solely translate only the right-side values using a translation service (such as Google Translate).
  
For example: Take the first page (Project Dashboard)

In each page, the labels are on the left and values are on the right.

```
"projectDashboard": {
    "addProject": "Add Project",
    "biometricData": "Biometric Data",
    "view": "View",
    "filter": "Filter",
    "name": "Name",
    "projectType": "Project Type",
    "collections": "Collections",
    "creationDate": "Creation Date",
    "lastRunDate": "Last Run Date",
    "lastRunStatus": "Last Run Status",
    "success": "Success",
    "failure": "Failure",
    "projectRow": "There are no projects available.",
    "tableDescription": "List of Projects"
}
```

The figure below highlights the page labels along with their values.

![](\_images/ctk-lang4.png)

* Also translate the labels on all pages.

### Step 3: Translate validator description.

All Validator descriptions have been added to the resource bundle. The names of validators are their labels, and their descriptions are their values.

Here is an example of validator description added in resource bundle.

```
"validators": {
    "SchemaValidator": "Validates the response for mandatory attributes and correct values",
    "SignatureValidator": "Validates the response signature"
}
```
* Translate only the right-side values.
* If a new validator is added, a resource bundle must be added as well.

### Step 5: Translate every testcase in the resource bundle.

* Translate the values of testName, testDescription, and androidDescription. The code will use the testcase data in accordance with the testId.
* If you add any new testcases in the future, you must include them in the resource bundle.

Here is an example of testcase added in resource bundle.

```
"testcases": {
    "SBI1002": {
        "testName": "Registration capture - Left Slap",
        "testDescription": "Test to validate the RCapture interface for Left Slap Fingerprints<br><br>Steps:<br>1. Click on Start Streaming button. <br>2. Once streaming is done, click on Inititate Capture button to start the capture.  <br> 3. Place your left slap on the device until the capture completes",
        "androidTestDescription": "Test to validate the RCapture interface for Left Slap Fingerprints<br><br>Steps:<br>1. Click on Inititate Capture button to start the capture.  <br> 2. Place your left slap on the device until the capture completes"
    }
}
```

### Step 6: Translate all the service-generated validator messages.

All the service-generated validator messages have been added based on the below cases.

```
    //case 1 "VALIDATOR_MSG_001"
    //case 2 "VALIDATOR_MSG_001::arg1"
    //case 3 "VALIDATOR_MSG_001::arg1;arg2"
    //case 4 "VALIDATOR_MSG_001::VALIDATOR_MSG_002;arg2"
    //case 5 "VALIDATOR_MSG_001,VALIDATOR_MSG_002::arg1;arg2,VALIDATOR_MSG_003::arg3"
    //case 6 "VALIDATOR_MSG_001,textMessage,VALIDATOR_MSG_003::arg3"
```

For example:

case 1:
* There are no arguments in this case.

Example of validator message in a resource bundle:

```
"validatorMessages": {
    "TIMEOUT_VALIDATOR_001": "Timeout validation is successful"
}
```

* The `validationResultDto` now contains an additional attribute called `setDescriptionKey`. This will help to take validator messages from resource bundle.

Example code for setDescriptionKey:

```
validationResultDto.setDescription("Timeout validation is successful");
validationResultDto.setDescriptionKey("TIMEOUT_VALIDATOR_001");
```
case 3:

* This case contains more than one argument in the validator message. 

Example of validator message in a resource bundle:

```
"validatorMessages": {
    "TIMEOUT_VALIDATOR_002": "Timeout validation failed. Timeout given: {} ms. Response received in: {} ms"
}
```

* {} – This will represents the arguments value.
    
Example code for setDescriptionKey:

```
validationResultDto.setDescription("Timeout validation failed. Timeout given: " + timeout + "ms."
+ " Response received in: " + diff + "ms");
validationResultDto.setDescriptionKey("TIMEOUT_VALIDATOR_002" + AppConstants.ARGUMENTS_DELIMITER + timeout + AppConstants.ARGUMENTS_SEPARATOR + diff);
```

Here ARGUMENTS_DELIMITER is `::` and ARGUMENTS_SEPARATOR is `;`

### Step 7: Translate all service errors.

Example of service errors added in a resource bundle given below.

```
"serviceErrors": {
    "TOOLKIT_SUCCESS_000": "Success",
    "TOOLKIT_PROJECTS_001": "No project found for the user",
    "TOOLKIT_PROJECTS_002": "No matching SBI project available for the given id"
}
```

Error codes are on the left and error messages are on the right.

### Step 8: Build and deploy the code.

* You need to build code after completing the steps listed above.
* After building, you can deploy the code.
