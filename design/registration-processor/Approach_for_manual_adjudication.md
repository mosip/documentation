# Approach for Manual Adjudication

**Background**

Registration-Processor will perform demo dedupe on each applicant demographic information. It will try to find out potential duplicate record and if the match score exceeds defined threashold then it will validate biometrics against auth DB. If auth doesnot identify the applicant biometric then it will go for manual adjudication.

The target users are -

Server application which will process the packets.
Administrator of the platform who may need to verify the packets.
The manual adjudicator who will consume registration-processor services.

The key requirements are -
- Expose rest API to provide -
	1. Complete applicant demographic information.
	2. Applicant documents.
	3. Applicant biometrics.
- Expose rest API to receive manual adjudicator decision against registration id.
- Save manual adjudication decision in table.
- Send an event to event bus based on approve/reject decision.
	1. If packet is approved then it should go for bio dedupe next.
	2. If packet is rejected then it should update registration-status db with correct status and send message to error queue.

The key non-functional requirements are
-	Performance: Should be able to perform manual adjudication on millions of potential duplicate records per second.

**Solution**

The key solution considerations are -
- Create vertical "Manual-adjudication-stage" with rest endpoints to -
	1. GET : Provide applicant demographic, document and biometric information to manual adjudicator for verification.
	2. POST : Receive decision from manual adjudicator on packets either approved or rejected and save it to table.
- Create ManualAdjudicationController and add 2 new methods -
	1. HTTP method GET. URI : /manualadjudicationrequest. This is to provide applicant information to initiate manual adjudication.
	2. HTTP method POST. URI : /manualadjudicationresponse. This is to get the response from manual adjudicator.
Create DTOs to send information to manual adjudicator.
- Call packet-info-storage-service to get the potential duplicate records against the applicant from manual adjudication table.
- Above step will provide the applicant and list of potential duplicates. Call call filesystem-adapter-ceph to get below information for both applicant and potential duplicate -
	1. Applicant demographic json file.
	2. Applicant documents.
	3. Encoded Applicant biometrics.
		1. face.
		2. fingerprint.
		3. iris
	4. Execption photo (if any).
- When the decision comes from manual adjudicator, save it to table and send an event to -
	1. Bio dedupe : when manual adjudicator approves packet.
	2. Error queue : when manual adjudicator rejects packet.
- Update correct status to registration table and add transaction records. Add audit logs(wherever applicable).
