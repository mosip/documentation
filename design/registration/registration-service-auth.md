
**Design - Service Integration - Authentication**

**Background:**
   In MOSIP platform there are few functionalities are exposed through services, which is consumable by client application to meet the requirement.  
   As per service security standard, before invoking of any service, the token to be passed in the request to authenticate the requester.  If token is 
   not valid or expired then client is not allowed to consume the service and rejected by the service with proper reason. If token is success then service 
   would provide the proper functional response.       


The **target users** are  

-   Registration officer  
-   Registration Supervisor  
-   Individual  

The key **requirements** are  

-   Invoke the auth relevant service to get authentication token before invoking any functional REST services.  
-   Pass the auth token along with the request while invoking the functional services.  
-   Use refresh token to refresh the auth token before getting expired.  
-   Based on the service context invoke the auth service with right user id / client id.  
      
    
**Solution:**  

1.  Write an REST service Interceptor which is invoked before invoking any web service call.  
2.  This interceptor should check whether the invoking REST service should required authentication. If yes then invoke the auth service to get the token.  
    -  Batch process : /authenticate/clientidsecretkey - invoke this url and pass the client id and client secret key from property file.  
    -  User and Pwd Context : /authenticate/useridPwd - invoke this url and pass the client user id and hashed password to get the auth token.  
    -  User and OTP : /authenticate/useridOTP - invoke this url to get the OTP validated along with the auth token.  

3. If the token is about to expire then invoke the '/authorize/refreshToken' service to get the new auth token by passing the old token id and update the same in ApplicationContext.    
4. when user clicks on 'Logoff' button then invoke the '/authorize/invalidateToken' service to invalidate the token and remove from ApplicationContext.  

   Once the token received by any one of the mode the token [auth and refresh] would be assigned to the request. 
   Before invoking the actual service call from RestTemplate component, the token would be attached.  

   RestClientAuthAdvice - Advice should be invoked before making any call to Web service through RestClientUtil. This component will check for the token 
   availability, if not available then invoke the  authentication service to get the token and attach the token in the request and also update the same 
   value in the ApplicationContext. Hence further request will uses the value from ApplicationContext.  

    
**Class and Sequence Diagram:**  

![Service Auth Class Diagram](_images/service_auth_class_sequence_diagram.png)  

