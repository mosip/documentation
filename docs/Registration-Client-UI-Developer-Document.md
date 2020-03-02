# Registration Client UI Developer Documentation

*** 
This document guides the developer to find the traceability between UI and the respective controller components.  The provided technical classes are available in the package of '**registration-client**' module. In this module, the required controllers are bind with the FXML screens. 

It doesn't detail about each methods level information since that is covered in Javadoc of each component and Design Documents.   

## UI Screen Vs Controller mapping: 

|**Functionality:**| Login with UserName and Password/ OTP/ BIO  |  
|:------:|-----|  
|**Technical Detail:**| Login screen with User ID will be loaded initially and after successful valudation of the user id the respective authenitcaiton screen [if multi-factor more than one authenticaiton] will be loaded|  
|**FXML and Controller class**| **RegistrtaionLogin.fxml**  --> **LoginController.java** and **Authentication.fxml** --> **AuthenticationController.java**. For each controller always the **initialization()** method will be called from the controller to initialize the screen|  
|**Input parameter:**| The required buttons,text fields, Radio buttons, On-click events directly mapped to the Controllers of public methods|   


|**Functionality:**| Officer Information Header Screen  |  
|:------:|-----|  
|**Technical Detail:**| After successful login, the Home screen displayed with the officer's information as a header.|  
|**FXML and Controller class**| **Header.fxml**  --> **HeaderController.java**. For each controller always the **initialization()** method will be called from the controller to initialize the screen|  
|**Input parameter:**| The required buttons, text fields, Radio buttons, On-click events directly mapped to the Controllers of public methods.|   


|**Functionality:**| Main / Home Screen  |  
|:------:|-----|  
|**Technical Detail:**| After successful login to the application, the application launches the home screen where the operator can do the new registration/UIN update/ Lost UIN / Pending Approval/ Update operator Bio-metrics operations|  
|**FXML and Controller class**| **RegistrationOfficerLayout.fxml, RegistrationOfficerPacketLayout.fxml**  --> **PacketHandlerController.java**. For each controller always the **initalization()** method will be called from the controller to initialize the screen|  
|**Input parameter:**| The required buttons, text fields, Radio buttons, On-click events directly mapped ot the Controllers of public methods.|   


|**Functionality:**| Registration Header Screen  |  
|:------:|-----|  
|**Technical Detail:**| On Click of any registration/UIN update or Lost UIN the screen header loaded with Registration Header screen, which indicates to the operator currently which data are we going to capture. It highlights with bold color.|  
|**FXML and Controller class**| **RegistrationHeader.fxml**  --> **RegistrationHeaderController.java**. For each controller always the **initialization()** method will be called from the controller to initialize the screen|  
|**Input parameter:**| The required buttons, text fields, Radio buttons, On-click events directly mapped to the Controllers of the public methods|   


|**Functionality:**| Demographic Screen  |  
|:------:|-----|  
|**Technical Detail:**| This screen helps to capture the demographic information of the Resident like Name,Age/DOB , Address, Parent/Guardian Details,Email ID and Mobile Number|  
|**FXML and Controller class**| **Registration.fxml, DemographicDetail.fxml**  --> **RegistrationController.java**. For each controller always the **initialization()** method will be called from the controller to initialize the screen|  
|**Input parameter:**| The required buttons, text fields, Radio buttons, On-click events directly mapped to the Controllers of the public methods|   


|**Functionality:**| Fingerprint Capture Screen  |  
|:------:|-----|  
|**Technical Detail:**| This screen helps to capture the fingerprint information of the Resident like left slap /Right Slap and two thumbs. Apart from this capture of single fingerprint for the authentication will also be called from here. The operations like Reset/Star Over and Scan methods are applicable to this screen|  
|**FXML and Controller class**| **FingerPrintCapture.fxml**  --> **FingerPrintCaptureController.java**. For each controller always the **initialization()** method will be called from the controller to initialize the screen|  
|**Input parameter:**| The required buttons, text fields, Radio buttons, On-click events directly mapped to the Controllers of the public methods|

|**Functionality:**| Iris Capture Screen  |  
|:------:|-----|  
|**Technical Detail:**| This screen helps to capture the Iris information of the Resident like left Eye /Right eye. Apart from this capture of single iris for the authentication will also be called from here. The operations like Reset/Star Over and Scan methods are applicable to this screen|  
|**FXML and Controller class**| **IrisCapture.fxml**  --> **IrisCaptureController.java**. For each controller always the **initialization()** method will be called from the controller to initialize the screen|  
|**Input parameter:**| The required buttons, text fields, Radio buttons, On-click events directly mapped to the Controllers of the public methods|

|**Functionality:**| Face Capture and Camera popup Screen |  
|:------:|-----|  
|**Technical Detail:**| This screen helps to capture the Face information of the Resident using the ICFO standard. Apart from this capture of face for the authentication will also be called from here. The operations like capture/reset/close methods are applicable to this screen. The pop for the camera will be also part of this controller.|  
|**FXML and Controller class**| **FaceCapture.fxml**  --> **FaceCaptureController.java** and **WebCamera.fxml** --> **WebCameraController.java**. For each controller always the **initialization()** method will be called from the controller to initialize the screen|  
|**Input parameter:**| The required buttons, text fields, Radio buttons, On-click events directly mapped to the Controllers of the public methods|

