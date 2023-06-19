# Language Support in Compliance Toolkit (CTK)

* Partners can select their preferred language while logging into CTK. By default, CTK supports three languages namely- English, French and Arabic.

* To add support for an additional language, below are the steps to be followed:
    * Step 1: Add an additional language to the CTK login page.
    *	Step 2: Add a new resource bundle (i18n JSON) file for the new language.
    *	Step 3: Translate each page label.
    *	Step 4: Translate validator description.
    * Step 5: Translate every testcase in the resource bundle.
    * Step 6: Translate all the service-generated validator messages.
    * Step 7: Translate all the service errors.
    *	Step 8: Build and deploy the code.
 
Let us understand the steps mentioned above with more details.

### Step 1: Add an additional language to the CTK login page.

* The user can add a new language support to CTK via Keycloak.
* to do so, create a locale for a new language in localization.
* Add a new locale in the supported locales field.
  
For example: New locale “es” for Spanish language.

![](_images/.png)

* It will be added to the CTK login page once the changes have been saved.

### Step 2: Add a new resource bundle (i18n JSON) file for the new language.

The i18n folder is available under assets folder in UI codebase.

<image>

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

###
 


 

