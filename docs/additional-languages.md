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

