# ID generation algorithm

#### Background

There are many ID generators inside MOSIP. To generate the ID, Secured Random generators are used. When multiple concurrent requests are there to generate the ID generator, there can be a performance issue. So, an algorithm have to be defined to accomodate the concurrent ID generate requests. 

#### Solution



**The key solution considerations are**


- Performance is the key thing during the ID generation. 

- Generate a single secure random number and keep that securely. 

- Have an incremental counter value, which is also a Secure Random number. Save this it to the datbaase. 

- Whenever a new request for the ID generation gets received, increment the counter and use that as a key to the AES algorithm and encrypt the initial secure random number


- Convert the Hash to the number and provide this as the ID. 


**Module diagram**



![Module Diagram](_images/kernel-id-generators-algorithm.jpg)

