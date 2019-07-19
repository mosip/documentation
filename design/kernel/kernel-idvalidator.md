# ID Validator

#### Background

This library can be used to validate several IDs such as UIN,VID,PRID,TSPId etc based on configured business rules.


#### Solution



**The key solution considerations are**


- Create an interface for IDValidator having required method declaration to validate ID, which will be exposed to the other applications.


- Create a project which implements IDValidator for different types of IDs  based on configured business rules.


- IDValidator can be used in any MOSIP module to validate ID after adding IDValidator implementation to their class path.



**Class Diagram**



![Class Diagram](_images/kernel-idvalidator-cd.png)


** Validation Flow**

![Flow Chart](_images/kernel-idvalidator-fc.png)



## Implementation


**kernel-idvalidator** [README](../../../kernel/kernel-idvalidator/README.md)