|**Functionality:**| Resident capture information Preview Screen |  
|:------:|-----|  
|**Technical Detail:**| This screen helps to preview the captured information of the Resident like Demographic/Bio-metric and Documents scanned. This screen helps to edit the particular section of which we captured.|  
|**FXML and Controller class**| **RegistrationPreview.fxml**  --> **RegistrationPreviewController.java**. For each controller always the **initialization()** method will be called from the controller to initialize the screen|  
|**Input parameter:**| The required buttons, text fields, Radio buttons, On-click events directly mapped to the Controllers of the public methods|

|**Functionality:**| Officer/Supervisor Authentication Screen | 
|:------:|-----|  
|**Technical Detail:**| This screen helps to authenticate the officer/supervisor, after capture the all resident information. The authentication can happen base don the configuration like PWD/OTP/Bio-metric.|  
|**FXML and Controller class**| **OperatorAuthentication.fxml**  --> **AuthenticationController.java**. For each controller always the **initialization()** method will be called from the controller to initialize the screen|  
|**Input parameter:**| The required buttons, text fields, Radio buttons, On-click events directly mapped to the Controllers of the public methods|

|**Functionality:**| Acknowledgment Screen | 
|:------:|-----|  
|**Technical Detail:**| This screen helps to provide the acknowledgment information of the information captured of the resident. This helps the operator to print the acknowledgment slip and give to the resident.|  
|**FXML and Controller class**| **AckReceipt.fxml**  --> **AckReceiptController.java**. For each controller always the **initialization()** method will be called from the controller to initialize the screen|  
|**Input parameter:**| The required buttons, text fields, Radio buttons, On-click events directly mapped to the Controllers of the public methods|

|**Functionality:**| Document Scan Screen & Scan Popup screen | 
|:------:|-----|  
|**Technical Detail:**| This screen helps to scan the required documents which required based on the operations like New Registration/UIN update /Lost UIN. This scan/edit/remove operation of the documents mapped to this controller. For each scan button, the relevant scan pop window will be displayed. The operations capture will be part of the ScanPopupViewController.|  
|**FXML and Controller class**| **DocumentScan.fxml**  --> **DocumentScanController.java** and **Scan.fxml** --> **ScanPopUpViewController.java**. For each controller always the **initialization()** method will be called from the controller to initialize the screen|  
|**Input parameter:**| The required buttons, text fields, Radio buttons, On-click events directly mapped to the Controllers of the public methods|

|**Functionality:**| Bio-metric Exception Screen | 
|:------:|-----|  
|**Technical Detail:**| This screen helps to mark the bio-metrics which are not available for the resident while capturing the biometric information. By this screen, we can select/deselect the fingers [10] and iris[2]. The operation select/deselect mapped to the controller.|  
|**FXML and Controller class**| **BiometricException.fxml**  --> **BiometricExceptionController.java**. For each controller always the **initialization()** method will be called from the controller to initialize the screen|  
|**Input parameter:**| The required buttons, text fields, Radio buttons, On-click events directly mapped to the Controllers of the public methods|

|**Functionality:**| Parent/Guardian Bio-metric Screen | 
|:------:|-----|  
|**Technical Detail:**| This screen helps to capture the anyone of the parent bio-metric for the child registration/UIN update or Lost UIN. This screen provided with the dropdown by selecting the required bio-metric the same thing should be captured by the operator.  The operation Reset/StarOver/Scan mapped to the controller.|  
|**FXML and Controller class**| **GuardianBiometrics.fxml**  --> **GuardianBiometricsController.java**. For each controller always the **initialization()** method will be called from the controller to initialize the screen|  
|**Input parameter:**| The required buttons, text fields, Radio buttons, On-click events directly mapped to the Controllers of the public methods|

|**Functionality:**| Officer/Supervisor Onboarding Screen | 
|:------:|-----|  
|**Technical Detail:**| This screen helps to Onboard the officer/supervisor to the current machine to create the New Registration/UIN Update and Lost UIN for the residents.|  
|**FXML and Controller class**| **Onboard.fxml, UserOnboard.fxml**  --> **UserOnboardParentController.java**. For each controller always the **initialization()** method will be called from the controller to initialize the screen|  
|**Input parameter:**| The required buttons, text fields, Radio buttons, On-click events directly mapped to the Controllers of the public methods|

|**Functionality:**| Officer/Supervisor Fingerprint Capture Screen  |  
|:------:|-----|  
|**Technical Detail:**| This screen helps to capture the Officer/Supervisor fingerprint information of the Resident like left slap /Right Slap and two thumbs. Apart from this capture of single fingerprint for the authentication will also be called from here. The operations like Reset/Star Over and Scan methods are applicable to this screen|  
|**FXML and Controller class**| **UserOnboardFPCapture.fxml**  --> **FingerPrintCaptureController.java**. For each controller always the **initialization()** method will be called from the controller to initialize the screen|  
|**Input parameter:**| The required buttons, text fields, Radio buttons, On-click events directly mapped to the Controllers of the public methods|

