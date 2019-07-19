# Registration center ID Generator

#### Background

A center ID can be generated for various centers in the MOSIP platform. Once a unique number is generated, this Center ID is assigned against a Registration Center. 

#### Solution



**The key solution considerations are**


- An unique number have to be generated for each request.

- The various configurations such as the starting number, incremental value, restricted numbers etc., are retrieved from the config server and injected to the library. 


**Module diagram**



![Module Diagram](_images/kernel-idgenerator-regcenterid.jpg)


**Class diagram**



![Class Diagram](_images/kernel-idgenerator-cd.png)


## Implementation


**kernel-idgenerator-regcenterid** [README](../../../kernel/kernel-idgenerator-regcenterid/README.md)
