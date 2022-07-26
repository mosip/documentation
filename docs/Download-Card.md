The printing and delivery of cards in a foundational ID system highly depend upon the printing capacity and postal infrastructure of the country. The last mile delivery of the resident's card is unreliable in many developing countries. Based on the need of the hour, in MOSIP we have added a new feature to download the resident's card using the resident service APIs or receive the card at an assisted kiosk using the admin portal.

## Download cards using the admin portal
The admin with the role "DIGITALCARD_ADMIN" has the privilege to download the digital copy of the UIN card for the residents (currently as a PDF). Here the resident reaches the centre and requests the admin to provide a PDF version of their ID card.

To download the card, 
1. The admin logs into the admin portal and navigate to the **Download Card** option on the left navigation pane.
3. The admin now enters the registration ID shared by the resident and clicks on the search icon to check if the registration ID exists and proceeds for further verification.
4. If a card is available for that registration ID, the photograph along with the date of birth of the resident is displayed on the screen.
5. Now the admin can perform a manual verification to confirm the identity of the resident or the country can customize this section to add an SDK to perform local authentication.
6. If the identity of the resident can be verified, the admin has to provide consent by clicking on the *"I have verified the face"* option and downloading the card.
7. If the face does not match then the request for downloading the card is rejected.
8. The card downloaded here can be printed and a physical copy of the same can be shared with the resident.

![](_images/admin/download-card-new.png)

## Restrictions and Auditing
* The admins who have the additional role "DIGITALCARD_ADMIN" only have the privilege to see the option to download a card.
* There is a limit added for the admins per day to search a registration ID but the limit doesn't reduce when there is a failed attempt. The limit here is configurable by the country.
* All the transactions successful or failed are logged in the audit table which can be further used for analytics.
* As of now there are no time restrictions on the availability of the registration ID but there is a restriction on the number of times a particular registration ID might be shared in the policy.
* The PDFs that are generated are password protected. The passwords are configurable.

## Download the card using resident services APIs
If this API is added to the resident portal of the country, then the resident should be able to download the digital copy of his/her card using OTP authentication. The details about the API are listed below:

### Request OTP using RID

#### Request URL
`POST https://{base_url}/resident/v1/req/rid-otp`

#### Request Body
```
{
  "id": "mosip.resident.ridotp",
  "individualId": "10002100300001520220726101639",
  "metadata": {},
  "otpChannel": [
    "EMAIL"
  ],
  "requestTime": "2022-07-26T11:54:43.013Z",
  "transactionID": "1234567890",
  "version": "v1"
}
```

#### Response Body
```
{
  "id": "mosip.identity.otp.internal",
  "version": "1.0",
  "transactionID": "1234567890",
  "responseTime": "2022-07-26T12:24:36.152Z",
  "errors": null,
  "response": {
    "maskedMobile": null,
    "maskedEmail": "XXiXXaXX.XX@gmail.com"
  },
  "metadata": null
}
```

### Request to Download Card

#### Request URL
`POST https://{base_url}/resident/v1/req/rid-digital-card`

#### Request Body
```
{
  "id": "mosip.resident.ridotp",
  "request": {
    "individualId": "10002100300001520220726101639",
    "otp": "111111",
    "transactionID": "1234567890"
  },
  "requesttime": "2022-07-26T11:54:43.013Z",
  "version": "v1"
}
```

#### Response
A password-protected PDF file containing the digital version of the resident's ID card.
