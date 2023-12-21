# Registration Processor: Camel Route changes

This document outlines the changes made to the camel route file following the migration.

1. In the 1.2.0.1 release, there is a default camel route file for each registration type, without any differentiation between the dmz and mz concepts. This is due to the transition from V2 to V3 deployment, which is mandatory.



{% file src=".gitbook/assets/registration-processor-camel-routes-new-mz.xml" %}



{% file src=".gitbook/assets/registration-processor-camel-routes-new-dmz (1).xml" %}



{% file src=".gitbook/assets/registration-processor-camel-routes-new-default (1).xml" %}

2. Workflow commands are implemented to handle the isValid and internal error, with the primary purpose of making important decisions regarding the overall workflow state. Previously, these decisions were made within each individual stage, but now we are transferring them to the camel route, allowing for easier customization by different countries. This change grants more flexibility in controlling the workflow and reduces the reliance on specific stages for decision-making. It is mandatory for the registration table to be updated with packet processing results in each stage, whether successful or failed, excluding the status code. The example below demonstrates one of the workflow commands utilized in routes.

`<to uri="workflow-cmd://complete-as-failed" />`

Below are the workflow commands:

| Commands                                         | Usage                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| ------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| workflow-cmd://complete-as-processed             | The status code will be updated to "PROCESSED" and a websub event will be sent to the notification service for notification purposes. Additionally, it will check if there is an additional request ID present. If so, a tag will be created with a specific registration type and flow status set as "PROCESSED". Furthermore, the latest transaction status code of the main flow will be updated to "REPROCESS" in order to resume processing. Lastly, notifications will be added for failed, rejected, processed, and pause-and-request-additional-info records within the workflow. |
| workflow-cmd://complete-as-rejected              | The status code will be updated to "REJECTED" and a websub event will be sent to the notification service for notification. Additionally, it will verify if there are any additional request IDs present. If so, a tag will be created for the specific registration type with a flow status of "REJECTED", and the processing of the main flow will be resumed.                                                                                                                                                                                                                          |
| workflow-cmd://complete-as-failed                | The status code will be updated to FAILED, and a websub event will be sent to the notification service for notifying relevant parties. Additionally, if there is an additional request ID present, a tag will be created with the corresponding registration type and flow status as FAILED. Following this, the processing of the main flow will resume.                                                                                                                                                                                                                                 |
| workflow-cmd://mark-as-reprocess                 | It will update status code to REPROCESS. It will create tag with particular reg type with flow status as FAILED                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| workflow-cmd://anonymous-profile                 | To store packet details in anonymous profile table                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| workflow-cmd://pause-and-request-additional-info | It will verify if there is an additional request ID. If there is, it will update the status code to "FAILED" and the latest transaction status code of the main workflow to "REPROCESS" in order to resume processing of the main workflow. If there is no additional request ID, it will update the status code to "PAUSED\_FOR\_ADDITIONAL\_INFO" and create the additional request ID. It will then send a web sub-event to the notification service to trigger a notification.                                                                                                        |

3. The OSI validator stage is divided into four stages: operator-validator stage, supervisor-validator stage, introducer-validator stage, and cmd-validator stage. If a packet is determined to be valid, it will be directed from the packet classifier to the cmd-validator stage. This step is mandatory.

#### 1.1.5.5

~~~
<route id="packet-classifier-->quality-checker new route">
        <from uri="eventbus:packet-classifier-new-bus-out" />
        <log
            message="packet-classifier-->quality-checker new route ${bodyAs(String)}" />
        <choice>
            <when>
                <simple>${bodyAs(String)} contains '"isValid":true'</simple>
                <to uri="eventbus:quality-checker-bus-in" />
            </when>
            <when>
                <simple>${bodyAs(String)} contains '"isValid":false' and ${bodyAs(String)} contains '"internalError":false'</simple>
                <to uri="eventbus:message-sender-bus-in" />
            </when>
            <when>
                <simple>${bodyAs(String)} contains '"internalError":true'</simple>
                <to uri="eventbus:retry-bus-in" />
            </when>
            <otherwise>
                <to uri="eventbus:error-bus-in" />
            </otherwise>
        </choice>
    </route>
~~~

 #### 1.2.0.1   

 ~~~
