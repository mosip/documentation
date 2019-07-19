**Approach to integrate with Image Scanner in Windows OS**

This document provides the detail about configuring of Image capturing service in 
Windows 10 that will be used to integrate from Registration client application. 
 

There are three different set of services / libraries has been analyzed.
1.	Twain - Not working in Windows 10 64 bit.  
2.	WIA  - Working in Windows 10.  
3.	SANE – It works only in Linux version. Not in Windows.  

**Twain:**  
	- http://thorntonzone.com/manuals/Compression/Fax,%20IBM%20MMR/MMSC/mmsc/uk/co/mmscomputing/application/imageviewer/index.html  
	- Downloaded the jar from this location and configured required Twain based Device manager and Data Source to capture the image.  
	- Unable to integrate with scanner and couldn't capture any output from scanner. It looks like Windows 10 doesn’t support Twain 64 bit libraries.  



**WIA – Windows Image Acquisition:**  
	Able to integrate with the SCanner using the Com4j wrapper classes, which is generated out of dll files.
	But We couldn’t find any direct open source libraries to use this service to capture the image.    
        Used the **com4j open source library** to communicate with wiaaut.dll files through the respective wrapper classes.  
	https://com4j.kohsuke.org/runtime-semantics.html  
  
	As windows by default providing this [WIA] service to communicate with the scanner, we have chosen the respective wiaaut.dll libraries to create the Java libraries.  
	From application we can invoke the com4j generated factory class from WIA package to communicate with Scanner device.
	           ICommonDialog wiaObj = ClassFactory.createCommonDialog(); 
	           
	           wiaObj.showAcquireImage(WiaDeviceType.ScannerDeviceType, WiaImageIntent.ColorIntent, WiaImageBias.MaximizeQuality, "", false, false, false);


**WIA Service:**
 	![WIA Service diagram](_images/wia_diagram.jpg)

**Command to create the Com4j Wrapper class from dll file :**
java -jar tlbimp.jar -o wia -p wia %WINDIR%\system32\wiaaut.dll

https://windows10dll.nirsoft.net/wiaaut_dll.html - entire wrapper classes and the respective interface is available here.


**If No Scanner found then get the below error:**
https://docs.microsoft.com/en-us/windows/desktop/wia/-wia-error-codes
WIA_S_NO_DEVICE_AVAILABLE	No scanner device was found. Make sure the device is online, connected to the PC, and has the correct driver installed on the PC.	0x80210015


**com4j.ComException: 80210015 (Unknown error) : .\invoke.cpp:517**
       at com4j.Wrapper.invoke(Wrapper.java:166)
       at com.sun.proxy.$Proxy4.showAcquireImage(Unknown Source)
       at com.TestScanner.WIAScannerTest(TestScanner.java:87)
       at com.TestScanner.main(TestScanner.java:37)

