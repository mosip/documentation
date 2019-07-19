# Kernel Utils

#### Background

Kernel utils can have common utilities methods to be reused across MOSIP platform. 
There are several static classes and methods as below:

- StringsUtills

- FileUtils

- DateUtils

- CryptoUtils

- CalanderUtils

- ZipUtils

- JsonUtils

- HMACUtils

- UUIDUtils 


[API Documentation]

```
mvn javadoc:javadoc
```


#### Solution


**The key solution considerations are**

- All utilities classes can be part of kernel.core package and can be imported throughout platform.  Apache and Jackson library can be used if required.


**Class Diagram**


![Class Diagram](_images/kernel-utils-cd.png)


