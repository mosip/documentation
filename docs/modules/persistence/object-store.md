# Object Store

## Overview

Object Store is a storage module for MOSIP named as [Khazana](https://github.com/mosip/khazana). The module is an abstraction of storage layer used across [Registration Client](https://github.com/mosip/registration-client), [Packet Manager](https://github.com/mosip/packet-manager), [Datashare or Durian](https://github.com/mosip/durian) for packets and biometric data.

Khazana provides following adapters to store objects

1. POSIX - Supports storage of packets on a filesystem. Its typically used by registration client to store packets locally on the machine. This adapter is not receommended for usage in low latency environments like packet manager. 
2. S3 - [S3](https://docs.aws.amazon.com/AmazonS3/latest/API/Welcome.html) is one of the well known  API for object stores. [AWS Java S3 Client](https://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/AmazonS3.html) is used in Khazana to support any S3 compliant object storage solutions. 
3. Swift - An object storage system from [Openstack](https://docs.openstack.org/swift/latest/getting_started.html). Swift has published API's and Khazana supports the same on experimental basis using [JOSS SDK](https://joss.javaswift.org/). This works with any Swift or Swift compliant object storage solutions.

Object Store is used for following purpose wihin mosip

1. Registration Client - Encrypted packets
2. Pre-registration - Uploaded Documents
3. Idrepo - Individual's biometrics and documents
4. Datashare - On demand individual's biometrics, documents and other information. 

As part of our sandbox deployment we have provided an example use case with [minio](https://www.minio.io) for on-prem deployment and AWS S3 with AWS deployment. Object Store is installed as part of [default sandbox deployment](https://github.com/mosip/mosip-infra/tree/release-1.2.0/deployment/v3/external/object\_store).

__Note:__ Please note its important to choose the right partner for object storage and work with them to scale acordingly. Please follow the hardware estimate for Object Store based on respective Object store products. 

The below is the list of S3 Java API's used by MOSIP. This can be used to understand the vendor compatibility. Khazana does not use any internal business logic and is purely an storage abstraction layer.

| Java API Used by MOSIP| S3 Documentation URL |
|:----|:----|
|getConnection(bucketName).getObject(bucketName, finalObjectName)|[public S3Object getObject(String bucketName, String key)](https://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/AmazonS3Client.html#getObject-java.lang.String-java.lang.String-)|
|getConnection(bucketName).getObjectMetadata(bucketName, finalObjectName)|[public ObjectMetadata getObjectMetadata(String bucketName, String key)](https://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/AmazonS3Client.html#getObjectMetadata-java.lang.String-java.lang.String-)|
|doesBucketExistV2(bucketName)|[public boolean doesBucketExistV2(String bucketName)](https://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/AmazonS3Client.html#doesBucketExistV2-java.lang.String-)|
|createBucket(bucketName)|[public Bucket createBucket(String bucketName)](https://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/AmazonS3Client.html#createBucket-java.lang.String-)|
|getObjectMetadata()|[public ObjectMetadata getObjectMetadata()](https://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/model/S3Object.html#getObjectMetadata--)|
|getObjectMetadata().getUserMetadata()|[public Map<String,String> getUserMetadata()](https://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/model/ObjectMetadata.html#getUserMetadata--)|
|addUserMetadata(m.getKey(), m.getValue())|[public void addUserMetadata(String key, String value)](https://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/model/ObjectMetadata.html#addUserMetadata-java.lang.String-java.lang.String-)|
|PutObjectRequest(bucketName, finalObjectName, s3Object.getObjectContent(), objectMetadata)|[public PutObjectRequest(String bucketName, String key, InputStream input, ObjectMetadata metadata)](https://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/model/PutObjectRequest.html#PutObjectRequest-java.lang.String-java.lang.String-java.io.InputStream-com.amazonaws.services.s3.model.ObjectMetadata-)|
|getRequestClientOptions()|[public RequestClientOptions getRequestClientOptions()](https://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/AmazonWebServiceRequest.html#getRequestClientOptions-)|
|setReadLimit(readlimit)|[public final void setReadLimit(int readLimit)](https://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/RequestClientOptions.html#setReadLimit-int-)|
|putObject(putObjectRequest)|[public PutObjectResult putObject(PutObjectRequest putObjectRequest)](https://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/AmazonS3Client.html#putObject-com.amazonaws.services.s3.model.PutObjectRequest-)|
|deleteObject(bucketName, objectName)|[public void deleteObject(String bucketName, String key)](https://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/AmazonS3Client.html#deleteObject-java.lang.String-java.lang.String-)|
|listObjects(account, searchPattern)|[public ObjectListing listObjects(String bucketName, String prefix)](https://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/AmazonS3Client.html#listObjects-java.lang.String-java.lang.String-)|
|getObjectSummaries()|[public List<S3ObjectSummary> getObjectSummaries()](https://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/model/ObjectListing.html#getObjectSummaries--)|
|listObjects(searchPattern)|[public ObjectListing listObjects(String bucketName)](https://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/AmazonS3.html#listObjects-java.lang.String-)|
|getObjectSummaries()|[public List<S3ObjectSummary> getObjectSummaries()](https://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/model/ObjectListing.html#getObjectSummaries--)|
|doesObjectExist(bucketName, finalObjectName)|[boolean doesObjectExist(String bucketName, String objectName)](https://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/AmazonS3.html#doesObjectExist-java.lang.String-java.lang.String-)|
|GetObjectTaggingRequest(bucketName,finalObjectName)|[public GetObjectTaggingRequest(String bucketName, String key)](https://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/model/GetObjectTaggingRequest.html#GetObjectTaggingRequest-java.lang.String-java.lang.String-)|
|getObjectTagging(getObjectTaggingRequest)|[GetObjectTaggingResult getObjectTagging(GetObjectTaggingRequest getObjectTaggingRequest)](https://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/AmazonS3.html#getObjectTagging-com.amazonaws.services.s3.model.GetObjectTaggingRequest-)|
|SetObjectTaggingRequest(bucketName,finalObjectName,objectTagging)|[public SetObjectTaggingRequest(String bucketName, String key, ObjectTagging tagging)](https://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/model/SetObjectTaggingRequest.html#SetObjectTaggingRequest-java.lang.String-java.lang.String-com.amazonaws.services.s3.model.ObjectTagging-)|
|setObjectTagging(setObjectTaggingRequest)|[SetObjectTaggingResult setObjectTagging(SetObjectTaggingRequest setObjectTaggingRequest)](https://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/AmazonS3.html#setObjectTagging-com.amazonaws.services.s3.model.SetObjectTaggingRequest-)|
