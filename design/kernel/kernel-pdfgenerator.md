# PDF Generator

#### Background

This application can be used converting plain/html template to PDF. It contains several methods that accept content as:

- Input Stream


- File


- String


#### Solution



**The key solution considerations are**


- Create an interface PDFGenerator having required method declaration to generate PDF document, which will be exposed to the other applications.


- Create a project which implements PDFGenerator from provided template based on iText API.


- PDF generator can be used in any MOSIP module to generate pdf after adding PDFGrenerate implementation to their class path.



**Class Diagram**


![Class Diagram](_images/kernel-pdfgenerator-cd.png)


## Implementation


**kernel-pdfgenerator-itext** [README](../../../kernel/kernel-pdfgenerator-itext/README.md)