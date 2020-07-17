
The UN Sustainable Development Goal 16.9 has prioritized “legal identity for all” by 2030. There is now a focus by countries and development actors to reach this goal. Until now, this has often meant that countries go through a formal tendering process and find a vendor who can build the ID system. This has led to two kinds of challenges: 

1.	From a governance perspective, lack of adequate privacy and safeguards in law, and 
2.	From a technology perspective, technology and vendor lock-in. 

In a survey conducted by ID4Africa, several members of the ID community identified Vendor lock-in is their main problem. To quote the ID4Africa survey findings here: “It shows vendor lock-in as a top problem. The majority feels they were held hostage by the solution provider.”

The Modular Open Source Identity Platform ([MOSIP](https://www.mosip.io/)) effort started about 20 months ago as a response to the technology challenge identified by the ID community.  MOSIP has launched the [1.1 version](https://github.com/mosip) on Github and continues to improve the platform with fixes and enhancements. However, there are several additional important modules that need to be built to shape this open-source layer. The MOSIP team has curated a list of modules/ problems that would require the best minds in the technology world to take up and solve for. 

To organize this effort to work with technology enthusiasts from around the world, the MOSIP team is proposing the Technology Contributors Coalition (TCC). The TCC is being set-up as a coalition of individuals and organizations who are keen on shaping the evolution of MOSIP. Organizations can encourage their resources to collaborate on specific projects by contributing code and documentation or second their resources to work full time with the MOSIP team. 

TCC contributors will work closely with the MOSIP team on identified modules, features, or problems, or suggest new modules and enhancements to MOSIP. The key areas of contribution will include enhancements related to privacy, security, interoperability, service delivery, improved user experience etc. A suggested set of ideas for collaboration are appended below.

#1. Reporting Framework
Mosip in its operation generates system data, seed data and transaction data along with audit logs. Reporting and analytics are required to monitor the operations of the system.

**Use cases**
* Collation of data from numerous sources like master tables, transactional data, audit logs, system health monitors.
* Creation of a live stream of data for real time analytics
* Creation of a data lake to store data for consumption by presentation tools
* Computation and storage of metrics on a periodic basis for trend analysis
* Mechanism to archive or purge data based on time
* Provide reports to support operations (some indicative reports are given below)
	* Report the number of new registrations carried out per day
	* Report the number of UIN update transactions
	* How many registrations happened per registration center on a given day
	* Report the number of UINs allocated age-wise and gender wise
	* How many registrations were approved and rejected end of day centerwise
	* Given a center, the list of registrations that were rejected along with the reasons for rejecting
	* Given a date or date range, list of registration packets that failed processing (for administrators)
	* Packet processing statistical report that includes 
		* Number of new registrations, UIN updates, lost UIN, UIN updates via. Resident Services & Re-Prints done every day.
		* Number of packets stuck at processing state or failed for a specific date

#2. Registration App on a Tablet 
The registration services contain the required functionalities to capture and record demographic and biometric details of individuals.  A native UI has been provided as a reference implementation for demo and customization. It is required to provide the same functionality on an iOS and Android tablets.  

**Use cases**
* Use the inbuilt camera to capture photograph
* Work with peripherals for capture of other fingerprint and Iris
* Use MDS specifications for interacting with the devices to capture biometrics securely

#3. Resident Portal
Resident portal offers residents to avail self-service features for managing their identity data, controlling and viewing usage of their identity. A set of REST API provided by MOSIP is available for the portal to use. A portal is required with a human-centric design.

**Use cases**
* Updating ID data
* Managing ID usage (Lock / Unlock)
* Generate virtual id
* View usage logs
* Merge pre-registration features into this portal
* CMS integration for country specific content to be presented
* Login, session management features
* Responsive UI that can work with mobiles and tablets

You can view the features for Resident Services [here](Resident-Services-Functionality.md).

#4. Resident Portal App
The resident self-service app offers the same set of features offered in the portal as an app on the phone or tablet. Refer to Problem 3 for use cases.

#5. Log Manager
Log manager provides following functionalities:
* Create a logging system reference implementation with stacks such as elk, splunk, kafka etc.
* Logging features should support
	* Supports creation of logs without loss of data with log levels
	* Collates logs from across the application
	* Store generated logs in configured location
	* Manages log size, rotation segregation
	* Support for logger configurations
	* Support addition log level to a particular logger dynamically
* Indexing and searching of log to be supported
* Time based purging of log to be supported for different types of log data

These logs come handy for analyzing the system behavior and debugging. More details can be obtained from our [Java Coding Standards](MOSIP-Java-Coding-Standards.md#logs).
 
We need a visual dashboard that would display the logs using tools like Kibana.

#6. Consent Framework
MOSIP is a custodian of user’s identity data. A user consent framework is needed that allows users to wield varying degrees of control of different types of their data and their uses.

Consent is required from the user for the following:
* Verification of user identity by an external application
* Verification of user data (Know Your Customer)
* Sharing of user data (Know Your Customer)
* Seeding of authorized systems (Functional ID Linkage)

Consent can be obtained a-priori or instantly for different nature of transactions. Consent can be provided in multiple ways like:
* Authorizing a transaction with authentication (single or multi-factor) (Instant)
* Signing the request with a digital certificate (apriori)
* Providing an OTP (Instant)
* Sharing a generated pass-key (Instant)
* Using a challenge-response mechanism (Instant)

No action is taken without user’s continued consent and knowledge.

A data clearinghouse setup can be set up to facilitate the exchange of information between the functional system based on user consent. This will help keep user information current and relevant and avoid sharing of data via third-party agents or an unsecured procurement chain.

#7. Fraud Analytics
The objective of a fraud management system is to ensure frauds in various stages are identified and prevented. Some examples of tagging for possibility of frauds are below.
* Fake supporting documents such as Proof of Identity, Address proof, age proof etc.
* Registration in the name of an individual who is dead
* Registration that happens outside the windows of working time of the registration centers
* Registering a child with invalid introducer (may be with using the operator’s identity)
* Pre-registrations done from outside the country are tagged for fraud analysis.
* Pre-registrations done from a single host many times may be tagged for fraud analysis.
* A registration operator is taking way more time than the standard time may be tagged for further analysis.
* A registration center has been decommissioned however there could be attempted registrations that eventually MOSIP denies, but the data would be useful for further analysis about the activities around the center.
* A registration operator has been disabled, but there could be attempted registrations that are denied by MOSIP, but the data would be useful for further analysis.
* Frequent registrations happening from one or more centers using manual adjudication process regularly could be a case of possible frauds.

#8. System Health Monitoring
Users need to monitor the health of various services running on the MOSIP server to manage them efficiently.   The foundational ID Systems needs to run 24x7 for long period of time.

Common health monitoring use cases are,
* Health of the services that includes services that are running and the ones that are down
* Requests pending in the queues that have not been clearly for a long time
* One or more services are not reachable since they are not running
* The server may be running but has crashed multiple times over a given period of time rendering the server unhealthy.
* The dependent servers/services such as ABIS, authentication servers, eKYC servers etc might be disconnected or not running and hence the server may not be able to fulfil requests completely. 
* The server may be running at suboptimal performance
* Measure system metrics such as network utilization, disk utilization, CPU and memory utilization.
The solution would require
* Providing health monitoring APIs using which one could create a health monitoring dashboard
* Providing alerts via SMS and emails.
* Providing mechanisms to register to one or more alerts  
* All MOSIP services are embedded into various docker containers orchestrated by Kubernetes.   Hence it is possible to measure the following 
	* Kubernetes node utilization
	* Monitoring the running pods
	* Utilization of network, memory and CPU in individual pods

Tools sets that may be used could be,
* Heapster can be used to monitor Kubernetes clusters and collect metrics from it.
* InfluxdB can be used to store these collected metrics in time-series database
* Grafana or Prometheus to aggregate the collected information

#9. Homomorphic encryptions for offline validation
An offline authentication mode is a powerful way to prove identity with very less traceability by a central system. We would like to avoid any card-based technology in performing such authentication as carrying and keeping its pin safe is specific to the culture of the country. The better model would be to print an ID card themselves (like QR code) who can then take it anywhere for validation without losing the privacy. One example use case is defined below.
* Login to the MOSIP from a internet connected computer.
* Perform a biometric/biographic authentication and receive the ekyc data.
* Print the data (VID + demographic + photo) encrypted with homomorphic in QR form.
* The data is digitally signed.
* Take it to a bank to open an account 
* The person who carries the QR code print provides VID (one VID per QR) and demographic data.
* Bank validates if the homomorphic data contains the given information and the photo matches the person standing in front.
* If all is OK then the bank stores the entire QR Code and opens the account.

#10. Transparency of data integrity in custodian’s environment
The initial adopters of MOSIP are developing nations with huge aspirations to go digital. While MOSIP plays a vital role in establishing a foundational digital id its essential that MOSIP brings transparency to the demographic and biometric data stored. 
* We want to ensure that every individual’s record is updated only after his consent. 
* A means of cryptography through which we could ensure that internal hackers cannot alter records and hide the evidence.
* A mechanism for MOSIP to auto-publish a hash (or something similar) which could be used to validate that the data has not tampered.

#11. False Finger/IRIS/Face detection
While biometric has proven to be unique it also suffers from attacks related to false fingers/non-live photos. It’s important to build a mechanism over which we can detect such fraudulent activities. While the device on the field would bring in liveness validation it would not be enough just to depend on that alone.

All our images are JPEG lossless, so it would be good to have a mechanism to identify false biometrics on the server.

#12. Advanced demographic storage
One of the important services in MOSIP is to provide authentication - An online verification. MOSIP plans to federate this service across multiple players. We expect the residents to choose a service provider to whom MOSIP can share data.

MOSIP would like to share this data in an encrypted model where the authentication provider has no access to the original data but still be non-reputable, and is able to provide an online verification service.

Is it possible to use Homomorphic encryption in this case?


---
----------------------------------------------------------------------------



Please see the [Contributor Guide](Contributor-Guide.md) on how to file bugs, contribute code, and more.

You can join the our [developer mailing list](https://groups.io/g/mosip-dev) to get more updates!

You may also be interested in joining our community room on Gitter via [![Gitter](https://badges.gitter.im/mosip-community/community.svg)](https://gitter.im/mosip-community/community?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge) where you could get some great community support.