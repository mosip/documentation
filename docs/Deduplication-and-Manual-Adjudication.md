Providing unique identity for a resident is one of key features of any identity platform. Hence, in MOSIP, we provide features like demographic and biometric de-duplication followed by manual adjudication to identify the uniqueness of a resident's demographic and biometric details.

# De-Duplication
De-duplication is the process to find a duplicate by comparing the individual’s details (biometric and demographic data) with the data stored in the system. 

## Demographic De-Duplication
In demographic de-duplication the MOSIP system compares some of the demographic data (i.e. Name, Date of Birth and Gender) of the resident against the data present in MOSIP System (the resident's those who have already registered in MOSIP). If any potential match is found, the MOSIP system sends the resident's biometrics to the ABIS system to confirm if the biometrics are also matching.

### Process Flow
1. MOSIP System receives a request to perform demographic de-duplication for Person A.
2. MOSIP System performs demographic de-duplication for Person A by,
	i. Adding Person A's details (i.e. name, date of birth and gender) in the database.
	ii. Comparing Person's details against all the records in the database.
3. Let's say the MOSIP System find duplicates against two records - Person B and Person C.
	i. If Person B's registration has failed we consider Person B not to be a potential match for Person A.
	ii. If Person C's registration is completed and a UIN is associated then we consider Person C to be a potential match for Person A.
4. Now the list of Potential Matches for Person A (here, we only have Person C as the only potential match, there can be a scenario where there are multiple potential matches for Person A) are sent to ABIS to perform de-duplication against the potential matches.
5. As here, we ask ABIS to just perform match of Person A's biometrics with Person C's biometrics, we call this process a Gallery Match in ABIS. As we are asking ABIS to perform biometric de-duplication of Person A against the gallery that we have sent.

![](_images\biometrics\deduplication-deographic_deduplication.png)

## Biometric De-Duplication
In biometric de-duplication the MOSIP system sends the biometrics of the resident to an ABIS System (Automated Biometrics Identification System). Here, the expectation from the ABIS system is to perform biometric de-duplication (1:N match) against all the records that it has stored earlier. 

{% hint style="info" %}
Any Packet irrespective of it has gone through demographic de-duplication or ABIS gallery match, will go through the biometric deduplication stage.
{% endhint %}

### Process Flow
1. MOSIP system receives a request to perform biometric de-duplication for Person A.
2. MOSIP system sends an insert request to the ABIS system to insert Person A's biometrics in ABIS via. a queue.
3. ABIS system processes the request sent by MOSIP and sends a response back to MOSIP via. a queue.
4. MOSIP system now sends a identify request to the ABIS system to perform deduplication for Person A in ABIS via. a queue.
5. ABIS System processes the request and sends the list of potential matches back to MOSIP via. a queue.
6. Let's say the ABIS system has found duplicates against two records - Person B and Person C.
	i. If Person B's registration has failed we consider Person B not to be a potential match for Person A.
	ii. If Person C's registration is completed and a UIN is associated then we consider Person C to be a potential match for Person A.
7. Not the list of Potential Matches for Person A (here, we only have Person C as the only potential match, there can be a scenario where there are multiple potential matches for Person A) are sent to Manual Adjudicator to take the final decision.

![](_images\biometrics\deduplication-biometric_deduplication.png)
 
