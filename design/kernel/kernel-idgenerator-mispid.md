# MISPID Generator

#### Background

A MISP ID can be generated for each MISP. There are configurations during the MISP ID generations such as only numeric, length, restricted numbers etc, 

#### Solution



**The key solution considerations are**


- An unique number have to be generated for each request.

- The counter have to be maintained in a persistent storage, so that when next request comes, this counter is incremented for the next generated number


**Module diagram**



![Module Diagram](_images/kernel-MISPIDGenerator.jpg)


**Class diagram**



![Class Diagram](_images/kernel-idgenerator-cd.png)


## Implementation


**kernel-idgenerator-mispid** [README](../../../kernel/kernel-idgenerator-mispid/README.md)
