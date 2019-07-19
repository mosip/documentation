# Acknowledgement of UIN assignment

#### Background

There is a pool of UIN in the database. Whenever the Registration processor module requests for an UIN from this pool, the status have to reflect whether it have been UNUSED or ISSUED or ASSIGNED. Let's say the initial status is UNUSED. If the UIN is responded back the caller, the system doesn't knows whether the UIN had been actually used. Due to some exception in the caller, the UIN might not been actually assigned to anybody. 

#### Solution



**The key solution considerations are**


- When the UIN got generated and kept in the pool, the UNUSED status is assigned. 

- As soon as you respond with the UIN to any request call, the status of the UIN is updated as ISSUED. 

- This new service is to receive the acknowledgement from the caller. When the confirmation is received, the status of the UIN in the pool database is changed to ASSIGNED. 


**Module diagram**



![Module Diagram](_images/kernel-uin-ack-service.jpg)

