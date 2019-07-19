# TokenID Generator

#### Background

A Token ID can be requested by an Indivudual against his UIN. A library should be able to generate an unique ID and assign it against a UIN. When a request comes to retrieve a Token ID agains UIN, the system should return a mapping, if already exists. Otherwise, a mapping should be created and returned.  

#### Solution



**The key solution considerations are**


- The API will generate a unique number against the configurations. 

- The configurations are injected by the caller of the module. These configurations are defined in the config server. 


**Module diagram**



![Module Diagram](_images/kernel-idgenerator-tokenid.jpg)

** ID Generator Algotithm **

 [ID Generator Algotithm](kernel-id-generators-algorithm.md)




**Class diagram**



![Class Diagram](_images/kernel-idgenerator-cd.png)

## Implementation


**kernel-tokenidgenerator** [README](../../../kernel/kernel-idgenerator-tokenid/README.md)
