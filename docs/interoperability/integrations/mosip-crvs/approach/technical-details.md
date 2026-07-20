# Technical Details

This section outlines the technical requirements for integrating a Civil Registration and Vital Statistics (CRVS) system with MOSIP, applicable to any country implementation. It covers the necessary prerequisites and API specifications to facilitate a seamless and secure connection between the two systems, enabling smooth data exchange and processing of birth registration requests. Depending on the country's implementation model and agreements, these steps may be carried out by the System Integrator (SI) or the CRVS team.

#### **ID schema Configuration:** <a href="#id-schema-configuration" id="id-schema-configuration"></a>

To initiate any registration request, the country must define an ID schema based on the specific requirements for CRVS integration. The sample ID schema can be referred to [here](https://github.com/mosip/documentation/blob/1.2.0/docs/_files/id-schema/id-schema-sample.json) and should be customized to include all required fields for packet generation per the country’s requirements. This schema governs the structure of the data submitted to MOSIP for processing and storage in the Identity Repository.

{% hint style="info" %}
**Note:** MOSIP advises adopting and customizing the latest released ID schema version to meet country-specific needs.
{% endhint %}

For comprehensive guidance on defining and customizing the ID schema in MOSIP, please refer to the [documentation here](https://docs.mosip.io/1.2.0/id-lifecycle-management/identity-management/id-schema).

#### **1. Create Client ID/Role for the CRVS** <a href="#id-1.-create-client-id-role-for-the-crvs" id="id-1.-create-client-id-role-for-the-crvs"></a>

As part of the integration approach, two specific API’s are exposed:

1. Create a packet API from the MOSIP packet manager module to create a packet
2. Trigger the API from the registration processor module to process the packet.

allowing external systems (in this case, CRVS) to use these APIs to initiate requests.

To facilitate this, the external system must be assigned a specific new client ID and secret, ensuring secure and authenticated communication. Additionally, a new, specific role should be created for the external user, which will be associated with the API request in subsequent calls for packet creation and processing.

This role helps MOSIP validate and verify that the request is coming from an authorized and authentic source, ensuring secure and accurate handling of the registration process. By associating the role with the API request, MOSIP can properly authenticate the external system and manage permissions for the request flow.

Read on to learn more about the specific steps involved

**Create the Client**

* **Log in to Keycloak Admin Console**
  * Access the keycloak admin console.
  * Ensure you have the necessary administrative privileges to create clients.
* **Select Your Realm**
  * If you are not already in the desired realm, switch to it from the top-left drop-down menu. The realm should be the one where you want to create the client.
* **Create a New Client**
  * In the left-hand menu, go to **Clients** and click on **Create**.
* **Enter the Client Details**
  * **Client ID**: Enter `mosip-crvs1-client` as the client ID (or a relevant name based on your deployment).
  * **Client Protocol**: Select `openid-connect`.
  * **Root URL**: Leave this field blank or enter the URL if required.
* **Save the Client**
  * After entering the necessary details, click **Save** to create the client.

Once the client is created, please update the properties in the locations below:

1. `auth.server.admin.allowed.audience` In the [Packet manager default properties](https://github.com/mosip/mosip-config/blob/v1.2.4.0/packet-manager-default.properties#L24).
2. `auth.server.admin.allowed.audience` In the [Registration processor default properties](https://github.com/mosip/mosip-config/blob/v1.2.4.0/registration-processor-default.properties#L996).

{% hint style="info" %}
**Note:** The client name specified here is a placeholder and can be customised to suit the specific requirements of the System Integrator SI/CRVS.
{% endhint %}

**Configuring the Client**

* **Access the Settings Tab**
  * After creating the client, navigate to the **Settings** tab.
* **Configure Client Settings**
  * **Access Type**: Set this to **confidential** if you intend to use client credentials for authentication.
  * **Service Accounts Enabled**: Turn this option **ON** if you are using client credentials flow for secure communication.
  * **Valid Redirect URIs**: Enter `*` (or specify specific URLs if known and necessary).
* **Save the Changes**
  * Once the configuration is complete, click **Save** to apply the changes.

**Generate and note the Secret key**

* Navigate to the **Credentials** tab.
* If you selected the **confidential** access type, keycloak will generate a **Secret Key**. Note this secret as it will be used for authentication in subsequent API calls.

**Creating the Role**

* **Go to the Roles Section**
  * In the Keycloak Admin Console, under your realm, navigate to **Roles**.
* **Create a New Role**
  * Click on **Add Role**.
  * Enter the following details:
    * **Role Name**: `ONLINE_REGISTRATION_CLIENT`
  * Click **Save** to create the role.

#### **Assigning the Role to the Client**

* **Assign the Role to the Client**
  * Go back to the **Clients** section and select the client `mosip-crvs1-client` that you previously created.
* **Navigate to Service Account Roles**
  * Under the **Service Account Roles** tab (this tab is visible only if **Service Accounts Enabled** is turned on), click on **Add Role**.
* **Select the Role**
  * From the **Client Roles** dropdown, select either `realm-management` or your specific desired client role (if the role is specific to a client).
  * Add the `ONLINE_REGISTRATION_CLIENT` role to the selected client.

#### **2. Fetch Access Token to Call the APIs** <a href="#id-2.-fetch-access-token-to-call-the-apis" id="id-2.-fetch-access-token-to-call-the-apis"></a>

Once the role is created and mapped to the client ID. As a follow-up step, below keycloak API is to be called to authenticate the CRVS associated with the new role. In the response of the API, there is an access token returned in the response header. This is the access token that should be used when initiating any request using the packet manager API.\
\
**Authenticate Endpoint:** {domainname}/v1/authmanager/authenticate/clientidsecretkey

**Method:** POST

**API Request Structure:**

```json
{
  "id": "string",
  "metadata": {},
  "request": {
    "appId": {{appId}},
    "clientId": {{clientId}},
    "secretKey": {{secretKey}}
  },
  "requesttime": "{{requestTime}}",
  "version": "string"
```

In the API above, the fields Client ID and Secret key are the values created in the previous steps, as mentioned above. Once the authentication is successful, in the response header, we will receive an access token, which is to be noted and used for the subsequent packet manager API request.

#### 3. Create the Default Officer <a href="#id-3.-create-the-default-officer" id="id-3.-create-the-default-officer"></a>

To process the request coming from CRVS, a default officer is to be registered and assigned to the CRVS. The officer is to be added from keycloak by the admin.

* **Log in to Keycloak**
  * Open the Keycloak admin portal.
  * Log in using your admin credentials.
* **Navigate to the Users Section**
  * In the left-hand menu, click on Users.
* **Add a New User**
  * Click on the Add user button to create a new user.
  * Fill in the required fields under the details tab:
    * **Username**: Enter a unique username for the officer (this will become the Officer ID).
    * **First Name**: Enter the officer's first name.
    * **Last Name**: Enter the officer's last name.
* **Set Temporary Password**
  * Under the **Credentials** tab, set the password for the officer.
  * Toggle **Temporary** to **Off** to disable the "temporary password" feature.
  * Click **Set Password**.
* **Enable the User**
  * Under the **User Enabled** section, ensure that the user is **enabled**.
  * Click **Save** to create the user.
* **Assign Roles to the User**
  * Navigate to the **Role Mappings** tab.
  * Under **Available Roles**, select the role **Registration\_officer**.
  * Click the **Add selected** button to assign the role.
* **Finalize the Officer Creation**
  * After saving, the officer's **username** from step 3 will serve as the **Officer ID**.
  * This **Officer ID** will be used in the subsequent create packet API request. Ensure you pass this ID correctly in the request.

#### 4. Create Centre <a href="#id-4.-create-centre" id="id-4.-create-centre"></a>

A unique default centre will be assigned to the CRVS to process requests. This centre can be created through the Admin Portal. For detailed instructions on how to create a centre, refer to the [**Admin Portal Center Creation Guide**.](https://docs.mosip.io/1.2.0/id-lifecycle-management/support-systems/administration/test/admin-portal-user-guide#create-center)

**Fetching the Centre ID**\
As of now, there is no direct support for fetching the specific centre ID in MOSIP. To retrieve the Centre ID, use the API below to get a list of all centres in the system. From this list, manually search for the Centre ID associated with the newly created centre for CRVS. The “id“ attribute in the response will be the centre ID.

**Get List of All Centres Endpoint:** `{domain}/v1/admin/masterdata/registrationcenters`

**Method:** GET\
\
Once the **Centre ID** is identified, ensure it is saved securely for future reference. This **Centre ID** will be required in subsequent interactions with the CRVS system for processing requests.

#### 5. Create Machine <a href="#id-5.-create-machine" id="id-5.-create-machine"></a>

A unique default machine will be assigned to the CRVS to process requests. This machine can be created through the Admin Portal.

Before creating a new machine, it is required that a public key is fetched using the below API. The public key received in the response of this API is to be used as the public key & signing public key, while adding the details in the admin portal, to create and onboard the machine.

**URL**: `{domain}/v1/keymanager/tpmsigning/publickey`

**Method**: POST

**API Request Structure:**

```json
{     "request" : 
    {         
        "serverProfile" : "Prod"    
     } 
}
```

**Sample Response:**

```json
{
    "id": null,
    "version": null,
    "responsetime": "2025-04-15T14:04:31.683Z",
    "metadata": null,
    "response": 
    {
        "publicKey": "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAzWOM81oggDiy26SPzASVCLpEf0sJC-81j7GCpDHVcHCAfQVIxaBP9K6u2R19mgiakVY92Nlb5y4PUKV1EpLbZKQxaK14gU4ks7hroCM_gbEssaon7lCFCu8uobKriXlC9RI1ZY9HF9QFfilCuGC9q58gZ_YC-VMGZOB9YtN_5QRbXvI9XQr-d1eODtOVuVCpsPz6FkEHOSWdj0HPLeGTLZO7Ac7dfMyksNJzfmad6PQ7i2GHQ1ZqK6aVTZOt37_kuGkUz7CzVhBNhsdYVeK-qG331dI66XMxSVYNK5O9poDzH1mAAIG_2MdxAEWHcDstZl6YvmWn5-JEhS6QdB6mFwIDAQAB"
    },
    "errors": null
}
```

For detailed instructions on how to create a machine, refer to the [**Admin Portal Machine Creation Guide**](https://docs.mosip.io/1.2.0/id-lifecycle-management/support-systems/administration/test/admin-portal-user-guide#machines)

{% hint style="info" %}
**Note: “/home/mosip/.mosipkeys“** location must be volume mounted and kept secure as per the best security practices to prevent unauthorised access.
{% endhint %}

**Fetching the Machine ID**

As of now, there is no direct support for fetching the specific machine ID in MOSIP. To retrieve the machine ID, use the API below to get a list of all centres in the system. From this list, manually search for the machine ID associated with the newly created centre for CRVS. The “id“ attribute in the response will be the machine ID.

**Get a List of All Machine Endpoints:** `{domain}/v1/masterdata/machines`

**Method:** GET

Once the **Machine ID** is identified, ensure it is saved securely for future reference. This **Machine ID** will be required in subsequent interactions with the CRVS system for processing requests.

#### 6. Map Officer to Centre and Machine <a href="#id-6.-map-officer-to-centre-and-machine" id="id-6.-map-officer-to-centre-and-machine"></a>

Once the officer, centre, and machine are created for CRVS, the next step is to map the user to the centre. This ensures the user is properly associated with the correct zone and centre for their operations.

1. **Log in to Admin UI**
   1. Log in to the Admin UI using the **admin** user created in Keycloak if it is a fresh environment.
2. **Map Zone to User**
   1. Navigate to **Resources** → **User Zone Mapping** → **Map Zone**.
   2. Select the **username** for which the zone is to be mapped.
   3. Choose the appropriate **zone** from the dropdown.
   4. Click **Save**.
   5. Refer to the accompanying images for further guidance.
3. **Activate the User**
   1. After mapping the zone, activate the user.
4. **Map Centre to User**
   1. Navigate to **Resources** → **User Centre Mapping**.
   2. Select the **username** for which the centre needs to be mapped.
   3. Choose the appropriate **centre** from the dropdown.
   4. Click **Save**.
   5. Activate the user, as outlined in Step 3.

#### 7. Create the AID <a href="#id-7.-create-the-rid" id="id-7.-create-the-rid"></a>

The Application ID (AID) refers to the unique identifier assigned to track the packet that is being processed for events such as birth or death registration. It can be used by MOSIP or CRVS to track the progress and status of the specific event.

**AID Structure(Recommended):**

1. **Centre ID** (First 5 digits): The first 5 digits of the RID represent the **Centre ID**.
2. **Machine ID** (Next 5 digits): The next 5 digits of the RID represent the **Machine ID**.
3. **Random Sequence** (next N digits): The next N digits can be a randomly generated sequence based on the length that the country wants to use for the RID.

**Example of AID:**

For the AID `10001100771006920220128223618`The breakdown is as follows:

1. **Centre ID**: `10001` (First 5 digits)
2. **Machine ID**: `10077` (Next 5 digits)
3. **Random Sequence**: `1006920220128223618` (Remaining 16 digits)

The AID format mentioned above is the recommendation to be followed, but not mandatory. CRVS can generate the AID in any specified format as per their requirement and include it in the Create Packet API Request to ensure proper packet identification and mapping.

Once all the above pre-requisites are in place, the next step is to initiate a request(birth/death/update) by calling the create packet API of MOSIP’s packet manager module. API structure, required fields, and other details are mentioned further in this document.

#### **8. Create Packet API** (Packet Manager Module) <a href="#id-8.-create-packet-api-packet-manager-module" id="id-8.-create-packet-api-packet-manager-module"></a>

**Create Packet Endpoint:** {domain}/commons/v1/packetmanager/createPacket

**Method:** PUT

**API request Structure**:

```json
{
    "id": "string",
    "version": "string",
    "requesttime": "2025-02-25T11:14:17.667Z",
    "request": {
        "id": {{aid}},
        "refId": "10007_10007",
        "offlineMode": false,
        "process": "CRVS_NEW",
        "source": "CRVS1",
        "schemaVersion": "0.3",
        "fields": {
           "fullName": "[ {\n  \"language\" : \"eng\",\n  \"value\" : \"test_update\"\n}]",
			"dateOfBirth": "2023/12/30",
			"gender": "[ {\n  \"language\" : \"eng\",\n  \"value\" : \"Male\"\n}]",
			"addressLine1": "[ {\n  \"language\" : \"eng\",\n  \"value\" : \"addressLine1\"\n}]",
			"addressLine2": "[ {\n  \"language\" : \"eng\",\n  \"value\" : \"addressLine2\"\n}]",
			"city": "[ {\n  \"language\" : \"eng\",\n  \"value\" : \"Bangalore\"\n}]",
			"state": "[ {\n  \"language\" : \"eng\",\n  \"value\" : \"Karnataka\"\n}]",
			"postalCode": "14022",
			"email": "wwe@gmail.com",
			"phone": "7790075085",
			"zone" : "[ {\n  \"language\" : \"eng\",\n  \"value\" : \"Ben Mansour\"\n}]",
			"region" : "[ {\n  \"language\" : \"eng\",\n  \"value\" : \"Rabat Sale Kenitra\"\n}]",
			"province":"[ {\n  \"language\" : \"eng\",\n  \"value\" : \"Kenitra\"\n}]",
		},
       
		"metaInfo": {
			"metaData": "[{\n  \"label\" : \"registrationType\",\n  \"value\" : \"CRVS_NEW\"\n}, {\n  \"label\" : \"machineId\",\n  \"value\" : \"10007\"\n}, {\n  \"label\" : \"centerId\",\n  \"value\" : \"10007\"\n}]",
			"registrationId": {{rid}},
			"operationsData": "[ {\n  \"label\" : \"officerId\",\n  \"value\" : \"crvs\"\n}, {\n  \"label\" : \"officerBiometricFileName\",\n  \"value\" : null\n}, {\n  \"label\" : \"supervisorId\",\n  \"value\" : null\n}, {\n  \"label\" : \"supervisorBiometricFileName\",\n  \"value\" : null\n}, {\n  \"label\" : \"supervisorPassword\",\n  \"value\" : \"false\"\n}, {\n  \"label\" : \"officerPassword\",\n  \"value\" : \"true\"\n}, {\n  \"label\" : \"supervisorPIN\",\n  \"value\" : null\n}, {\n  \"label\" : \"officerPIN\",\n  \"value\" : null\n}, {\n  \"label\" : \"supervisorOTPAuthentication\",\n  \"value\" : \"false\"\n}, {\n  \"label\" : \"officerOTPAuthentication\",\n  \"value\" : \"false\"\n} ]",
			"capturedRegisteredDevices": "[]",
			"creationDate": "20250225110733"			
		},
		
		
		"audits": [
			{
				"uuid": "c75s4521-87d6-6a4x-balw-2432e2355440",
				"createdAt": "2025-02-25T13:22:49.214Z",
				"eventId": "REG-EVT-066",
				"eventName": "PACKET_CREATION_SUCCESS",
				"eventType": "USER",
				"hostName": "DESKTOP-JL4BAEV",
				"hostIp": "localhost",
				"applicationId": "REG",
				"applicationName": "REGISTRATION",
				"sessionUserId": "crvs",
				"sessionUserName": "crvs",
				"id": {{aid}},
				"idType": "REGISTRATION_ID",
				"createdBy": "crvs",
				"moduleName": "Packet Handler",
				"moduleId": "REG-MOD-117",
				"description": "Packet Successfully Created",
				"actionTimeStamp": "2025-02-25T07:52:49.214Z"
			}
        ],   
		"schemaJson":"{\"$schema\": \"http://json-schema.org/draft-07/schema#\",\"description\": \"MOSIP Sample identity\",\"additionalProperties\": false,\"title\": \"MOSIP identity\",\"type\": \"object\",\"definitions\": {\"simpleType\": {\"uniqueItems\": true,\"additionalItems\": false,\"type\": \"array\",\"items\": {\"additionalProperties\": false,\"type\": \"object\",\"required\": [\"language\",\"value\"],\"properties\": {\"language\": {\"type\": \"string\"},\"value\": {\"type\": \"string\"}}}},\"documentType\": {\"additionalProperties\": false,\"type\": \"object\",\"properties\": {\"format\": {\"type\": \"string\"},\"type\": {\"type\": \"string\"},\"value\": {\"type\": \"string\"},\"refNumber\": {\"type\": [\"string\",\"null\"]}}},\"biometricsType\": {\"additionalProperties\": false,\"type\": \"object\",\"properties\": {\"format\": {\"type\": \"string\"},\"version\": {\"type\": \"number\",\"minimum\": 0},\"value\": {\"type\": \"string\"}}}},\"properties\": {\"identity\": {\"additionalProperties\": false,\"type\": \"object\",\"required\": [\"IDSchemaVersion\",\"fullName\",\"dateOfBirth\",\"gender\",\"addressLine1\",\"addressLine2\",\"addressLine3\",\"region\",\"province\",\"city\",\"zone\",\"postalCode\",\"phone\",\"email\",\"proofOfIdentity\",\"individualBiometrics\"],\"properties\": {\"proofOfAddress\": {\"bioAttributes\": [],\"fieldCategory\": \"pvt\",\"format\": \"none\",\"fieldType\": \"default\",\"$ref\": \"#/definitions/documentType\"},\"gender\": {\"bioAttributes\": [],\"fieldCategory\": \"pvt\",\"format\": \"\",\"fieldType\": \"default\",\"$ref\": \"#/definitions/simpleType\"},\"city\": {\"bioAttributes\": [],\"validators\": [{\"validator\": \"^(?=.{0,50}$).*\",\"arguments\": [],\"type\": \"regex\"}],\"fieldCategory\": \"pvt\",\"format\": \"none\",\"fieldType\": \"default\",\"$ref\": \"#/definitions/simpleType\"},\"postalCode\": {\"bioAttributes\": [],\"validators\": [{\"validator\": \"^[(?i)A-Z0-9]{5}$|^NA$\",\"arguments\": [],\"type\": \"regex\"}],\"fieldCategory\": \"pvt\",\"format\": \"none\",\"type\": \"string\",\"fieldType\": \"default\"},\"proofOfException-1\": {\"bioAttributes\": [],\"fieldCategory\": \"evidence\",\"format\": \"none\",\"fieldType\": \"default\",\"$ref\": \"#/definitions/documentType\"},\"referenceIdentityNumber\": {\"bioAttributes\": [],\"validators\": [{\"validator\": \"^([0-9]{10,30})$\",\"arguments\": [],\"type\": \"regex\"}],\"fieldCategory\": \"pvt\",\"format\": \"kyc\",\"type\": \"string\",\"fieldType\": \"default\"},\"individualBiometrics\": {\"bioAttributes\": [\"leftEye\",\"rightEye\",\"rightIndex\",\"rightLittle\",\"rightRing\",\"rightMiddle\",\"leftIndex\",\"leftLittle\",\"leftRing\",\"leftMiddle\",\"leftThumb\",\"rightThumb\",\"face\"],\"fieldCategory\": \"pvt\",\"format\": \"none\",\"fieldType\": \"default\",\"$ref\": \"#/definitions/biometricsType\"},\"province\": {\"bioAttributes\": [],\"validators\": [{\"validator\": \"^(?=.{0,50}$).*\",\"arguments\": [],\"type\": \"regex\"}],\"fieldCategory\": \"pvt\",\"format\": \"none\",\"fieldType\": \"default\",\"$ref\": \"#/definitions/simpleType\"},\"zone\": {\"bioAttributes\": [],\"fieldCategory\": \"pvt\",\"format\": \"none\",\"fieldType\": \"default\",\"$ref\": \"#/definitions/simpleType\"},\"proofOfDateOfBirth\": {\"bioAttributes\": [],\"fieldCategory\": \"pvt\",\"format\": \"none\",\"fieldType\": \"default\",\"$ref\": \"#/definitions/documentType\"},\"addressLine1\": {\"bioAttributes\": [],\"validators\": [{\"validator\": \"^(?=.{0,50}$).*\",\"arguments\": [],\"type\": \"regex\"}],\"fieldCategory\": \"pvt\",\"format\": \"none\",\"fieldType\": \"default\",\"$ref\": \"#/definitions/simpleType\"},\"addressLine2\": {\"bioAttributes\": [],\"validators\": [{\"validator\": \"^(?=.{3,50}$).*\",\"arguments\": [],\"type\": \"regex\"}],\"fieldCategory\": \"pvt\",\"format\": \"none\",\"fieldType\": \"default\",\"$ref\": \"#/definitions/simpleType\"},\"residenceStatus\": {\"bioAttributes\": [],\"fieldCategory\": \"kyc\",\"format\": \"none\",\"fieldType\": \"default\",\"$ref\": \"#/definitions/simpleType\"},\"addressLine3\": {\"bioAttributes\": [],\"validators\": [{\"validator\": \"^(?=.{3,50}$).*\",\"arguments\": [],\"type\": \"regex\"}],\"fieldCategory\": \"pvt\",\"format\": \"none\",\"fieldType\": \"default\",\"$ref\": \"#/definitions/simpleType\"},\"email\": {\"bioAttributes\": [],\"validators\": [{\"validator\": \"^[A-Za-z0-9_\\\\-]+(\\\\.[A-Za-z0-9_]+)*@[A-Za-z0-9_-]+(\\\\.[A-Za-z0-9_]+)*(\\\\.[a-zA-Z]{2,})$\",\"arguments\": [],\"type\": \"regex\"}],\"fieldCategory\": \"pvt\",\"format\": \"none\",\"type\": \"string\",\"fieldType\": \"default\"},\"introducerRID\": {\"bioAttributes\": [],\"fieldCategory\": \"evidence\",\"format\": \"none\",\"type\": \"string\",\"fieldType\": \"default\"},\"introducerValidationToken\": {\"bioAttributes\": [],\"fieldCategory\": \"evidence\",\"format\": \"none\",\"fieldType\": \"default\",\"$ref\": \"#/definitions/simpleType\"},\"introducerValidationTokenDetails\": {\"bioAttributes\": [],\"fieldCategory\": \"evidence\",\"format\": \"none\",\"fieldType\": \"default\",\"$ref\": \"#/definitions/documentType\"},\"introducerBiometrics\": {\"bioAttributes\": [\"leftEye\",\"rightEye\",\"rightIndex\",\"rightLittle\",\"rightRing\",\"rightMiddle\",\"leftIndex\",\"leftLittle\",\"leftRing\",\"leftMiddle\",\"leftThumb\",\"rightThumb\",\"face\"],\"fieldCategory\": \"pvt\",\"format\": \"none\",\"fieldType\": \"default\",\"$ref\": \"#/definitions/biometricsType\"},\"fullName\": {\"bioAttributes\": [],\"validators\": [{\"validator\": \"^(?=.{3,50}$).*\",\"arguments\": [],\"type\": \"regex\"}],\"fieldCategory\": \"pvt\",\"format\": \"none\",\"fieldType\": \"default\",\"$ref\": \"#/definitions/simpleType\"},\"dateOfBirth\": {\"bioAttributes\": [],\"validators\": [{\"validator\": \"^(1869|18[7-9][0-9]|19[0-9][0-9]|20[0-9][0-9])/([0][1-9]|1[0-2])/([0][1-9]|[1-2][0-9]|3[01])$\",\"arguments\": [],\"type\": \"regex\"}],\"fieldCategory\": \"pvt\",\"format\": \"none\",\"type\": \"string\",\"fieldType\": \"default\"},\"individualAuthBiometrics\": {\"bioAttributes\": [\"leftEye\",\"rightEye\",\"rightIndex\",\"rightLittle\",\"rightRing\",\"rightMiddle\",\"leftIndex\",\"leftLittle\",\"leftRing\",\"leftMiddle\",\"leftThumb\",\"rightThumb\",\"face\"],\"fieldCategory\": \"pvt\",\"format\": \"none\",\"fieldType\": \"default\",\"$ref\": \"#/definitions/biometricsType\"},\"introducerUIN\": {\"bioAttributes\": [],\"fieldCategory\": \"evidence\",\"format\": \"none\",\"type\": \"string\",\"fieldType\": \"default\"},\"proofOfIdentity\": {\"bioAttributes\": [],\"fieldCategory\": \"pvt\",\"format\": \"none\",\"fieldType\": \"default\",\"$ref\": \"#/definitions/documentType\"},\"IDSchemaVersion\": {\"bioAttributes\": [],\"fieldCategory\": \"none\",\"format\": \"none\",\"type\": \"number\",\"fieldType\": \"default\",\"minimum\": 0},\"proofOfException\": {\"bioAttributes\": [],\"fieldCategory\": \"evidence\",\"format\": \"none\",\"fieldType\": \"default\",\"$ref\": \"#/definitions/documentType\"},\"phone\": {\"bioAttributes\": [],\"validators\": [{\"validator\": \"^[+]*([0-9]{1})([0-9]{9})$\",\"arguments\": [],\"type\": \"regex\"}],\"fieldCategory\": \"pvt\",\"format\": \"none\",\"type\": \"string\",\"fieldType\": \"default\"},\"introducerName\": {\"bioAttributes\": [],\"fieldCategory\": \"evidence\",\"format\": \"none\",\"fieldType\": \"default\",\"$ref\": \"#/definitions/simpleType\"},\"proofOfRelationship\": {\"bioAttributes\": [],\"fieldCategory\": \"pvt\",\"format\": \"none\",\"fieldType\": \"default\",\"$ref\": \"#/definitions/documentType\"},\"UIN\": {\"bioAttributes\": [],\"fieldCategory\": \"none\",\"format\": \"none\",\"type\": \"string\",\"fieldType\": \"default\"},\"preferredLang\": {\"bioAttributes\": [],\"fieldCategory\": \"pvt\",\"format\": \"none\",\"type\": \"string\",\"fieldType\": \"dynamic\"},\"region\": {\"bioAttributes\": [],\"validators\": [{\"validator\": \"^(?=.{0,50}$).*\",\"arguments\": [],\"type\": \"regex\"}],\"fieldCategory\": \"pvt\",\"format\": \"none\",\"fieldType\": \"default\",\"$ref\": \"#/definitions/simpleType\"}}}}}"
    }
}
```

{% hint style="info" %}
**Note**: The API request shared above is only a sample and is not to be used for any implementation.
{% endhint %}

#### **Field Descriptions**

#### **Request Object**

1. `source`: Specifies the source of the registration request. This will be the same for any request that comes to MOSIP for birth or death.
2. `process`: Identifies the specific process for the registration.
   * `CRVS_NEW` - When initiating an infant birth request
   * `CRVS_DEATH` - When initiating a death registration request
3. `id`The unique identifier for the registration request(AID).

{% hint style="info" %}
**Note**: As per the current implementation, if the same AID is used twice, the record will be updated with the latest request data.
{% endhint %}

* `ref_id:` Combination of centre ID and machine ID.
  * Ex - “centerid\_machineid”
* `schema_version`The version of the ID schema that the country is using in production.

**Field object:**

1. `fullName`: The full name of the individual.
2. `dateOfBirth`: The date of birth of the individual.
3. `gender`: Gender of the individual.
4. `addressLine1`: First line of the address.
5. `addressLine2`: Second line of the address.
6. `city`: City of residence.
7. `state`: State of residence.
8. `postalCode`: Postal code of the address.
9. `email`: Email address.
10. `phone`: Contact phone number.
11. `zone`: Geographic zone.
12. `region`: Region of the address.
13. `province`: Province of residence.
14. Additional fields
    1. Birth registration field:
       1. `introducerInfoToken`: Introducer’s eSignet user info jwt token, to be passed when sending a request for the birth registration
    2. Death registration field:
       1. `deceasedInformer`: Informant’s eSignet user info jwt token, to be passed when sending a request for the death registration
       2. `deceasedDeclarationDate`: The date on which the individual was declared deceased.
       3. `declaredAsDeceased`: A flag indicating that the individual has been officially marked as deceased.
       4. `typeOfDeath`: Specifies the nature of the death, such as _natural_ or _jurisdictional_.

**MetaInfo Object (Center and Operator Information):**

1. `centerId`: Unique identifier for the centre where the registration is processed.
2. `machineId`: Unique identifier for the machine used for registration.
3. `operationsData`: Contains fields such as officer ID, officer password, supervisor ID, etc.
4. `registration_type`: This is the value same as the process field for birth(`CRVS_NEW`) or death(`CRVS_DEATH`).

`centerId`, `machineId`, `officerId` must be provided along with any additional relevant operational information for the request to be processed.

**Audit Object:**

1. `uuid`: Unique uuid to be sent with any request coming from CRVS.
2. Please add the values for the other fields in the audit object as per the details of the machine and the person who is registering the request from the CRVS.

It is required that at least one attribute in the audit object is populated with valid data before making the request.

`schemaJson`: JSON schema (in stringified format) used by the country

**Sample Response:**

```json
{
    "id": "mosip.registration.packet.writer",
    "version": "v1",
    "responsetime": "2025-04-07T13:38:09.184Z",
    "metadata": null,
    "response": [
        {
            "id": "8239749062",
            "packetName": "8239749062_evidence",
            "source": "CRVS1",
            "process": "CRVS_NEW",
            "refId": "10018_10084",
            "schemaVersion": "0.3",
            "signature": "RGvN6tYDSvwxP6LAs1Qng1jLkRi1MASxRkB5Vu-EtnQx2R2VGVInhysPWaBrILi_bMKcHFCV8JI8FlQaf4NuKJ313wsAs_jVJSMCgUjaPoeyaEV0mUW90-BulREHqNfSuLzYY1cBmomiSNf1qRMkxwKOG2phWoJuigFEa2UjCWZffldMAGtNs5eXMWuglcjLCJFw7KPxDo3tGD6u92JN35F4te0R5_fN46XaaLDgkfWhBRuCDS0mJKprYXOnQaXQPGdNorxuNE7_emFxWKafu59TDowa--DDv6c1sbOG3mePOG4_QW8RhKOt8r9oLrU1nhkEuksAAW8zL3fZ7FmTPQ",
            "encryptedHash": "u7BUoTU5CqCQTe1BeLReRaWMcB7-FsfoxLoj68FMUhw",
            "providerName": "PacketWriterImpl",
            "providerVersion": "v1.0",
            "creationDate": "2025-04-07T13:38:07.769757Z"
        },
        {
            "id": "8239749062",
            "packetName": "8239749062_optional",
            "source": "OPENCRVS",
            "process": "CRVS_NEW",
            "refId": "10018_10084",
            "schemaVersion": "0.3",
            "signature": "fShMATi2V0oTtk6qhjJxn-XXbzEfQttavH676-kyjF90WLos6cwA9oyAv-gvRAScNoREUjT-Zj6z-RltTwCoRVkU6jeqzWFODnfoPtxp13Adsj2tHhp94gaerzBDvKxUxjn7ecM2I9FJb4kt5M-a0YSI_VtlTFfhTTfIvxXBnDEPGT6FxpDho_wlsKwXs1uigRPYKnXDeP7Sxy3AgvVkAkcNKCmBF5skzOqJ18bibpQU8q2l9dW5Anxy54CwRsvXhJRq43sWTm5CP3xHa5dBFDrS2qa3BZQ8Igt9BzEJoLBptTLm5wyA3aCJ_GHe_8ekWxkTFChDJX9-5UwPmxfWeA",
            "encryptedHash": "-kMmslv2AWMMMdmXykoFP3kr0mW0m3X1eFMEl_2LQRk",
            "providerName": "PacketWriterImpl",
            "providerVersion": "v1.0",
            "creationDate": "2025-04-07T13:38:08.283129Z"
        },
        {
            "id": "8239749062",
            "packetName": "8239749062_id",
            "source": "CRVS1",
            "process": "CRVS_NEW",
            "refId": "10018_10084",
            "schemaVersion": "0.3",
            "signature": "hK_BiKShkXyRn6Pv3PRXLNkagF4WQYwX-9INbD8u45vEPIIdXmaz1o6Z-8SKx6VvEpUYePFDuhpRZJMLg3giNYvpRIM1U8T4tAXp_P6XEgOvfUivqXgILMkQWNkM-Bk6ygzNV1GN5RrTUoi2vTxuljlyN94IOCpQNFGap9l1Ge_Ab278Y0ofCCzmXM9vWnew-sJ5w4hxagKvIn2DIsoNfb8RbMD2n6ebm8LP1uKAdpwTRx0HOTJyxW-svTjdFzYP_n5qi0Ggqa6V7x28DD8b43XPGusNJAlG3PJy06aB6IVhq9P1GwFn2QMm_-2U60mJlvq7VsoBrx7WWEa8rree4w",
            "encryptedHash": "qBaCdSxAlOtuhcwnG7JojI4WzloHhe_9h2nk6b6LM64",
            "providerName": "PacketWriterImpl",
            "providerVersion": "v1.0",
            "creationDate": "2025-04-07T13:38:08.687475Z"
        }
    ],
    "errors": []
}

```

\
9\. **Trigger API (Registration Processor Module)**

In MOSIP, after a packet is created, it is processed for validations and verification of the information in the **Registration Processor**. Inside the Registration Processor, each packet follows a specific workflow defined by the **Camel route**.

For the integration with CRVS, the newly created packet is uploaded to the Object Store. To pick up this new packet and trigger the processing, we have developed a new API. This API ensures to trigger the appropriate workflow is triggered for further processing of the registration packet. For this integration, the camel route workflow to be executed is determined by the values provided for the **source** and **process**.\
\
API Documentatio&#x6E;**:** [Create workflow instance for packet processing. | Registration processor](https://mosip.stoplight.io/docs/registration-processor/branches/main/d56c892cfa950-create-workflow-instance-for-packet-processing)
