# Updatedby and Createdby in webservices

#### Background

There are many webservices in MOSIP platform. All the webservices have the authentication part defined for the services. So, when a request comes to the webservice, the webservice takes the AuthToken in the request. If the AuthToken is not there in the request, the request is rejected right away. If the AuthToken is available, the userID field from the User claim is taken. Then this userID field is inserted into the database column. This userID in the database has no relation or constraint with any other DB table. This userID is the primary field in the IAM. 

#### Solution



**The key solution considerations are**


- The incoming requests should be screened for the AuthToken. If the AuthToken is not available, the request is rejected. Basically, all the incoming requests to the webservices should be filtered for Authentication and Authorization. 


- The userID have to be taken from the User claim in the AuthToken. The token should be sent to the AuthServer for validity and the user claim. 


- If the request is for Create request, the Createdby DB column data is placed by the userID.

- If the request is for the Update request, the Updatedby DB column data is placed by the userID. 

- If the request is for the Delete request, the Updatedby DB column data is placed by the userID. Note: We don't have hard delete in the MOSIP system. So, in case of soft delete, the Updatedby DB column is updated. 



**Module diagram**



![Module Diagram](_images/UpdatedbyCreatedby.jpg)

