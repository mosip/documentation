# Overview
This security testing report contains all the security bugs that were found in the various mosip modules .This is a combination of both web-application related security and API related security testing.

# Timeline
This report is presented for the 1.2.0 release also called the LTS release.

# Setup detail
For testing the modules we have used state of the art Security testing tools such as Burpsuite Professional, wasp ZED attack proxy, wireguard and many other linux tools.

# Web application details
In MOSIP we have three modules that function partially as web-applications namely Preregistration, Administration and Partner-management-Portal. All three have been tested thoroughly. 

# API Details
We have a few other modules that are not directly user interfaced and use APIs for internal function . https://mosip.github.io/documentation/1.2.0/1.2.0.html

# Summary of the findings by Severity

**Web Security Vulnerability Snapshot**

|Severity|Count|
| :- | :-: |
|High|0|
|Medium|18|
|Low|8|
|Information|0|
|TOTAL|26|

# Detailed Findings


|ID |Category|Status|Severity|Risk|
| :- | :- | :- | :- | :- |
|Test:1|Test|fixed|Medium|Low|

|Description|<p>  </p><p>Attacker can steal JWT cookie from the browser (Steal Personal information)</p><p>1. Install cookie manager plugin in any browser.<br>2. Login into the application and click cookie manager.<br>3. Select JWT for current page.<br>4. Copy the JWT and go to jwt.io web site decrypt the JWT.                                                                                                                                                                          5. Check if any sensitive information is disclosed as this is only base64  encoded </p><p></p>|
| :- | :- |
|Risk Assessment|<p>A lot of Authentication and Authorization in mosip is handled by JWT tokens.</p><p>If any Personal Data comes out in the token, It is a Data Breach</p>|
|Fix Recommendation|No PII data Should be provided in the token itself.|

API Security


|ID |Category|Status|Severity|Risk|
| :- | :- | :- | :- | :- |
|Test:2|Test|Fixed|Medium|Low|

|Description|<p>Attacker can steal JWT cookie from the browser (Crack the JWT secret key)</p><p>1. Get the JWT token.<br>2. Run the automated tool to crack the JWT and check if you can break the security key if it is a weak security key.</p><p></p>|
| :- | :- |
|Risk Assessment|<p>A lot of Authentication and Authorization in mosip is handled by JWT tokens.</p><p>If  a token is broken, the secret key is revealed already as well as other important data.</p>|
|Fix Recommendation|A very Strong and Random secret key must be used and must be changed at regular interval as well.|



|ID|Category|Status|Severity|Risk|
| :- | :- | :- | :- | :- |
|Test:3|Test|fixed|Low|Low|

|Description|<p>Session not getting invalidated after logout.</p><p></p>|
| :- | :- |
|Risk Assessment|If a session does not get invalidated after logout, then the chances of some attacker using it to take over the session is high.|
|Fix Recommendation|.The Session must be invalidated as soon as the user logs out. And the Token provided should not allow access.|


|ID|Category|Status|Severity|Risk|
| :- | :- | :- | :- | :- |
|Test:4|Test|fixed|Medium|Medium|

|Description|<p>Attacker can bypass the authentication using SQL injection or LDAP injection. Sometimes due to insufficient data sanitation and testing attackers are able to break in. This is a high severity risk.</p><p></p>|
| :- | :- |
|Risk Assessment|If the attacker is able to bypass authentication, then a lot of other vulnerabilities are exploitable to him as a legitimate user, which is not desirable.|
|Fix Recommendation|In our modules, we don’t use username and password externally, hence this is inapplicable.|




|ID|Category|Status|Severity|Risk|
| :- | :- | :- | :- | :- |
|Test:5|Test|Known issue, not a vulnerability.|Low|Low|

|Description|<p>An attacker can monitor the request and response and change the request  parameters.</p><p>If an attacker uses certain proxy tools, he/she will be able to monitor the requests and responses of certain users in the network.</p><p></p>|
| :- | :- |
|Risk Assessment|It allows the PII data of an individual to be leaked. It can also lead to generation of faulty data and incomplete profiles |
|Fix Recommendation|Most of the data should be sent in an encrypted manner.|


