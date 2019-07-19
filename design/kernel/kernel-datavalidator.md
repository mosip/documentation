# Data Validator

**Background**

This library can be used to validate several data such as Email,Phone etc based on configured business rules.


**Solution**



**The key solution considerations are**


- Create an interface for DataValidator having required method declaration to validate data, which will be exposed to the other applications.


- Create a project which implements DataValidator for different types of data  based on configured business rules.


- DataValidator can be used in any MOSIP module to validate data after adding DataValidator implementation to their class path.



**Class Diagram**



![Class Diagram](_images/kernel-datavalidator-cd.png)


** Validation Flow**

![Flow Chart](_images/kernel-datavalidator-fc.png)




## Implementation


**kernel-datavalidator** [README](../../../kernel/kernel-datavalidator/README.md)