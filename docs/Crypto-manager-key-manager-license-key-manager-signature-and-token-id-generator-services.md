## kernel-crypto-jce
[Background & Design](https://github.com/mosip/commons/blob/master/design/kernel/kernel-crypto.md)


```
mvn javadoc:javadoc
```

**Java Dependency**
*JDK version should be "1.8.0_181" or above.*

**Maven dependency**
  
 ```
    <dependency>
		<groupId>io.mosip.kernel</groupId>
		<artifactId>kernel-crypto-jce</artifactId>
		<version>${project.version}</version>
	</dependency>
 ```



**The inputs which have to be provided are:**
1. Key for encryption or decryption can be [SecretKey](https://docs.oracle.com/javase/8/docs/api/javax/crypto/SecretKey.html) or [PrivateKey](https://docs.oracle.com/javase/8/docs/api/java/security/PrivateKey.html) or [PublicKey](https://docs.oracle.com/javase/8/docs/api/java/security/PublicKey.html). 
2. Data for encryption in *Byte Array* format.


**The response will be *byte array* of either encrypted data or decrypted data** 

**If there is any error which occurs while encryption and decryption, it will be thrown as Exception.** 

**Exceptions to be handled while using this functionality:**
1. InvalidKeyException
2. InvalidDataException
3. SignatureException
4. InvalidParamSpecException

**Usage Sample**



  
*Usage Symmetric Encryption:*
 
 ```
@Autowired
private CryptoCoreSpec<byte[], byte[], SecretKey, PublicKey, PrivateKey, String> cryptoCore;
	
byte[] encryptedData =cryptoCore.symmetricEncrypt(secretKey,data,iv,aad);
```
 
 *Output*
 
 ```
8��ޡ����'��P�ր��|sN#�lY;����4(\M�M9�c�J
 ```
 
 *Usage Asymmetric Encryption:*
 
 ```
@Autowired
private CryptoCoreSpec<byte[], byte[], SecretKey, PublicKey, PrivateKey, String> cryptoCore;
	
cryptoCore.asymmetricEncrypt(keyPair.getPublic(),dataToEncrypt));
	
 ```
 
  *Output*
 
 ```
S݄=Җ[<C&!r��˅Б�ɦ-�	�T��	�$0�P����e�T7����M���S��
�Ɯ�����>��T���a�Z3��0n�ɐ&F��7�[eܕ̺5#͉y�����l����t�f���𲞊�J�3�hk�Y�9�e�7i�k����
)&�������Ϩ8�H���=a�l�Fʷ���'d��؆x��K���0�x�ۦ.m��Պd"Q��C�����c��hvϟi�S��q�Q��
 ```

 *Usage Symmetric Decryption:*
 
 ```
@Autowired
private CryptoCoreSpec<byte[], byte[], SecretKey, PublicKey, PrivateKey, String> cryptoCore;
	
byte[] decryptedData = cryptoCore.symmetricDecrypt(secretKey, encryptedData,iv,aad);
```


*Output*

```
This is Plain Text
```

*Usage Asymmetric Decryption:*

```
private CryptoCoreSpec<byte[], byte[], SecretKey, PublicKey, PrivateKey, String> cryptoCore;
	
byte[] decryptedData = cryptoCore.asymmetricDecrypt(privatekey, encryptedData);
```

*Output*

```
This is Plain Text
```

*Usage Signing and Verify*

```
private CryptoCoreSpec<byte[], byte[], SecretKey, PublicKey, PrivateKey, String> cryptoCore;

String signnedData=cryptoCore.sign(dataTOSign,certificateResponse.getCertificateEntry().getPrivateKey());

boolean result = cryptoCore.verifySignature(dataTOSign.getBytes(), signnedData, certificateResponse.getCertificateEntry().getPublicKey());

```

*Output*

```
true
```

*Usage Hashing*

```
private CryptoCoreSpec<byte[], byte[], SecretKey, PublicKey, PrivateKey, String> cryptoCore;

String hashedData = cryptoCore.hash(datatoHash.getBytes(),salt.getBytes());
```
*Output*

```
5058438A3A25B9E4E16D2D65B0D994FD041222016B8B72615A7159655908C55D
```

## kernel-keymanager-service

[Background & Design KEYMANAGER](https://github.com/mosip/commons/blob/master/design/kernel/kernel-keymanager.md)



Default Port and Context Path

```
server.port=8088
server.servlet.path=/keymanager

```

localhost:8088/keymanager/swagger-ui.html




**Usage Sample**


  **Get Public Key**
  
  *Request*
  
  ```
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
.url("http://localhost:8088/keymanager/v1.0/publickey/REGISTRATION?referenceId=ref1&timeStamp=2018-12-11T06%3A12%3A52.994Z")
  .get()
  .build();

Response response = client.newCall(request).execute();
  ```
  
  *Response*
  
  Status:200
  
  ```
 {
    "publicKey": "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAzaFwykABfN683Mp5SNpBQU2_tIRKILIDBReeuTWQuS-6B8Z7kQmQ0cv2fG8fr8XTx7avyY3su25YFfNuIliBmdC3ZKqWVvsL9EpTCCQolcKo9a0351ieKxe_wCg5DIRLS1CciyK_cr2IqcUwh_Y3zkkZs0cF2R945vA_7RMTUth1_9zdobrxYMrMsIf2L1431vLP0-mUuAonQ9GU34L-SyAP1uscWcbk6Xj_EdZRvqrj2aOXrHy0FbQltrwNuTyX0-ZLBwMH7U50Nrh4BeQBA1ioeFKmdzSEY95Fs2jJGmxDUK77dsHw77jmg125HlEuu-NwIvDlcwCFuGQheUQFvwIDAQAB",
    "issuedAt": "2018-12-11T06:12:52.994",
    "expiryAt": "2019-12-11T06:12:52.994"
}
  ```

  **Sign pdf**
  
  *Request*
  
  ```
final String DEST = DEST;
final String SRC = SRC;
File outFile = new File(DEST);
File inFile = new File(SRC);
RestTemplate restTemplate = new RestTemplate();
RequestWrapper<PDFSignatureRequestDto> requestWrapper = new RequestWrapper<>();
PDFSignatureRequestDto request = new PDFSignatureRequestDto(400, 400, 600, 600, "signing", 1, "password");
		request.setApplicationId("KERNEL");
		request.setReferenceId("SIGN");
		request.setData(Base64.encodeBase64String(FileUtils.readFileToByteArray(inFile)));
		request.setTimeStamp("2019-12-10T06:12:52.994Z");
		requestWrapper.setRequest(request);
		HttpHeaders headers= new HttpHeaders();
		headers.add("Cookie", Token);
HttpEntity<RequestWrapper<PDFSignatureRequestDto>> httpEntity = new HttpEntity<RequestWrapper<PDFSignatureRequestDto>>(requestWrapper, headers);
ResponseEntity<String> responseEntity =restTemplate.exchange("http://HOST:PORT/v1/keymanager/pdf/sign", HttpMethod.POST, httpEntity, String.class);
ObjectMapper mapper= new ObjectMapper();
JsonNode jsonNode= mapper.readTree(responseEntity.getBody());
SignatureResponseDto signatureResponseDto=mapper.readValue(jsonNode.get("response").toString(), SignatureResponseDto.class);
FileUtils.writeByteArrayToFile(outFile,Base64.decodeBase64(signatureResponseDto.getData()));
 ```
 
*Response*
  
Status:200
  
```
 {
    "data": "sq9oJCdwV-mHEdxEXRh91WkQcGJ6Q83quNaP9OZa_p0"
 }
```

**Encrypt Request**
  
  ```
OkHttpClient client = new OkHttpClient();

MediaType mediaType = MediaType.parse("multipart/form-data;boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW");

RequestBody body = RequestBody.create(mediaType, "{\r\n  \"applicationId\": \"REGISTRATION\",\r\n  \"data\": \"VGhpcyBpcyBhIHBsYWluIHRleHQ=\",\r\n  \"referenceId\": \"ref123\",\r\n  \"timeStamp\": \"2018-12-06T12:07:44.403Z\"\r\n}");

Request request = new Request.Builder()
  .url("http://localhost:8087/cryptomanager/v1.0/encrypt")
  .post(body)
  .addHeader("content-type", "application/json")
  .build();

Response response = client.newCall(request).execute();
  ```
  
  *Response*
  
  Status:200
  
  ```
{
"data":"EsGmECXJucN7AH6DHoKzzGs3bwspfOftQHwhpOWHUpptyFU1MYOz_iJxi1dBcLDXKQE_OV1xrY8Jyw0XUcSDbNYW9qHr5Hfbe30kTc-hCVNKItYN0OYOSBvgq9pd6TAatzlADvW6PRbRyHuumRqoD2ZL0tddiZqe6pa_Ya3hlTYsZm-L_65IJnkGDJLmxmMVS-pqqKqqtrXnTdYMjvK2wMkuZIFz4SX6F0jxnHz7XhrKSBzY8b8O4z1ZUterB450kKPzbRsZ3fySdjlpqhwtuVXZV6gkAA_n1iACOksvSyUZ7BN5AgWKnnsUHaNyF6f-e564G6nTN4M3Fyd_Z_KzxCNLRVlfU1BMSVRURVIjcvEHI6pM3H-kRWMRBZJDyte4BHKuUj4PBtU3dJ4kb_Vmd4nFBuguSh_tFHiz62GB"
}
  ```
  
  **Decrypt Request**
  
  ```
OkHttpClient client = new OkHttpClient();

MediaType mediaType = MediaType.parse("application/json");

RequestBody body = RequestBody.create(mediaType, "{\n  \"applicationId\": \"REGISTRATION\",\n  \"data\": \"EsGmECXJucN7AH6DHoKzzGs3bwspfOftQHwhpOWHUpptyFU1MYOz_iJxi1dBcLDXKQE_OV1xrY8Jyw0XUcSDbNYW9qHr5Hfbe30kTc-hCVNKItYN0OYOSBvgq9pd6TAatzlADvW6PRbRyHuumRqoD2ZL0tddiZqe6pa_Ya3hlTYsZm-L_65IJnkGDJLmxmMVS-pqqKqqtrXnTdYMjvK2wMkuZIFz4SX6F0jxnHz7XhrKSBzY8b8O4z1ZUterB450kKPzbRsZ3fySdjlpqhwtuVXZV6gkAA_n1iACOksvSyUZ7BN5AgWKnnsUHaNyF6f-e564G6nTN4M3Fyd_Z_KzxCNLRVlfU1BMSVRURVIjcvEHI6pM3H-kRWMRBZJDyte4BHKuUj4PBtU3dJ4kb_Vmd4nFBuguSh_tFHiz62GB\",\n  \"referenceId\": \"ref123\",\n  \"timeStamp\": \"2018-12-06T12:07:44.403Z\"\n}\n");

Request request = new Request.Builder()
  .url("http://localhost:8087/cryptomanager/v1.0/decrypt")
  .post(body)
  .addHeader("content-type", "application/json")
  .build();

Response response = client.newCall(request).execute();
  ```
  
  *Response*
  
  Status:200
  
  ```
{
 "data": "VGhpcyBpcyBhIHBsYWluIHRleHQ"
}
  ```

**Sign Request**
  
  ```
OkHttpClient client = new OkHttpClient();

MediaType mediaType = MediaType.parse("application/json");
RequestBody body = RequestBody.create(mediaType, "{ \"id\": \"string\", \"metadata\": {}, \"request\": { \"data\": \"admin\" }, \"requesttime\": \"2018-12-10T06:12:52.994Z\", \"version\": \"string\" }");
Request request = new Request.Builder()
  .url("http://localhost:8092/v1/signature/sign")
  .post(body)
  .addHeader("Content-Type", "application/json")
  .build();

Response response = client.newCall(request).execute();
  ```
  
  *Response*
  
 HTTP Status: 200 OK
  
  ```
{
    "id": null,
    "version": null,
    "responsetime": "2019-05-20T05:59:32.178Z",
    "metadata": null,
    "response": {
        "signature": "ZeNsCOsdgf0UgpXDMry82hrHS6b1ZKvS-tZ_3HBGQHleIu1fZA6LNTtx7XZPFeC8dxsyuYO_iN3mVExM4J2tPlebzsRtuxHigi9o7DI_2xGqFudzlgoH55CP_BBNUDmGm6m-lTMkRx6X61dKfKDNo2NipZdM-a_cHf6Z0aVAU4LdJhV4xWOOm8Pb8sYIc2Nf6kUJRiidEGrxonUCfXX1XlnjMAo75wu99pN8G0mc7JhOehUqbwuXwKo4sQ694ae4F_AYl70sepX24v-0k0ga9esXR4i9rKaoHbzhQFtt2hangQkxHajq9ZTrXWMhd4msTzjHCKdEPXQFsTbKrgKtDQ",
        "timestamp": "2019-05-20T05:59:31.934Z"
    },
    "errors": null
}
  ```

**The inputs which have to be provided for validate sign response by passing Response Timestamp along with the data and sign response:**

1.signature -Mandatory

2.data - Mandatory

3.timestamp -Mandatory


**The response will be Validation Successful  if request is successful, else throw exception Validation Unsuccessful** 


**Signature Validate**
  
*Request*
  
  ```
OkHttpClient client = new OkHttpClient();

MediaType mediaType = MediaType.parse("application/json");

RequestBody body = RequestBody.create(mediaType, "{ \"id\": \"string\", \"metadata\": {}, \"request\": { \"signature\": \"DrgkF2vm4WvBe04UNe-RePRcrg77uQpsH3GENRcglBsid-K0UDReeeZVKwimOdwV7Ht1j-_D1BFf2sCrM8ni7ztE5Xc_3TEaniOAnOgZDRSI0GG-uSqjH51AwTSl1PYdStfXtOn6HEfEU68JG7TdAliDI5C7thJ1YNmPnHusIsZzX6sW_VfvSpLeA_RzCqnUDH_VaEzZt_5zRYiQv9van4wt0P7HTfIBlQ5zaeO3wXOc3Pogct3ssKwqdaMmZdc7QTDOFqDZZVceMTIXKyiH-ZVs_u3QXRysiLVdXoz7d7yXHdWxQtzsfMjY7alMJNgbmu4X26LYNRemn65Mmn6ixA\", \"data\": \"test\", \"timestamp\": \"2019-05-20T07:28:04.269Z\" }, \"requesttime\": \"2018-12-10T06:12:52.994Z\", \"version\": \"string\" }");



Request request = new Request.Builder()
  .url("http://localhost:8092/v1/signature/validate")
  .post(body)
  .addHeader("Content-Type", "application/json")
  .build();

Response response = client.newCall(request).execute();
  ```
  
  *Response*
  
 HTTP Status: 200 OK
  
  ```
{
    "id": null,
    "version": null,
    "responsetime": "2019-05-20T07:16:40.794Z",
    "metadata": null,
    "response": {
        "status": "success",
        "message": "Validation Successful"
    },
    "errors": null
}
  ```

  **Token ID Generation**
  
  
```
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("http://localhost:8097/v1/tokenidgenerator/7394829283/PC001")
  .get()
  .build();

Response response = client.newCall(request).execute();
```


  *Response:*
  
  HttpStatus: 200 OK
  
```
{
	"id": "mosip.kernel.tokenid.generate",
	"version": "1.0",
	"metadata": {},
	"responsetime": "2019-04-04T05:03:18.287Z",
	"response": {
                  "tokenID": "268177021248100621690339355202974361"
                },
        "errors": []
}
```

 
 **License Key Generation :**
 
 ```
{ 
OkHttpClient client = new OkHttpClient();

MediaType mediaType = MediaType.parse("application/json");
RequestBody body = RequestBody.create(mediaType, "{\"tspId\":\"TSPID1\",\"licenseExpiryTime\":\"2019-02-07T05:35:53.476Z\"}");
Request request = new Request.Builder()
  .url("http://localhost:8080/v1.0/license/generate")
  .post(body)
  .addHeader("content-type", "application/json")
  .addHeader("cache-control", "no-cache")
  .addHeader("postman-token", "7d3b19f4-5a6c-d926-4975-1f228f8caa3e")
  .build();

Response response = client.newCall(request).execute();
}
 ```
 
*License Generation Responses :*
Successful Generation :

HttpStatus : 200 OK

```
{
    "licenseKey": "rAx2TRvemovtZ0to"
}
```

**License Key Mapping:**
 
```
OkHttpClient client = new OkHttpClient();

MediaType mediaType = MediaType.parse("application/json");
RequestBody body = RequestBody.create(mediaType, "{ \"lkey\": \"rAx2TRvemovtZ0to\",\"permissions\": [\"OTP Trigger\",\"OTP Authentication\"],\"tspId\": \"TSPID1\"}");
Request request = new Request.Builder()
  .url("http://localhost:8080/v1.0/license/map")
  .post(body)
  .addHeader("content-type", "application/json")
  .addHeader("cache-control", "no-cache")
  .addHeader("postman-token", "86230d1c-f33d-0ab1-6726-8f7f6ade6072")
  .build();

Response response = client.newCall(request).execute();

```
*License Mapping Responses:*

 HttpStatus : 200 OK
 

 ```
{
    "status": "Mapped License with the permissions"
}
 ```

**License Key Fetch:**
 
```
 OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("http://localhost:8080/v1.0/license/fetch?licenseKey=rAx2TRvemovtZ0to&tspId=TSPID1")
  .get()
  .addHeader("cache-control", "no-cache")
  .addHeader("postman-token", "ac4daf24-2cef-f5f5-50f4-32b0d1938177")
  .build();

```

*License Fetch Responses:*

 HttpStatus : 200 OK

 ```
{
    "mappedPermissions": [
        "OTP Trigger",
        "OTP Authentication"
    ]
}
 ```
  
 
    
  
## Setup steps:

### Linux (Docker) -- OLD Style

1. (First time only) Rename the  kernel-keymanager-softhsm Dockerfile in softhsm directory to `Dockerfile`. Build kernel-keymanager-softhsm docker image using this Dockerfile with command:

```
docker build --build-arg softhsm_pin=1234 --tag kernel-keymanager-softhsm:0.1 .
```

The pin passed to the variable `softhsm_pin` in docker build command should be same as the value of property
`mosip.kernel.keymanager.softhsm.keystore-pass` in properties file.

2. (First time only) Modify the `FROM` in kernel-keymanager-service Dockerfile with kernel-keymanager-softhsm docker image name:
```
FROM kernel-keymanager-softhsm:0.1
```

OR

2. (First time only) Push kernel-keymanager-softhsm docker image to private repository and modify the `FROM` in kernel-keymanager-service Dockerfile with kernel-keymanager-softhsm docker image URI:
```
FROM <your-repository>/kernel-keymanager-softhsm:0.1
```

3. Build kernel-keymanager-service docker image with command:

```
docker build --tag kernel-keymanager-service:1.0 .
```

4. Run docker container using command:

```
docker run -tid --ulimit memlock=-1  -p 8088:8088 -e spring_config_url_env=<spring_config_url_env> -e spring_config_label_env=<spring_config_label_env> -e active_profile_env=<active_profile_env> -v softhsm:/softhsm --name kernel-keymanager-service kernel-keymanager-service:1.0
```
#### Note:
- Remember to use docker volume using `-v softhsm:/softhsm` and do not add bind mount `(-v /softhsm:/softhsm)`.
- Keys will be stored in a docker volume named softhsm. To view information of this volume, run:

```
docker volume inspect softhsm
```

Know more about docker volume: https://docs.docker.com/storage/volumes/
- It is recommended to set ulimit for memlock (the maximum size that may be locked into memory) to unlimited using 
`--ulimit memlock=-1`. If not, the softhsm will warn with this message:

```
SoftHSM has been configured to store sensitive data in non-page RAM
(i.e. memory that is not swapped out to disk). This is the default and
most secure configuration. Your system, however, is not configured to
support this model in non-privileged accounts (i.e. user accounts).

You can check the setting on your system by running the following
command in a shell:

        ulimit -l

If this does not return "unlimited" and you plan to run SoftHSM from
non-privileged accounts then you should edit the configuration file
/etc/security/limits.conf (on most systems).

You will need to add the following lines to this file:

#<domain>       <type>          <item>          <value>
*               -               memlock         unlimited

Alternatively, you can elect to disable this feature of SoftHSM by
re-running configure with the option "--disable-non-paged-memory".
Please be advised that this may seriously degrade the security of
SoftHSM.
```

### Linux (Docker) -- New Style
With the new docker file the key manager is an independent of the type of HSM. The HSM is abstracted out of this layer using PKCS11 library and dynamic installation of client libraries for the HSM.

However the key manager needs the hsm client (vendor specific) to interact with the various models of HSM. The Docker file is structured to download and install this client from the artifactory url $artifactory_url_env/artifactory/libs-release-local/hsm/client.zip. 

In our environment we will use a network based HSM from The HSM is run in network mode baed on the https://hub.docker.com/repository/docker/mosipdev/softhsm. The source code of this project is part of the mosip-mock-services projects.

So in order to connect the key manager with the softhsm the following has to be done.

1. Load the client.zip file from https://github.com/mosip/mosip-mock-services/softhsm to the artifactory in the path /artifactory/libs-release-local/hsm/client.zip
1. Run the keymanager docker using the following command or its equivalent yml
    docker run -e artifactory_url_env="url pointing to the artifactory" -e PKCS11_PROXY_SOCKET="tcp://servicenameofsofthsm:5666" kernel-keymanager-service:<version>


### Windows

1. Download softhsm portable zip archive from https://github.com/disig/SoftHSM2-for-Windows#download
2. Extract it to any location, e.g `D:\SoftHSM2`. SoftHSM2 searches for its configuration file in the following locations:
```
  1. Path specified by SOFTHSM2_CONF environment variable
  2. User specific path %HOMEDRIVE%%HOMEPATH%\softhsm2.conf
  3. File softhsm2.conf in the current working directory
```
3. Modify following in environment variables:
```
> set SOFTHSM2_CONF=D:\SoftHSM2\etc\softhsm2.conf
> set PATH=%PATH%;D:\SoftHSM2\lib\
```
4. Create another conf file at `D:\SoftHSM2\etc\softhsm-application.conf` with below content
```
# Sun PKCS#11 provider configuration file for SoftHSMv2
name = SoftHSM2
library = D:\SoftHSM2\lib\softhsm2-x64.dll 
slotListIndex = 0
```
5. Install JCE With an Unlimited Strength Jurisdiction Policy as shown here:
https://dzone.com/articles/install-java-cryptography-extension-jce-unlimited
6. Go to `D:\SoftHSM2\bin` and run below command:
```
> softhsm2-util.exe --init-token --slot 0 --label "My token 1"
```
Check token is initialized in slot with below command:
```
> softhsm2-util.exe --show-slots
```
The output should be like below:
```
Slot 569035518
    Slot info:
        Description:      SoftHSM slot ID 0x21eacafe
        Manufacturer ID:  SoftHSM project
        Hardware version: 2.4
        Firmware version: 2.4
        Token present:    yes
    Token info:
        Manufacturer ID:  SoftHSM project
        Model:            SoftHSM v2
        Hardware version: 2.4
        Firmware version: 2.4
        Serial number:    b1ee933e21eacafe
        Initialized:      yes
        User PIN init.:   yes
        Label:            My token 1
Slot 1
    Slot info:
        Description:      SoftHSM slot ID 0x1
        Manufacturer ID:  SoftHSM project
        Hardware version: 2.4
        Firmware version: 2.4
        Token present:    yes
    Token info:
        Manufacturer ID:  SoftHSM project
        Model:            SoftHSM v2
        Hardware version: 2.4
        Firmware version: 2.4
        Serial number:
        Initialized:      no
        User PIN init.:   no
        Label:
```
5. Put the newly created conf filepath `D:\SoftHSM2\etc\softhsm-application.conf` in `mosip.kernel.keymanager.softhsm.config-path` property. Softhsm is ready to be used. 

For more information, check https://github.com/opendnssec/SoftHSMv2

## kernel-keymanager-softhsm

[Background & Design](https://github.com/mosip/commons/blob/master/design/kernel/kernel-keymanager-softhsm.md)


```
mvn javadoc:javadoc
```


To use this api, add this to dependency list:

```
		<dependency>
			<groupId>io.mosip.kernel</groupId>
			<artifactId>kernel-keymanager-softhsm</artifactId>
			<version>${project.version}</version>
		</dependency>
```


**Exceptions to be handled while using this functionality:**

1. KeystoreProcessingException
2. NoSuchSecurityProviderException


**Usage Sample**
  
Usage1: Get All Alias
 
 ```
		@Autowired
		private KeyStore keystoreImpl;

		List<String> allAlias = keystoreImpl.getAllAlias();

		allAlias.forEach(alias -> {
			Key key = keystoreImpl.getKey(alias);
			System.out.println(alias + "," + key);
			keystoreImpl.deleteKey(alias);
		});

 
 ```
 
 Output: allAlias
 
 ```
test-alias-private,SunPKCS11-SoftHSM2 RSA private key, 2048 bits (id 2, token object, not sensitive, unextractable)
test-alias-secret,SunPKCS11-SoftHSM2 AES secret key, 32 bits (id 4, token object, not sensitive, unextractable)
 ```
 
 Usage2: Secret Key
 
 ```
 
 		@Autowired
		private KeyStore keystoreImpl;
		
 		KeyGenerator keyGenerator = null;
		try {
			keyGenerator = KeyGenerator.getInstance("AES");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		SecureRandom secureRandom = new SecureRandom();
		int keyBitSize = 256;
		keyGenerator.init(keyBitSize, secureRandom);
		SecretKey secretKey = keyGenerator.generateKey();

		keystoreImpl.storeSymmetricKey(secretKey, "test-alias-secret");

		SecretKey fetchedSecretKey = keystoreImpl.getSymmetricKey("test-alias-secret");
		
```

Output: SecretKey

```
SunPKCS11-SoftHSM2 AES secret key, 32 bits (id 6, token object, not sensitive, unextractable)
```

Usage:3 KeyPair 

```
		@Autowired
		private KeyStore keystoreImpl;
		
		KeyPairGenerator keyPairGenerator = null;
		try {
			keyPairGenerator = KeyPairGenerator.getInstance("RSA");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		keyPairGenerator.initialize(2048);
		KeyPair keyPair = keyPairGenerator.generateKeyPair();

		keyStoreImpl.storeAsymmetricKey(keyPair, "test-alias-private", LocalDateTime.now(),
				LocalDateTime.now().plusDays(365));

		PrivateKey privateKey = keystoreImpl.getPrivateKey("test-alias-private");


		PublicKey publicKey = keystoreImpl.getPublicKey("test-alias-private");
		
		
```

Output: privateKey , publicKey

```
SunPKCS11-SoftHSM2 RSA private key, 2048 bits (id 7, token object, not sensitive, unextractable)

Sun RSA public key, 2048 bits
  modulus: 30328748957969945174954745208064345862312969927254598238526101762391296493510742256233065491262447187409078364000282905404149813261041457625810095572898553468954461087700148296418925749778448475363419327262968745137244118884489221475416539456905265179962075689677948902259773446393861226550815844977347279173492442418988010503374643453726724268482134502743060873752304598505726082877096316359566366812195445612134930294321549768069928020266719012437919578249686342320718712856084420897976841767236464163300792423929086540883232763064844858799603503457594656470904561008040334197773602257581934425199267901046399134783
  public exponent: 65537
  
```

Usage 4 : Certificate

```
@Autowired
private KeyStore keystoreImpl;

X509Certificate certificate = (X509Certificate) keystoreImpl.getCertificate("test-alias-private");



```

Output: certificate

```
[
[
  Version: V3
  Subject: CN=www.mosip.io, OU=MOSIP, O=IITB, C=IN
  Signature Algorithm: SHA1withRSA, OID = 1.2.840.113549.1.1.5

  Key:  Sun RSA public key, 2048 bits
  modulus: 16265726321697190074417570435820273840526375073035324517336363746765717615231463034967523596048334125232762399152129449559887648172484985573599028996853878084271063611042433468250637295902848860022208245186117552741112522087084290954015399873585231466909793093414927350186559745777351425653013789176663345326343349978119814401307260122185081738557665997537450087518000196841656438659836315332485387833632324608293715178218792148295966729133268565081260221357611865111342824069787439471367315492975709574099349381748011137719162784189473363140108977750461142038262582094549226950119548612995912086261424715267362148473
  public exponent: 65537
  Validity: [From: Mon Nov 26 19:19:31 IST 2018,
               To: Tue Nov 27 01:24:31 IST 2018]
  Issuer: CN=www.mosip.io, OU=MOSIP, O=IITB, C=IN
  SerialNumber: [    cb0f0ba3 47dbbc2a]

]
  Algorithm: [SHA1withRSA]
  Signature:
0000: 4C 02 4F 6B 5F FE BC 86   08 1F B4 3D A3 5E 22 F9  L.Ok_......=.^".
0010: F3 8B EE B8 DE 03 EE 97   E2 6C 04 2E BF 5E EE 81  .........l...^..
0020: E2 B2 2A A8 71 93 B3 B1   41 C4 6A 6B 71 AD 30 A3  ..*.q...A.jkq.0.
0030: D5 1A 5F E6 4D DC F8 63   E5 53 B6 20 25 E2 6D 7A  .._.M..c.S. %.mz
0040: 0E CE 40 4A C6 16 EF 75   E7 1B 8C AB CD CF C7 D7  ..@J...u........
0050: B7 B3 D4 F8 23 B6 69 3B   7E 12 45 7F AA 2D 26 E2  ....#.i;..E..-&.
0060: E7 F8 46 5A 42 FF 8E 2E   D5 B6 A6 D4 34 02 C8 6A  ..FZB.......4..j
0070: 46 53 93 04 A4 BC 8D 47   74 1C 10 81 21 74 8F 83  FS.....Gt...!t..
0080: 8B 84 20 30 F0 A9 F7 5B   9C C2 3D EB D1 E4 1B 20  .. 0...[..=.... 
0090: 53 F9 71 17 1C 6A C0 18   A4 76 4F 8D D0 F2 00 55  S.q..j...vO....U
00A0: 76 1D 5C 07 6B 16 CC 6D   36 7B 2C 98 3B 5F A7 D3  v.\.k..m6.,.;_..
00B0: C3 20 42 CC D1 D0 EE B3   49 C8 A5 E0 1F 6B 68 82  . B.....I....kh.
00C0: 71 87 42 17 4E FE EF A4   39 B5 35 A3 E4 30 3D 02  q.B.N...9.5..0=.
00D0: 25 9D DE 7D 93 0D 79 60   6A D1 65 CF B5 C8 D8 00  %.....y`j.e.....
00E0: 05 E0 1D 79 41 F8 9B 8C   4E 42 ED A6 52 2B 96 D9  ...yA...NB..R+..
00F0: 4A 95 D8 F4 78 82 AB 8C   EC 7C 13 22 45 0B 7E 45  J...x......"E..E

]
```


## Setup steps:

### Linux

1. Follow docker installation steps from https://github.com/mosip/mosip/blob/master/kernel/kernel-keymanager-service/README.md

### Windows

1. Download softhsm portable zip archive from https://github.com/disig/SoftHSM2-for-Windows#download
2. Extract it to any location, e.g `D:\SoftHSM2`. SoftHSM2 searches for its configuration file in the following locations:
```
  1. Path specified by SOFTHSM2_CONF environment variable
  2. User specific path %HOMEDRIVE%%HOMEPATH%\softhsm2.conf
  3. File softhsm2.conf in the current working directory
```
3. Modify following in environment variables:
```
> set SOFTHSM2_CONF=D:\SoftHSM2\etc\softhsm2.conf
> set PATH=%PATH%;D:\SoftHSM2\lib\
```
4. Create another conf file at `D:\SoftHSM2\etc\softhsm2-application.conf` with below content
```
# Sun PKCS#11 provider configuration file for SoftHSMv2
name = SoftHSM2
library = D:\SoftHSM2\lib\softhsm2-x64.dll 
slotListIndex = 0
```
5. Install JCE With an Unlimited Strength Jurisdiction Policy as shown here:
https://dzone.com/articles/install-java-cryptography-extension-jce-unlimited
6. Go to `D:\SoftHSM2\bin` and run below command:
```
> softhsm2-util.exe --init-token --slot 0 --label "My token 1"
```
Check token is initialized in slot with below command:
```
> softhsm2-util.exe --show-slots
```
The output should be like below:
```
Slot 569035518
    Slot info:
        Description:      SoftHSM slot ID 0x21eacafe
        Manufacturer ID:  SoftHSM project
        Hardware version: 2.4
        Firmware version: 2.4
        Token present:    yes
    Token info:
        Manufacturer ID:  SoftHSM project
        Model:            SoftHSM v2
        Hardware version: 2.4
        Firmware version: 2.4
        Serial number:    b1ee933e21eacafe
        Initialized:      yes
        User PIN init.:   yes
        Label:            My token 1
Slot 1
    Slot info:
        Description:      SoftHSM slot ID 0x1
        Manufacturer ID:  SoftHSM project
        Hardware version: 2.4
        Firmware version: 2.4
        Token present:    yes
    Token info:
        Manufacturer ID:  SoftHSM project
        Model:            SoftHSM v2
        Hardware version: 2.4
        Firmware version: 2.4
        Serial number:
        Initialized:      no
        User PIN init.:   no
        Label:
```
5. Put the newly conf filepath `D:\SoftHSM2\etc\softhsm2-application.conf` in `mosip.kernel.keymanager.softhsm.config-path` property. Softhsm is ready to be used. 

## kernel-licensekeygenerator-misp

[Background & Design](https://github.com/mosip/commons/blob/master/design/kernel/kernel-keymanager-softhsm.md/Kernel-licensekeygenerator-misp.md)



```
 mvn javadoc:javadoc

 ```
 
 
**Maven Dependency**

```
	<dependency>
			<groupId>io.mosip.kernel</groupId>
			<artifactId>kernel-licensekeygenerator-misp</artifactId>
			<version>${project.version}</version>
	</dependency>

```
  
**Sample Usage**
  
```
	  Autowire the interface MISPLicenseGenerator
	  @Autowired
	  private MISPLicenseGenerator<String> mispLicenseGenerator;
```


```
	  Call generateLicense() from autowired mispLicenseGenerator instance to generate license key.     
	  String generatedLicense = mispLicenseGenerator.generateLicense());
```
	  
**Sample License**

```

 Generated License: u7y6thye
 
```   
   


## kernel-responsesignature-api

[Background & Design](https://github.com/mosip/commons/blob/master/design/kernel/kernel-cryptography-digitalsignature.md)


```
mvn javadoc:javadoc
```

**Maven dependency**

 ```
    <dependency>
			<groupId>io.mosip.kernel</groupId>
			<artifactId>kernel-responsesignature-api</artifactId>
			<version>${project.version}</version>
		</dependency>
 ```

 
 **Sample Usage**
 
   1. *Signing the response*
   
  ```
   #Instance of signatureUtil
   @Autowired
   private SignatureUtil signatureUtil;
   
   String responseBody = "\"response\": { \"roles\": [ { \"roleId\": \"REGISTRATION_ADMIN\", \"roleName\": \"REGISTRATION_ADMIN\", \"roleDescription\": \"Registration administrator\" }, { \"roleId\": \"TSP\", \"roleName\": \"TSP\", \"roleDescription\": \"Trusted Service Provider\" } ] }"
  
    #Pass the response body to sign the response with private key.
    SignatureResponse signatureResponse= signatureUtil.sign( responseBody);
   ```
   
   **Sample response**
 
 ```
 {
  "response": {
    "data": "SvYBeeZTl-ao4loe981MkTTBZ507Om7HaZAzxQ1Dj9M9KNuxgslYbQgFdcsaSnoCiUM5nZRDVl2-GgyUJdlqd9cb5kvnAZQjubV2ZYsZfqu2W8MJnsglXK1iUrD6jPf0KNCQ86UmlHOc9BIFi9u1Wh87b8kKmIdbkL8Jv4x2Yqqvufp5kkFja4udXcIVJhhSmsYS4Z0DtDv6p9eGZ18Gcrz-Nf9G9ZRcGpllOIvZfo7Jq4-MW94TJNBq0FA-H0qwdHFJIDJaCT5lN_dGzD4mFu-9CPL4xpeA76V1E7D_vT_v7UQcFgAu4ewdw4-Qew9guOSCUrrcJ-PF5sYxxyT9Fg"
    "timestamp":"2019:09:09:09.000Z
  }
}
 ```
   2. *Validate with public key*
   
   ```
    #Instance of signatureUtil
   @Autowired
   private SignatureUtil signingUtil;
   
   boolean isVerfied = signingUtil.validateWithPublicKey(responseSignature,
   responseBody ,publicKey);
   
   ```
 3. *Validate*
 
 
   ```
   #Instance of signatureUtil
   @Autowired
   private SignatureUtil signingUtil;
   
   boolean isVerfied = signingUtil.validate(responseSignature, responseBody,
				responseTime);
  ```
  
  **Sample response**
 
 ```
 #if the signature is verified the response will be true
 boolean isVerified= true;
 ```
 
  
## kernel-idgenerator-tokenid

[Background & Design](https://github.com/mosip/commons/blob/master/design/kernel/kernel-idgenerator-tokenid.md)


```
 mvn javadoc:javadoc

 ```
 
 **Maven Dependency**

```
	<dependency>
			<groupId>io.mosip.kernel</groupId>
			<artifactId>kernel-idgenerator-tokenid</artifactId>
			<version>${project.version}</version>
	</dependency>

```




** Database Properties **

```
Schema : ida

Tables : token_seed , token_seq

```


**Sample**
 
  ```
//Autowire the interface TokenIdGenerator

  @Autowired
	TokenIdGenerator<String> tokenIdGenerator;

 //Call generateId()
  String tokenId = tokenIdGenerator.generateId();
  
```
**Sample TokenID:**

Generated tokenId: 526900409300563849276960763148952762


# List of Configurable Parameters
* [**Link to Configurable Parameters of Kernel**](https://github.com/mosip/mosip-config/blob/master/config-templates/kernel-env.properties)
* [**Link to Kernel Application Properties**](https://github.com/mosip/mosip-config/blob/master/config-templates/application-env.properties)







  
   
 
   
