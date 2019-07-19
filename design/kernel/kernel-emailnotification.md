# Email Notification Service

#### Background

This service can be used to send email through configured SMTP server. Service has REST API exposed to send messages and attachments through Email. 


#### Solution


**The key solution considerations are**


- Create a project which provides REST service to send email.


- REST service can be used by any MOSIP module to send email through HTTP client.


- Request body model for POST **/notifier/email**

(curl sample)

```
-H "Content-Type: multipart/form-data" 
-F "attachments={}" 
-F "mailCc=user1@gmail.com" 
-F "mailContent=OTP for Auth" 
-F "mailSubject=OTP" 
-F "mailTo=admin1@gmail.com"
```



- Response body model for POST **/notifier/email**

HttpStatus: 202 Accepted


```
{
  "status": "Email Request submitted"
}
```

**Class Diagram**



![Class Diagram](_images/kernel-emailnotification-cd.png)




## Implementation


**kernel-emailnotification-service** [README](../../../kernel/kernel-emailnotification-service/README.md)
