# Configuring Credential Template

This guide help you customize and configuring credential templates using the **Velocity Template Language (VTL)** syntax. 
It explains how data from the **mimoto** service is passed into a template, how you can configure fields in the template, and how to retrieve and display the relevant data dynamically. This also includes a sample template to guide users in writing their own templates.

# Overview

The **mimoto** service pass data to a **Velocity Template** for rendering, This allows the you to define which fields you want to display and how you want to structure the credential templates. You can customize the template with your own fields and data, making it flexible and easy to adapt.


## Mimoto Service Flow

1.  **Data Preparation**: The mimoto service gathers all the required display properties and field values for the credential from the issuer wellknown.

2.  **Template Retrieval**: The user provides the `issuerId` and `credentialType` which are used to check if a custom template exists in the configuration service.

3.  **Field Mapping**: The template is populated dynamically using field names and values passed from the backend.


## Template Retrieval and Configuration

### Template Retrieval Mechanism

The mimoto service checks if a specific template is available based on the `issuerId` and `credentialType` by querying the config service. If a template is found, it is used; otherwise, a default template is applied.
A dynamic name for the template file which mimoto service search is made with this combination `issuerId-credentialType-template.html`. For example if issuerId is Mimoto and credentialType is
MosipVerifiableCredential then service will search for Mosip-MosipVerifiableCredential-template.html file in the configuration service.

If the profile is `local` while running mimoto, the template is fetched from a local directory; else, it fetches from a configuration service.

## Understanding available Data Fields in the template

### Credential Issuer Information:

* `titleName`: The credential display name provided by the issuer (MOSIP Verifiable Credentials).

* `logoUrl`: The logo of the issuer (https://api.collab.mosip.net/inji/mosip-logo.png) which can be
    included in the template as part of the issuer's branding.

* `backgroundColor`: Background color for the credential provided by the issuer.

* `backgroundImage`: A background image URL (https://api.collab.mosip.net/inji/mosip-logo.png)which can be used to customize the appearance of the credential.

* `textColor`: The color of the text in the credential( #000000).

* `qrCodeImage`:

* `face`:If face is available as part of the credential.

## Dynamic Fields

Data fields are dynamically fetched in the velocity template from the `rowProperties` object.

* **If orderProperty is present**: The `rowProperties` map will contain the fields from `credentialSubject` in the order specified by `orderProperty` of issuer wellknown. Each entry in `rowProperties` will map the field name (e.g., `fullName`, `phone`) to a Map with the display name as the key and the credential value as the value.

* **If orderProperty is not present**: All fields in credentialSubject of issuer wellknown will be included in rowProperties, and they will be picked in the order they appear in the redentialSubject. Each field will again be mapped to a Map with the corresponding display name and its value. The rowProperties map will look like this for example:


```json
{
    "fullName": {
        "Full Name": "Some Name"
    },
    "phone": {
        "Phone Number": "+1234567890"
    },
    "gender": {
        "Gender": "Male"
    }
}

```

## Customizing the Template

Now that you understand the available properties, you can customize your template using these dynamic values. In your custom credential template (HTML file), you will use placeholders for each property to dynamically populate the content.

Example for rendering the **Full Name** field:

```vtl
#foreach($field in ['fullName'])
    #set($data = $rowProperties.get($field))
    #if($data && $data.size() > 0)
        #foreach($entry in $data.entrySet())
            <div>
                <label>$entry.key</label>
                <div>$entry.value</div>
            </div>
        #end
    #end
#end
```

**Example for logoUrl**

`<img src="../../../../unsegregated/$logoUrl" alt="Issuer Logo" class="logo" />`

This pattern can be used for any other field such as **Policy Number**, **Email**, **Gender**, etc., by updating the `$field` name.

### Sample Templates

[StayProtected-InsuranceCredential-template.html](https://github.com/mosip/inji-config/blob/release-0.7.x/StayProtected-InsuranceCredential-template.html)

[StayProtected-InsuranceCredential-template.html](https://github.com/mosip/inji-config/blob/release-0.7.x/Mosip-MosipVerifiableCredential-template.html)
