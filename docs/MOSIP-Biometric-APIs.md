

MOSIP uses biometrics in Registration and ID Authentication modules. This wiki page defines Biometric API interface which provides functional support for processing biometrics. 
A Device Provider can provide implementation for the methods present in Biometric API interface, packaged in the form of a ***jar*** file. 

Below are the methods that Biometric API interface exposes -     

**1.  Quality Checker -** This method checks the quality of input biometrics and returns quality score for the same.     
***Method Signature -***     
`QualityScore _checkQuality_(BIR sample, KeyValuePair[] flags) throws BiometricException`


**2.  Matcher -** This method matches captures a biometric record, matches it against list of stored biometric records and provides a matching score against each stored biometric record.      
***Method Signature -***    
`Score[] _match_(BIR sample, BIR[] gallery, KeyValuePair[] flags) throws BiometricException`


**3.  Composite Matcher -** This method matches captures list of  biometric records, and matches them against list of stored biometric records. It then returns a composite matching score for the list of input biometric records.     
***Method Signature -***     
`CompositeScore _compositeMatch_(BIR[] sampleList, BIR[] recordList, KeyValuePair[] flags) throws BiometricException`


**4.  Extractor -** This method extracts salient features and patterns of input biometric record to use in fast comparison. It returns the extracted biometric record.     
***Method Signature -***     
`BIR _extractTemplate_(BIR sample, KeyValuePair[] flags) throws BiometricException`


**5.  Segmenter -** This method segments single biometric record into multiple biometric records and returns list of segmented biometric records. Eg: Split thumb slab into multiple fingers.     
***Method Signature -***     
`BIR[] _segment_(BIR sample, KeyValuePair[] flags) throws BiometricException`
