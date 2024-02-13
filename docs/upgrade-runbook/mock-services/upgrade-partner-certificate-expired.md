# Partners' Certificate Expired 

_Here's how to fix it!_.

The key point to note here is that MOSIP only accepts partners whose client certificates have a minimum of 1 year of validity remaining. MOSIP re-signs the client certificate with a 1-year validity. The respective partner must renew their certificate before the MOSIP-signed certificate expires in order to continue communication with MOSIP.

However, if this renewal is not done, the certificates will expire.

Here is a three-step process to address this scenario:

a. **How to check the validity of your partner's certificate?**

To check the validity, the user must have access to the database.

The user can access the `mosip_keymanager` database and open two tables: `ca_cert_store` and `partner_cert_store`.

The `ca_cert_store` table stores the CA and SUBCA/Intermediate CA certificates, while the `partner_cert_store` table stores the PARTNER/CLIENT certificates. In both of these tables, there are columns named `cert_not_before` and `cert_not_after` which provide details about the validity of the partner's certificate.

b. **How to extend the validity of the partner's certificate?**

There are two categories of partners: MOSIP Internal partners (e.g., IDA) and External partners (e.g., Device Partners, MISP partners).

1) For MOSIP Internal partners, if the validity of their certificate needs to be increased, the onboarder script can be run again for that specific partner. The onboarder will create fresh certificates and upload them to extend the validity.

2) For External Partners, they will need to obtain fresh certificates from their CA and upload them to extend their validity.

c. **Troubleshooting common errors**:

`KER-ATH-401 Authentication Failed`

If the user encounters this error code, it means that the user is not authenticated. The user should authenticate first before using the API.

`KER-PCM-005 Root CA Certificate not found`.

If the user encounters this error code, it means that there is an issue with either the CA or SUBCA certificate. The user must resolve the CA/SUBCA issue first.

