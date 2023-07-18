# How to setup ABIS for testing

A partner can test their biometric ABIS’s with MOSIP’s Compliance Toolkit. In this document, we have provided the steps that can be followed by the partner to enable the ABIS testing.

The diagram below illustrates the CTK deployment architecture.

![](\_images/ctk-deployment-architecture-abis.png)

## Test using a Mock ABIS

Below is a quick demonstration followed by steps to set up ABIS for testing.

{% embed url="https://www.youtube.com/watch?v=NQiJ-PDOuI0" %}

* Checkout MOSIP’s Mock Services from `https://github.com/mosip/mosip-mock-services`. Make sure to checkout the code from **develop** branch.
* Go to `REPO_ROOT/mock-abis`.
* For setting ABIS queue configuration, follow the steps below:
    * Step 1: Create `registration-processor-abis.json` in the resources folder with the below details.

    ```
    {
        "abis": [{
        "name": "ABIS",
        "host": "",
        "port": "",
        "brokerUrl": "tcp://activemq.${env}.mosip.net:61616",
        "inboundQueueName": "ctk-to-abis",
        "outboundQueueName": "abis-to-ctk",
        "pingInboundQueueName": "ctk-to-abis",
        "pingOutboundQueueName": "abis-to-ctk",
        "userName": "artemis",
        "password": "XXXXXXX",
        "typeOfQueue": "ACTIVEMQ",
        "inboundMessageTTL": 2700
        }]
    }
    ```

    * Step 2: Update the following details in `application-local.properties`.

    ```
    secret_url=https://api-internal.${env}.mosip.net/v1/authmanager/authenticate/clientidsecretkey
    local.development=true
    abis.bio.encryption=false
    ```

    * Step 3: Update the following details in `config.properties`.

    ```
    secret_url=https://api-internal.${env}.mosip.net/v1/authmanager/authenticate/clientidsecretkey
    secret_url.clientnId=mosip-regproc-client
    secret_url.id=string
    secret_url.secretKey=XXXXXXXXXXX
    secret_url.appId=regproc
    secret_url.requesttime=2023-03-27T06:12:52.994Z
    secret_url.version=string

    analytics.confidence=90
    analytics.internalscore=112
    analytics.key1=value1
    analytics.key2=value2
    ```

    * Step 4: Build the code with the command  `mvn clean install -Dmaven.test.skip=true -Dgpg.skip=true`.
      
* If you are testing with newer queues, then you need to first create them manually in `active mq` console.

```
Create Address > ctk-to-abis >  anycast > save
Create Address > abis-to-ctk >  anycast > save
```

* After build is successful, place your ABIS jar in the `\mock-abis` folder
* create a bat file to run `mock ABIS`.

```
    cd <LOCAL_PATH>\mock-abis
    java -jar -Dlocal.development=true -Dabis.bio.encryption=true -Dspring.profiles.active=local -Dmosip_host=https://$   {env}.mosip.net target/mockabis.jar
```

Here `LOCAL_PATH` is the installation folder path for the mosip-mock-service.
* Once the mock ABIS service is running, check if the JAR is working using the Swagger available at URL: `http://localhost:8081/v1/mock-abis-service/swagger-ui.html`
* In CTK ,for the ABIS project configure the below details:

```
"Url": "wss://activemq.${env}.mosip.net/ws",
"RequestQueueName": "ctk-to-abis",
"ResponseQueueName": "abis-to-ctk",
"userName": "artemis",
"password": "XXXXXX"
```
