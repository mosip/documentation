# RID Generator

#### Background

The Registration client module needs to generate a RID and assign it to an individual during the Registration process. The Registration client can go in offline mode also. 

#### Solution



**The key solution considerations are**


- There cannot be any duplicate numbers generated.


- The registration client should be able to generate a unique number even if the Registration client goes to offline mode. 


- The configurations of the RID is injected to the RID generator module. 


- The RID generator is included in the Registration client module as Java Jar file. 

- The Registration client application can go offline sometimes. During this time, the properties have to be injected to the RID generator. 

- When the Registration client comes online, all the configurations will be synced and downloaded to the client machine. 



**Module diagram**




![Module Diagram](_images/kernel-idgenerator-rid.jpg)


**Class diagram**



![Class Diagram](_images/kernel-idgenerator-cd.png)


## Implementation


**kernel-ridgenerator** [README](../../../kernel/kernel-idgenerator-rid/README.md)