|ID|Category|Status|Severity|Risk|
| :- | :- | :- | :- | :- |
|Test:6|Test|Known issue, not a vulnerability.|Medium|Low|

|Description|An attacker can overload the system by sending thousands of requests.|
| :- | :- |
|Risk Assessment|<p>A denial of service attack can take place if an attacker uses a tool to send thousands of requests each minute, which may cause server to crash or be inefficient.</p><p></p>|
|Fix Recommendation|There should be a limit on number of times an user can send a request ,and there must be blacklisting method for disabling users who are sending too many requests.|



|ID|Category|Status|Severity|Risk|
| :- | :- | :- | :- | :- |
|Test:7|Test|Known issue, not a vulnerability.|low|low|

|Description|<p>An attacker can try a dictionary attack or a brute force method to get the userId and password.</p><p></p>|
| :- | :- |
|Risk Assessment|With a sophisticated tool an attacker can try to brute force through the initial login page. If he is successful, He will be able to further attack all the available options that an admin has.|
|Fix Recommendation|The passwords have to be strong and authentication should not allow numerous attempts.|




|ID|Category|Status|Severity|Risk|
| :- | :- | :- | :- | :- |
|Test:8|Test|Fixed|Medium|Medium|

|Description|<p>An attacker can put XSS scripts that will be executed on victims browser.</p><p></p>|
| :- | :- |
|Risk Assessment|<p>If an attacker gets through admin login, he will be able to use malicious  scripts through the UI and can take over the server.</p><p></p>|
|Fix Recommendation|<p>All inputs by user’s should be considered as potentially dangerous and must pass through sanity. It should always be treated as text and not scripts.</p><p>In mosip we use anti-xss configuration as well</p><p></p>|






|ID|Category|Status|Severity|Risk|
| :- | :- | :- | :- | :- |
|Test:9|Test|Fixed|Medium|Medium|

|Description|An attacker can try Malicious file uploads.|
| :- | :- |
|Risk Assessment|<p>Malicious file upload can be a considered one of the high risk attacks.</p><p>An attacker can create a malicious file with script sin the file name or scripts hidden inside the meta data of the file and the server may execute it.</p>|
|Fix Recommendation|<p>In admin portal there are two types of uploads (.CSV and .csr )</p><p>Both of these inputs are sanitized and are validated before being used by the code.</p>|


|ID|Category|Status|Severity|Risk|
| :- | :- | :- | :- | :- |
|Test:10|Test|Fixed|Medium|Medium|

|Description|Attackers can try Null Byte upload or try to change the file extension.|
| :- | :- |
|Risk Assessment|<p>If Null byte injected payloads get through and get executed, there is a good chance malicious files can be uploaded, may even lead to RCE.</p><p></p>|
|Fix Recommendation|Sanitation of every input is done thoroughly, all the filenames and extensions are whitelisted and checked before being used.|

|ID|Category|Status|Severity|Risk|
| :- | :- | :- | :- | :- |
|Test:11|Test|Fixed|low|Medium|

|Description|Attacker can try to attempt to upload oversized files to cause buffer overload.|
| :- | :- |
|Risk Assessment|<p>If buffer overload attacks are tried and are successful it can lead to server crashing and can cause issues with the day to day operation of the project.</p><p></p>|
|Fix Recommendation|In mosip,the size limit is set to 4 Megabytes, which is configurable and hence buffer overload threat is mitigated.|

|ID|Category|Status|Severity|Risk|
| :- | :- | :- | :- | :- |
|Test:12|Test|Known Issue|Low|Medium|

|Description|<p>Attackers can try different methods to expose the used server name and version.</p><p>It is otherwise known as banner grabbing.</p>|
| :- | :- |
|Risk Assessment|Banner grabbing is not a direct vulnerability however it may lead attackers to try newly exposed vulnerability of software or framework that has not been patched yet.|
|Fix Recommendation|In mosip, configurations have been changed and updated so that these values are not accessible to external users. The patches are also updated regularly.|

