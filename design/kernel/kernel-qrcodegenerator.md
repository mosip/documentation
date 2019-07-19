# QR Code Generator

#### Background

This library can be used to encode data to QR Code. It contains a method to convert String to QR byte code based on version specified.


#### Solution


**The key solution considerations are**


- Create an interface QrCodeGenerator having required method declaration to generate QR bar Code, which will be exposed to the other applications.


- Create a project which implements QrCodeGenerator from provided template based on iText API.


- QR Code generator can be used in any MOSIP module to generate code after adding its implementation to their class path.



**Class Diagram**


![Class Diagram](_images/kernel-qrcodegenerator-cd.png)


## Implementation


**kernel-qrcodegenerator-zxing** [README](../../../kernel/kernel-qrcodegenerator-zxing/README.md)