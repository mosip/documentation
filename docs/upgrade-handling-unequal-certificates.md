# Handling unequal certificates in IDA and Key-Manager Databases

First, we will compare the thumbprints in the key_alias tables' thumbprint column of the mentioned IDA and Keymanager DB. 

To check if the thumbprints are the same in both databases, we can follow these steps. For demonstration purposes, we will use 'mpartner-default-auth' as an example.

#### Check through SQL commands

~~~
-- SQL commands to find the entry in both Keymanager  and IDA databases respectively. The cert_thumbprint column to be compared between both the entries.
select * from key_alias where app_id='PARTNER' and ref_id = 'mpartner-default-auth' order by key_expire_dtimes desc limit 1;
select * from key_alias where app_id='IDA' and ref_id = 'mpartner-default-auth' order by key_expire_dtimes desc limit 1;
~~~

In the results of the above query, if it is found that the thumbprints do not match, the next objective is to take the MOSIP signed certificate from keymanager and store it in IDA manually, so that they match.

Here is a simple method to accomplish that task.

A. **Perform the required authentication at authmanager portal using the below swagger URL**

[](https://api-internal.dev.mosip.net/v1/authmanager/swagger-ui/index.html?configUrl=/v1/authmanager/v3/api-docs/swagger-config#/authmanager/clientIdSecretKey)

**Sample request body**:

~~~

{
  {
  "id": "string",
  "version": "string",
  "requesttime": "2023-08-31T12:42:06.436Z",
  "metadata": {},
  "request": {
   "clientId": "mosip-regproc-client",
    "secretKey": "****************",
    "appId": "regproc"
  }
}
~~~

B. **Get the certificate using following swagger URL**

[](https://api-internal.dev.mosip.net/v1/keymanager/swagger-ui/index.html?configUrl=/v1/keymanager/v3/api-docs/swagger-config#/keymanager/getCertificate)

In the `app_id` field use : PARTNER , in the `ref_id` field use : name of the partner whose cert thumbprints are mismatching such as `mpartner-default-auth`.

**Sample response**: 

~~~
{
  "id": null,
  "version": null,
  "responsetime": "2023-08-31T12:44:28.804Z",
  "metadata": null,
  "response": {
    "certificate": "-----BEGIN CERTIFICATE-----\nMIIDjCCAqagAwgKoZIhvcNAQELBQAwdjELMAkGA1UE\nBhMCSU4xCzAJBgNVBAgMAktBMRIwEAYDVQQHDAlCQU5HQUxPUkUxDTALBgNVBAoM\nBElJVEIxIDAeBgNVBAsMF01PU0lQLVRFQ0gtQ0VOVEVSIChQTVMpMRUwEwYDVQQD\nDAx3d3cubW9zaXAuaW8wHhcNMjMwNzE4MDgwNDA4WhcNMjQwNzE3MDgwNDA4WjCB\ngzELMAkGA1UEBhMCSU4xCzAJBgNVBAgMAktBMRIwEAYDVQQHDAlCQU5HQUxPUkUx\nDTALBgNVBAoMBElJVEIxIDAeBgNVBAsMF01PU0lQLVRFQ0gtQ0VOVEVSIChJREEp\nMSIwIAYDVQQDDBlJREEtbXBhcnRuZXItZGVmYXVsdC1hdXRoMIIBIjANBgkqhkiG\n9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtcHF46xabZVp3WtvULbMT/5BBDtzO5pR00nb\nhg+lJ/Tjxtdk6XnMWV7uDD3vsAAhyBw/DxD0DApb02o6Ocf8yMl5NSWIPzJPFSGw\nL6fMhJUuocE/Ng9fVQ4cO9gC/QLxVKTRncpGJeXh0WE6zcZO5t8Vkvy8hq5IIS44\nOECp9ynhx6OIhvEZaJmETmnVQoYZ6KhcPVNgb7otXimSOmuZ4XDhYSJXxE7CT7V+\n8Q/pZvQ4apjmPhqCB5dypEwkuFvDk1fkRJhyHgZhd8adsuj3mbRlK9O7tHFV0hV2\nYo93csKu7AqqU7H+H788CDkjmOX6LqaHk5LxPufsKOWp8DfhqQIDAQABo0IwQDAP\nBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBRDUl0RAF5gjF8Kqn0SQW8oTpWgcTAO\nBgNVHQ8BAf8EBAMCAqQwDQYJKoZIhvcNAQELBQADggEBAA7dj1TqEHjZFMju9wt8\nDRI4sUMbf4YtPQQ65ACZ5K+mSBsKWwNQHXna8wn7JMOAFZFxNmz8TKFXAFBbVfYg\neqd2LPsgVpUTy35E3BwjTU90X0viS6o/2bNT0UAo5u1s9PG9YY7p/AUfr1x3kVow\nkplctHOwFmEF1S+Gzq2F1q7sFV41sePYNf5ZEDByc37M9Mdm7D4nddcnYFEbSOdT\nOOCVjt9yM50rE7OinFdBMlkkRiWazuxoXmR2ysumIf0szfNLuCsvJUZw68MUWY8g\nNuPEOUxOo3Es7uNkPTWbLPN5p2tMGNJ3LC4cp86e1aSCzNRFYeDcPbuvf966CY4M\n7X8=\n-----END CERTIFICATE-----\n",
    "certSignRequest": null,
    "issuedAt": "2023-07-18T08:04:08.000Z",
    "expiryAt": "2024-07-17T08:04:08.000Z",
    "timestamp": "2023-08-31T12:44:28.855Z"
  },
  "errors": null
}
~~~

C. Now, reauthenticate in the same authmanager URL (note the different clientId , appId and corresponding secret key changes )

https://api-internal.dev.mosip.net/v1/authmanager/swagger-ui/index.html?configUrl=/v1/authmanager/v3/api-docs/swagger-config#/authmanager/clientIdSecretKey

**Sample Request**

~~~
{
  {
  "id": "string",
  "version": "string",
  "requesttime": "2023-08-31T12:42:06.436Z",
  "metadata": {},
  "request": {
    "clientId": "mosip-ida-client",
    "secretKey": "************",
    "appId": "ida"
  }
}
~~~

D. After getting the certificate through step B mentioned above, copy it and use it in the following POST request in the below swagger URL:

https://api-internal.dev.mosip.net/idauthentication/v1/internal/swagger-ui/index.html?configUrl=/idauthentication/v1/internal/v3/api-docs/swagger-config#/keymanager/uploadCertificate

In `applicationId` field use `IDA` and in the `referenceId` field use _name of the partner_ whose cert thumbprints are mismatching such as `mpartner-default-auth`.

**Sample request**

```
{
  "id": "string",
  "version": "string",
  "requesttime": "2023-08-31T12:46:55.317Z",
  "metadata": {},
  "request": {
    "applicationId": "IDA",
    "referenceId": "mpartner-default-auth",
    "certificateData": "certificate from step-B"
  }
}
```

After successfully completing this final step, we can proceed to the SQL cmd check mentioned at the beginning of this document and ensure that the thumbprints now match.

### Basic Troubleshooting

1. Always ensure that you are using the correct base-url for your environment. In our case, it is dev.mosip.net and this should be used in all swagger links. Make sure to change it according to your requirement.

2. If you encounter an error code such as "errorCode": "500", "message": "401 Unauthorized", please re-authenticate using the authmanager token provided and ensure that you are using the proper credentials.

3. If you receive a 400 Bad request error, please resend your request with the correct time format and verify that your request JSON is in the specified format.

4. If you encounter any other issues, please remember to post your queries on the [MOSIP Community](https://community.mosip.io/).
