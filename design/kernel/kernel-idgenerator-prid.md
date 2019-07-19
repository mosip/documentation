# PRID Generator

#### Background

The Pre-registration application needs to display an acknowledgement number when somebody pre-registers for an enrolment.  

#### Solution



**The key solution considerations are**


- Generate an Id numeric id of configured length and policy. 


- The configurations of the PRID is injected to the PRID generator module by the Pre-Registration module. 


- The PRID generator is included in the Pre-Registration client module as Java Jar file. 



**Module diagram**



![Module Diagram](_images/Kernel-idgenerator-prid.jpg)

** ID Generator Algotithm **

 [ID Generator Algotithm](kernel-id-generators-algorithm.md)


**Class diagram**



![Class Diagram](_images/kernel-idgenerator-cd.png)

## Implementation


**kernel-pridgenerator** [README](../../../kernel/kernel-idgenerator-prid/README.md)