|ID|Category|Status|Severity|Risk|
| :- | :- | :- | :- | :- |
|Test:13|Test|Known Issue|Medium|Medium|

|Description|Attackers can try path traversal/Directory Traversal attacks.|
| :- | :- |
|Risk Assessment|If path traversal is allowed the attacker will try to find any important files through adding ../../ to the url in the request. |
|Fix Recommendation|<p>In Mosip path traversal is not allowed and all files are secured robustly.</p><p>We use server configurations to sanitize the urls.</p>|

|ID|Category|Status|Severity|Risk|
| :- | :- | :- | :- | :- |
|Test:14|Test|Fixed|Medium|Medium|

|Description|Attackers can try CSRF attacks.|
| :- | :- |
|Risk Assessment|<p>A CSRF or a Cross Site  Request Forgery is a very dangerous vulnerability .</p><p>In a CSRF attack an attacker can send a malicious link to an authentic user and if the website is susceptible to CSRF attack then it will allow the attacker to steal the token of the user and access to the server.</p>|
|Fix Recommendation|CSRF is blocked in mosip ,using anti-CSRF configurations.|

|ID|Category|Status|Severity|Risk|
| :- | :- | :- | :- | :- |
|Test:15|Test|Fixed|Medium|Medium|

|Description|` `Attackers can try CORS attacks.|
| :- | :- |
|Risk Assessment|CORS or Cross Origin Resource Sharing is equally dangerous. It allows external users to have access to resources that only intended user should have access to.|
|Fix Recommendation|CORS is also blocked in mosip using anti-CORS configurations.|

|ID|Category|Status|Severity|Risk|
| :- | :- | :- | :- | :- |
|Test:16|Test|Known Issue, Not a vulnerability.|low|Medium|

|Description|` `Attackers can try Header manipulation attacks.|
| :- | :- |
|Risk Assessment|In a Header manipulation attack an attacker changes the headers of the requests to see if it shows any values or errors in response. Without right validation these Headers can cause unwanted changes in DB and Server.|
|Fix Recommendation|In mosip, each request is whitelisted with only the one header it is required to have and manipulating header values will |

|ID:17|Category|Status|Severity|Risk|
| :- | :- | :- | :- | :- |
|Test|Test|Known Issue,not a vulerability|low|Medium|

|Description|An attacker with access to admin UI can try to upload incorrect certificates.|
| :- | :- |
|Risk Assessment|The certificates are key to establishing the trust chain among various modules in mosip .If an incorrect certificate gets through and replaces a valid one, it may cause the module to stop working all together.|
|Fix Recommendation|In mosip, we require a specific format to upload certificates and before accepting any certificate we match the public key modulus of the certificates.|

|ID|Category|Status|Severity|Risk|
| :- | :- | :- | :- | :- |
|Test:18|Test|fixed|Medium|Medium|

|Description|Attackers can try request smuggling attacks.|
| :- | :- |
|Risk Assessment|<p>Request smuggling although uncommon is still a very dangerous vulnerability.</p><p>In request smuggling we send multiple packets of data in quick succession to try and deceive the server and use the incorrect packet of data</p>|
|Fix Recommendation|In mosip,we do not allow any external header and all the input are sanitized before being used by the server.|

|ID|Category|Status|Severity|Risk|
| :- | :- | :- | :- | :- |
|Test:19|Test|fixed|Medium|Medium|

|Description|Attackers can try XXE injection attacks|
| :- | :- |
|Risk Assessment|XXE injections are used by attackers to input payloads into the logic of an XML application.|
|Fix Recommendation|The inputs are robustly sanitized before use and also special characters are not allowed in every field,to minimize risk.|

|ID|Category|Status|Severity|Risk|
| :- | :- | :- | :- | :- |
|Test:20|Test|Known issue, not a vulerability|low|Medium|