<route id="packet-classifier-->cmd-validator new route">
      <from uri="eventbus://packet-classifier-new-bus-out" />
      <log message="packet-classifier-->quality-classifier new route ${bodyAs(String)}" />
      <choice>
         <when>
            <jsonpath>$.[?(@['isValid'] == false && @['internalError'] == true)]</jsonpath>
            <to uri="workflow-cmd://complete-as-failed" />
            <to uri="workflow-cmd://anonymous-profile" />
         </when>
         <when>
            <jsonpath>$.[?(@['isValid'] == true && @['internalError'] == true)]</jsonpath>
            <to uri="workflow-cmd://mark-as-reprocess" />
         </when>
         <when>
            <jsonpath>$.[?(@['isValid'] == false && @['internalError'] == false)]</jsonpath>
            <to uri="workflow-cmd://complete-as-failed" />
            <to uri="workflow-cmd://anonymous-profile" />
         </when>
         <otherwise>
            <to uri="eventbus://c-m-d-validator-bus-in" />
         </otherwise>
      </choice>
   </route>
~~~


4. Tags will be created in the packet classifier stage. Depending on the tags, the packet will be transferred from the command validator stage to either the supervisor or operator stage. In order to introduce validation and check tags, packets will be moved accordingly. The availability of tags allows us to modify camel routes. (Mandatory)

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

5.  The quality checker stage has been updated to the quality classifier stage. Packets are now transferred from the supervisor, operator, and introducer stages to the quality classifier stage, depending on the designated route. This change is mandatory.

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

#### 1.1.5.5 

~~~
<route id="manual-verification-->uin-generation new route">
        <from uri="eventbus:manual-verification-new-bus-out" />
        <log
            message="manual-verification-->uin-generation new route ${bodyAs(String)}" />
        <choice>
            <when>
                <simple>${bodyAs(String)} contains '"isValid":true'</simple>
                <to uri="eventbus:uin-generator-bus-in" />
            </when>
            <when>
                <simple>${bodyAs(String)} contains '"isValid":false' and ${bodyAs(String)} contains '"internalError":false'</simple>
                <to uri="eventbus:message-sender-bus-in" />
            </when>
            <when>
                <simple>${bodyAs(String)} contains '"internalError":true'</simple>
                <to uri="eventbus:retry-bus-in" />
            </when>
            <otherwise>
                <to uri="eventbus:error-bus-in" />
            </otherwise>
        </choice>
    </route>
~~~

#### 1.2.0.1

~~~
<route id="manual-adjudication-->uin-generation new route">
      <from uri="eventbus://manual-adjudication-new-bus-out" />
      <log message="manual-adjudication-->uin-generation new route ${bodyAs(String)}" />
      <choice>
         <when>
            <jsonpath>$.[?(@['isValid'] == false && @['internalError'] == true)]</jsonpath>
            <to uri="workflow-cmd://complete-as-failed" />
            <to uri="workflow-cmd://anonymous-profile" />
         </when>
         <when>
            <jsonpath>$.[?(@['isValid'] == true && @['internalError'] == true)]</jsonpath>
            <to uri="workflow-cmd://mark-as-reprocess" />
         </when>
         <when>
            <jsonpath>$.[?(@['isValid'] == false && @['internalError'] == false)]</jsonpath>
            <to uri="workflow-cmd://complete-as-rejected" />
            <to uri="workflow-cmd://anonymous-profile" />
         </when>
         <otherwise>
            <to uri="eventbus://uin-generator-bus-in" />
         </otherwise>
      </choice>
   </route>
~~~

7. New route has been added from UIN generator stage to biometric-extraction stage. This stage fetches biometric extraction policy from PMS and sends to ID Repository (mandatory).

   ~~~
    <route id="uin-generation route-->biometric-extraction-stage new route">
      <from uri="eventbus://uin-generator-new-bus-out" />
      <log message="uin-generation-->biometric-extraction-stage route ${bodyAs(String)}" />
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
         <otherwise>
            <to uri="eventbus://biometric-extraction-bus-in" />
            <to uri="workflow-cmd://anonymous-profile" />
         </otherwise>
      </choice>
   </route>
   ~~~

    8. New route has been added from biometric-extraction stage to Finalization stage. This stage publishes draft version to ID Repository DB (Mandatory).

   ~~~

   <route id="biometric-extraction route-->finalization-stage new route">
      <from uri="eventbus://biometric-extraction-new-bus-out" />
      <log message="biometric-extraction-->finalization-stage route ${bodyAs(String)}" />
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
         <otherwise>
            <to uri="eventbus://finalization-bus-in" />
         </otherwise>
      </choice>
   </route>
   ~~~

  9. New route has been added from  Finalization stage to Printing stage. This stage creates Credential Request for printing systems (mandatory).