|**Functionality:**| Officer/Supervisor Iris Capture Screen  |  
|:------:|-----|  
|**Technical Detail:**| This screen helps to capture the Officer/Supervisor Iris information of the Resident like left Eye /Right eye. Apart from this capture of single iris for the authentication will also be called from here. The operations like Reset/Star Over and Scan methods are applicable to this screen|  
|**FXML and Controller class**| **UserOnboardIrisCapture.fxml**  --> **IrisCaptureController.java**. For each controller always the **initialization()** method will be called from the controller to initialize the screen|  
|**Input parameter:**| The required buttons, text fields, Radio buttons, On-click events directly mapped to the Controllers of the public methods|

|**Functionality:**| Officer/Supervisor Face Capture and Camera popup Screen |  
|:------:|-----|  
|**Technical Detail:**| This screen helps to capture the Officer/Supervisor Face information of the Resident using the ICFO standard. Apart from this capture of face for the authentication will also be called from here. The operations like capture/reset/close methods are applicable to this screen. The pop for the camera will be also part of this controller.|  
|**FXML and Controller class**| **UserOnboardWebCamera.fxml**  --> **FaceCaptureController.java** and **WebCamera.fxml** --> **WebCameraController.java**. For each controller always the **initialization()** method will be called from the controller to initialize the screen|  
|**Input parameter:**| The required buttons, text fields, Radio buttons, On-click events directly mapped to the Controllers of the public methods|


|**Functionality:**| Pending Approval Screen |  
|:------:|-----|  
|**Technical Detail:**| This screen helps the supervisor to approve the registration done by the officer. This screen displays the list of the packets with respect to their acknowledgment slip. The operations approve/reject mapped to this controller.|
|**FXML and Controller class**| **RegistrationPendingApproval.fxml**  --> **RegistrationApprovalController.java**. For each controller always the **initialization()** method will be called from the controller to initialize the screen|  
|**Input parameter:**| The required buttons, text fields, Radio buttons, On-click events directly mapped to the Controllers of the public methods.|

|**Functionality:**| Pending Approval - Rejection list Screen  |  
|:------:|-----|  
|**Technical Detail:**| This screen helps the supervisor to reject the registrations done by the officer. This screen displays the list of the packets with respect to their acknowledgment slip. The operations reject mapped to this controller. On selecting the rejection the drop-down will be displayed with a list of reasons to reject the registrations.|
|**FXML and Controller class**| **RejectionComment.fxml**  --> **RejectionController.java**. For each controller always the **initialization()** method will be called from the controller to initialize the screen|  
|**Input parameter:**| The required buttons, text fields, Radio buttons, On-click events directly mapped to the Controllers of the public methods.|

|**Functionality:**| Send Notification[SMS/Email] Screen  |  
|:------:|-----|  
|**Technical Detail:**| This screen helps the officer to send the SMS/email to other members. After successful registration of the resident, if the person wants to send the message to more than one person they can send by using this screen. |
|**FXML and Controller class**| **SendNotification.fxml**  --> **SendNotificationController.java**. For each controller always the **initialization()** method will be called from the controller to initialize the screen|  
|**Input parameter:**| The required buttons, text fields, Radio buttons, On-click events directly mapped to the Controllers of the public methods.|


|**Functionality:**| UIN - Update Selection Screen  |  
|:------:|-----|  
|**Technical Detail:**| This screen helps the officer to select the required fields to be updated as part of the UIN update screen. W.r.t the selection of the relevant fields and screen will be displayed subsequently.|
|**FXML and Controller class**| **UpdateUIN.fxml**  --> **UpdateUINController.java**. For each controller always the **initialization()** method will be called from the controller to initialize the screen|  
|**Input parameter:**| The required buttons, text fields, Radio buttons, On-click events directly mapped to the Controllers of the public methods.|

|**Functionality:**| Re-Registration Screen  |  
|:------:|-----|  
|**Technical Detail:**| This screen helps the officer to inform/not inform the re-registration status, which comes from the server as response. |
|**FXML and Controller class**| **ReRegistration.fxml**  --> **ReRegistrationController.java**. For each controller always the **initialization()** method will be called from the controller to initialize the screen|  
|**Input parameter:**| The required buttons, text fields, Radio buttons, On-click events directly mapped to the Controllers of the public methods.|


|**Functionality:**| Sync Data Screen  |  
|:------:|-----|  
|**Technical Detail:**| This screen helps the officer to sync the all required operations manually. Which is available at the Main home screen. |
|**FXML and Controller class**| **SyncDataProcess.fxml**  --> **SyncDataProcessController.java**. For each controller always the **initialization()** method will be called from the controller to initialize the screen|  
|**Input parameter:**| The required buttons, text fields, Radio buttons, On-click events directly mapped to the Controllers of the public methods.|