|Description|Attackers can try to spoof /change biometric data or confidential data|
| :- | :- |
|Risk Assessment|If an attacker is able to successfully spoof or change the data of a person,then he will be able to make unwanted changes in DB .|
|Fix Recommendation|In mosip each piece of data goes through multiple layers if encryption /decryption and signature validation. Hence any spoofed or changed data will be invalid.|

|ID|Category|Status|Severity|Risk|
| :- | :- | :- | :- | :- |
|Test:21|Test|Fixed|Medium|Medium|

|Description|<p>An attacker can try double host header attacks.</p><p></p>|
| :- | :- |
|Risk Assessment|The double host header or multiple header attack allows the attacker to send malicious data or website links in the headers of the request.|
|Fix Recommendation|In mosip each header value is sanitized and validated before use.|

|ID|Category|Status|Severity|Risk|
| :- | :- | :- | :- | :- |
|Test:22|Test|Fixed|Medium|Medium|

|Description|Attackers can try to use other user’s PRID to get their PII data(IDOR)|
| :- | :- |
|Risk Assessment|<p>This is an example of horizontal privilege escalation.</p><p>An attacker with a  regular user access tries to get the data of another user.</p><p></p>|
|Fix Recommendation|In mosip horizontal privilege escalation is not possible, each request is accompanied with an unique cookie which an attacker does not have.|

|ID|Category|Status|Severity|Risk|
| :- | :- | :- | :- | :- |
|Test:23|Test|Known issue, not a vulnerability.|Medium|Medium|

|Description|An attacker can try privilege escalation attacks.|
| :- | :- |
|Risk Assessment|In privilege escalation attacks an attacker already has user access and then tries to get admin access. They can try to add extra roles in tokens or use possible admin username and passwords.|
|Fix Recommendation|In mosip all roles are provided and secured by KeyCloak and each token is validated before use, hence no privilege escalation attacks are probable.|



|ID|Category|Status|Severity|Risk|
| :- | :- | :- | :- | :- |
|Test:24|Test|Fixed|Medium|Medium|

|Description|Absence of x-content –type header|
| :- | :- |
|Risk Assessment|The HTTP 'X-Content-Type-Options' response header prevents the browser from MIME-sniffing a response away from the declared content-type.|
|Fix Recommendation|In mosip X-content type header is added to configuration to mitigate the vulnerability.|


|ID|Category|Status|Severity|Risk|
| :- | :- | :- | :- | :- |
|Test:25|Test|Fixed|Medium|Medium|

|Description|Weak ciphers can be decrypted and used for data stealing|
| :- | :- |
|Risk Assessment|When the used cipher is weak ,it usually tends to fall short in front of brute-force attacks and that leads to data leakage.|
|Fix Recommendation|In MOSIP we have used hardened ciphers which are highly impossible to break even with sophisticated tools.|


|ID|Category|Status|Severity|Risk|
| :- | :- | :- | :- | :- |
|Test:26|Test|Fixed|Medium|Medium|

|Description|Without a CSP(content security Policy) a program is never very secure.|
| :- | :- |
|Risk Assessment|The primary benefit of CSP is preventing the exploitation of cross-site scripting vulnerabilities. When an application uses a strict policy, an attacker who finds an XSS bug will no longer be able to force the browser to execute malicious scripts on the page|
|Fix Recommendation|In MOSIP we have CSP set in our ngnix configurations along with many other properties to harden our server configuration.|



|ID|Category|Status|Severity|Risk|
| :- | :- | :- | :- | :- |
|Test:27|Test|Fixed|Medium|Medium|

|Description|The Preregistration Zip may cause buffer overload.|
| :- | :- |
|Risk Assessment|<p>In reg-client we have an option to import data from preregistered PRIds,which</p><p>Comes as a zip file.If the size and content of the zip file are not regulated it may lead to buffer overload among other problems.</p>|
|Fix Recommendation|<p>To mitigate this we have configure a limit of </p><p>1.size of zip file</p><p>2.maximum no of files allowed inside a zip</p><p>3.The maximum allowed ratio of files and their resultant zip files.</p>|

