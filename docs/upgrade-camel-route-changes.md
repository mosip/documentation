# REGPROC: Camel route changes

This document outlines the changes made to the camel route file following the migration.

1. In the 1.2.0.1 release, there is a default camel route file for each registration type, without any differentiation between the dmz and mz concepts. This is due to the transition from V2 to V3 deployment, which is mandatory.

 <<<<<Attach files>>>>

2. Workflow commands are implemented to handle the isValid and internal error, with the primary purpose of making important decisions regarding the overall workflow state. Previously, these decisions were made within each individual stage, but now we are transferring them to the camel route, allowing for easier customization by different countries. This change grants more flexibility in controlling the workflow and reduces the reliance on specific stages for decision-making. It is mandatory for the registration table to be updated with packet processing results in each stage, whether successful or failed, excluding the status code. The example below demonstrates one of the workflow commands utilized in routes.

`<to uri="workflow-cmd://complete-as-failed" />`

Below are the workflow commands:

| Commands   |      Usage     |  
|-----------------|-------------------|
| workflow-cmd://complete-as-processed | The status code will be updated to "PROCESSED" and a websub event will be sent to the notification service for notification purposes. Additionally, it will check if there is an additional request ID present. If so, a tag will be created with a specific registration type and flow status set as "PROCESSED". Furthermore, the latest transaction status code of the main flow will be updated to "REPROCESS" in order to resume processing. Lastly, notifications will be added for failed, rejected, processed, and pause-and-request-additional-info records within the workflow.  |  
| workflow-cmd://complete-as-rejected | The status code will be updated to "REJECTED" and a websub event will be sent to the notification service for notification. Additionally, it will verify if there are any additional request IDs present. If so, a tag will be created for the specific registration type with a flow status of "REJECTED", and the processing of the main flow will be resumed.| 
| workflow-cmd://complete-as-failed| The status code will be updated to FAILED, and a websub event will be sent to the notification service for notifying relevant parties. Additionally, if there is an additional request ID present, a tag will be created with the corresponding registration type and flow status as FAILED. Following this, the processing of the main flow will resume.
|workflow-cmd://mark-as-reprocess| It will update status code to REPROCESS.  It will create tag with particular reg type with flow status as FAILED|
|workflow-cmd://anonymous-profile| To store packet details in anonymous profile table|
|workflow-cmd://pause-and-request-additional-info|It will verify if there is an additional request ID. If there is, it will update the status code to "FAILED" and the latest transaction status code of the main workflow to "REPROCESS" in order to resume processing of the main workflow. If there is no additional request ID, it will update the status code to "PAUSED_FOR_ADDITIONAL_INFO" and create the additional request ID. It will then send a web sub-event to the notification service to trigger a notification.|

3. The OSI validator stage is divided into four stages: operator-validator stage, supervisor-validator stage, introducer-validator stage, and cmd-validator stage. If a packet is determined to be valid, it will be directed from the packet classifier to the cmd-validator stage. This step is mandatory.

<<<<<<<checkkkkkkkk>>>>

4. Tags will be created in the packet classifier stage. Depending on the tags, the packet will be transferred from the command validator stage to either the supervisor or operator stage. In order to introduce validation and check tags, packets will be moved accordingly. The availability of tags allows us to modify camel routes.  (Mandatory)

