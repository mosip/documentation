# Template Manager:

## Background

Applications generate automatic emails for account signup, password reminders or automatically sent reports and notification. Using template engine, the email and notification template can be stored in a text file rather than directly embedded in your Java code, it will separate the representation and data

**Template engine consist of at least these primary elements:**

* An associated **data model**.


* One or more **source templates**.


* A processor or **template engine**.


* Generated output in the form of **processed template**.



## Solution:

**The key solution considerations are**


- Create an interface TemplateManager having required method declaration to parse/merge the template, which will be exposed to the other applications.


- Create a project which implements TemplateManager from provided template based on template engine like velocity template engine or freemarker template processor.


- TemplateManager can be used in any MOSIP module to process template after adding its implementation to their class path.


- Configure the template and data which you can pass to template manager.




**Class Diagram:**



![kernel_templatemanager_classdiagram](_images/kernel-templatemanager-cd.png)




## Implementation


**kernel-templatemanager-velocity** [README](../../../kernel/kernel-templatemanager-velocity/README.md)
