## What is .well-known folder?

The ".well-known" folder is a convention used in web development to provide a standardized location for certain files or resources that need to be publicly accessible and discoverable. It typically resides at the root level of a website or web server. The purpose of this folder is to make it easy for web clients (browsers, applications, or services) to find important files or resources related to web services and security.

## Why e-Signet uses ".well-know" directory?

e-Signet uses the ".well-known" directory to serve the following purposes:

* **Standardization**: To provide a standardized location for specific public files and resources related to web services and security. It makes it easier for developers and web clients using e-Signet to know where to look for important information.
* **Security**: Security-related files and resources can be placed in the ".well-known" directory, such as the public certificate for encryption and signature verification can be placed here. 
* **Interoperability**: By following the ".well-known" convention, web developers using e-Signet can ensure interoperability with various web standards and protocols. For example, e-Signet shares the context file which contains the structure of its Verifiable Credentials.
* **Ease of Configuration**: Web servers can be configured to serve files from the ".well-known" directory without needing custom configurations for each specific resource. This simplifies the server setup and maintenance process.
* **Transparency**: For matters related to security policies and contact information, such as in the "security.txt" file, placing them in a well-known location makes it transparent and easily accessible to anyone interested in the website's security practices.

## How is ".well-known" directory used in e-Signet?

MOSIP's ".well-know" directory contains three files,
* jwks.json
* openid-configuration
* oauth-configuration

### jwks.json

<Define>

