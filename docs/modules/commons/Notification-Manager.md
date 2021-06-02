# Notification

## OTP Notification Services

1. OTP Notification Services is a combined service, which receives a request to generate an OTP and responds directly to the User using SMS or Email Notification. 
1. The service receives a request to generate and send OTP with User ID, OTP Channel (MOBILE and/or EMAIL), Template Variables, and Template Context (SMS and/or Email). 
1. It then calls OTP Generator Service to generate an OTP against a Key (Mobile Number or Email). 
1. It calls the Template Merger Service to merge OTP with the Template (SMS and/or Email). 
1. It calls SMS and/or Email Notification Service to send the notification as per the template. 
1. The choice of sending SMS and/or Email depends on the Notification Type Flag received in Input.
1. The system responds with the error message if a particular User ID does not have an Email or Mobile number registered against it if the otp channel received is Email or Mobile number respectively 

## Email Notification

1. This service triggers an Email Notification upon receiving a request to trigger notification with Recipient Email-ID, CC Recipients Email-IDs, Subject, Email Content, and Attachment as input parameter. 
1. The restriction on Attachment and its size is configurable. 
1. The Third-Party Email Vendor is configurable and any country specific vendor can be used.

## SMS Notification

This service triggers an SMS Notification upon receiving a request to trigger notification with Phone Number and Content as input parameter. The third-party SMS Vendor is configurable and any country specific vendor can be used.

## PDF Generator

This utility enables creation of PDF from the content received. It will receive a content in input parameter, convert it into a PDF document, and respond with it to the source.

PDF Generator also supports the feature to generate a Password Protected PDF with an additional input parameter “Password”, which is an optional parameter.

**NOTE**: If a Password is not received, then PDF Generator will generate the PDF of received content without the password protection.

## Template Merger

This utility merges a Template with Placeholders with the dynamic values to form the content to be sent as Notifications or Acknowledgement. The Utility will receive a template and dynamic values from a source. It will merge the values and template and respond with the processed content.
