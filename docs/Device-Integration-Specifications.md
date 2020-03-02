
This document detailed out the design approach to integrate with the list of devices used in the MOSIP platform.

Interface approach has been taken to implement the integration with external devices.  
The interface should have the required method to communicate with the external devices.  
An Abstract class has been defined to implement the common functionality and it should be extended by Vendor specific implementation class.
The device vendor's specific implementation class should extend the Abstract class and implement the required methods using available libraries. 

## Devices:
1. Scanner
2. Printer
3. GPS

### Scanner: 
***

**Interface: IMosipDocumentScannerService**  
   1. public Boolean isConnected()  -  to check the scanner connection availability.
   
   2. public BufferedImage scan() -   to scan the document from the scanner device.  

**Abstract Class: DocumentScannerService**  
1. public byte[] asPDF(List<BufferedImage> bufferedImages) -  to convert the captured scanned document files into pdf format.  

2. public byte[] asImage(List<BufferedImage> bufferedImages) -  to convert the captured scanned document files into image format.  

3. public byte[] getImageBytesFromBufferedImage(BufferedImage bufferedImage) - to get the byte[] from BuffredImage object.  

4. public List<BufferedImage>  pdfToImages(byte[] pdfBytes) - to convert the pdf document to image format in order to show in the document preview.  

### Printer:
***
 Use the JavaFx provided print functionality to interact with printer directly from UI layer. No additional interface is required. 
 javafx.scene.web.WebView.getEngine().print(PrinterJob)

### GPS:  
***

**Interface:IMosipGPSService**   
1. public String getComPortGPSData (String comPortNo, int portReadWaitTime) - it returns GPS signal in standard format.

**Abstract Class:IMosipGPSServiceImpl**    
1. public GPSPosition sigalParser(String line)
Inputs: gps signal (Ex: $GPRMC,055218.000,A,1259.4845,N,08014.7602,E,0.07,120.70,171018,,,A*64)
   - returns the latitude and longitude from the GPS signal. 