```
{
  "keys": [
    {
      "kty": "RSA",
      "x5t#S256": "VS8O8lB_M4-ge70X-GmRwVSkRyXyNjnsR0D-jYYpd90",
      "e": "AQAB",
      "use": "sig",
      "kid": "ui7Nf7dSQ3q71wHDz1PauQXna2ruMk9va47kne3cahY",
      "x5c": [
        "MIIDvTCCAqWgAwIBAgIITYyS7rMLxKQwDQYJKoZIhvcNAQELBQAwdzELMAkGA1UEBhMCSU4xCzAJBgNVBAgMAktBMRIwEAYDVQQHDAlCQU5HQUxPUkUxDTALBgNVBAoMBElJVEIxGjAYBgNVBAsMEU1PU0lQLVRFQ0gtQ0VOVEVSMRwwGgYDVQQDDBN3d3cubW9zaXAuaW8gKFJPT1QpMB4XDTIzMDQyODA3MDMyM1oXDTI2MDQyNzA3MDMyM1owfzELMAkGA1UEBhMCSU4xCzAJBgNVBAgMAktBMRIwEAYDVQQHDAlCQU5HQUxPUkUxDTALBgNVBAoMBElJVEIxGjAYBgNVBAsMEU1PU0lQLVRFQ0gtQ0VOVEVSMSQwIgYDVQQDDBt3d3cubW9zaXAuaW8gKE9JRENfU0VSVklDRSkwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCp/7weNfvZ8bza+SKwQZ2fM7dGFCRSc7mCLgfntWU7/5H7XxBc6ATwLfL8PZrbOywkagbmn2tvVjcdfKv3ZwkvhbMGjCS/fhkveu8y0sZt/gSecO6Sp+qdc22ASGL0xUCZ6xMGPLFOTtym28I9qq9qRj+NtJMy0tYN9uQcljkDePleZWseTOJ87KpVjtEMbrZUlG5GX/6JIvBZbkPx/L3N8//lGrJ/Cg/W6qXsN+Uka2Kp8Y0tT67Q8PqWwFYts3B26ve+E1GnVc6OpNB8j/Yw3fOcu0u1UOJbjldk8ytwwDrpxkD8ROTT/RmvjsAyDkeYRGoQ27Q/4nf0zoM22E2rAgMBAAGjRTBDMBIGA1UdEwEB/wQIMAYBAf8CAQEwHQYDVR0OBBYEFIG/x4ajYbA0WYY/pPLKlOpz+FB4MA4GA1UdDwEB/wQEAwIChDANBgkqhkiG9w0BAQsFAAOCAQEAdfVSOlxtL+cYwpcbK0x3bX3WVvXnznV/rkEh/Dh/CFld1dDteT2bOUAi8y74wmZ/ev+8wPiLozgU2vfgM4lIETm2cf/tm9Xm/fC027tQMxbB9e6p90xzRwZd3InDrLJ+USKLv6ywy/yKiZ33jW39J5AzFnx5WlSLfh2AVCmJwhxF2UZLenUOP0D7miQcqCQ89NMX4PKcZa0gPKqTfWv2TB8/SbmA5RJeXb7Mo/c3WSDh4P+sdzy3azm53vWigLNSY5emaMN+i80CrO4C+25EUpbqEbvtGSV0YU5ZtotUDSuF9PG9e77Prj8yFK657MDkXiLkcb0mnx2Fkiu7zmFiSA=="
      ],
      "exp": "2026-04-27T07:03:23.761Z",
      "n": "qf-8HjX72fG82vkisEGdnzO3RhQkUnO5gi4H57VlO_-R-18QXOgE8C3y_D2a2zssJGoG5p9rb1Y3HXyr92cJL4WzBowkv34ZL3rvMtLGbf4EnnDukqfqnXNtgEhi9MVAmesTBjyxTk7cptvCPaqvakY_jbSTMtLWDfbkHJY5A3j5XmVrHkzifOyqVY7RDG62VJRuRl_-iSLwWW5D8fy9zfP_5RqyfwoP1uql7DflJGtiqfGNLU-u0PD6lsBWLbNwdur3vhNRp1XOjqTQfI_2MN3znLtLtVDiW45XZPMrcMA66cZA_ETk0_0Zr47AMg5HmERqENu0P-J39M6DNthNqw"
    },
    {
      "kty": "RSA",
      "x5t#S256": "r4kXB_agNjON1ffULvvQxMn7D1trZkl3_BSPPmxJ6t8",
      "e": "AQAB",
      "use": "sig",
      "kid": "hrLG-Zbo-KD4c1mJjSBlWbSO5LZYHsoCDl-Wy6yRfXI",
      "x5c": [
        "MIIDrTCCApWgAwIBAgIIllIPUoxNBHswDQYJKoZIhvcNAQELBQAwcDELMAkGA1UEBhMCSU4xCzAJBgNVBAgMAktBMRIwEAYDVQQHDAlCQU5HQUxPUkUxDTALBgNVBAoMBElJVEIxGjAYBgNVBAsMEU1PU0lQLVRFQ0gtQ0VOVEVSMRUwEwYDVQQDDAx3d3cubW9zaXAuaW8wHhcNMjIwOTMwMDkzNDA4WhcNMjUwOTI5MDkzNDA4WjB2MQswCQYDVQQGEwJJTjELMAkGA1UECAwCS0ExEjAQBgNVBAcMCUJBTkdBTE9SRTENMAsGA1UECgwESUlUQjEgMB4GA1UECwwXTU9TSVAtVEVDSC1DRU5URVIgKElEQSkxFTATBgNVBAMMDHd3dy5tb3NpcC5pbzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANzxiKwpUd66wQwsEHngQTx5mpqhAI58eo4plfeOLsutwuMrbktPXhsol6TXOKm3XcjNg/7dhF6HED3uU0YyC/CYhZ8SdThokQmPb3mE0G4gnOj94SgSV19xFZWsm4tQcXcca1i5Qzlrb8iotmuTUVcJfd5PgK1xxEgILtmbkHFMtDK42Fif0aDoOa5222/vFeFq9g3+lO7PPbysHRZl12FUtl4FvoB0dlqcJ2zpFl9lycb/8ru1S2+86UJ72yHFoFWo+tkR8Iw/lf0RvRtmc0KTY6l3813MT8uu2IDA//aPrK3CIR0dgyzNMK8e3vqrBXaxYQ8onWSBix2P/KRXlTMCAwEAAaNFMEMwEgYDVR0TAQH/BAgwBgEB/wIBATAdBgNVHQ4EFgQU93hx7ghwaK6OfoQzw5UdljX5NPowDgYDVR0PAQH/BAQDAgKEMA0GCSqGSIb3DQEBCwUAA4IBAQAjwztvdggtsx+cckVziuVl1M7bCBxJTBfmBr3bB7l3exfp5i4VsxQoxIKyPJq4ZUEylxPhO88cMr7p27PV8e4Z3q43j2Qz2ORo1CxIG/MaIIPuattRMm+5WvJTqf/T53Tt049N34aoNP6XqEF9OKoDfnOP/r1I3twX0nN4s6uurM7y6lHhhz94GM4SQ1+bbnSSs9mMNe29qYkEw46aGEJKWSQ96d43/PIJP9A2NQdf1ioeJmXHr1ZSmazf08dtI25tTDk+HwLI4x9K3elX91tItefp6q09RmRtPq7DwGvsXxVMTd6VoGHsSSeI61o37qvOe31+UldG/IpQuoxiFtER"
      ],
      "exp": "2025-09-29T09:34:08.732Z",
      "n": "3PGIrClR3rrBDCwQeeBBPHmamqEAjnx6jimV944uy63C4ytuS09eGyiXpNc4qbddyM2D_t2EXocQPe5TRjIL8JiFnxJ1OGiRCY9veYTQbiCc6P3hKBJXX3EVlaybi1BxdxxrWLlDOWtvyKi2a5NRVwl93k-ArXHESAgu2ZuQcUy0MrjYWJ_RoOg5rnbbb-8V4Wr2Df6U7s89vKwdFmXXYVS2XgW-gHR2WpwnbOkWX2XJxv_yu7VLb7zpQnvbIcWgVaj62RHwjD-V_RG9G2ZzQpNjqXfzXcxPy67YgMD_9o-srcIhHR2DLM0wrx7e-qsFdrFhDyidZIGLHY_8pFeVMw"
    }
  ]
}
```

