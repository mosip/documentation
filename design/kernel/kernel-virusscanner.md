# Virus Scanner

#### Background

This library can be used to scan files and folders for virus. It contains two methods for virus scanning separately for file and folder .


#### Solution



**The key solution considerations are**


- Create an interface for VirusScanner having required method declaration, which will be exposed to the other applications.


- Create a project which implements VirusScanner based on Capybara Clamav API.


- Virus scanner can be used in any MOSIP module for virus scanning after adding VirusScanner implementation to their class path



** Class Diagram**



![Class Diagram](_images/kernel-virusscanner-cd.png)


## Implementation


**kernel-virusscanner-clamav** [README](../../../kernel/kernel-virusscanner-clamav/README.md)