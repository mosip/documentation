#  Attaching documents to an application

## Document categories and applicable document types 
* When a user provides their demographic data, the pre-registration system captures the data. 
* Based on the parameters (from the configuration) for example - gender, age, and residential status (Foreigner, National) from the demographic data, applicant types are determined. The pre-registration system then sends the id to the mapping.
* Based on the applicant type, the applicable document categories are received from the mapping. The pre-registration system then displays only applicable categories.
* The document category and type of documents in each category to be uploaded varies based on the applicant type. pre-registration system displays only those types to the applicant.
* Once the documents are uploaded by the applicant the system performs a virus scan to check the integrity of the document. Once the virus scan is successful, the document is encrypted and stored in the object-store.

## Referring to already uploaded documents
* The POA (Proof of Address) document could be uploaded or can be referred to an already uploaded POA of an existing applicant
* The user could select a particular applicant document to which he wants to refer 
* When Pre-registering for a family living at the same address it is not required to upload the same POA again and again, instead could refer to the document as uploaded by the first family member saving space and time.

{% hint style="info" %}

* For details on the low level design please follow the page,
    * [Approach to pre-registration document service](https://github.com/mosip/pre-registration/blob/1.1.5/design/pre-registration/pre-registration-document-service.md)
* For details on the API specification on pre-registration document upload follow this [page](Pre-Registration-APIs.md#document-service-public)

{% endhint %}