### openid-configuration

<Define>

```
{
  "issuer": "https://esignet.collab.mosip.net/v1/esignet",
  "authorization_endpoint": "https://esignet.collab.mosip.net/v1/esignet/authorize",
  "token_endpoint": "https://esignet.collab.mosip.net/v1/esignet/oauth/token",
  "userinfo_endpoint": "https://esignet.collab.mosip.net/v1/esignet/oidc/userinfo",
  "jwks_uri": "https://esignet.collab.mosip.net/v1/esignet/oauth/.well-known/jwks.json",
  "scopes_supported": [
    "profile",
    "email",
    "phone"
  ],
  "response_types_supported": [
    "code"
  ],
  "acr_values_supported": [
    "mosip:idp:acr:static-code",
    "mosip:idp:acr:generated-code",
    "mosip:idp:acr:linked-wallet",
    "mosip:idp:acr:biometrics"
  ],
  "userinfo_signing_alg_values_supported": [
    "RS256"
  ],
  "userinfo_encryption_alg_values_supported": [
    "RSAXXXXX"
  ],
  "userinfo_encryption_enc_values_supported": [
    "A128GCM"
  ],
  "response_modes_supported": [
    "query"
  ],
  "token_endpoint_auth_methods_supported": [
    "private_key_jwt"
  ],
  "token_endpoint_auth_signing_alg_values_supported": [
    "RS256"
  ],
  "id_token_signing_alg_values_supported": [
    "RS256"
  ],
  "claim_types_supported": [
    "normal"
  ],
  "claims_supported": [
    "name",
    "address",
    "gender",
    "birthdate",
    "picture",
    "email",
    "phone_number",
    "individual_id"
  ],
  "claims_locales_supported": [
    "en"
  ],
  "display_values_supported": [
    "page",
    "popup",
    "touch",
    "wap"
  ],
  "ui_locales_supported": [
    "en"
  ]
}
```

### oauth-configuration

<Define>

```
To Add
```