~~~
 <route id="finalization route-->printing-stage new route">
      <from uri="eventbus://finalization-new-bus-out" />
      <log message="finalization-->printing-stage route ${bodyAs(String)}" />
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
         <otherwise>
            <to uri="eventbus://printing-bus-in" />
         </otherwise>
      </choice>
   </route>
~~~

10. Based on Tags related to quality score, the packets will move form quality classifier to `workflow-cmd://pause-and-request-additional-info` or demodedupe (optional).

#### 1.1.5.5

~~~
<route id="quality-checker-->osi-validator new route">
        <from uri="eventbus:quality-checker-new-bus-out" />
        <log
            message="quality-checker-->osi-validator new route ${bodyAs(String)}" />
        <choice>
            <when>
                <simple>${bodyAs(String)} contains '"isValid":true'</simple>
                <to uri="eventbus:o-s-i-validator-bus-in" />
            </when>
            <when>
                <simple>${bodyAs(String)} contains '"isValid":false' and ${bodyAs(String)} contains '"internalError":false'</simple>
                <to uri="eventbus:message-sender-bus-in" />
            </when>
            <when>
                <simple>${bodyAs(String)} contains '"internalError":true'</simple>
                <to uri="eventbus:retry-bus-in" />
            </when>
            <otherwise>
                <to uri="eventbus:error-bus-in" />
            </otherwise>
        </choice>
    </route>
~~~

#### 1.2.0.1

~~~

<route id="quality-classifier-->demo-dedupe new route">
      <from uri="eventbus://quality-classifier-new-bus-out" />
      <log message="quality-classifier-->demo-dedupe new route ${bodyAs(String)}" />
      <choice>
         <when>
            <jsonpath>$.[?(@['isValid'] == false && @['internalError'] == true)]</jsonpath>
            <to uri="workflow-cmd://complete-as-failed" />
            <to uri="workflow-cmd://anonymous-profile" />
         </when>
         <when>
            <jsonpath>$.[?(@['isValid'] == true && @['internalError'] == true)]</jsonpath>
            <to uri="workflow-cmd://mark-as-reprocess" />
         </when>
         <when>
            <jsonpath>$.[?(@['isValid'] == false && @['internalError'] == false)]</jsonpath>
            <to uri="workflow-cmd://complete-as-failed" />
            <to uri="workflow-cmd://anonymous-profile" />
         </when>
         <when>
            <jsonpath suppressExceptions="true">$.[?(@['tags']['BIOMETRIC_CORRECTION_FLOW_STATUS'] in ['FAILED'] || @['tags']['BIOMETRIC_CORRECTION_FLOW_STATUS'] in ['REJECTED'])]</jsonpath>
            <setProperty propertyName="ADDITIONAL_INFO_PROCESS"><constant>BIOMETRIC_CORRECTION</constant></setProperty>
            <setProperty propertyName="PAUSE_FOR"><constant>1296000</constant></setProperty>
            <to uri="workflow-cmd://pause-and-request-additional-info" />
         </when>
         <when>
            <jsonpath suppressExceptions="true">$.[?(@['tags']['Biometric_Quality-Iris'] in ['Average', 'Good','--Biometrics-Not-Available--'] && @['tags']['Biometric_Quality-Finger'] in ['Average', 'Good', '--Biometrics-Not-Available--'] && @['tags']['Biometric_Quality-Face'] in ['Average', 'Good', '--Biometrics-Not-Available--'])]</jsonpath>
            <to uri="eventbus://demo-dedupe-bus-in" />
         </when>
         <when>
            <jsonpath suppressExceptions="true">$.[?(@['tags']['Biometric_Quality-Iris'] in ['Poor'] || @['tags']['Biometric_Quality-Finger'] in ['Poor'] || @['tags']['Biometric_Quality-Face'] in ['Poor'])]</jsonpath>
            <setProperty propertyName="ADDITIONAL_INFO_PROCESS"><constant>BIOMETRIC_CORRECTION</constant></setProperty>
            <!-- PAUSE_FOR is in seconds -->
            <setProperty propertyName="PAUSE_FOR"><constant>1296000</constant></setProperty>
            <to uri="workflow-cmd://pause-and-request-additional-info" />
         </when>
         <otherwise>
            <to uri="workflow-cmd://complete-as-failed" />
            <to uri="workflow-cmd://anonymous-profile" />
         </otherwise>
      </choice>
   </route>