```
      <route id="cmd-validator-->operator-validator new route">
      <from uri="eventbus://c-m-d-validator-new-bus-out" />
      <log message="cmd-validator-->operator-validator/supervisor-validator new route ${bodyAs(String)}" />
      <choice>
         <when>
            <jsonpath>$.[?(@['isValid'] == false &amp;&amp; @['internalError'] == true)]</jsonpath>
            <to uri="workflow-cmd://complete-as-failed" />
            <to uri="workflow-cmd://anonymous-profile" />
         </when>
         <when>
            <jsonpath>$.[?(@['isValid'] == true &amp;&amp; @['internalError'] == true)]</jsonpath>
            <to uri="workflow-cmd://mark-as-reprocess" />
         </when>
         <when>
            <jsonpath>$.[?(@['isValid'] == false &amp;&amp; @['internalError'] == false)]</jsonpath>
            <to uri="workflow-cmd://complete-as-failed" />
            <to uri="workflow-cmd://anonymous-profile" />
         </when>
         <when>
            <jsonpath suppressExceptions="true">$.[?(@['tags']['META_INFO-OPERATIONS_DATA-officerId'] != '' &amp;&amp; @['tags']['META_INFO-OPERATIONS_DATA-officerId'] != '--TAG_VALUE_NOT_AVAILABLE--')]</jsonpath>
            <to uri="eventbus://operator-validator-bus-in" />
         </when>
         <when>
            <jsonpath suppressExceptions="true">$.[?(@['tags']['META_INFO-OPERATIONS_DATA-supervisorId'] != '' &amp;&amp; @['tags']['META_INFO-OPERATIONS_DATA-supervisorId'] != '--TAG_VALUE_NOT_AVAILABLE--')]</jsonpath>
            <to uri="eventbus://supervisor-validator-bus-in" />
         </when>
         <otherwise>
            <to uri="workflow-cmd://complete-as-failed" />
            <to uri="workflow-cmd://anonymous-profile" />
         </otherwise>
      </choice>
   </route>
```

5. The quality checker stage has been updated to the quality classifier stage. Packets are now transferred from the supervisor, operator, and introducer stages to the quality classifier stage, depending on the designated route. This change is mandatory.

   ```
   <route id="operator-validator-->supervisor-validator new route">
      <from uri="eventbus://operator-validator-new-bus-out" />
      <log message="operator-validator-->supervisor-validator/introducer-validator/demo-dedupe new route ${bodyAs(String)}" />
      <choice>
         <when>
            <jsonpath>$.[?(@['isValid'] == false &amp;&amp; @['internalError'] == true)]</jsonpath>
            <to uri="workflow-cmd://complete-as-failed" />
            <to uri="workflow-cmd://anonymous-profile" />
         </when>
         <when>
            <jsonpath>$.[?(@['isValid'] == true &amp;&amp; @['internalError'] == true)]</jsonpath>
            <to uri="workflow-cmd://mark-as-reprocess" />
         </when>
         <when>
            <jsonpath>$.[?(@['isValid'] == false &amp;&amp; @['internalError'] == false)]</jsonpath>
            <to uri="workflow-cmd://complete-as-failed" />
            <to uri="workflow-cmd://anonymous-profile" />
         </when>
         <when>
            <jsonpath suppressExceptions="true">$.[?(@['tags']['META_INFO-OPERATIONS_DATA-supervisorId'] != '' &amp;&amp; @['tags']['META_INFO-OPERATIONS_DATA-supervisorId'] != '--TAG_VALUE_NOT_AVAILABLE--')]</jsonpath>
            <to uri="eventbus://supervisor-validator-bus-in" />
         </when>
         <when>
            <jsonpath suppressExceptions="true">$.[?(@['tags']['AGE_GROUP'] == 'INFANT' || @['tags']['AGE_GROUP'] == 'MINOR' || @['tags']['INTRODUCER_AVAILABILITY'] == 'true')]</jsonpath>
            <to uri="eventbus://introducer-validator-bus-in" />
         </when>
         <otherwise>
            <to uri="eventbus://quality-classifier-bus-in" />
         </otherwise>
      </choice>
   </route>
   ```

6. Instead of manual verification in section 1.1.5.5, it is now replaced with manual adjudication in section 1.2.0.1. Additionally, a new route has been specified from the manual adjudication stage to the UIN generator stage in the XML route. In cases where duplicates are identified, the manual adjudication stage is added to the route after the demo dedupe and bio dedupe processes. This change is mandatory.

| 1.1.5.5  |      1.2.0.1    |  
|-----------------|-------------------|
| 
