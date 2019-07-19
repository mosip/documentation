# UUID Generator

#### Background

"Universally Unique Identifier(UUID)" is used in multiple places in the MOSIP platform such as to identify an unique transaction or to have it as the ID field. MOSIP platform uses the UUID Version 5. The UUID includes the namespace name-based. 

#### Solution



**The key solution considerations are**


- The UUID generated have to be unique for multiple requests, even if the requests arises at the same time.  

- The length of the generated UUID is limited to 36 characters. 

- In its canonical textual representation, the sixteen octets of a UUID are represented as 32 hexadecimal (base 16) digits, displayed in five groups separated by hyphens, in the form 8-4-4-4-12 for a total of 36 characters (32 alphanumeric characters and four hyphens). 

For example:

	123e4567-e89b-12d3-a456-426655440000
	
	xxxxxxxx-xxxx-Mxxx-Nxxx-xxxxxxxxxxxx
	
The four bits of digit M indicate the UUID version, and the one to three most significant bits of digit N indicate the UUID variant. In the example, M is 1 and N is a(10xx), meaning that the UUID is a variant 1, version 1 UUID; that is, a time-based DCE/RFC 4122 UUID.

- The UUID generator is provided as a utility jar file. The caller have to included this jar file in the classpath to make use of this utility. 