~~~

11. We can use JSON path also and update the conditions.                                                                            If we want to update route based on `isValid` and `internalError` then follow the below syntax (optional)

~~~
<jsonpath>$.[?(@['isValid'] == true && @['internalError'] == true)]</jsonpath>
~~~

If we wish to use check condition based on address, then follow the below syntax (optional) ,

~~~
<jsonpath suppressExceptions="true">$.[?(@['messageBusAddress']['address'] == 'verification-bus-in')]</jsonpath>
~~~

If we wish to use the check condition based on Tags, then follow as below (optional):

~~~
<jsonpath suppressExceptions="true">$.[?(@['tags']['AGE_GROUP'] == 'INFANT' || @['tags']['AGE_GROUP'] == 'MINOR' || @['tags']['INTRODUCER_AVAILABILITY'] == 'true')]</jsonpath>
~~~

If we want to set the property in camel route, then follow the steps as below.       .

This property is used for PAUSE and RESUME feature. We cant set application properties here (optional)     

~~~
<setProperty propertyName="PAUSE_FOR"><constant>1296000</constant></setProperty>
~~~

13. As a part of the 1.2.0.1 update, if no biometric data is available, the system will proceed to the verification stage. This stage is only relevant in cases where the required biometrics are missing from the packet. The system will send the applicant's demographic and biometric information to the external Verification System (VS) through a queue and Datashare. Upon receiving the decision from the VS, the system will proceed accordingly and forward the packets. In case of rejection, the applicant will be notified (optional).

New route is specified from verification to UIN generator stage `route.xml`

~~~

 <route id="verification route-->uin-generator new route">
      <from uri="eventbus://verification-new-bus-out" />
      <log message="verification route-->uin-generator new route ${bodyAs(String)}" />
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
         <otherwise>
            <to uri="eventbus://uin-generator-bus-in" />
         </otherwise>
      </choice>
   </route>
~~~

14. Now securezone-notification stage can consume from securezone-notification-bus-in address which is from packet receiver stage. We can even use, http://regproc-group2.regproc/registrationprocessor/v1/securezone/notification instead of http://mz.ingress:30080/registrationprocessor/v1/securezone/notification (optional)

    ##### 1.1.5.5

    ~~~
    <route id="packet-reciever-->securezone-notification new route">
        <from uri="eventbus:packet-receiver-new-bus-out" />
        <log
            message="packet-reciever-->packet-uploader new ${bodyAs(String)}" />
        <choice>
            <when>
                <simple>${bodyAs(String)} contains '"isValid":true'</simple>
                <process ref="tokenGenerationProcessor"/>
                <setHeader headerName="CamelHttpMethod">
                    <constant>POST</constant>
                </setHeader>
                <setHeader headerName="Content-Type">
                    <constant>application/json</constant>
                </setHeader>
                <setHeader headerName="Cookie">
                    <simple>${header.Cookie}</simple>
                </setHeader>
                <setBody>
                    <simple>${bodyAs(String)}</simple>
                </setBody>
                <to uri="http://mz.ingress:30080/registrationprocessor/v1/securezone/notification" />
            </when>
            <when>
                <simple>${bodyAs(String)} contains '"internalError":true'</simple>
                <to uri="eventbus:retry-bus-in" />
            </when>
            <otherwise>
                <to uri="eventbus:error-bus-in" />
            </otherwise>
        </choice>
    </route>
    ~~~

    #### 1.2.0.1

    ~~~
    <route id="packet-receiver-->securezone-notification new route">
      <from uri="eventbus://packet-receiver-new-bus-out" />
      <log message="packet-receiver-->securezone-notification new ${bodyAs(String)}" />
      <choice>
         <when>
            <jsonpath>$.[?(@['isValid'] == false && @['internalError'] == true)]</jsonpath>
            <to uri="workflow-cmd://complete-as-failed" />
         </when>
         <when>
            <jsonpath>$.[?(@['isValid'] == true && @['internalError'] == true)]</jsonpath>
            <to uri="workflow-cmd://mark-as-reprocess" />
         </when>
         <when>
            <jsonpath>$.[?(@['isValid'] == false && @['internalError'] == false)]</jsonpath>
            <to uri="workflow-cmd://complete-as-failed" />
         </when>
         <otherwise>
            <to uri="eventbus://securezone-notification-bus-in" />
         </otherwise>
      </choice>
   </route>
   ~~~
         
