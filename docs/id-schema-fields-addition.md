# Adding fields in an ID Schema 

The identity schema implements the JSON Schema Standard and allows you to adjust Ory specifically to your requirements. Identity schema specifies the types of data the system can store for users, such as their names, email addresses, phone numbers, and birthdays. Through schemas, you can also define additional fields that can be added to user profiles, such as a job titles, company names, or locales.
The identity schema not only defines the data model of your identities, but also controls business logic and allows you to:

* Define which field is used as the identifier when logging in: username, email, phone number, or a combination of those.
* Define fields which are used to verify or recover the user's identity: email, phone number, or a combination of those.

Depending on your setup, you can benefit from defining different identity schemas for different groups of users, such as customer support and end users. This allows to tailor the user experience and security measures to the specific needs and requirements of each group.

The sandbox comes with its default ID Schema (in Master DB, identity_schema table. In order to use different schemas, please follow the below steps:


With Swagger

1.	Go to (please add the exact env name in the link):
https://api-internal.<<add the environment name>>.mosip.net/v1/authmanager/swagger-ui/index.html?configUrl=/v1/authmanager/v3/api-docs/swagger-config#/authmanager/clientIdSecretKey

2. Select

3. Select “Try it out”
   
Edit the value with the below credentials from Keycloak:
```
"
"clientId": "mosip-admin-client",
 "secretKey": "<<get the secrete key from rancher>>",
"appId": "admin"
"
```
4. After editing, click on “Execute”, and make sure the response is success as below:

AUTHENTICATION IS COMPLETED, BELOW ARE THE STEPS TO POST AND PUBLISH THE ID SCHEMA.

5.	Go to (please add the exact env name in the link):
https://api-internal.<<add the environment name>>.mosip.net/v1/masterdata/swagger-ui/index.html?url=/v1/masterdata/v3/api-docs#/schema-controller/createSchema

6.	Select

7. Select “Try it out”

8. 	Paste the Springfield id schema in "schema": <<paste the id schema here>> as below:

a.	To Stringfy, below are the steps:
remove space and compact with the below link (select “Compact” under Json template and “RFC8259” under Json specification.
https://jsonformatter.curiousconcept.com/#
then stringfy the compact json using: https://onlinetexttools.com/json-stringify-text
https://jsonformatter.org/json-stringify-online

  
9. Click on “Execute”, and make sure the response is success with an ID as below:

10. Open the DB in pgAdmin/DBeaver and navigate to ENV > Database > mosip_master > Schemas > master > Tables > identity_schema.
11. Right click on identity_schema and select scripts > select Scripts. 
12.	Click on execute.
13.	Check the values of “id” make sure that the ID value is same as the ID in response of step 9. Also the schema will be saved as “Drafted” in the DB.
14.	Go to (please add the exact env name in the link):
https://api-internal.<<add the environment name>>.mosip.net/v1/masterdata/swagger-ui/index.html?url=/v1/masterdata/v3/api-docs#/schema-controller/publishSchema

15. Select

16. Select the “Try it Out” option and update the time to the current time
Copy the id from the DB to publish.
The time to be edited is highlighted below:


And click on “Execute” to execute the changes and response is as below

17. Now the ID Schema is updated successfully. After the schema is published, it can be verified in the DB as published. 



