# PIN Validator

**Background**

This library can be used to validate PIN based on configured business rules.


**Solution**


**The key solution considerations are**


- Create an interface for PINValidator having required method declaration to validate PIN, which will be exposed to the other applications.


- Create a project which implements PINValidator for PIN validation based on configured business rules.


- PINValidator can be used in any MOSIP module to validate PIN after adding Its implementation to their class path.



**Class Diagram**



![Class Diagram](_images/kernel-pinvalidator-cd.png)




## Implementation


**kernel-pinvalidator** [README](../../../kernel/kernel-pinvalidator/README.md)