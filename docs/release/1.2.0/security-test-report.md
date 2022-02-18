# Overview
This report contains all the security bugs that were identified in various MOSIP modules. This is a combination of both web application and API related security testing scenarios.

# Timeline
This report is prepared based on the security testing performed on the 1.2.0 version of MOSIP.

# Setup detail
For testing the modules we have used state of the art security testing tools such as Burpsuite Professional, owasp ZED attack proxy, wireguard and other Linux tools.

# Web application details
In MOSIP we have three modules that have web-based UI interfaces. These modules are Preregistration, Administration and Partner-management-Portal. All three have been tested thoroughly.

# API Details
All other modules in MOSIP do not have any web-based interface and these modules communicate with each other using APIs. The details of the APIs in MOSIP 1.2.0 are available [here](https://mosip.github.io/documentation/1.2.0/1.2.0.html).

# Summary of the findings by severity

**Web Security Vulnerability Snapshot**

|Severity|Count|
| :- | :-: |
|High|0|
|Medium|18|
|Low|8|
|Information|0|
|Total|26|

# Detailed Findings

## Scenario 1

| Current Status | Severity | Risk |
| :- | :- | :- |
| Fixed | Medium | Low |

| Description | An attacker can steal a JWT cookie from the browser and try to extract any personal information that is available there.<br>1. Install cookie manager plugin in any browser<br>2. Login into the application and click cookie manager<br>3. Select JWT for current page<br>4. Copy the JWT and go to jwt.io website to decode the token<br>5. Check if any sensitive information is disclosed in the token's payload as this is mostly base64 encoded |
| :- | :- |
| Risk Assessment | For authentication and authorization in MOSIP we use JWT tokens. If any PII data is shared in the token, it would be considered a data breach. |
| Fix Recommendation | No PII data should be shared in the token. |

## Scenario 2

| Current Status | Severity | Risk |
| :- | :- | :- |
| Fixed | Medium | Low |

| Description | Attacker can steal JWT cookie from the browser and crack the JWT secret key<br>1. Get the JWT token using the cookie manager plugin<br>2. Run an automated tool to crack the JWT token and check if you can break the security key if the security key is weak |
| :- | :- |
| Risk Assessment | For authentication and authorization in MOSIP we use JWT tokens. If the token is broken, the secret key can be revealed as well as other important data can be exploited. |
| Fix Recommendation | A very strong and random secret key should be used and it should be changed at regular intervals. |

## Scenario 3

|Current Status|Severity|Risk|
| :- | :- | :- |
|Fixed|Low|Low|

| Description | Session was not getting invalidated after logout |
| :- | :- |
| Risk Assessment | If a session doesn't get invalidated after calling the logout API, then the risk of any attacker taking over the session becomes high. |
| Fix Recommendation | The session must be invalidated as soon as the user calls the logout API. After the token gets invalidated, all the access for the token should be removed. |

## Scenario 4

| Current Status | Severity | Risk |
| :- | :- | :- |
| Fixed | Medium | Medium |

| Description | Attacker can bypass authentication using SQL injection or LDAP injection. Sometimes due to insufficient data sanitation and testing, attackers can break in. This has a very high security risk. |
| :- | :- |
| Risk Assessment | If an attacker bypasses authentication, then a lot of other vulnerabilities can be exploited by the attacker. |
| Fix Recommendation | In our modules, we don’t use username and password externally, hence this is inapplicable. |

## Scenario 5

| Current Status | Severity | Risk |
| :- | :- | :- |
| Known issue, not a vulnerability | Medium | Medium |

| Description | An attacker can monitor the request and response and change the request  parameters. If an attacker uses certain proxy tools, he/she will be able to monitor the requests and responses of certain users in the network. |
| :- | :- |
| Risk Assessment | It allows the PII data of an individual to be leaked. It can also lead to generation of faulty data and incomplete profiles.|
| Fix Recommendation | Most of the data should be sent in an encrypted manner. |

## Scenario 6

| Current Status | Severity | Risk |
| :- | :- | :- |
|Known issue, not a vulnerability|Medium|Low|

| Description | An attacker can overload the system by sending thousands of requests |
| :- | :- |
|Risk Assessment | A denial of service (DoS) attack can take place if an attacker uses a tool to send thousands of requests each minute, which may cause server to crash or be inefficient. |
|Fix Recommendation | There should be a limit on number of times an user can send a request, and there must be blacklisting method for disabling users who are sending too many requests. |

## Scenario 7

| Current Status | Severity | Risk |
| :- | :- | :- |
| Known issue, not a vulnerability | Low | Low |

| Description | An attacker can try a dictionary attack or a brute force method to get the userId and password. |
| :- | :- |
| Risk Assessment | With a sophisticated tool an attacker can try to brute force through the initial login page. If he is successful, He will be able to further attack all the available options that an admin has. |
| Fix Recommendation | The passwords have to be strong and authentication should not allow numerous attempts. |

## Scenario 8

| Current Status | Severity | Risk |
| :- | :- | :- |
| Fixed | Medium | Medium |

| Description | An attacker can put XSS scripts that will be executed on victims browser |
| :- | :- |
| Risk Assessment | If an attacker gets through admin login, he will be able to use malicious scripts through the UI and can take over the server. |
| Fix Recommendation | All inputs by user’s should be considered as potentially dangerous and must pass through sanity. It should always be treated as text and not scripts. In mosip we use anti-xss configuration as well. |

## Scenario 9

| Current Status | Severity | Risk |
| :- | :- | :- |
| Fixed | Medium | Medium |

| Description | An attacker can try to upload malicious files |
| :- | :- |
| Risk Assessment | Malicious file upload can be a considered one of the high risk attacks. An attacker can create a malicious file with script sin the file name or scripts hidden inside the meta data of the file and the server may execute it. |
|Fix Recommendation|In admin portal there are two types of uploads ".CSV" and ".csr". Both of these inputs are sanitized and are validated before being used by the code. |

## Scenario 10

| Current Status | Severity | Risk |
| :- | :- | :- |
| Fixed | Medium | Medium |

| Description | Attackers can try Null Byte upload or try to change the file extension. |
| :- | :- |
| Risk Assessment | If Null byte injected payloads get through and get executed, there is a good chance malicious files can be uploaded, may even lead to RCE. |
| Fix Recommendation | Sanitation of every input is done thoroughly, all the filenames and extensions are whitelisted and checked before being used. |

## Scenario 11

| Current Status | Severity | Risk |
| :- | :- | :- |
| Fixed | Low | Medium |

| Description | An attacker can try to attempt to upload oversized files to cause buffer overload. |
| :- | :- |
| Risk Assessment | If buffer overload attacks are tried and are successful it can lead to server crashing and can cause issues with the day to day operation of the project. |
| Fix Recommendation | In MOSIP,the size limit is set to 4 Megabytes, which is configurable and hence buffer overload threat is mitigated. |

## Scenario 12

| Current Status | Severity | Risk |
| :- | :- | :- |
| Known Issue | Low | Medium |

| Description | An attackers can try different methods to expose the used server name and version. It is otherwise known as banner grabbing. |
| :- | :- |
| Risk Assessment | Banner grabbing is not a direct vulnerability however it may lead attackers to try newly exposed vulnerability of software or framework that has not been patched yet. |
| Fix Recommendation | In MOSIP, configurations have been changed and updated so that these values are not accessible to external users. The patches are also updated regularly. |

## Scenario 13

| Current Status | Severity | Risk |
| :- | :- | :- |
| Known Issue | Medium | Medium |

| Description | Attackers can try path traversal/Directory Traversal attacks. |
| :- | :- |
| Risk Assessment | If path traversal is allowed the attacker will try to find any important files through adding ../../ to the url in the request. |
| Fix Recommendation | In MOSIP, path traversal is not allowed and all files are secured robustly. We use server configurations to sanitize the URLs. |

## Scenario 14

| Current Status | Severity | Risk |
| :- | :- | :- |
| Fixed | Medium | Medium |

| Description | Attackers can try CSRF attacks |
| :- | :- |
| Risk Assessment | A CSRF or a Cross Site  Request Forgery is a very dangerous vulnerability. In a CSRF attack an attacker can send a malicious link to an authentic user and if the website is susceptible to CSRF attack then it will allow the attacker to steal the token of the user and access to the server. |
| Fix Recommendation | CSRF is blocked in MOSIP, using anti-CSRF configurations. |

## Scenario 15

| Current Status | Severity | Risk |
| :- | :- | :- |
| Fixed | Medium | Medium |

| Description | Attackers can try CORS attacks |
| :- | :- |
| Risk Assessment | CORS or Cross Origin Resource Sharing is equally dangerous. It allows external users to have access to resources that only intended user should have access to. |
| Fix Recommendation | CORS is also blocked in mosip using anti-CORS configurations. |

## Scenario 16

| Current Status | Severity | Risk |
| :- | :- | :- |
| Known Issue, not a vulnerability. | Low | Medium |

| Description | Attackers can try header manipulation attacks |
| :- | :- |
| Risk Assessment | In a Header manipulation attack an attacker changes the headers of the requests to see if it shows any values or errors in response. Without right validation these Headers can cause unwanted changes in DB and Server. |
| Fix Recommendation | In MOSIP, each request is whitelisted with only the one header it is required to have and manipulating header values will |

## Scenario 17

| Current Status | Severity | Risk |
| :- | :- | :- |
| Known Issue, not a vulnerability. | Low | Medium |

| Description | An attacker with access to admin UI can try to upload incorrect certificates. |
| :- | :- |
| Risk Assessment | The certificates are key to establishing the trust chain among various modules in MOSIP. If an incorrect certificate gets through and replaces a valid one, it may cause the module to stop working all together. |
| Fix Recommendation | In MOSIP, we require a specific format to upload certificates and before accepting any certificate we match the public key modulus of the certificates. |


## Scenario 18

| Current Status | Severity|Risk |
| :- | :- | :- |
|Fixed|Medium|Medium|

| Description | Attackers can try request smuggling attacks. |
| :- | :- |
| Risk Assessment | Request smuggling although uncommon is still a very dangerous vulnerability. In request smuggling we send multiple packets of data in quick succession to try and deceive the server and use the incorrect packet of data. |
| Fix Recommendation | In MOSIP,we do not allow any external header and all the input are sanitized before being used by the server. |

## Scenario 19

| Current Status | Severity | Risk |
| :- | :- | :- |
| Fixed | Medium | Medium |

| Description | Attackers can try XXE injection attacks |
| :- | :- |
| Risk Assessment | XXE injections are used by attackers to input payloads into the logic of an XML application. |
| Fix Recommendation | The inputs are robustly sanitized before use and also special characters are not allowed in every field,to minimize risk. |

## Scenario 20

| Current Status | Severity | Risk |
| :- | :- | :- |
|Known issue, not a vulerability|Low|Medium|

| Description | Attackers can try to spoof /change biometric data or confidential data |
| :- | :- |
| Risk Assessment | If an attacker is able to successfully spoof or change the data of a person, then he/she would be able to make unwanted changes in the database. |
| Fix Recommendation | In MOSIP, each piece of data goes through multiple layers if encryption/decryption and signature validation. Hence, any spoofed or changed data will be invalid. |

## Scenario 21

| Current Status | Severity | Risk |
| :- | :- | :- |
| Fixed | Medium | Medium |

| Description | An attacker can try double host header attacks |
| :- | :- |
| Risk Assessment | The double host header or multiple header attack allows the attacker to send malicious data or website links in the headers of the request. |
| Fix Recommendation | In MOSIP, each header value is sanitized and validated before use. |

## Scenario 22

|Current Status|Severity|Risk|
| :- | :- | :- |
| Fixed | Medium | Medium |

| Description | Attackers can try to use other user’s PRID to get their PII data(IDOR) |
| :- | :- |
| Risk Assessment | This is an example of horizontal privilege escalation. An attacker with a  regular user access tries to get the data of another user. |
| Fix Recommendation | In MOSIP, horizontal privilege escalation is not possible, each request is accompanied with an unique cookie which an attacker does not have. |

## Scenario 23

| Current Status | Severity | Risk |
| :- | :- | :- |
| Known issue, not a vulnerability. | Medium | Medium |

| Description | An attacker can try privilege escalation attacks. |
| :- | :- |
| Risk Assessment | In privilege escalation attacks an attacker already has user access and then tries to get admin access. They can try to add extra roles in tokens or use possible admin username and passwords. |
| Fix Recommendation | In MOSIP, all roles are provided and secured by KeyCloak and each token is validated before use, hence no privilege escalation attacks are probable. |

## Scenario 24

|Current Status|Severity|Risk|
| :- | :- | :- |
| Fixed | Medium | Medium |

| Description | Absence of x-content –type header |
| :- | :- |
| Risk Assessment | The HTTP 'X-Content-Type-Options' response header prevents the browser from MIME-sniffing a response away from the declared content-type. |
| Fix Recommendation | In MOSIP, X-content type header is added to configuration to mitigate the vulnerability. |

## Scenario 25

| Current Status | Severity | Risk |
| :- | :- | :- |
| Fixed | Medium | Medium |

| Description | Weak ciphers can be decrypted and used for data stealing |
| :- | :- |
| Risk Assessment | When the used cipher is weak ,it usually tends to fall short in front of brute-force attacks and that leads to data leakage. |
| Fix Recommendation | In MOSIP we have used hardened ciphers which are highly impossible to break even with sophisticated tools. |

## Scenario 26

| Current Status | Severity | Risk |
| :- | :- | :- |
| Fixed | Medium | Medium |

| Description | Without a CSP(content security Policy) a program is never very secure |
| :- | :- |
| Risk Assessment | The primary benefit of CSP is preventing the exploitation of cross-site scripting vulnerabilities. When an application uses a strict policy, an attacker who finds an XSS bug will no longer be able to force the browser to execute malicious scripts on the page |
| Fix Recommendation | In MOSIP, we have CSP set in our ngnix configurations along with many other properties to harden our server configuration. |

## Scenario 27

| Current Status | Severity | Risk |
| :- | :- | :- |
| Fixed | Medium | Medium |

| Description | The pre-registration zip file might cause buffer overload |
| :- | :- |
| Risk Assessment | In the registration client, we have an option to import data from preregistered PRIds, which are multiple zip files. If the size and content of the zip files are not regulated, it may lead to buffer overload among other problems. |
|Fix Recommendation|To mitigate this we have configure a limit of,<br>1.size of zip file<br>2.maximum no of files allowed inside a zip<br>3.The maximum allowed ratio of files and their resultant zip files. |
