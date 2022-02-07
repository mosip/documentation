This document defines the APIs specifications for various operations that ABIS can perform to integrate with MOSIP.

API specification version: **0.9**

Published Date: February 05, 2021

# Revision Note
Publish Date|Revision
------------|-------
May 07, 2020|This is the first formal publication of the interface as a version-ed specification. Earlier draft are superseded by this document. The interface is revamped to make it friendlier to programmers and also has a new method for conversion.
June 09, 2020|A note related to targetFPIR was added
June 26, 2020|New [failure reason](#failure-reasons) (code - 6, 8, 9, 10, 11, 12) for ABIS have been added.
August 04, 2020|Analytics section has been added to the overall response for Identify and the [failure reason](#failure-reasons) have been updated.
November 19, 2020|Note on encryption of biometric data share using referenceURL has been added.
February 05, 2021|Note on [refernceURL](#reference-url) and [authentication token](#authentication-token) was added for Insert Request 
March 23, 2021|New [failure reason](#failure-reasons) (code - 17) for ABIS has been added.
May 3, 2021|The logic for encryption has been updated for ABIS data share URL
September 8, 2021|All possible error codes for Data Share URL has been added.

# Introduction
An ABIS system that integrates with MOSIP should support the following operations. 
* [Insert](#insert)
* [Identify](#identify)
* [Delete](#delete)
* [Ping](#ping)
* [Pending Jobs](#pending-jobs)
* [Reference Count](#reference-count)

{% hint style="info" %}
All ABIS operations are via. a message queue and are asynchronous. The data sent in ABIS can be byte array or text based on a configure in registration processor. 
{% endhint %}

# Parameters

## Common Parameters
Common parameters used for all ABIS operations:
Name | Description | Restrictions | Type
-----|-------------|--------------|------
requestID | ID that is associated with each request sent to ABIS | ABIS should not use this ID in any other context outside the request | UUID
referenceID | ID of a single registration record. Registration record is maintained in MOSIP. This ID is the mapping between MOSIP and ABIS | None | UUID
referenceURL | URL to the biometrics data stored in MOSIP. This URL will have read only access | None | HTTPS URL
biometricType | Type of biometric data sent in the request | FID/FIR/IIR | String
returnValue | Code for response | [Standard Return Codes](#standard-return-codes) | String
failureReason | Code for failure reason | [Failure Reasons](#failure-reasons) | String

## Standard Return Codes
Code | Status
-----|---------
1 | Success
2 | Failed

## Failure Reasons
Code | Reason
-----|-------
1 | internal error - Unknown
2 | aborted
3 | unexpected error
4 | unable to serve the request - invalid request structure
5 | missing referenceId (in request body)
6 | missing requestId (in request body)
7 | unable to fetch biometric details (using referenceURL)
8 | missing reference URL (in request body)
9 | missing requesttime (in request body)
10 | referenceId already exists (in ABIS)
11 | CBEFF has no data
12 | referenceId not found (in ABIS)
13 | invalid version
14 | invalid id
15 | invalid requesttime format
16 | invalid CBEFF format
17 | data share URL has expired
18 | Biometric Quality check failed

# ABIS Operations
The following operations are supported by MOSIP:
* [Insert](#insert)
* [Identify](#identify)
* [Delete](#delete)
* [Ping](#ping)
* [Pending Jobs](#pending-jobs)
* [Reference Count](#reference-count)

## Insert 
* ABIS must get biometric data from referenceURL, process it and store it locally within the ABIS reference database. More details about the refernceURL is mentioned in our [referenceURL section](#reference-url). 
* referenceId must not be active prior to this operation i.e., it must not have been used before this operation.
* De-duplication must not be performed in this operation.
* MOSIP will provide biometric data in [CBEFF format](CBEFF-XML.md) to ABIS as a response of referenceURL and the data will be encrypted and encoded as mentioned below.

### Request and Response Structre for Insert

#### Insert Request
```JSON
{
  "id": "mosip.abis.insert",
  "version": "1.1",
  "requestId": "91234567-89AB-CDEF-0123-456789ABCDEF",
  "requesttime": "2020-03-29T07:01:24.692Z",
  "referenceId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "referenceURL": "https://{base_url}/v1/datashare/get/mpolicy-default-abis/mpartner-default-abis/mpartner-default-abismpolicy-default-abis20210205062412BlQo0rJB"
}
```

#### Success Response
```JSON
{
  "id": "mosip.abis.insert",
  "requestId": "91234567-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2020-03-29T07:01:24.692Z",
  "returnValue": "1"
}
```

#### Failure Response
```JSON
{
  "id": "mosip.abis.insert",
  "requestId": "91234567-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2020-03-29T07:01:24.692Z",
  "returnValue": "2",
  "failureReason": "7"
}
```

### Reference URL
The reference URL is MOSIP's datashare URL which is generated based on a policy defined by MOISP's adopter.
* The referenceURL is authenticated and authorized; ABIS needs to send a JWT token inside the request header COOKIE
* The referenceURL will be active for a certain time as decided by the MOSIP adopter 
* The data sent in the referenceURL will be encrypted

#### Authentication Token
As mentioned above in order to access the request URL the ABIS system needs to send a JWT token inside the request header COOKIE. In order to get the token ABIS needs to call MOSIP's AuthN & AuthZ API with Client ID & Secret Key by passing the credentials (clientid, secretkey and appid) which would be provided by the System Integrator (SI).

Below is the sample API details for getting the authentication token. More details about the API is available in our [AuthN & AuthZ document](AuthN-and-AuthZ-APIs.md#authenticate-using-clientid-and-secret-key). 

##### Sample Request URL
`POST https://{base_url}/v1/authmanager/authenticate/clientidsecretkey`

##### Sample Request Body
```JSON
{
  "id": "string",
  "metadata": {},
  "request": {
    "appId": "regproc",
    "clientId": "mosip-regproc-client",
    "secretKey": "abc123"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```

##### Sample Response
```
Response Cookie:

Set-Cookie 
authorization: eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJyanpjdUZPTmpBLWZRRDZYVVpYeFlldk5UZWtYcnZKVXN1RG5TeHJjZ0tZIn0.eyJqdGkiOiI2Yzg0ZDMyNi04NjZhLTRmZTQtOGJiMy02NGY0YWVjNmZiZDAiLCJleHAiOjE2MDk5NDg3NTAsIm5iZiI6MCwiaWF0IjoxNjA5OTEyNzUwLCJpc3MiOiJodHRwczovL3FhMi5tb3NpcC5uZXQva2V5Y2xvYWsvYXV0aC9yZWFsbXMvbW9zaXAiLCJhdWQiOiJhY2NvdW50Iiwic3ViIjoiODdmMDU3NjQtNzg5ZC00ZTZiLTljMWUtYzU2YmJkYzI5NTYzIiwidHlwIjoiQmVhcmVyIiwiYXpwIjoibW9zaXAtYWJpcy1jbGllbnQiLCJhdXRoX3RpbWUiOjAsInNlc3Npb25fc3RhdGUiOiJiNjZjMjBiMy03OTY1LTQ0ZDUtODg3Ny00Zjk2MDNlNzI5OTEiLCJhY3IiOiIxIiwiYWxsb3dlZC1vcmlnaW5zIjpbImh0dHBzOi8vcWEyLm1vc2lwLm5ldCJdLCJyZWFsbV9hY2Nlc3MiOnsicm9sZXMiOlsib2ZmbGluZV9hY2Nlc3MiLCJ1bWFfYXV0aG9yaXphdGlvbiJdfSwicmVzb3VyY2VfYWNjZXNzIjp7Im1vc2lwLWFiaXMtY2xpZW50Ijp7InJvbGVzIjpbInVtYV9wcm90ZWN0aW9uIl19LCJhY2NvdW50Ijp7InJvbGVzIjpbIm1hbmFnZS1hY2NvdW50IiwibWFuYWdlLWFjY291bnQtbGlua3MiLCJ2aWV3LXByb2ZpbGUiXX19LCJzY29wZSI6ImVtYWlsIHByb2ZpbGUiLCJjbGllbnRJZCI6Im1vc2lwLWFiaXMtY2xpZW50IiwiY2xpZW50SG9zdCI6IjEwLjI0NC4zLjM1IiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJzZXJ2aWNlLWFjY291bnQtbW9zaXAtYWJpcy1jbGllbnQiLCJjbGllbnRBZGRyZXNzIjoiMTAuMjQ0LjMuMzUifQ.ntez3ZkbDsjWi467JVj9d3kfktbUc7e6zQhHv0bVJfmiQA0N1QGyXAiZdqZrHj3cgFo0Lft54jgEtCGZZAma8nAw9IDICet9TA2A_u5hZ3oAq6HwYMS1pWb43jx5K9RRr_Yc-hdNnma754KzHhJgU1A7e_y0m88MT_oohHpRQ16jItEfC0AUQUvOAsxPwn-mmhu4uFFEq9e05ftBDIEBr24t-8feWN92uCJVMrSYHHjFL2ayg03I4Zkw1IupfLa-HACIlIToUmAk00aPxLtyWMFpOHVcLKBS2i9gEeqCEiUzklwuEp0B4aCqk5_M-Ng2X6VcGsCUJ8ACWRG4lCQQYA
```

```JSON
{
  "id": "string",
  "version": "string",
  "responsetime": "2021-02-05T06:31:36.885Z",
  "metadata": null,
  "response": {
    "status": "Success",
    "message": "Clientid and Token combination had been validated successfully"
  },
  "errors": null
}
```

#### DataShare URL 
Below is the sample API detail for reference URL. 

##### Sample Request URL
`GET https://{base_url}/v1/datashare/get/mpolicy-default-abis/mpartner-default-abis/mpartner-default-abismpolicy-default-abis20210205062412BlQo0rJB`

##### Sample Encrypted Response
```
JeLlBHHTbA-c0YdoLpy7Ya8jXujwzj4gw3nyfwbDrHyY7sLrD7EC3yFLWI0KDO794vmagTOwWyNJhvJid8Q_-Zl1r5O24mb6t3mimQTr5ShKs3EP0WjTiRF8PpQlgo2n6cnCc_VUsrHTokCNxdHyuZ7OEEI1p3-gq7ClDqHlDsBQ73--OSCDYfzBf_H6-d87fuO0jEntnCfAwM5HX5aDx2BUq_-RDL2QSzUczAJqs3JxUr5_14QF_d2sGdB9oNLFZErM8jNLCTAzlLZi1AUcCAbcRZ8nJY3-tg_p0uMzQYk82Tem_juC5-rW4teaE3GKXbbS7k31oezqNkCiLG2JGiq31E4DYkG38HXNHH7Xu3_-xDeohsKJYoghqffH4RO3I0tFWV9TUExJVFRFUiMjgcRZkv-rMGJezmpnjpycI1JO-HJ1_QzkiNHjV1gt5J981QhYQ3Br3mbkqKRelTZ9iQEFYNtxcaYKLyCXFEPsl_rVZXMYpLYBWxsWuPxP0ESMwtFMGSeRKsJkEosE_B_kabuBiyyOR26no1BvWSKKgfHa_wc1sssp3ObF-Jq_SmXVePSwUyHwD9edsn6SgJgmv-nW8_s0pSyApRR2U4yQF5Rlj5KgMv9cJPNPX38ioi_1YGtCnd2F0MvUT7hOYAQWrWKbVQEV0JG_swQnrp9li4lmvyjhfaQP-rXaE1XOOsw7C8RXErphUOAeN9z3oEpVtfJ44S5BgQ4u_ltNRyfkjdXFSXGf2n8DCxgdjv8gMfRCA_DAKM_3LWbsVsKK3KdrQZfyibiM__dnWgVH7D5bYhbxz-2Nvlp03qnr7BAx3NdoJ2Ej7dXf8omqn5mpdHVrmR72uqyXzKERFI0iD3lCE_AIIShBtxTu2v0FpfmHfGQvr5QzAHwkgo9GMvphsNgvU6raWLFI4DlBDdDsbRw6vcTxXlVdteLefd6DouXHRJQc8RHN5ucLI4TZ13ybF7FFTTjv3RjuWHO3OoBpZkse8RYoGRmRsjKa7zRFj5hJIhQKxkZdE7j0laGrRqpEUkMSGTmjiMy9j6Sx1GxddYCPTda0RwqbQ3OFrtxrokidpyNXlE_YdPcRxMre0FdG-QqXqMzFZdogorK3ATNUEwND_W5OyfEf46zyUDgwC8qHfyxmi2MZ5WQmkL5Et_73X-1w2oLxbkIk46Kr-UQFkqUfxitl_916WP5yaYOG-DsvUkEDWmfQLVu3LbW7Nd5LyOZorTN80J2O34phw1FLhNuAtFa893TgLi7D-08SxezPc2cv07aO4-ak2PTNRF96ayciHqemm51yERt_p19PC9A6BLSu5i5X9gaua-CbgKBhFJtPreumk-EV4VXI-my9mOLpMxvzuS37nzHp8Qtya4XM494ZsuKlCc0Cos8uIOAqHRBASW4nwmRfbVBA6LKDuiPU14xXtRp1GUW8WpLFEwL91OvgQVJ6V5mqX8EJRVPSaJJC4ka2tlfOtqd8QRAwCvMVtv_ufOCO2R2ghFTjFWT8cZ1PfC6WoKuj7WHOIAp-6bIa5BDXxp-ouYxrqr-NgpFQnTZrPeLB0D1ITkq0tiYYoigIPVJtoyQ0tQeph1QLsCdBZF6uPk5hCn4u47sispPZSyF4ZyDyO6lVl1EbYvRwP4VzIjiux4TJH27Luh8KR_fjzWSuKUC8cL2FtTTB7tusWbu33jVak8tce6NUPYJDVKSdEjZFRMt3KdUppT9qxynJrCanSY0AB4VEqBSP2IlXbS5uquTdYHrWbaJp3ZbVl2l3LJTgYFWWvYGPCW47plXWXdELqsMar9W6NTDkxq8PjkGbSsv87VvpP6PW4vqYe7Hem3ql9Xtp7AWHV4dHW8WuZzqe7pcGqutAUaEMHHde1jBvbQPDTDN1Zw2dQuq2sMhtQOdh6g8tPHzZ99P3mGbCh704bGOJ-sSC-ywwaC-tZogQ9T5J7nBkfrgVOzA-tj_grVu7xUOxxJ_ndZlL_VxtYoHfRUyIJ-jCxFTcWqwx-e50eemf1-a8jQE91Bu7riXqWTHY4K9IXm3usRGYmhloEgGOU2GqVrShNsgRZkDXR8yVdJjbRpgPbXTjUOyTun8yQdRdAJBr8QM7p1ays8rXb2psALEm3-fuhjItFVPIzveGmhkkx5FvI6VUn94O7Vjhkm7nOMsKcEd5F6Y3IDXT0boLxrvrMXf3BCbJPortdwrQFC-IEzxm8QLvjyNvlpzgC1cSiZy9dGy37Lp0z63lCfdmMpHwWlX0nqWZOG6E62-hMQUubr4k8YaE0L_RIXrsI6h8SKMMUGlDX4y_f0Wjf7jOno6CSZgYHiKVGz7HCrpi_HaIPeDbuu6oakaZoE5F3KAn41f8g_L1tUhrc5UCBwszxBJvsOxaezzvVzEcvyPG78lpRfX3e1qCOz_eOWMmYeo-lILgKH_POGquRHwpRSj1DpNGPRj8XgtzHuQzw8js4BK4xSPWs7HeqKo-9XtvxYhq8KxsJYl9Oko6_U09lE6YtWs3cY4kPCdZxDxi496Cf1bUlfZwkP0vfmIWICdxTlZ_CIC-oVsmMxqBKZFRcxOc8Si_y6hSZMvEkenEoWAdAVVDsbzF4eXWl_yFwmGH8cozjyIJPbqM_8IisjTvqLrpUJ2jHOmvDlcsRf-vPCsSARSISURf78HXhed4SUT4eQiS8TGKHLtKGsmv57fpQOoIwWHHrNrrI0Oq2baKRbEmA9GSdiKGKKi6B5pYDbQGlUd4XaybFXXcqcWmUyBlaEo_RZQfcbazRZq-neBbn_2MDTw6tXcP_B5xoGPOraFqGw69fsuU7vWwjrJ1h8qUevu7ofwiRy11tMBe--DwuJjeHV1j5UpnSXRuwvzvNHmbJxEJ5tpxV_5OXMgVgqoJ6G7fb0RBDuqtnCnerNAS3QJ4IJQbCEMUBXuGN7ZZeaTMBRnZ7MNVDSeO7Vzzs44ds9Uh1iYZtnAE3G-7NWX-lyZ9Km7xFZ1Wzlr5hJSsdZ15VjUvw0Rp8PmSwLSstrK_VU4Oc0QdrWAWixuHeuPjj63NRNBQyVYLrsN1CUB4kNsswhmT10Zohn4gbd8xvjYcKJdLAiSKGPsGsW_uhdsaSSEAiBF_yai-iZNisowx4XjMYZwetdPCARTVfoYraCpy-X8sPp0CwW4Z5RnjQUvP1mXkVtUgxyDMlBoICBJEeyU9JUBZQIfoMB_c3E1ViQuBYeO_pjUbWesse1mrSv-S3YB6V1qTi3T1kHg4Qm7FjMisi6zZXhDJxf4ciD4e08OpzPHcIwlill3R67lqtjg2kz3nyDMNghlLqErtWyB1CvYWDPGw127aPfv9OrfSjSJ938_PvXSrame_1oLPIeuSepjST125KbrJGnePAqrlFGWeMWQtET0I3lX1sF9duubPQha-Lsa8zdEAdL9IA8_VRaVJWeFANa0sVZtE8dmRaleKhHYZTxVtWCYmTSzXRDhQj7r7gVFmk5auY72jz6-Ys5hpJogRXLaJBrPgi7Ebg3lsSuZKyswptcpGWRGPE_yB9NW9-WG9mDn6_SXZo-vROsMKhq8_ATeBQ2NgN5YM8XUQYaronHVqg0w-c6wzJYFMoSYhRir1bsrcmxCObk8LDP5_fd1BTBqH2c2fUtmW_btwm9UmTv-uik4Wd4dqBciCfMO3BtmQ7OhlZFYAsx6p-ITBxF8sc8NZE74hIWknFUo7Yoi-gq96u-js69Y2ewbFTraj8liFsq9rkOC__-A32g4vyQ8umHR6h6HXmr7Oi0hVjLn32I5ENwRQ3_fcYPf3wUrUd6VAPhigCG8xb-KUOHQOv7dCAZCCQ1UW8-t_eOHDMGW2pG_-B1W-LmbwslI4c4-xxe2PWtTxBntAocuPd3N8bk_-q7aJ_g0KzlTgcIxASUn_2bTQAtICRuS5YGp3m6AQu8AT0gekBTcL8-l63AxLdBK0WqwtgBbDXD7uKlXNeVjg7DueW0cm3_WcJ0Z7MdI2U-LuJ-m8PD14rxwFarWc3OcZYCrjkeYs5rDfJL2CBQj2Fehdld-W4xfaBexTY9Thgk9FzWBz9DfXvCzhmvT_Xoi7L0FBj1XpU7FjgOtH9aRvKYpy_cSB9ErPtp1J5E4wZZSJq6v7HcEN6rNoo1F0L1TrqLMkmnRDGb34Cqt0_LEtBUqq6eP7scR7EZMXP_z1qbWq3GLTp6VbI4vZm8mv8kQ2ov9i8NqkJQojj9lwkgbZogP7etWL9vnAfrAuqxNjHmPspjQvUWcTbTVp7l1BteIL1bp29p1Nk-aiPuVhRU6T6HvK02laQcw6GFtOHpRxw1e3Zc-bfLeTrNp88I4QvU1rkf5WnptRCV2rQl6CEBnWeVc6F49MZk80OHHFktMA1eTvC2kocgwwmbJ7mwk4Dmoc-sScoKGiNAkSStC4JKAC0-DxGjSGRAcS4xiUb9e0TSzWczXTWrt6nlscCF9rsgXoUuvIUHPV9XvUjH5vsCbXg36DduEoFy5f6zMROFkOVzQpGZWAlqj6ZhSPua2pgZabjg2DEHg-8-_k332s6S0w0RZ3TQoG0IYJxp1Xzg7-ZR7r4e9WonYU_JcgKOgEoDZJteovG7tGJOZMrl-RC4dEOSPkfbo5YnexCkUwhuXEZO3zmsgy8fVwSExRbCSZnh9zP-B6YTDrsMQhoX23d9qpNMxEDfFn3zvQX7j5HqcV9_xJJd0ytmu9jiMjaztMetrABRTU6oya3W0Eb8PGdwvH0XVzKnmr5sHzaJxmD28p3DTvqdNqHh6RVrM2zlDb8O8y-3zkTOSTEq8hWVg5Jf-_wsP81zzrsMw3ZM2gTwz5uf7NEIuhorEfrOxuOvRLSSXhmn13lzJn46jUBTq4MJ9PxVnuX2ELbUhqLgSssnVkm0XA_YdajNqDXb8k5YUXayAI4OL7DFuC9b2FHBlx3toFuxGEyzrFQ7kxs_nE2NtI32FiINUdVJ7fs4LUlqhQG9ortv7EoHfrx62jXm2IChiOIk18ntBxGzUAA3-iUgqdwuE8yQIv9Hio2CgU4TgoS47ZMuxsPLMwNesBUO-gaSNZ3KqBzi5AgrLyIrJ305cbCqWL0BNqDrJgRVyLBgR78Bba-rsBxGXN65GiwW3WrUC1kCpSfKFlp1P4oZnSXyVb2a2Hnqr1Jnw--i7XTRr7u9O2fvim9gpuSBIMJr5KdtXajnmJCe2PR5OtFnB6_RCL7BxnhOARuVXClzyuXDVZ1yLM87mu1_5qjR-CZ2u6EAEXZumr74spAMRf0SIj-KUx8RvP4Ps59XZ3_-qCX0TdnsgA_L3gGBWwFAu_bSpKXdjXGyMPoVp24Ob11MIXoRRwe43YGOP0ucLu33yv3LI7XNip5i2HTG0qgtMP-3cK7bBeQ1IWH4udXvF6_e9hdacvDKx2nr0_2GnmT44RXOrna70ayn0IgE-40pcy3nPH-EINI70WkYiA0maoj_qeJJ7EXmd6cTYvWm2grXIz-mse-0v4FLdx6_bgboMwdipgdocNW11S3M619whQlzEIec-YuvuRJKTir6HIfoMeEFBnTlzkVpwXD3OQAlzin73ZNQta8jPaWVZ76OUZ0YOxEcyoor-Xk8TsNNIR03O4xYjxsPlIWl_YXbIujT3OSwKybR3P6ShLe-K2Vbt9NElx-n-fnCpTwpc8uXZmF21TpAC94JletmWL_UaTX1Hw9cYHFjAdnJFCOPt4D-yTKjIsz_T2TyBj3FV7Lb5oa6nMdtDnORwkwmQWHCz3HQYVuszhxpfUaRC_CZt7sgbMFbAiuYnhASeJjr29NmIQmeTSB_AFlnB0EbZ2F1p7QnFrW21vDKS3xz4UyDgK_uLDNsuadB3fRcHCmIz8csJ3Ju_GJxro7T4b-ZD8CI4ABIWX8YUFe3WpJjXD4IyybGfF0VnYXYEgS_c1NnGdEhltaLiFBqoTiM8Gcb_-nA0YgFEBxO2jQ3ChZiIPqkz3p3cqFRWc-yVBwlGkGO23Ek56CmTzaJlLp0T4zKOmR9MtQdQZNFZDO1nEdGipuAse6dHPwa9sLG3IHHSjFhFFpvNLsxiKQT8OwGZWtNsMuB_YdQT6wWCKPCXUvzE3WzRFNVPYkJd9zbvcEahInZwBRO8qsVb-An3w2iCTZPsuqtx_KeK2CzQSeMWgbGyMEYPHMw1fBrDP5NTQ2qpZf1vQ-xYnNU0ZbLzoN-sjDPOdQ2UD4EWZbWNDUSo-p2Nm6RZLQF_Y3zOzia82SagQsH7pFfFy7BBzfvHldBvl5h_iXY_Gxt_T5XQ3gjj8wtHj3KDyAGhReheoLguw-Qmhy-QgAs0VE75BheISUMrqhjtP5wFbgVD9WYbdqlgUVHVS7I5gXnYEeWyiL_MBXySsUDZxQcaBU0G2FdsWpqPjJehDNI91Z48L_fdQXjRvbJYUN9c3Jiwyd4HTMWBs5XObHDknkiBBjqsfs7ZyIWE0yNwN303ZpjXdrFt_GUDrXpfJb51wW7XMBwUAAiVkTFG2Nm7QiUX56mA_nrJaXSNzz7qQDVuUNBg5P7fPFpxWktxM_FNqpainCcVSK8WomIsEt9dX4NlRK3GpKggSqgmV1uzlWey5Ei_5JBE3SgwIIjhKSkojS18LfAe8pBjIWxih0HaDqY6WF2kGD8dLF0Xq7vXZYMXJe0UhHb4MKMVetw-b641A3rdFonMfVCDxLY3_46C1Xx2ROgD_zbh-EDhqTJ9EXugsYqGGh97WVibtssW82OgBTbT2Z-rPzT9cZ7sczBm2iBa6VIyWkpdCC0RebD473qZ5H75qGtd4aEMw3k_Y-ml_K_06UPNf3DKcLS5MNxqfxE-KfxBDtZKFw9qn6GLzllzz6a0jAVdNMgcHPL3KS6R-zhub81s149nvpugKgLtpPCQG5bnvva-4-Zz0ov9bV9nPU5ABBlCAvTV82txjBtjihK8qdtn0fw-66CNHbpw3OGk7UxrsdlUw1UQaBBdZaaf3F3jV4Pem81VWAyY0JAzKoHMwS_3I0zCfrBbVmhsRogESTYR0MTQG5XtS3FIvSO4uwQvl3mDaFFkzdFcCZYibAwyBf5eLPItkW5o1Axw089_oR866hDwJpecgujQNlJ281Jbp15_O97jHEB-mj24vJtdVLDNWW1Fn4HE7V15ncMnBZjehxidnPFLDrlxQ-cFFy18JrrT6glReGltLFUb3toXLj3eoc6B4RPB2wPJL2yDbIzXiGGV9S2oJ-ooWcakkNP_z4YGNFz0VRHISDeNH7Qo8bWHYgPAD5mWXEUfzSjjfm5ZVLDz13FAmyalXX1ZSpM7sPeP3YzGGFRN5KLcy0dhQORhlDXZKRrys98yxx5sPCL53O82D2YoYribMbrSUpmYLs9o9vTI3MYYAhuX0SNKSlmGtkSwTfJZ5f7l-XIB10Gtu_M6QWwjGq2GfartiE-dBvXjU8ZMxSAWBJHQjKpmbfwNPjbLg7x5f-3KGCJ5XKZeYv3N3j81zJJtBdKgS3oRnJmIK3hE1_pj4uhiddhLEEmIG5IsVlPnr89_3BLbeIBZuExIdmibRszriBdnmaJz6vfqphhb5qhtho2c7JjEqM86GGt3fJdaBQSUwM7fWNHsivxvWJ8l51aCGVqMPnEvF0M1mLuogdcC1SwA7tyzzEBmC0zVK8SkE8sdbxDQjHeAV7o7qOj7zjPncqwyJuSyKLaAZmSnx-n44i_QN-upeQ9bS6MHd94bcR0AesoL4fkReepU3Cz5x8TD3yH-PqU_mRplDz1kU7ns9OguGf9wJ2Q89qUJq1etxHhWte7i-5B0D47he03twbn730LRF2iXVo4QJ3KYOhhe4mebjUysFLMSnqyAR63oqVl_rcTjQ6HyHbgNatfcIldV_J5Zm8tR8WKDg-OGp0PNV1RL3ehpCY1vEmjJsUiOz30qwFRI412yXCAgc8JbHAoTAdpfDrI8EmOyayL7DqJkytqJVcAC-caGpxK3g9MU3zPtS0Z0i_riB-swwVMnt9T7guo5N9-6oZcXmcCfax8s3oNsdjHyMjeNAZhatN4nXcUOojDP4VAGQUt51pq2GgoTO4Zl0ZdvbJSo2UiIPaerirLw757_z9ndXgFfcrBVYSSoYWngu4ovYjqiIB41CLxErYRara1scp2d_7GqpR1rU1oTmWvccD77t-AToZ35mqE2tI8QI2mZ9m8cNsJUWNn0Aklzp9mJrgj_ygeiYzYvCHuWw-VpMbpL3HWieFIFEZo20tPZucMsigTc3W4TcPWqRr5XMZM9dZin9dtNaEUKnugOJf7yZwc6LrXq1sc3eDsRihpczCFNCDAmem7HNXTBPZvU4rMKQSaiOgm8nYXh08FzD_KpvKKlZokXvznbViOQjj35OKNhOaJbENzaOoZJvo0T7SH3Wx3ObDwM4sybtnxGFcFyCgDuBl6LgdWWxJTuXYqPRebKhGtFyx5hnbT1ymCdO1MKlaR34ANCCl0ZIKzDAFMQ_G7iftc6_Z24pOFTgBAhaze6NxRfeGaS4NzuTjCl2x10w6sx9jHUCbsXQGfsPhCSUnTo34PpC2BuTzDZg7TGYBC98E0iMJDYYCd4paOSXHwG0_6Bbcn9dCEncgzjLr86o7Xvpb7I6E0sUnzOMH6aZLCoRqjiqJmeCodmFw5V4Wkz2Opcj9LHdwjKzcsU0PEg4QoxKLh76jtc1Us1Ct0Aa537S3b4cqM2wgF2AFUjCqaXznR-PCBQ88EwA2DeTKMoeuISLr6JcvkVG6VnlMBW4MLxqYl5hhcS6nvYOlZmO2VKwtIl0c4En6LAUMoO_aUjoMqkjYIvnhUYE8GMxDHqzymUNRWqXHmLymxhB9qXD_DJa7OObIbijkPEtU8gU1bvQGDlyJKljv6cWvMAd86K-wNXy4g6jbXsRNrbK4XhJSlkZQnE5XRsxptG_x_Gz9D5geC-tRS-HfMVnxoh8EYM7x_fArK1_bDSCIXRP4ZBPxhrGGXe6ploHk50f5pj9z37zjITLWbnLg-DwRJMQqKNKuj5cT3Ywqh8oblRObau9rmZSBHD1ZwgTtHvMuRM1VHQt-_5fpTdhdmucT8dONFmSS3M3ScKc3USqqqit6tJsGqFqS6G65092XJBJX83HB_DaqbWVxBj4vkBoLJkfJr4W7CoI3oUCTtD5KIQWaWY5ISPiW0oDEarJV9BTYFjjUPu-Wkv9lDOFFeRXCnRkdkzUw-Y6-lIhmC_PaYOwNbc_DngO66j-WzS7RdM6Q-155dgU-nvyezVHnVnIRmmKmlgVy6qn8Ho2XiM4P9UVihWOWYQa_nCiC1HITwSRVqXK7Te2wdw8cIsZh3Pe5dvtChw_1c-sDvfAd9AOSt8KF2jW7zj9FHxjjweCTLOexgcjl5QOyioJgICs-OiE-cXemgQRJGxjKxfgVsAWwEDESt4cGjn5oK3Zv8RdIlLFUBYSU8xVGqEftcF--jabgnOmIBIS-kgmDkgiBt88r3CCuzR74mwOVKs4cF7A4u87DwGRbfNI9tS5ORWUWouy07hXWey4KYb6zt0ZSHozhd4MKqnqebzOg9wwUpsAnD5vBS37_MR_h8XUsRB_RCioGF05tu_zyG61rBKFq6SZu3maYVy7Q1EplKJavMtmVY-rf6ZBfPq6isQf0d8VIJqJQzMkdWnnIbDH5cXEIQWwVOU0l18PpxxRxQsFN_7HrJ7S2krO3_luuoc9atnH1H9NgN2uN-AWrO3hWGemJAyY6jt1DY4R9gJfcLAuZtgsU9LfubFoQYTIoh9FTl1bUID3UuZ3DgK4_-9jOl3D7SFH7qPukfw_MDx3elsjwD0nEUeY3t_c5lQ3lUw3Rpu3G10yB4ql9XFAlcYYFlj-t4pfE2DQIygXVK4CjALWpfZDQ82LlC9UsfBBPpNroGh2NF2hwaDJX5H_8Fh59JV30DVt6TOYNOzX1rRiv4BiRCbfgL4hkRVvGvOfFEimIyCA2BEJsuKqKMOCli6lS_q6ADQtSVamdT2WRelGSWnjVw2NLyl5pMCgoWDWKbVMEMOmMfc9QHRbgbjd7dP6-NnsOvb_FlPlJdQWkdB9N2wyqEB_hKrMb4oqaAALi5a8IlP7AhGmqWfV3J9SdM_AjHO8o3nOihVeheV501R9-9VnChYvsOOEd-sztqDTg5YZfpQhUKb3_21AxuBh5WzyUnpoOcVfArCPYNlm-6i7X3w_zLPZc4QHtsgl3efZzYheV8_gyxfrSTyWCypIna0TxLRVBk29PWQSQlte76jQ8356tjpaBE3yNwemXuKIEI6EuaPx3Y_f23AGuIb8G32j5aJMGCBnsp1OZK4yKo9p16OwYkscawgtb2U_OfVb6SA-KHDfKb4f4oh0qteoZ9Af_jeCBiyEO6BAuB8AiSZ3gggk2y6Vqb5LzJjRmUn2fodkoeoLPqovWaGHD3RxDhvmBlWc500cqV5aRWIad-nvVKxH3Uhbdlz-ClLy1EbHd10NCbWhlzjgFUx2y2lbqY7nIA1DwYDqi78uMVyjDjMoQEcOG9QsWT9YXYAoaSRbP1VOpYYdlvgTAOM-RC3c7hXVDcCTCjxJDqYuDo4hgBmRSXq1VLsOd4jPguBhRik6PplrFqr55hMz3Hs5RMYyQ5fxBsk6AzwW6UH39rPehqQEk2r_YMFpEOXhtZ9qi4pPNCv-_uV9MKI5bs54x0cbBy9ShxAuSkKMu2ZZ1GFCMh3NL2F3ZxsAAxJTwTLubq-mdGj8TBgF5aQnZ-6ZucOxQCUPDvDKdW9_nPT0Eq86JOP8-3E8ACplx1bg-vkZLKZKpxHxI9x1OnexFompYJWJAxj5nBP5_i_RV_1Q5wH66PzWlUlQW7b2RAl8VnYwJVVk1mRdrCUgnQ9lZQHI7ckkMvvobXy5f4EN4TeneZb2efjLtKxNV73arOOc-clQ5tLq2Gimd5sRwk77JnCy8xz8tXKfZGcfdJJwuTF2e5EZsKP4v7a1rvp3hFCvpnzYf3RS2o71TD5XP4CRueiXHV9dsfCCknJ3IYjYBFvWcXkxBS_xIUhSmAL8d55nPCtoLbLhdVEzN3HupWSfrNyl6743BWBpF4r0_X4-3jJWjltoiQWl-gq2W4dMdfvt39gboZ5qVA0XDCQaQV63VBFT5gXGjkrxS-ecC_FSbjZN9v2-f7b-q-ScXxU_bcLt8kxcpuR7gcms-ZF0b_jgysQlC7DKvWbUijM2Si8QZKHfQHKvBKqAW88iiucTkMUCaE_RE5-936wPG4EVZcSjb1q7sGKs3Cyjdx-gQ9yQ3XWLwKbw1BSDWuYnz-lU97jvVKZIy-uW3vJvIGfofSF04L-OWXry46S33jsmtB1f5aTYN5pSGjLuMqtSKIJZ1WR5ghUIOC3YN91juQPA8YykKqEqf-HbyPqymOIgdET7kWaH5KCqWDGGqsGvu9UDzzA9I1zHBvxpsxnfRdb-CTv0Gvj304pmI0klz-6OTRSiE4EPh6doNjcTNoTJGDNmpBhDtw__fmbegzYyIQafbQROkbnPpuVOD-zGhrDKyhBgvfNcjs41gSLgT4sYcdAa-CPAxKDhF9e0bZXBrmK8-4Y8Vz-CMfNs4Oki-njAGgEb1OxEziFWRoZDoMbUDr0FkhqCIxQvLZ5DwMRyoxWTyLkyAKPgj668a6k2gfzABdppRNCPZi7h3cPdni25H5zvW9QxXleSkgUS4yRXPwE7lGUUna5vBIbJ88yCOROCDZkJnTGCBcd23F6JhMHg4Debem8-3pzsc2yn7X_2CCQ7nB1wOggQ5pgfvgRd9af-iww66V_Rh2TDLSEhRjkEwmZ2vQ6T-R_xbfy-SqHOYSNvSBS39iySGJpSieRpZCWcK_51YRrsVE7P3MCRyTp6vJvNNGnyfyHGVQwZt_QYEeAIC3UETXwXq9_pLBR2bm-FprMGFAUMBQsiN2ww8CF7lNHj2otoBTwssdIUWMWsukjKuHk58wEDzKfDMAsKSX5KkXpUWlXetECstLOlklQ58Hfjyk8kknwqV_n41L0ClUgGkgQ4UYGUuWVFZ35e_xB8MB_N5Iel965o81m4pMnaKZFMeGQbqDVrWVz4N2pkdOJlDj0PUCWT6RQO0JmIFYMIlVcWRXErmOhVdrT4US3FinmhtzRxLSpqDbayixHS2m4j_n9xraByqVt9KBhhRoxhS-IVFS7POCJmMpv2JEkq76BDJBv5NqTNRaLR2_8TPBKkORNDxsyx9CsZyILSzIYlOQOxDFK1LM_MTYAIRfBGndsqevEOXqC1ycRHPYh4go5KVAuib1gBh9rBIL0fOgpqIR0KWVA6O0QCA8XzF0OrjZMW1seZAsFG5E5HNbliKF3d1nyIB-N-8BKufJKU_hfMrH2Ko-Egr1ASUmdfeWOvwu9Ab9sd96QrZtoeATiP2xFEuFIXSQD2vTwH2EPlEAOQshSBpO8OA6-l7dl7aSNxmyhi9S9ak9av-PLvXgP4ZM0U9NSL0EnPxAjUTsxJIF2rBrw30xSIQmJM-LnULuJFbN2AUyuvMBBz0a8c0oDa2HvMunmRF9inaJMbfYN_Vvq2FC2xHmtTpGcLWftdPh7E8UggSujGcJjGbbKJyBxKb8UtCNWfBOKhPQwwiJVDfk6AuM79pEsd0CA8XpJa-I_YgAheyNHI9qQRWa_LqMLM6XS4h5SOc4seoxop3MqMWiDQTNqKrneEaagWCID98p5GgaxWN0F5xBQu_85tYGqx2CNQFTXWfR5XV2wlbBPQ_ZhNndaFnnWCZ6dkra5wuFtFMmTScZcAsy7lPaDDsCJhyf6ITt4HY9vYvXu_s5UmKTQwXJv4QCg_09noFuRinC-03v7Vk8RG8ZhWAmoHpUPhnJuj4X29JO-Q7o-G37ccBYgJzNmAAl8KjvPqXQUnR02Xaj5X7KoTMKaKRnOWbahtAwh1T5m084wyYR1CaejTCYnISiBohbCmHA0_e2foTfW-NWrP3JVx3J2ArdFr4o9k9LVfPF59mR35bKd0ilEsXWP5itX7vjjkh1UDFmJjtaTRqP9mqB20WF53C0GV2Ydpj9AjH_e2zMMsY7JPbIu7vo-dqB0zzXHFpl7zAudfBGA5-sRIpYBg6CaKQQJ541BsvtHFLapixqAt_av9yg0i4YpYskSwXFRP2-Xx8_vSwbuwzIfAykJL4GYqOdkFN1DJZxp0frDZi6fKpE7gWGLPNeGePK9v2rvG5_gp12FlEnCI0fuVcVfRhhPK-9Wnn0jaRPXd4AsvWHsOFYk5V4sPQBvlBEHMjPDdu0AxPShhLLMW0uNCRahZcf7gtsqmkDYCZZhgHCnhKqk9TnayWhww5yJLN6hkPJJcA-z1o3R0mxuFL5xU89adRNx7Ko3q1_IwiRRrhDQ_-iqzHiwQDY6OtvOjmWLEQt_OL5s5mSDyfzk61fCbaGPYBjvTvnZftRloJW9ZNTjhBjavqkBjSW3ZhK_I88Nr4RRMmTQnU6jwZP-Z-97rp2nnznd2iGUPvjRQOfFmitL2BGJD7wo1w2zLCmLqDXwBuWdtyH_swmMyVyMS-09ExZOMmQ_TIggK3TfkqJRwiqZQx3Jju-XbpvqeBHQZlly6ekfi-jyk78OPRi7JucB_tpEVDUAt2QQjLT_kKqBXkNCKI-R-_6FuX50IF_UG_NgfHEDVLnVQMidar68ODtuRhSarTz8eSJKTo1t2i3BvUhzqEoFTWyCZO7qCl4wu6I9FVUWqPzXepAzXa5vUPH5MuLzgZ5HKzHDX8-eCF3uj15fKOTrLpxTAMJ9W1jeoiAWiqAaPMdte-o6CdV1qswtn_o9cI8Mb844wr6ullOqRh5OVjEezqFxUnKpg-l6oacJp6mJ_hwOKksl-uB47lCqZD6fpf82THlIvH5pvmjC4f6Bwn2cfb5OGeipgEe5CjMVWdKudgkiCBOM6jnRhWcw3apxg1yhG_pvC-uJr0VCgg5NnFZ8Lr_DFTAr1DUhiCn-t7XZI9ydrGu-G3jCbylVZh-72cTmuCCeqJFjh7YDsXDaZNAkLP32BHhgAl-Dm8A0MZJBK8huIiK17dMbYiGv-xe8Z9fCrRx88u00P-UAfCRgEhk6fFEEODkZgWE7Q-blELNC8zBMjKCgY8gXLPHgEwn1UcAVxb5o0o2d7TDmD1PgUwl1-XtnjBm5b_OJBT5MA-6MhZPpDGoFzMfJ5SRJcvWVsNVXKppRZukiT1xmIRqLfZzCCa2uriJkcTw822QqJT-SuCvfKjz0tiwA4X_yfJjZKc7jFJMmULGLRAhjeMos1kKlFQQVeI27u-yyl0_rsVYGMfWCWFe9l_8j8lJWwGBZiqTH4Amt_crBQYewDhP5YoMTSVFeXrkCneISixHCi2OW500n8BEyh_nDMo78au_Hq3CcECoQKCWxxEVcKo127GNlTolgwGR9m9H6S96R_kSZBPovSylzi51UFkZVwaVdy9vNma_b_Cji1rjrpYdXhUqhagUVVugw0apMcugOSC-o-WfRavr5jm3GG3E9TyY3EUA3dvNOWFhYuPACJcMxf1tknGlFwRSfB1XFpIYNVoz2XEdNXrOzLm2cOnzSTgYsz1POARfwtjzsEdzHIpX2SMCMztEbVqJ-PlDxJh9iG3KzvDiVUJS-M3YFGCyWcrbfWOMfnhUZxqJ2MGKTAJ22ML2sdzNGFu_vlbx82gbn4LuM3UaxdnxMWJkKaXR5zGwDLEKM7nE87X8gomaNVmxim9gHA_FzeO4M9va0F8oisk5usPmYs3pgYParuxrAmx-MgVIIASNEuh6YD0rXcsNpco9KjEpnw_CmQNIWBmUB7RimqmScGWL-FU3LSVxeYl6m2SKaU1ySqfUZs9I6gIGs7-E29tL2kifv1FirVCM4qFSa2XoCkby1l0o3d2yuTC52jEL43zEY3IGWi2GY8521FKQoapAwml6ssLrYoscf2b6-tP25o-tXMsOWg_liSCU8p9uQgxOz6rvRr9fftgaJxo2mkch0eUg70MCGYI14Jzusb1EYOq5F4-HR9LytKcsKg732NEjr-lPRG2wVOuZy_nc-KbCcDq4wtMFwHCMHyXOQCe6n7b-WEPrfL4WzIv3-ZNjzR0MqsonYcLhkOBSjoHcBQmbxkhSfM_p1Q6s-ZrlGsS_JDU18CZGujKtjJej-ldHldGXFULBR3nZ0Gq9SVhzvvFU-r5m7UK63yR0A3aMYdgSf2J3AN-qoJAaxNRU6v-aJ349_2IYS55OwUr2Dm0jW4bTBRRVh9S9b98ogbREWkKAsLKZwiGMKW6FVr0uI1q4X18nq2M_D5u09MP5zAUe-kd3xAGx4T6pbohiVLDkIthRRX9n_GUD1nqi8diXwUGjTEsWijdqC4GeViX_x_M8XNKKBxDswzdb4Zzkv--02P-mraTbRBtL5jKvW1bbNIDgocIUIaqv-Haz4U_-Thecwx_1h598zPhZsMV6UwCyIMkniJyTZKcDblK4g6MDFcarfZn8wYuZfXmR9CDSD0GkfvH5X2v3AaBsA5iKrzHcVIG7lvwQyM2FYIKGeEeF5JGhR5pe4bLwDxw1m-m3zlhuGSQ7xETfuBGKes8c_AJEzK4EyhPUMwU4KFJcTVf8ZrGwgECZI51Y3ZdxcE7blt8pelJUs6GAYEJn_5YlucIyUX76GiA-ZycrVELXevypyx6-p9_gXFqOhwDULGRybML85j0x1PorqlAtbiu4LGd5-uj3s5cPMWu1qwZ8-XmMZD9qIF74TEa2VUisE1UMspnZ_Jkj8fzk_-vHC3iUfzqirGH-SbOtmtpPT1XTDQSr1Ixsp10WuKuoDibFpAo45MsJeScn5mQyLYGYkzSBGPxUx-IvZGuLyFFFtNQKSuuLSq5QYO_YkRMGijuFPYn9yuW2m_yMAiz6kqjyfs3ze0AfyuQ-HGB18cQpaBtTbfb3A22vr3Mkgw3imOnrNBNOvs52KSUw20820iHGQ_f1_CSQ3qv6a8z5gnYnEXAbLiX6Lan9gJFZN63IhjD9w27UNuavUZ6fb_3gVij3sw3Cii3FCH-Uhono3QKM4WZlo2DdaADK3N2pFDrzswojY-_32w92WKfaFxGCGELZW-o_Ii3zJrEp8EbYxAcCkVEZX1y7C3ts5Ju3Pp34tzl7UVdS60jvL2s4VniKqnctFAS9jkZwheAn4-dGyhSGmub7ZvlK67o6i6jKqwXvEBg5lgbFnjx3zX1XR3z57FQQtlx7asCaHhPuge9sGEeugcvUs-VAwVEiGqmso4Vnj03hPIUEVG8Abc-rCLID_dVoRmfSFlO_8nkxE4Hd6MYQWO_T6UYyw25hCOFtIZ-8h4JQblMQpWQkJ7krTTmz_8UNEEHg
```

{% hint style="info" %}

**The structure of the encrypted data downloaded from referenceURL **

The data downloaded would be URL safe base64 encoded. Hence, after decoding the data will be in the below format. It will be divided in two Parts after splitting using #KEY_SPLITTER#.

Encrypted Key Data | KEY_SPLITTER | Encrypted Actual Data
----------|--------------|-----------
Part 1    | #KEY_SPLITTER# | Part 2

**Part 1:**

1. VER_BYTES - Current version constant is - VER_R2  - first 6 bytes
2. Certificate Thumbprint - Key Identifier - next 32 bytes
3. Encrypted Random AES Key - Encrypted with RSA OAEP - SHA256-MFG1 - Remaining bytes (256 bytes)

**Part 2:**

1. Random 32 bytes which will be used as AAD in AES - first 32 bytes
2. IV/Nonce - First 12 bytes from AAD
3. Actual Encrypted data using AES GCM PKCS5Padding - Remaining bytes

{% endhint %}

##### Sample Response after Decryption
```XML
<?xml version="1.0" encoding="UTF-8"?>
<BIR xmlns="http://standards.iso.org/iso-iec/19785/-3/ed-2/">
    <BIRInfo>
        <Integrity>false</Integrity>
    </BIRInfo>
    <!-- right index finger -->
    <BIR>
        <Version>
            <Major>1</Major>
            <Minor>1</Minor>
        </Version>
        <CBEFFVersion>
            <Major>1</Major>
            <Minor>1</Minor>
        </CBEFFVersion>
        <BIRInfo>
            <Integrity>false</Integrity>
        </BIRInfo>
        <BDBInfo>
            <Format>
                <Organization>Mosip</Organization>
                <Type>7</Type>
            </Format>
            <CreationDate>2019-06-27T13:40:06.209Z</CreationDate>
            <Type>Finger</Type>
            <Subtype>Right IndexFinger</Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>100</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSAD...</BDB>
    </BIR>
    <!-- right middle finger -->
    <BIR>
        <Version>
            <Major>1</Major>
            <Minor>1</Minor>
        </Version>
        <CBEFFVersion>
            <Major>1</Major>
            <Minor>1</Minor>
        </CBEFFVersion>
        <BIRInfo>
            <Integrity>false</Integrity>
        </BIRInfo>
        <BDBInfo>
            <Format>
                <Organization>Mosip</Organization>
                <Type>7</Type>
            </Format>
            <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
            <Type>Finger</Type>
            <Subtype>Right MiddleFinger</Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>100</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSAD...</BDB>
    </BIR>
    <!-- right ring finger -->
    <BIR>
        <Version>
            <Major>1</Major>
            <Minor>1</Minor>
        </Version>
        <CBEFFVersion>
            <Major>1</Major>
            <Minor>1</Minor>
        </CBEFFVersion>
        <BIRInfo>
            <Integrity>false</Integrity>
        </BIRInfo>
        <BDBInfo>
            <Format>
                <Organization>Mosip</Organization>
                <Type>7</Type>
            </Format>
            <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
            <Type>Finger</Type>
            <Subtype>Right RingFinger</Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>100</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSAD...</BDB>
    </BIR>
    <!-- right little finger -->
    <BIR>
        <Version>
            <Major>1</Major>
            <Minor>1</Minor>
        </Version>
        <CBEFFVersion>
            <Major>1</Major>
            <Minor>1</Minor>
        </CBEFFVersion>
        <BIRInfo>
            <Integrity>false</Integrity>
        </BIRInfo>
        <BDBInfo>
            <Format>
                <Organization>Mosip</Organization>
                <Type>7</Type>
            </Format>
            <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
            <Type>Finger</Type>
            <Subtype>Right LittleFinger</Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>100</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSAD...</BDB>
    </BIR>
    <!-- left index finger -->
    <BIR>
        <Version>
            <Major>1</Major>
            <Minor>1</Minor>
        </Version>
        <CBEFFVersion>
            <Major>1</Major>
            <Minor>1</Minor>
        </CBEFFVersion>
        <BIRInfo>
            <Integrity>false</Integrity>
        </BIRInfo>
        <BDBInfo>
            <Format>
                <Organization>Mosip</Organization>
                <Type>7</Type>
            </Format>
            <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
            <Type>Finger</Type>
            <Subtype>Left IndexFinger</Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>100</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSAD...</BDB>
    </BIR>
    <!-- left middle finger -->
    <BIR>
        <Version>
            <Major>1</Major>
            <Minor>1</Minor>
        </Version>
        <CBEFFVersion>
            <Major>1</Major>
            <Minor>1</Minor>
        </CBEFFVersion>
        <BIRInfo>
            <Integrity>false</Integrity>
        </BIRInfo>
        <BDBInfo>
            <Format>
                <Organization>Mosip</Organization>
                <Type>7</Type>
            </Format>
            <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
            <Type>Finger</Type>
            <Subtype>Left MiddleFinger</Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>100</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSAD...</BDB>
    </BIR>
    <!-- left ring finger -->
    <BIR>
        <Version>
            <Major>1</Major>
            <Minor>1</Minor>
        </Version>
        <CBEFFVersion>
            <Major>1</Major>
            <Minor>1</Minor>
        </CBEFFVersion>
        <BIRInfo>
            <Integrity>false</Integrity>
        </BIRInfo>
        <BDBInfo>
            <Format>
                <Organization>Mosip</Organization>
                <Type>7</Type>
            </Format>
            <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
            <Type>Finger</Type>
            <Subtype>Left RingFinger</Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>100</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSAD...</BDB>
    </BIR>
    <!-- left little finger -->
    <BIR>
        <Version>
            <Major>1</Major>
            <Minor>1</Minor>
        </Version>
        <CBEFFVersion>
            <Major>1</Major>
            <Minor>1</Minor>
        </CBEFFVersion>
        <BIRInfo>
            <Integrity>false</Integrity>
        </BIRInfo>
        <BDBInfo>
            <Format>
                <Organization>Mosip</Organization>
                <Type>7</Type>
            </Format>
            <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
            <Type>Finger</Type>
            <Subtype>Left LittleFinger</Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>100</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSAD...</BDB>
    </BIR>
    <!-- right thumb finger -->
    <BIR>
        <Version>
            <Major>1</Major>
            <Minor>1</Minor>
        </Version>
        <CBEFFVersion>
            <Major>1</Major>
            <Minor>1</Minor>
        </CBEFFVersion>
        <BIRInfo>
            <Integrity>false</Integrity>
        </BIRInfo>
        <BDBInfo>
            <Format>
                <Organization>Mosip</Organization>
                <Type>7</Type>
            </Format>
            <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
            <Type>Finger</Type>
            <Subtype>Right Thumb</Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>100</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSAD...</BDB>
    </BIR>
    <!-- left thumb finger -->
    <BIR>
        <Version>
            <Major>1</Major>
            <Minor>1</Minor>
        </Version>
        <CBEFFVersion>
            <Major>1</Major>
            <Minor>1</Minor>
        </CBEFFVersion>
        <BIRInfo>
            <Integrity>false</Integrity>
        </BIRInfo>
        <BDBInfo>
            <Format>
                <Organization>Mosip</Organization>
                <Type>7</Type>
            </Format>
            <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
            <Type>Finger</Type>
            <Subtype>Left Thumb</Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>100</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSAD...</BDB>
    </BIR>
    <!-- face -->
    <BIR>
        <Version>
            <Major>1</Major>
            <Minor>1</Minor>
        </Version>
        <CBEFFVersion>
            <Major>1</Major>
            <Minor>1</Minor>
        </CBEFFVersion>
        <BIRInfo>
            <Integrity>false</Integrity>
        </BIRInfo>
        <BDBInfo>
            <Format>
                <Organization>Mosip</Organization>
                <Type>8</Type>
            </Format>
            <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
            <Type>Face</Type>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>100</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSAD...</BDB>
    </BIR>
    <!-- right iris -->
    <BIR>
        <Version>
            <Major>1</Major>
            <Minor>1</Minor>
        </Version>
        <CBEFFVersion>
            <Major>1</Major>
            <Minor>1</Minor>
        </CBEFFVersion>
        <BIRInfo>
            <Integrity>false</Integrity>
        </BIRInfo>
        <BDBInfo>
            <Format>
                <Organization>Mosip</Organization>
                <Type>9</Type>
            </Format>
            <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
            <Type>Iris</Type>
            <Subtype>Right</Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>100</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSAD...</BDB>
    </BIR>
    <!-- left iris -->
    <BIR>
        <Version>
            <Major>1</Major>
            <Minor>1</Minor>
        </Version>
        <CBEFFVersion>
            <Major>1</Major>
            <Minor>1</Minor>
        </CBEFFVersion>
        <BIRInfo>
            <Integrity>false</Integrity>
        </BIRInfo>
        <BDBInfo>
            <Format>
                <Organization>Mosip</Organization>
                <Type>9</Type>
            </Format>
            <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
            <Type>Iris</Type>
            <Subtype>Left</Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>100</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSAD...</BDB>
    </BIR>
</BIR>
```

##### Sample Response in case of Authentication Failure
```JSON
{
  "id": null,
  "version": null,
  "responsetime": "2021-02-05T06:29:48.257Z",
  "metadata": null,
  "response": null,
  "errors": [
    {
      "errorCode": "KER-ATH-401",
      "message": "Authentication Failed"
    }
  ]
}
```

##### All Possible Error codes and Messages from Datashare URL
Error Code  | 	Error Message
------------|---------------
DAT-SER-003 |	File does not exists or File is empty
DAT-SER-006 |	Data share not found
DAT-SER-006 |	Data share usage expired
KER-ATH-401 |	Authentication Failed
KER-ATH-403 |	Forbidden

{% hint style="info" %}
Please note that, for all the functional failures MOSIP sends response code as 200.  
{% endhint %}

## Identify
* All Insert requests added to the queue earlier must be serviced by ABIS when performing an Identify request.  
* Identify request provides a 1:N comparison. The given input is compared either against the gallery passed or if the gallery is not specified the entire database.
* The input for comparison can be provided by referenceID or referenceURL. 
	* If the referenceID is given it is used as the preferred option. The given referenceID must be existing in the ABIS database else ABIS will throw and error. 
	* If the referenceID is omitted or NULL and the referenceURL is passed the ABIS retrieves the biometrics provided in the referenceURL and compares the same against either a gallery or its database. 
	* If in case, both referenceID and referenceURL are missing ABIS throws an error.

{% hint style="info" %}
We are not using the referenceURL in Identify request for our current implementation. Hence, it will be an empty string for Identify request. MOSIP adopters can have customized work-flows where the referenceURL can be used.
{% endhint %}

* Identify request should give all candidates which are considered as a match based on ABIS thresholds.
* This request should not match against referenceID that is not in the reference database.
* The response now has a section for analytics that contains key value pairs. Values can be JSON objects also. The contents of the analytics section will be agreed upon by the MOSIP adopter with the ABIS provider. Scores are also moved to this section and are not mandatory response parameters any more.
* Ordering or ranking of results is not explicitly specified and can be agreed upon between the MOSIP adopter and the ABIS provider.
* The flags section of the request can be used to customize or control ABIS behavior by sending specific key value pairs.
* "targetFPIR" or "maxResults" are examples of such flags that can alter the ABIS behavior. These are optional attributes for MOSIP during an identify request. MOSIP expects the adopters to define these parameters based on the accuracy expectations and the work-flow requirements. These can be set at the ABIS configuration level and need not be part of the individual request at all.

To give an example, please find the following calculation for targetFPIR - which is the error rate at which identification requests are expected to return non-empty candidate list.

`round (-10 * log10 (target false positive identification rate))`

With this calculation:

Target False Positive Identification Rate	| targetFPIR
--------------------------------------------|------------------
1 in 1,000                                  | 30
1 in 10,000                                 | 40
1 in 100,000                                | 50

### Identify Request
```JSON
{
  "id": "mosip.abis.identify",
  "version": "1.1",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "requesttime": "2020-03-29T07:01:24.692Z",
  "referenceId": "987654321-89AB-CDEF-0123-456789ABCDEF",
  "referenceURL": "",//will be an empty string, if not used
  "flags": { //optional
    //maxResults is an example and not a prescribed flag
	"maxResults": "10", 
	//targetFPIR is an example and not a prescribed flag
	"targetFPIR": "30",
    //there can be more following this	
	"flag1": "value1",
	"flag2": "value2" 
  },
  "gallery": {
    "referenceIds": [
      {
        "referenceId": "2abe7b7d-b58a-4466-a006-c79297281123"
      }, 
      {
        "referenceId": "7acce7b7d-b58a-4466-a006-c79297281456"
      }, 
      {
        "referenceId": "3bce7b7d-b58a-4466-a006-c79297281678"
      }, 
      {
        "referenceId": "5cce7b7d-b58a-4466-a006-c79297281098"
      }, 
      {
        "referenceId": "2cce7b7d-b58a-4466-a006-c79297281321"
      } 
    ]
  }
}
```

### Success Response
```JSON
{
  "id": "mosip.abis.identify",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2020-03-29T07:01:24.692Z",
  "returnValue": "1",
  "candidateList": {
    "count": "1",
    "candidates": [
      {
        "referenceId": "7acce7b7d-b58a-4466-a006-c79297281456",
        "analytics": {
		  //internalScore is an example and not prescribed
		  "internalScore": "112", 
		  //confidence is an example and not prescribed
          "confidence": "90",
		  //there can be more following this	
		  "key1": "value1",
		  "key2": "value2"
        },
		// modality wise analytics
        "modalities": [ 
          {
            "biometricType": "FIR",
            "analytics": {
			  "confidence": "90",
              "internalScore": "112",
			  "key1": "value1",
			  "key2": "value2"
            }
          },
		  {
            "biometricType": "IIR",
            "analytics": {
			  "confidence": "90",
              "internalScore": "112",
			  "key1": "value1",
			  "key2": "value2"
            }
          },
		  {
            "biometricType": "FID",
            "analytics": {
			  "confidence": "90",
              "internalScore": "112",
			  "key1": "value1",
			  "key2": "value2"
            }
          }
        ]
      }
    ]
    "analytics": {
      //This is a optional section
      //Data in this section can be agreed upon between the MOSIP adopter and the ABIS Provider
	}
  }
}
```

### Failure Response
```JSON
{
  "id": "mosip.id.identify",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2020-03-29T07:01:24.692Z",
  "returnValue": "2",
  "failureReason": "7"
}
```

## Delete
* Removes only the entry referred by the referenceId.
* This operation can be used to remove duplicates found by Identify.

### Delete Request
```JSON
{
  "id": "mosip.abis.delete",
  "version": "1.1",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "requesttime": "2020-03-29T07:01:24.692Z",
  "referenceId": "7acce7b7d-b58a-4466-a006-c79297281456"
}
```

### Success response
```JSON
{
  "id": "mosip.abis.delete",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2020-03-29T07:01:24.692Z",
  "returnValue": "1"
}
```

### Failure response
```JSON
{
  "id": "mosip.abis.delete",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2020-03-29T07:01:24.692Z",
  "returnValue": "2",
  "failureReason": "1"
}
```

## Ping
* A Ping request should respond with a response on the liveness of the ABIS system.

### Ping Request
```JSON
{
  "id": "mosip.abis.ping",
  "version": "1.1",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "requesttime": "2020-03-29T07:01:24.692Z",
}
```

### Success response
```JSON
{
  "id": "mosip.abis.ping",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2020-03-29T07:01:24.692Z",
  "returnValue": "1"
}
```

## Pending Jobs
* ABIS responds with the count of requests that are still pending.

### Pending Jobs Request
```JSON
{
  "id": "mosip.abis.pendingJobs",
  "version": "1.1",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "requesttime": "2020-03-29T07:01:24.692Z",
}
```

### Success Response
```JSON
{
  "id": "mosip.abis.pendingJobs",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2020-03-29T07:01:24.692Z",
  "jobscount": "10",
  "returnValue": "1"
}
```

## Reference Count
* ABIS will send a count of records in the reference database

### Reference Count Request
```JSON
{
  "id": "mosip.abis.referenceCount",
  "version": "1.1",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "requesttime": "2020-03-29T07:01:24.692Z",
}
```

### Success Response
```JSON
{
  "id": "mosip.abis.referenceCount",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2020-03-29T07:01:24.692Z",
  "count": "10",
  "returnValue": "1"
}
```

# References 
* [Biometric Specification](Biometric-Specification.md) to know about biometric specification in MOSIP
* [CBEFF XML](CBEFF-XML.md) to how MOSIP stores biometric data
* [Authentication and Authorization API](AuthN-and-AuthZ-APIs.md#authenticate-using-clientid-and-secret-key) to get the JWT token
* [MOSIP's de-duplication process](Deduplication-and-Manual-Adjudication.md) for deatils about De-Duplication process in MOSIP
