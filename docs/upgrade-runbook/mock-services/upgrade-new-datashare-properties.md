# New Datashare Properties

If a country desires to designate specific data sharing to be transmitted on HTTP or HTTPS endpoints, they should accomplish this by including the **Domain URL** of the data sharing in the policy field itself.
This will have priority over any other settings.

Furthermore, two new fields have been incorporated into the policy:

* `shareDomainUrlWrite`: This field should be employed by individual modules when calling the data sharing functionality to write data.
  
* `shareDomainUrlRead`: This field should be used by the data sharing functionality when generating a URL to share with modules for reading data.

**Note**: It is important to note that these fields are compatible with previous versions and are not obligatory to include in all policies. They can be utilized only if a country sees a need for the new features.
