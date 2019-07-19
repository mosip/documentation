# UIN Generator

#### Background

The Registration processor module needs to generate a UIN and assign it to an individual during the end of the process. The UIN Generator micro service responds back with an unique number whenever requested. 

#### Solution



**The key solution considerations are**


- Create a project which implements UIN generator based on configured policy and provides REST service to fetch unused UIN.


- Service can have a pool of UINs based on configured pool size and a asynchronous check on fetch request for unused UIN threshold to generate pool.   


- REST service can be used by any MOSIP module to fetch UIN through HTTP client.


Uin generator functionality is to generate, store and provide uins.

Rules of UIN generation:
1. The number should not contain any alphanumeric characters
2. The number should not contain any repeating numbers for configured repeating limit or more than that.
3. The number should not contain any sequential number for configured sequence limit or more than that.
4. The numbers should not be generated sequentially
5. The number should not have repeated block of numbers for for configured repeating block limit or more than that.
6. The number should not contain the restricted numbers defined by the ADMIN
7. The last digit in the number should be reserved for a checksum
8. The number should not contain '0' or '1' as the first digit
9. First configured no. (5) digits should be different from the last no. (5) digits (E.g. 4345643456)
10. First configured (5) digits should be different to the last configured no. (5) digits reversed (E.g. 4345665434)
11. UIN should not be an ascending or descending cyclic figure (E.g. 4567890123, 6543210987)
12. UIN should be different from the repetition of the first two digits configured no. (5) times (E.g. 3434343434)
13. UIN should not contain configured no. (3) even adjacent digits (E.g. 3948613752)
14. UIN should not contain ADMIN defined restricted number


 [kernel-uin-ack-service.md](kernel-uin-ack-service.md)

- Request for GET **/uin**


Response :

HttpStatus: 200 OK
  
```
{
    "uin": "6127460851"
}
```


**Module diagram**



![Module Diagram](_images/kernel-uingenerator.png)



**Class Diagram**

![CD](_images/kernel-uingenerator-cd.png)



**ERD**

![ERD](_images/kernel-uingenerator-erd.png)


## Implementation


**kernel-uingenerator-service** [README](../../../kernel/kernel-uingenerator-service/README.md)
