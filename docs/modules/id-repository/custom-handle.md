# eSignet v1.3.0 Custom Handles Implementation Guide

## What is a handle?

UIN / VID are system-generated unique identifiers provided to Residents. Residents are allowed to authenticate themselves using either UIN / VID.

What if residents are given the flexibility to create their handle (username) and use their unique handle to authenticate?

* Handles can include resident's phone number, e-mail ID, or any linked functional ID / sectoral ID.
* The handle can also be a custom username created through the resident portal.

## Overview

Countries that have an established user base can now register users onto a relying portal using their distinctive identifiers referred to as handles. These handles are tailored to meet the specific requirements of each country, enabling users to easily access digital services and receive prompt benefits from both the government and private sector. This approach eliminates the need for users to remember a new or system generated IDs.

## How does it work?

The implementation of custom handles involves below steps:

1. Mark the fields that can be used as user handles. A new attribute is introduced in identity schema, **handle** which accepts boolean value. More than one field in the identity schema can be marked as handle.

   With phone as an example: 

      ``{"fieldCategory": "phone number", "format": "none", "type": "string", "fieldType": "default", "requiredOn" : "",  **"handle" : true**},``

 2. When the user registers, collected user data should contain **selectedHandles**, as more than one field can be marked 
    as handle, user can choose amongst the handle fields to use. User can also choose all of them. Client UI’s collecting 
    user data during registration can decide to provide this option to the user or it can also set selected handles to 
    default values as decided by the country. ``selectedHandles`` is also a field in schema, ``identity``.

    `` "selectedHandles" : {"fieldCategory": "none","format": "none","type": "array","items" : { "type" : "string" },"fieldType": "default"  }``

3. When the collected identity object is sent to the ID repository, it validates the data and accepts the handle provided it is unique amongst the registered handles.

   **Note:** If duplicated, a request to register the user is rejected.

4. Once identity is successfully processed and stored in an ID-repository, identity credentials are issued to IDA to store user credentials for each ID (UIN & VID) as well for each selected handle.

5. ID-repository can be configured to disable issuance of user credential to IDA for both UIN or VID using below properties.

   ``mosip.idrepo.identity.disable-uin-based-credential-request=true``

## What is handles collision? How handles collision can be avoided?

If the system is configured to use more than one functional ID as a handle and if two different functional ID systems followed the same format  /pattern to generate an ID, handles collision may occur. 

Collision between two different functional IDs will result in denying the creation / updating of a handle for a resident.

**Solution:** Every handle stored is postfixed with handle type and the handle type is chosen based on the handle field ID in the identity schema. On every authenticate request, IDA will expect handle postfixed with handle_type as input.

Property mentioned below is introduced in ID repository to postfix handle type on every creation of identity.

``mosip.identity.fieldid.handle-postfix.mapping={'phone':'@phone'}``

Property mentioned below is introduced in ``Id-authentication-default.properties`` file to validate the handle value based on the postfix provided in the ``inidivdualId`` input.

``mosip.ida.handle-types.regex={ '@phone' : '^\\+91[1-9][0-9]{7,9}@phone$' }``

## Conclusion

Implementing custom handles provides a user-friendly approach to user authentication without burdening end users with the need to remember additional or system generated complex IDs.
