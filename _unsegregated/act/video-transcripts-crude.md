
# Introduction to ING Stack for Verifiable Credentials

Welcome to an inside look at ING Stack—a comprehensive solution for managing the lifecycle of verifiable credentials. ING enables seamless, secure, and standards-compliant issuance, storage, and verification of credentials.

## Video URL

{% embed url="https://youtu.be/eyhnGFED-xc?si=Btq6pZgUXO_rEyzQ" %}

## What Are Verifiable Credentials?

Verifiable credentials are digital versions of trusted documents (e.g., IDs, certificates) that can be securely shared and instantly verified. The decentralized model involves:
- **Issuer**: Issues credentials.
- **Holder**: Manages credentials.
- **Verifier**: Validates credentials.

Trust is established without a central database, ensuring authenticity and integrity.

## The Problem Inji Solves

Traditional credential verification is slow, manual, and susceptible to forgery. ING addresses these issues by enabling secure, accessible, and efficient digital credential management.

## The Meaning of Inji

"ING" means "knowing" or "recognizance" (from Korean). ING was created to accelerate verification, support authorized issuance, and deliver high trust at low cost.

## ING Stack Modules

### 1. Inji certify
- Issues verifiable credentials from physical or digital data using open standards.
- Integrates with diverse data sources.
- Credentials can be managed via mobile apps or printed for offline users.

### 2. ING Verify
- Verifies documents and cryptographic proofs.
- Enables service providers to trust shared data.

All modules use open standards (W3C, OpenID, VCI, ISO), ensuring interoperability and inclusivity.

## Why Choose ING?

- **Paper-based credential support**
- **Interoperable via open standards**
- **Active ecosystem**
- **Modular design**
- **Scalable adoption**
- **Open source**
- **Multiple deployment models**
- **Secure, privacy-preserving, and inclusive**

## Potential Use Cases

- **Academics**
- **Cross-border travel**
- **Agriculture**
- **Healthcare**
- **Employment**

### Sector Examples

- **Agriculture**: Farmers access IDs, land records, crop certificates.
- **Healthcare**: Citizens share health records securely.
- **Education**: Students present verified credentials for admissions.

## Demo: National ID & Tax ID for Financial Services

A demo shows how to obtain national and tax IDs as verifiable credentials using a self-registration portal and web wallet, enabling fast, secure access to services like bank loans.

**Steps:**
1. Register and receive a unique identification number (UIN).
2. Download credentials via the ING web wallet.
3. Use credentials to access services.
4. Instant data verification for fast approval.

## Try It Yourself

Test ING Stack modules at [collab.mosip.net](https://collab.mosip.net). Access guides at [docs.mosip.io](https://docs.mosip.io) and more documentation at [docs.gi.io](https://docs.gi.io).

---

# ING Mobile Wallet: Features, Use Cases, and Demo Overview

[Video Overview](https://youtu.be/hO12UQXtkqI?si=F96dLNk3ko-dGn1j)

ING Mobile Wallet is a secure mobile application for storing, sharing (online/offline), and managing credentials from multiple issuers. It supports cross-platform access and is built for users with smartphones and internet access.

## Key Features

- **Secure storage** of credentials
- **Online and offline sharing** via QR code or BLE (Bluetooth Low Energy)
- **Multiple issuer support**
- **Cross-platform verification** (OpenID VP standard)
- **Interoperable VC formats** (JSON LD VC, MDOC MDL, SD Jot—coming soon)
- **Selective disclosure** (SD Jot—coming soon)
- **Customizable and configurable UI**
- **Reference implementation for Android/iOS**

## Use Cases

- **Citizens**: Store digital IDs, permits, certificates
- **Travelers**: Manage travel documents and visas
- **Students/Professionals**: Store diplomas, certificates
- **Patients**: Manage health records and vaccination certificates

## Demo Highlights

- Download and store credentials (National ID, health insurance, Tax ID, land records)
- Online sharing via OpenID VP and QR code scan/upload
- Offline sharing via BLE with face verification
- Credential management features: language selection, biometric login, backup/restore, key management, transaction history, help/FAQs

## Try It Yourself

Download ING Mobile Wallet from [collab.mosip.net](https://collab.mosip.net) for Android/iOS. Access setup guides and documentation at [docs.gi.io](https://docs.gi.io).

---

# Inji Web Wallet: Product Overview

Inji Web Wallet is a secure browser-based application for managing, storing, and sharing verifiable credentials. It broadens accessibility for users without smartphones and supports global standards.

## Key Takeaways

1. **Universal Accessibility**: Manage credentials via browser on any device.
2. **Secure Credential Management**: Strong encryption, selective disclosure, QR code sharing.
3. **Flexible Authentication**: Login via Google/standard providers; supports W3C/ISO standards.
4. **User-Friendly Experience**: Multi-language, easy credential download (PDF), passcode management.
5. **Practical Demo**: Walkthrough of credential download/storage for real-world use cases.

---

# ING Verify: Product Overview

ING Verify is a robust tool for verifying verifiable credentials. It enables instant, secure validation of credentials across industries.

## Problem Statement

Traditional verification is manual, error-prone, and lacks interoperability. ING Verify solves these challenges by providing tamperproof, cryptographically signed, instantly verifiable data.

## What Is ING Verify?

A verification tool for validating credentials encoded in QR codes. It uses cryptographic proofs to ensure authenticity and supports both digital and paper-based credentials.

## Key Features

- **QR Code Scanning**: Scan physical or digital credentials.
- **Upload QR Code**: Verify credentials via uploaded images/PDFs.
- **OpenID VP Cross-Device Flow**: Secure sharing from wallet to verifier on different devices.
- **Modular SDK Components**: Plug-and-play React components for easy integration.
- **Docker Compose**: Simplified deployment.
- **Secure Server-Side Verification**: Supports ED25519, RSA signatures; uses PostgreSQL for storage.
- **Supported Formats**: W3C VC data model 1.1/2.0, JSON LD, LDPBC, CEO-encoded QR codes.
- **Pixel Pass Integration**: Accurate QR code decoding.
- **Credential Display & Error Handling**: Clear status (valid/invalid/expired), downloadable VC data, real-time verification.

## Use Cases

- **Academics**: Verify transcripts and certificates.
- **Travel/Hospitality**: Validate digital passports and travel documents.
- **Agriculture**: Verify land records and subsidy documents.
- **Healthcare**: Validate medical records and prescriptions.
- **Employment**: Verify job roles and certifications.
- **Finance**: Validate banking statements and records.
- **Events**: Verify tickets for entry.
- **Supply Chain**: Authenticate products.

## Demo & Integration


**2. Secure Credential Management**: Credentials are stored with strong encryption, giving users full control over their data, including options for selective disclosure and secure sharing via QR codes.

**3. Flexible Authentication and Interoperability**: Users can log in using Google or other standard identity providers, ensuring ease of use and compatibility with global standards like W3C and ISO.

**4. User-Friendly Features and Experience**: Inj Web Wallet offers a seamless user experience with features like intuitive navigation, customizable settings, and responsive design for various screen sizes.

**4. User-Friendly Features and Experience**: The wallet offers simple sign-in, multi-language support, easy credential download (PDF), and straightforward passcode management, enhancing convenience and security.

**5. Practical Demonstration and Real-World Use Cases**: The demo walks through credential download and storage, showing how the wallet can be use d by individuals across sectors (e.g., healthcare, education, agriculture) and provides a reference portal for testing and setup.





# 4 Inji Verify: Product Overview – Your Gateway to Trusted Verifiable Credential Verification

[Music] Hello everyone, I am Vibha Menu the
product owner for NG verify. Today I will be taking you through the product
overview of NG verify which is a robust tool for verifying verifiable
credentials. Our agenda for today is pretty straightforward. We will start by
outlining the problem statement that inverify addresses. Then we will dive
into what Inia verify is and explore why it's the ideal solution for digital
credential verification. We will cover its diverse use cases
across various industries, highlight its key features and provide information on
how you can try it out for yourselves. We will conclude with a demo video and
sharing the collaterals. Before we deep dive into what INI verify
is all about, let us quickly take you through what INI is ultimately offering.
INS is basically a comprehensive verifiable credentiing stack designed to
enable the sharing of tamperproof instantly verifiable data that is
cryptographically signed by a trusted issuer. It provides potential tools for
all the key stakeholders in the credential life cycle. As you are
already aware, the INI stack comprises three key components. Ini certify for
issuing the verifiable credentials. In wallet for securely holding and sharing
the VCs, finally inverify for verifying the verifiable credentials.
This session particularly will focus on insure verify which is a dedicated tool
for verifiers enabling them to consume and verify the credentials
instantaneously and efficiently. In is standardsdriven which adhers to
widely adopted open standards as mentioned in the slide here.
Moving on to the problem statement on why we had to introduce NG verify and
how it benefited the larger society. In the modern digital world,
the demand for a secure, efficient and reliable way to verifiable credentials
was extremely necessary which currently the traditional credentials or the
traditional methods often fell short. We identified several key drawbacks.
Traditional credential verification methods posed significant challenges
because they frequently involved manual checks making them susceptible to human
error and most importantly wrong. We faced
a critical need for tampo pro instantly verifiable data that is
cryptographically signed by a trusted issuer. Without this trust in digital
credentials was ultimately compromised. This was ultimately missing in the
traditional way of verifying a credential. Also, we faced persistent
interoperability issues because ultimately the traditional credentials often struggled to work seamlessly
across various different platforms or various crossber use cases where
probably one particular credential was not seamlessly valid or relevant in some
other country when it was produced for identity verification. This hindered
widespread adoption in the case of traditional credentials. In order to
solve this, a verifiable credential solution such as ING was extremely
necessary. Finally, there was a clear demand for secure and reliable digital
verification. Hence, a robust tool which was capable of validating the
credentials across various different industries and use cases. effectively
was very much required for the current digital world.
Now in order to address all of these challenges that we previously mentioned in the slide, inverify has thus become a
solution or an answer to all of those above mentioned challenges. So what is
inverify? It is a robust verification tool specifically designed to validate
verifiable credentials encoded in QR codes securely.
Its core function involves decoding the data stored within the QR code using the
pixel pass library and then subsequently validating the verifiable credential
itself. This process ensures the authenticity of credentials through
cryptographic proofs. These verifiable credentials represent a digitally
secured version of both traditional paper and digital credentials.
Now most importantly why do we need to use NJ verify? What are the different
benefits it carry? Firstly, it offers enhanced security with verifiable QR
codes. These QR codes utilize digital signatures to safeguard the authenticity
and integrity of data providing a high level of trust for sensitive
information. It ensures seamless verification of issued VCs. It also
supports inclusivity by handling not just digitalbased credentials but also
paperbased credentials. So despite the fact whether the end user does have a
smartphone or not, he can still undergo the verification process instantly via
inverify because inverify has this special feature of ensuring that it can
scan or it can let's say verify the QR code embedded in this particular
credential which is either in a paper form or in a digital form.
The other um specialtity of Ingverify is that it's an open-source product which
makes it easily adoptable across different organizations or countries.
Another benefit is it provides ease of integration for verifier applications
through its modular components. I will take you through this particular feature
in brief in the upcoming slides later. Another feature that Ingverify or
another specialtity that Ingverify carries is it enables instant
verification and is inherently interoperable because it is standards
driven thus making it compatible or interoperable with other compliant
wallets which are recognized in the open-source space. Its modular design
allows for simplified integrations. It benefits from active ecosystem with
commercial technical support. Moving on to the different use cases of Inverify.
Fundamentally, Ingverify addresses the critical need for information to be
presented and validated for service delivery in the digital era. Let's
imagine scenarios like employment checks, bank balance verification,
identity checks, insurance checks, health checks, education check, skill set check. Wherever there is a necessity
to prove your identity, inverify can play a very pivotal role because in
verify ensures that in all of these interactions we are dealing with only
trusted data and it verifies trusted identity.
Now if I have to specify use cases in much more elaborate way, let's take for
example an academic use case. Inverify allows for verification of digital
credentials and transcripts which are issued to students by educational institutions. In the traditional form,
you might have definitely seen how much of a delay it carries for paperbased credentials to get verified because it
needs rigorous manual checks in order to confirm whether the identity is true and
whether the document produced is valid. Ing verify solves all such issues
because the verification that we perform within verify is extremely secure and
instantaneous. Moving on to the other use cases. Coming to crossber travel or travel and
hospitality. It supports the use of digital passports or travel documents
streamlining border control and verifying the travelers's identities.
Think about a use case on agriculture. Let's say you want to verify your land
ownership or let's say whether the farmer wants to obtain a subsidy for
agricultural crops. So any of such documents when produced can be verified
via inverify instantaneously and the data can be trusted also the identity
can be confirmed. When we think about a use case in health care industry, NJ verify can securely
verify patients medical records and prescriptions through QR codes ensuring
that data accuracy and privacy is also capable in healthcare settings. Let's
see how verify can be used in employment verification. It's used for verifying employee
credentials like job roles, certifications, and performance evaluations for HR processes.
Financial transactions can also make use of Ingverify in order
to verify their banking statements and financial records for enhanced security.
We can also use Ingverify in our day-to-day transactions. Let's say if we want to book a ticket uh in order to
watch a movie or if we would want to attend a concert. The QR codes that we derive in these digital tickets can
therefore get verified using verify which allows quick validation and prevents unauthorized entry. Inverify
can help verify the authenticity and origin of products through supply chain combating any counterfeiting. So to
summarize, VCs which are supported by Ingverify enable instant verification
providing user control over data sharing using wallets such as Ing wallet. Also
as we mentioned earlier in verify promotes interoperability thus ensuring
that it can also support verification of credentials derived from any other uh
compliant wallets in the digital identity or let's say opensource space
and significantly inverify can reduce the fraud and manual checks that
let's now move on to the very important part of verify which is to understand
and know more about the features that Ingverify provides. Let's now deep dive into the powerful
features that make Ingverify a leading verifiable solution. The first feature
is QR code scanning. Inverify allows users to easily scan QR codes using
their device camera. For mobile scans, a zoom slider is available to adjust
magnification, enhancing the scanning experience.
Let's say for example, a banking officer wants to verify the
national ID of a customer who wants to open a bank account in his bank. In
order to do so, the banking officer will use the ING verifies scan feature. He
will scan the QR code that is present in the national ID of
the respective customer. This national ID can possibly be in a printed form or
it could possibly be within the customer's mobile. So the NG verify scan
feature can instantaneously verify credentials which are either in printed
form or in digital form. Thus if the ID is valid then the respective valid
status will be displayed on the banker's banking portal. Thus the verification
was secure and instantaneous. Coming to second feature which is upload
QR code. Users or verifiers also have the flexibility to upload QR code images
or documents such as PDFs, JPEGs, JPGs and PGs directly to the portal for
verification. Let's say for example if the given credential is already in the uh laptop
or mobile phone and let's say if we are trying to open a verifier portal on the
very same device then by using the upload feature we can simply fetch the
uh verifiable credential from the local system either of the laptop or the
mobile phone and they can get the VC instantaneously verified using NG
verifies upload feature. The third option is open ID for VP or the third
feature is open ID4 VP cross device flow. This feature enables secure
sharing of verifiable credentials from a user's digital wallet such as NGW wallet
with a verifier using a different device altogether. So
what really happens here is that the verify requests for specific credentials on one of his devices and the user's
wallet which is basically relying on another device
allows sharing either all of the credentials requested or he might end up sharing only some of the credentials
based on the availability or up to his chron. The shared credentials are then verified for authenticity and validity
with results displayed on ng verify. This flow utilizes oper standards. So
basically this flow works only when the user's wallet and the verifier are
residing on two different devices. Now comes one of the most special
features within verify which is modular SDK components for integration. Before I
even explain you this particular feature, I would just want to show you how scan upload and VP verification can
be tested out independently for you to understand the Ini verify
features better. So if you see here we do have INI verify demo or reference
user interface which I will be explaining to you in the upcoming slides on how you can access it and experience
the verification flow for yourself. But as you see here the first three features
that I had covered the upload QR code, the scan QR code and the open ID4 VP
cross device flow. All of these are currently present in one of the demo or
reference UIs that we have created to provide you best user experience in
order for you to experience this phone flow by yourselves. But in a real world,
nobody would want to use Ingverify user interface as is. Let's say for
example, we talk about a bank and in order to verify the credentials of
customers, they simply want to have upload or scan feature within their
banking portals or any of the applications that they are using for verification. So as I was explaining
earlier, this modular SDK components for integration would help you use or
utilize only the upload or scan feature out of this entire UI. What you could
just do is that you could only
utilize the components that you need for your implementation and you can easily
integrate them to your verifier applications. So to condense or summarize, inverify
provides plug-and-play SDK components that allow verifier or relying party
applications to seamlessly integrate VC verification workflows without needing
or without having to depend on the entire NG verify reference application
that has been provided. These components when we say these components you can either use scan component or upload
component or the VP verification cross device flow component this is up to your
convenience to choose which component you would want in your verifier application. You can just utilize them
without having to depend on the entire inverify portal as is. Then these
components which are primarily built on Typescript and it is optimized for React
environments are published as independent npm modules offering
flexibility and reusability for custom UI integration.
So currently as per the current scope we have enabled
integration of these components only with those applications built on React.
In future releases, we'll ensure that we broaden the scope by making sure that these components can be integrated to
other applications running on different other frameworks or languages. But currently
it is supported only on React though we will be expanding the scope of it later.
So yes, coming back to the modular SDK components. So the first three features
that we have covered here can be used as individual components and can be
integrated to any of the react based verifier applications to make the
verification process very seamless. Now coming to the next feature which is
docker compose. Docker Compose is primarily helpful for easy installation
because deployment and setup are simplified through this kind of a docker
compost setup that enables quick and efficient installation.
Coming to the next feature which is secure serverside verification of VCs and V2s. Basically, the backend
integrates the VC verifier library to facilitate robust serverside
verification of both verifiable credentials and verifiable presentations. It supports key
cryptographic standards including ED25519 containing signature 2018 and 2020 and
RSA signature 2018. The back end uses a Postgress database for persistent and
reliable data storage enhancing durability. Now currently the formats that we
support as of now in verify are we adher to W3C VC data model 1.1 and 2.2
standards as was mentioned in one of the previous slides. The VC format that we support is JSON LD and it can decode CEO
encoded QR codes. For verifiable presentation, we are currently supporting LDPBC
format. There are various other um enhancements or features which are a part of NG
verify which includes pixel pass integration where we seamlessly integrate the pixel pass SDK for
accurate QR code decoding, credential display. Now when we were
talking about scan upload and VP verification flows ultimately what is
the result that you're deriving in NG verify let's say the reference implementation that we were portraying
here. So we will make sure that the validation status is clearly called out
in the respective verifier applications. So let's say if the credential is valid
then a valid status will be displayed. If it is a tampered credential then invalid status will be
displayed. Let's say if the credential is already expired then we will mention it as expired status. So basically our
UI clearly distinguishes between valid, invalid and expired credentials. User
can download the VC data as a JSON file or view it in a full screen mode for better readability. We also make sure
that error handling is incorporated in order to ensure that users are clearly
informed about why there is an invalid or unsupported or unreadable or expired
QR codes that has uh led to the failure or that has led to the verification
failure to be precise. Our NG verify thus provides real time
use uh verification because users can verify credentials in real time ensuring prompt validation and reducing delays.
The platform is designed to scale efficiently accommodating growing user demands and maintaining optimal
performance. Ingverify is compatible with a wide range of devices and
operating platforms including desktops, mobile devices and laptops making it
accessible from anywhere with an internet connection.
So before we actually showcase you the demo on the verify reference UI. So the
scan and upload functionality was anyways previously covered. This is just
a pictorial representation of how the flow actually looks like. So you either
scan a QR code present in the verifiable credential or upload the PDF which contains the QR code. When you scan or
upload it using the inverify uh reference UI or let's say if you're trying to utilize this components in any
of the verifier applications, you will be able to verify the credentials and appropriate status will be displayed on
the respective application. Now coming to the open ID for VP cross device flow.
Initially a verifier will be requesting certain set of credentials
and a QR code will be displayed based out of it. Now the wallet holder will
simply have to scan the QR code from his mobile device. When the QR code is
scanned, the requested credentials will now appear on his uh Ing wallet screen
and he now has the option to choose whether he wants to share these credentials or let's say for some reason
he do not want to share all of the credentials but wants to share only few of them. He also has an option to select
only some of the credentials and then pass it on to the Ingverify. The injure verify will now
receive these credentials, run the verification checks and it will display the status of each of these verifiable
credentials accordingly. To help you explain this in a much better way, I now hand over to my
colleague Sanchi who will take you through each of these features by demonstrating it via verify reference
UR. Over to you Sanji.
Welcome to the demo presentation of ng verify. Today we are going to see and
explore certain features and functionalities what ng verify as a module within ngtstack offers. As we
would have seen uh while we were discussing on the features and functionality some time back that it is
a it is a module it comes with different components libraries and SDKs that can be integrated into an already existing
relying party system. This is a reference demo portal that we have just given for trying trying it out and
testing purpose for external people to explore and understand that how VCs can
be verified, how it can be uh authent how it can be verified and how the
authenticity and integrity of the VCs can be proved by letting the verifiers
know whether it's valid in nature or not. So as we see on the screen we have three different features that we are
going to showcase and talk about today. One is let's say if your VC is downloaded in form of a PDF and you
would like to just give out that PDF uh to your verifier or to the relying party they can simply go ahead upload the same
PDF which has the QR code where QR code has your VC data and in verify portal
will be able to verify it. So to do the same thing I used my Ing web which we
would have seen it in a different video that how web as a module operates. It is
a web-based portal. So I just went ahead I used one of the issuers present here to download a health insurance. To keep
it a little quick, I have already kept a health insurance downloaded here in form
of a PDF and I'm going to use ng verify to down upload the same PDF document
which is available in my local folder. And now we are going to see uh whether
it is a valid PDF, invalid or expired. Great. Now what we see it on the screen
it tells me congratulations the given credential is valid in nature and these are the details present here. So as a
verifier what they get to know they get to know whether your credential is valid or not. They even get to know all the
details of your insurance that are required for them to give you certain services. So health insurance is a use
classic use case when you would like to avail services in a healthcare sector and you are visiting a hospital. It will
make your work much faster. You don't have to stand in line. You don't have to wait for long queues. So, it makes the
work faster and easier for a holder like me. And it can make the work uh easier
and faster for the hospitals that are looking at giving services to their
patients. So, in the similar manner, now let's go ahead with the scan QR code. So
this can eventually work in for a physical paper document verifiable credentials or the documents or ID cards
which are present even in your mobile wallet that you see it on the right hand side. So what I'm going to do one of the
VCs that is present here with me is the same insurance credentials which I have downloaded even in my mobile wallet. Now
here I have a QR code present. I can just simply open the scanner here. it
will open the camera and I can just go ahead and scan. So in the similar manner
if you see again it is showcasing that congratulations the given credential is
valid and it showcases all the details. So that's how even the scan of the QR
code can work for VCs documents IDs downloaded in anyone's mobile
application or even printed in form of a paper VC. Now let's move ahead to the
third uh feature which is one of the new features that we have introduced which
is open uh which is verifiable presentation verification which is VP verification mentioned here. The full
form of the VP word is verifiable presentation. It is built on open ID VP
standards.
So let's see how this open ID VP verification works. So here what we are going to see that we have certain steps
written here which is going to help out the verifier or the relying party to
verify the credentials that they're requesting from their holder or the individual. So here they can just simply
click on request credential. They will select what kind of credentials they want to share. So let's say they are
requesting for a national ID and healthare insurance both keeping the use case that as a user they are trying to
avail certain services from the hospital and they have to present their national ID and insurance certificate so that
they can verify both the documents and they will be able to get the services. So I verifier will generate the QR code
they will request the holder. So I will just click a share option available in my mobile phone like which is my wallet.
It will open the camera. Once the camera is open, it will scan the QR code. It will ask me to select the credentials
requested to be shared. It is asking me to share it with selfie because my national ID is present with a face
photo. So I'll proceed and give the consent.
So let's go ahead and do the share with selfie.
So once it has captured my selfie as you see can see it on the right side of this mobile device it is showcasing that ID
shared successfully. Even it will showcase in the history what kind of sharing that you have done. And now on
the verifier screen what we can see that the insurance credential which was even
shared earlier with upload and scan. Same insurance credential has been shared and it is giving that it is valid
in nature. Even my national ID is shared with the verifier and they have received all my national ID details like my face,
photo, full name, UI and other details. So it helps the verifier to understand
that whether the credentials, documents or ids received from the holder is valid
in nature or not. And once it is validated, they can go ahead and give the services because they will be able
to trust the data. That's the most important aspect where ng verify plays a
role in terms of verifiable credentials ecosystem. Even a here I think there
were two credentials that were requested and that were shared. Even a partial sharing can happen that will totally
depend on the uh holder how they would like to share their credentials. Let me
showcase you what is partial sharing. So here they are again uh verifier is again
going to request the credential MOSEP ID and health insurance. They'll generate the QR code. Following the same process,
we'll scan this QR code. Now here because two credentials are requested instead of as a user I only select to
share one that I only want to share my health insurance. Considering that I'm only sharing health insurance so it is
only asking me to click on share because no full face photo is present in my health insurance. I click on share. I
give my consent. It tells me that as a user I have shared this successfully.
But for the verifier they will be able to get that there were two credentials which were requested out of two one is
valid because it was shared and not shared out of two is one. So MOSUP ID was something which was not shared and
only health insurance was shared. So this is also um a way where verifier
gets to know that how many credentials they have requested, how many they have received, number of credentials which
are valid in nature and things that they haven't received. So this is how they can do and if you
see here we have something called request missing credential and then they can even restart the process. So if I
click on request missing credential again they will generate a QR code. Again as a user they'll ask them to only
requesting that credential that was not shared in the previous process. I can just do again phase verification
and in just very simple steps user is again able to share the same credentials
which were missed for the first time. So this is how verifier can verify all the
details. So these are the multiple methods that I have showcased for sharing. One is upload uh uploading the
document, scanning the document when it is in physical form, paper form or in
form of a PDF. VP verification is ideally where a verifier is already aware and updated what kind of
credentials they are requesting from their holder or the individual where they can simply generate the QR code and
the transfer from the uh verifier can take place. So this is the one of these
are the three different methods with which verify can work uh for sharing
verifying of credentials and many more.
You can even uh explore this uh it is present in our collab environment. You
can go on the collab environment. You'll be able to find this ninjify try it out. Once you click here, you will be able to
reach the same page the demo reference portal that I was showcasing for you. So
this will help you to experience and envision that how ideally each and every functionality within the module works.
Now that my colleague has demonstrated each of these features on the Ingi
verified demo or the reference user interface, you as users can make sure
that any of the components that you would want to integrate on your respective verifier applications can be
easily performed by extracting the npm modules which contain each of these
independent components and you can try it out on your application. for yourselves.
Moving on to the next set. As communicated earlier, you can
actually try out our sandbox collab environment where you can access the NJ verify
reference portal which we had demonstrated couple of minutes back. And
by following the instructions in the setup guide provided here, you will be able
continue it for yourself and explore the experience of digital verification at
ease. To test verify, you can access to the link that has been provided here.
to access the different uh documentations related to verify. You
may click on each of these links which will redirect you to ING verify documentation under ING docs.
Apart from these documentations, you can also explore the verify repository in
GitHub for deeper technical insights. If you really want to know more about the entire EGS stat solution, you may
click on the given link here. So finally, thank you so much for your
time and attention today. We hope that this overview has provided a clear
understanding of verifi's capabilities and its role in fostering trusted
digital interactions. Thank you one and all.

# 5 Inji Verify: Technical Deep Dive
First of all, hello folks. Today we are
going to discuss about uh the technical
side of NG verify. NG verify is actually
part of stack and ng verify is the
module that facilitates the verification
of both the verifiable credential and
verify presentation. NG verify also
implements the open ID for verifiable
presentation protocol for verifiable
credential sharing. So in this session
we will start by looking into the
components and general architecture of
graphic. Then we will cover how we can
uh do the local setup using the docker
compos for development. After that we
will do look at the different
integrations whatever is available in
engine.
Uh first of all let's look at the
different flows that are available in
JF.
uh for the diagram that you can see in
the screen. Uh we have two major flows
in NGF like we discussed before. The
first flow is the VCA flow and uh this
is describing about the VC how the VC is
shared and verified using QR codes um
either by uploading or scanning. So here
uh the Q whenever you upload a QR code
which contains a VC right the VC will
get decoded and it will be sent to the
back end for verification. So once
verified the appropriate status will be
shown and VC will be rendered
accordingly on the front end. Okay. The
next flow is on the scan and share of
PB. So that is the flow which implements
the open ID for BB sharing. So here the
verify act as a verifier endpoint for
open ID for VP and generates a QR code
for valid scan. Once the valid scans
this uh QR code that is generated by EG
verify, the ballot internally will match
for whatever VC is being asked for and
uh it is done using the presentation
definition as of now and the ballot will
wrap the VC into a verifiable
presentation and will be sent back to
the ing verify back end. So once
submission is reached inverify back end
inverify back end performs necessary pro
verification cryptographic verifications
on both VP and VC verify presentation
and verify credentials then it will pass
the result back to the front end of
verify and again the result of those
also will be rendered accordingly on the
screen. So we talked about different
parts of verify when we discussed these
two flows right. So now what we will
look at is we will look at them a little
bit uh in detail.
We for that we will go to the ng verify
repository. Uh we will look at what are
the different components available in ag
repository.
So before we go into the components
right we we'll simply talk about a
little bit on the repository structure
and the branching strategies here. So if
you look at it, we have a master branch
where uh master branch contains the
latest release changes actually uh or
you can go into any of your release
branches which are specified here. So
one of any release branches will also
have a release specific changes and if
you want to look at the latest changes
that are ongoing changes which are
developed at this point. So you should
be looking at uh the develop branch. So
you can go to the develop branch for
getting the latest changes whatever we
are working on. For now I'll go to the
last release version which is 030.
So we will look at uh the component
structure from here.
So we were talk we talked about uh the
different uh parts of NG verify during
flow discussion uh being easy verify
back end front end uh yeah those the
major two things we talked about verify
has a back end we will discuss about the
back end first uh so inverify backend
code is residing in the verify service
of inverify repo and uh inverify back
end is uh EG verify back end uh
facilitates the backend service for uh
verifier. When we say back end service
verifier, it actually facilitates the
open ID4 protocol. Uh all the AP
required for creating the VP request,
submitting, fetching the status of the
VP request all are implemented at uh the
AG verify backend service. So if you
want to go deeper into the API
documentation, you can look at the docs
folder. So we have a
open API uh documentation here. You can
put it into swagger or any other open
API rendering software and you can look
at it. Verify service is a Java spring
based application uh which uh serves the
APIs we just talked about
and all the code for uh verify service
resides on uh verify/verify
service directory and also the verify
service available as a docker image.
The next component inverify is the ng
verify SDK. As verify SDK is a simple
react component based library which
facilitates the flows that what we have
talked about in the beginning.
Essentially the scan and upload the open
ed for VP flow. These flows were
extracted into different components and
those are available as react components
as npm modules. Uh and the code for uh
that particular components are available
in ng SDK. If you look at it uh right
this is this is an npm based project and
it is a react based project again uh so
the the aim of this project or this uh
SDK is to like seamlessly integrating uh
the scan and upload flow and the open ID
verification flow in existing
applications or any applications of
relaying parties intended to so along
with the service right if you have uh
the service and if you have the SDK
alone you should be able to simply plug
it into any uh react based application
or retrofit into any react based
application and you should be able to uh
simply get the open forb flow and the
scan and upload vc verification flow
without any hassle that is the intention
of verify SDK so uh inverify SDK again
uh you could see the code base uh
undergy SDK next component that we will
look at is the NG verify eway Okay. So,
Agify UI is again a reference
implementation for uh Ingverify. The
service what we talked about or the SDK
what we talked about that is comprised
and that is integrated into Egypt UI.
Verify UI is a demo application that is
created by uh MOSIP where uh both the
SDK and uh services are integrated. So
you can actually go ahead and look at
the collab URL of EGF and see this is
the UI that we serve. If you look at
here right the uploads QR code, scan QR
code and VP verification all these ones
are actually coming out of the Ing
verify SDK and we have uh taken the
route of integrating those uh SDK into
our inverify UI. So this is more or less
like a reference implementation what we
have alongside uh the entire inverify.
Again verify UI is also a react based
application because we have to integrate
the react based ng verify SDK component
into our NG verify UI. So
you could see the code base is under the
directory called verify UI and you the
readme actually gives you a pretty good
idea on how you can run this one
independently but we will go into detail
of how to set up and run it using docker
compos for minimal uh setup.
Apart from all these uh we have uh if
you look at aglifies repo what we all
have is uh the we have API API test we
have UI test and we have uh some things
related to deployment also we have the
documentation. So most of the
documentations related to different
flows how the flows works everything you
can find at the docs and each flow for
example how the open ID for VP flow in
the SDK works you can actually see how
the flow works here what are the
different components of the flow what
are the different steps of the flow how
the integration is happening all those
things you can look at here now let's
look at how we can set up verify and
local so that we can continue with our
token development and testing. So for
local setup we will use docker compose.
So the docker compose related uh code
and the docker compose uh files are
available in the docker compose folder
of inverify. If you go inside docker
compose right we have a detailed readme
about what are the basic prerequisites
required and how are different
components and how different uh um
configurations are required for running
the service but I'll go through it very
quickly and we will look at the docker
compose file to see what are the
different components available as part
of our local setup so if you look at it
um there are three different services
available as part of a docker compost
which is the verif service and the next
one is verify UI and third one is the
postgress. So we will go through each
one of them in little more detail. So
verify service is the same service we
talked about before. Uh this is the back
end service of incident verify which
exposes all the APIs required for VC
verification and also for open ID for VP
sharing and verify UI is the reference
UI implementation whatever we have which
internally integrates the SDK also and
the next one is the Postgress DB.
Postgress DB is required for uh saving
the authorization request and all the DP
submissions in the back end. So the post
base DV is used for that purpose.
And coming back to the docker compost
there are some more configurations which
are required. So DV in it contains all
the DV initialization scripts. So it
will take care of all the table
creations and all the schema creations
all those kind of stuff and
configuration is again uh the config
JSON that is required for the verify UI
uh to show different kinds of
presentation definitions different kind
of VCs that are requested. So you can
you can configure this to have your own
VC to be requested for open id for
vflow. So starting the docker compose
again um you can continue to use the
default configuration whatever you have
but if you need a specific uh
configuration to be updated it is
possible to do it here you can just
update this file and you can restart
your docker compost. So after setting up
your local machine with all the docker
needed setup. So here we have provided
the links for all the prerequisites just
download and install all the necessary
components required based on your
platforms and uh we have provided a
little bit detailed uh uh detailed uh
info on how the configuration works and
what are the different configurations
what are the different parts of the
configuration all those things and uh
doing and starting the docker compose is
fairly straightforward. We could do a
simple docker compose minus v uh docker
compos up minus v. So
this will start all the services and it
will you the UI will be accessible at uh
local host 3000 and your local host 880
will be running your service and you
should be able to access your uh API
documentation through swagger ui uh
following this address. As we have
completed uh the local setup and now we
will look into the SDK part of a verify
we will look a little bit deeper um into
how we can uh test how we can develop
and how we can integrate the SDK. Again
uh SDK itself has a pretty good uh
documentation on how we can integrate
it. So the EG verify SDK like we
mentioned before uh it come it exposes
couple of components which are required
for integrating with any other react
application uh thisly have the features
of scanning the QR code uploading this
QR code and uh integrating the feature
of open ID for VP sharing. So if you go
look at uh npm uh you should be seeing
ng verify SDK react ng verify SDK you
can simply install and integrate the
project uh integrate the library into
your project using npm install at
massive/react
verify SDK and uh if you can go to npm
you should be able to see that the the
latest version and uh 030 is the latest
published version and you should be able
to pull it in. And if you want to if
you're interested in any beta versions
which is available, you can go into
versions and you can see there are
different beta versions available if you
want to use any of those. But latest
release version is 030. You can continue
to use that. Cool. Uh let's go back to
uh our readme of verify SDK and we will
look at how we can do the integration.
So like we said there are two different
components which available. One is the
open edp verification. Uh we'll go
through the first component which is
open for verification itself. And here
it talks about what are the different
props available and what are the
different uh data types and all those
things available as part of the
component and integration of the
component. We can see it here on the
example usage. So if you have a existing
component and you wanted to simply start
using the open edvp feature uh you
should be able to integrate it with uh
just importing the component and your
project by installing the SDK and uh
calling this open verification component
with the respective uh uh props. So I'll
go through the simplest props whatever
we have as of now. Uh the first one is
the trigger element. Sugar element
stands for uh any button or any any
other component on click of that
particular component you want to
initialize the open ID for VP flow uh
that is your trigger element. So if you
don't provide the trigger element
element basically the component will
immediately start initialize
initializing and it will start the flow
without any any external events and the
protocol is what is the default protocol
that is used for your QR code. So if you
are aware of the open ID for PPP spec uh
a protocol or custom URL scheme is used
for open ID for VP. So most of the valid
supports open ID for VP col/. So we just
kept it as uh the default value. You
either can provide uh or you can ignore
to provide. If you ignore to provide the
default value of open ID for VP/ will be
used and next one is the verify service
URL. So the open for VP uh component
actually works with
EG verify service. So you have to host
the service somewhere and provide the
URL to it because it is it it it needs
to be communicating with the the EG
verify service with the APIs specified
for making uh uh the making the
authorization request creating the
authorization request fetching the
status and fetching the result doing the
verification all those processes. So
verify services URL is required. It is
directly coupled with uh the verify
service and uh if you have any
presentation definition uh ID to be
specific or any presentation definition
to be specific can be passed is so this
component actually takes in uh
presentation definition or presentation
definition id either one of this can be
passed. So if you are passing an id it
expects uh the back end database to be
having uh presentation definition stored
in the tables and the reference ID is
being used or else you can actually pass
the definition all together where you
don't have to have the presentation
definition stored in the back end and if
you pass the definition all together the
the presentation definition itself will
be used for creating the authorization
request. The next parameter that we will
look at is on BP processed. So here this
is as also an example option. We have uh
two different uh uh props which are
which were available to pass either on
VP received or on VP processed. These
two different ones serves different uh
purposes and onvp refer uh received what
you will get is a reference to the
submission so that uh you can actually
go and push the result later stage. So
we the flow that we are looking at is if
the server wants to have only the
reference and the server wants to
communicate with the verify back end to
get the result this kind of flow can be
used where the UI doesn't need to be
aware of what is the result it only
needs the reference of the result but uh
let's say if the UA needs a result for
some further processing at the front end
or just showing some status or some some
some simil similar stuff then on BP
process can be used. So in this you will
get a final result where uh the
verification status of your VP proof and
verification status of your each VC is
present in the VP all those things you
will get. So that is another prop that
you can send and there is a a prop
called on QR expired. So for example
right uh the each authorization request
has its own expiry. So by default now it
is kept as uh 5 minutes but it's again
uh from the service side it is a
configurable value. So on QR code when
the QR code gets expired what is the
action to be done that is again a call
back that you can provide from here and
obviously you have a uh on error call
back where at any point if you have any
error what should be the action to be
taken from the uh relying party whoever
is integrating the open forp company.
Cool. Now uh let's look at the next
component. Uh the next component is uh
the QR code verification component. And
again this is also the integration is a
similar fashion but uh again the props
are slightly different. So the QR code
verification component again uh you
simply integrate it like you bought it
from SDK and you call it. Here also the
component requires a back end because
for the verification process the
verification is done not done at the
front end the verification is done at
the back end and result is sent. So you
will have to provide a back end URL for
your QR code verification component and
here also we have a similar behavior uh
to like the open ID for VP component. We
also have a on VC received and on VP
process. This also is the same fashion
we talked about on on VC received you
will get a reference of your VC that you
have asked for verification and later
point you can use that reference to
fetch the result. What is the
verification result and on VC process
you will get a final result of your
verification of whatever VC you have
submitted for uh submitted through
either scan or upload. So here if you
look at it the
in the QR code verification component
you can actually uh send couple of uh
props uh for example enable upload
enable scan. So the both the flows of uh
uploading and uh both the flows of
uploading and scanning are integrated in
the same component. The same component
can be used for uh uploading and
scanning. So if you look at our example
of integration here right uh the upload
and scan QR code we have the flows
differently in two different uh tabs. So
for here we have disabled the scanning
feature of the same component and for
here we have disabled the upload feature
of the component. These features can be
toggled using enable scan enable upload
enable zoom all these kind of props
which we are passing.
So this is the integration of EGF SDK.
So if you look at our verify UI code
right uh we have uh it integrated in a
similar fashion and we have used it. So
if you are developing a new portal uh a
new party portal for example you can
easily integrate this and you can get
the benefits of uh QR code scanning QR
code upload and uh open for VP very
easily. Now that we have discussed uh
about all the different components and
all the different integrations uh also
the local setup using docker compose in
ng verify. Um so we will just look at
what are the additional docu
documentations and stuff available. Um
if you look at EG verifier right almost
all the docs are related to different
flows and everything and some sample
postman collection all these things are
available under the doc section and uh
all the readmes for respective modules
are available in the root folder of all
the different modules for example for
SDK we have it at the SDK's root and for
the service we have it at the root of
the directory and all the even if you
want to individually test and set up
that uh docs are also available here.
Apart from these docs uh all the other
docs related to technical overview and
all those things are available at uh
docs.g.io.
So if you go to NG verify section of uh
docs of NG you can see uh what are the
development things uh the technology tag
different components support the
browsers customization and even the
integration guide for all these things
are available here
that brings us to the end of the session
and hope you guys understood uh some
more on the ag technical site also
thanks for tuning







# IC product overview
Hello everyone, welcome to the product
overview session of NG Certetify. I am
Vanya, product owner for NG Certetify
module.
Over the next few minutes, I'll take you
on a journey starting with what
NGCertify is, the key highlights of the
product, who can use it and how it works
in a real world scenario.
Before we dive into certetify, let's
step back for a moment and look at the
biggest picture. In ng stack
is built as a complete ecosystem with
three powerful modules each designed to
serve a distinct role in the credential
ecosystem. Ing certify for issuing
verifiable credentials. Ing validot is
used for securely storing and sharing
those verif credentials. Ing verify for
verifying credentials instantly.
NG is built on a global standards like
the W3C verifiable credentials data
model, open ID for VCI, open ID for VP,
ISO, IC.
This ensures maximum interoperability
and trust. Today our focus is on
NGCertify the trusted module for
creating, signing, issuing and managing
the verifiable credentials.
So what exactly NG certify is? Think of
it as a trusted credential issuance
engine. A solution that enables
authorized entities to issue digitally
signed credentials quickly, securely,
and in a way that can be instantly
verified.
Uh let's make this real with an example.
Imagine you have just graduated from
university. Instead of waiting weeks for
your printer certificate and worrying
about it getting lost or forged, you
receive a secure digital credential in
your valot
within minutes of results being
published. You can share it instantly
with your employers and they can verify
its authenticity in seconds without a
single phone call or a piece of paper.
So how does your degree become a
verifiable credential in your valot?
This is where certify comes in.
Your university can integrate with the
certify. So the certify converts your
university's degree record into a W3C
compliant verifiable credential and
issues it directly to your mobile valot.
From there you can store it, share it
and have it verified anytime anywhere.
That is the power of the NG certifi
making credentials instant, portable and
tamperproof.
So as a product what it offers behind
the scenes certify operates seamlessly
by integrating directly with the
existing database for realtime
credential generation.
It is built for all issuers from large
scale and government programs to small
private institutions.
It offers flexibility by allowing
issuers to customize credential
templates to suit different data formats
and requirements.
And it adapts across industries
delivering an end to-end management
experience from credential creation to
secure revocation.
And the benefit speaks for themsel.
Automated issuance. As you all
understand by now, credentials are
issued in seconds without manual
processing.
Enhanced security is attained by each
credential signed cryptographically
ensuring authenticity and preventing the
tampering. Crossplatform
interoperability works with any valid or
verifier that follows global standards.
User empowerment holders control when,
how, and with whom they share their
credentials. Ease of use for issuers and
holders.
Who can use it? Ingitite is incredibly
versatile. So it can be used from large
organization to individuals.
Large organizations such as education
institutions can integrate certify to
issue their diplomas, transcripts and
the degree certificates. While employees
can use to generate job offers or salary
slips. Governments can provide IDs,
license and permits. Professional
associations can issue certifications.
Even individuals educators or
professionals can issue course
completion certificates or skill
verifications.
Basically, if you have a data that needs
to be trusted, portable and verifiable,
ng certify can handle it and issue a
verifiable credentials.
What is the key feature?
at its core certifies primary capability
is credential issuance with full support
for W3C verifiable credentials across
multiple schemas.
The product offers the VC issuance in a
two integration approaches. One is
integration with an existing registry
where the credential is already
generated and signed at the source. In
this model, certifi's role is to align
the credential with global standards and
issue it to the valid or a holder on
request. For example, in MOSUP ID, a
national ID is already converted into a
verifiable credential and signed. When a
valid request a national ID certify
fetches the pre-generated credential,
aligns it with the standards and issue
it to the valid. The next approach is
integration using raw issuer data.
There the issuer only has the data and
certify is responsible for generating
signing and issuing the credential. For
example, in the case of university
degree certificate which we saw earlier,
if the university has the student
graduation data, certify can integrate
with the data source through postgress
or CSV
and
generate the verifiable credential, sign
it and issue it to the graduate. To
enable both the approaches, certify
provides two key plugins. VC issuance
plugins responsible for integration with
the existing registry while data
provider plug-in responsible for
integrating the data source to generate
a VC.
The next feature we are seeing is a
generation and signing. The essential
part of the VC issuance is VC generation
and signing. Certify supports multiple
signing algorithm RSA, ECC and ED25519.
It also allows the issuer to configure
the algorithm that best fits their
requirement.
It also supports DI binding through D
key and DT web ensuring an additional
layer of trust and security.
Certify is built for crossplatform
interoperability as we seen earlier
since it was built on open ID for VCA
standards. It is fully compliant with
the standard which means it can be used
with any valid or holder that follows
the same standards.
Since also certify ensures a full life
cycle management by enabling credential
revocation through an API based design
with discovery support giving issuers
the ability to revoke credentials
securely and transparently
certify can issue the credentials in two
formats as of today JSONLD and SD chart
while MOG MDL and signed JWT
is coming soon. Issuers can configure
the preferred format when defining each
credential type.
Now that we understood certify has a
major capability on two features VC
issuance and VC revocation.
So the process of issuing a credential
with certify is straightforward. Connect
your data source or the registry. Create
the credential digitally sign it and
issue it. If circumstance change, you
can revoke it through an API ensuring a
transparency and complete life cycle
control.
Here is an highle architecture of the
certify. Each component plays a role in
making credential issuance secure,
efficient and compliant with global
standards from data injection to signing
to binding to delivery. As you see the
data provider plug-in is responsible to
connect with the different data sources
to create a VC and issue it while VC
issuance plug-in is responsible to
integrate with the existing registry to
issue a VC. Key manager service is
responsible to sign the key and provide
a binding feature to pro issue the VC to
the wallet.
The best way to experience in certify is
try it yourself. Our sandbox environment
lets you to test and build.
You can try the ING mobile valid in web
valid to experience ng certify as well.
To know more about certify
you can refer to the documentation
and to know more about the instack also
you can refer to the documentation.
As you can see this is the incertified
documentation where you can able to
understand the features and how you can
integrate how you can test all the
details are available here. Similarly,
to know more about NG stack, you can uh
refer to the this documentation on the
same.
And that brings us to the end of this
overview. To learn more, simply scan the
QR code on your screen or visit our
documentation for detailed guides,
technical references, and integration
support. Thank you.






# Inji Certify: Technical Deep Dive – Verifiable Credential Issuance
Hello everyone and welcome to the
technical overview session of NGCertify.
I am Push the senior developer for NG
certify. So today I'll walk you across
the various technical aspects of NG
certify as a major ng stack component
and explain how it is the starting point
of the verifiable credential life cycle.
So here we'll be discussing on the
building blocks of uh ng certify
uh the digital credentials plug-in
architecture u the vc issuance flow and
the detailed architecture of ngcertify
components.
So let's deep dive into the session
while knowing about ngcertify and
everything that matters about ngcertify.
So before we move into the uh detailed
archite architecture view of NG certify
I want to discuss this uh VC issuance
and VC revocation flow. It's a simple
flow where we have a data registry and
then data registry will uh like
integration with database will be used
to fetch the data with the help of a
data brider plug-in and then that will
be used for credential creation through
a VC template or a velocity template. We
are using the velocity template uh to
fet the data we got from data source
registry and then uh when the VC is
created we get the JSON object or or a
SD chart uh depending on the format for
which we are trying to download a VC and
then we get the credential when we sign
it using the cryptos suit and algorithms
and uh lastly a response is
uh sent uh that that is a VC response
response which contains the credential
the verifiable the verifiable credential
that is uh attached with a like there's
a proof attached with the verifiable
credential which helps in the
verification of the VC uh then we have
the VC revocation flow so any issuer
that will trigger a revocation request
so that will be sent to the revocation
API and uh if the status uh revocation
that is we have enabled the status for a
particular VC Then in that case uh for
that particular VC whatever entries we
have in the table uh VC request will be
uh revocation request will be triggered
and the VC will be revoked
and it will be saved in another table
that will store the status of the VC
that this VC has been revoked. So this
is how the VC revocation flow works.
So this was on the VC issuance flow. Now
I'll start on the highle architecture
uh for ngcertify.
Yeah. So first let's discuss uh this
architectures
and then we have a we'll have a detailed
view of the architecture where I'll
discuss the flow how how ngcertify
works. So this is the API layer.
Um yeah so first one is the API layer uh
with which the wallets and all will
integrate and they will send a request
directly to the API layer that is the
issuance API and then the next is the VC
signer and the templating engine. Um so
this templating engine so whatever data
we get from the data provider plug-in or
the yeah from the plug-in level. So if
we go down here we see
that here is our plug-in layer. So this
uh we go to VC issuance plug-in then
this connects directly with the
credential issuers. It issues the VC and
sends to certify and if we go to data
pro plug-in then connects with the data
sources
uh it uh compiles the data and then
sends it to certify. Then the certify
makes use of this templating engine. So
we have defined a uh VC type for certify
where we can store all these uh uh
template data and all in a in a table
and based on whatever is the request we
can fetch that template and uh then that
template is evaluated with the data we
get from the data provider plug-in from
this layer. So this data uh this data
evaluates the VC template. We get the VC
structure which is uh which is an
unsigned VC. Then this templating with
the unsigned VC is sent to the VC
signer. This VC signer signs the VC
attaches proof with the verifiable
unsigned ver unsigned credential and
this credential then becomes the
verifiable credential and it is then
uh through the it is then sent to the uh
as a response to the
uh wallet uh with the help of this
issuance API who made request to this
issuance API. So this is what is the
structure what looks like a
uh highle architecture for ngcertify.
Now if we discuss the flow for ngcertify
uh so here there we'll discuss all the
flows like how
request is sent and then it is uh sent
how it is tackled in the uh in case of a
vice plug-in and how it works in case of
a data provider plug-in. So all these
things we'll discuss.
So this can be considered as a highle
architecture flow for LG certifi. So we
have the client that can be a wallet. So
it sends the request to the credential
API that is the API layer and then we
have the two plugins VCU plugin and data
provider plug-in. So if the request if
the plug-in mode uh that we are using in
ng certify uh we define it through a
property that which plug-in mode we want
to use. So if you go to this vc plug-in
mode then it fetches the v connects to
the data source internally it fetches
the vc signs the vc and returns it to
certify. So complete uh object is
returned to certify. In case of a data
provider plug-in, it is sent to the data
provider plug-in. It returns the JSON
object data in the form of JSON to
certify. Certify uses this uh JSON. It
goes to the credential configuration.
This is where we store all the
templates. This is the table credential
config config table where we store all
the templates uh based on the credential
type and all uh based on credential type
context and whatever we have in the
request respective to format.
Uh so we try we fetch the template VC
template from here. Uh it returns the
template we evaluate the template with
the data we got from the data proer
plug-in that is the JSON. It returns the
unsigned VC and this unsigned VC is then
used with a credential. This is a
credential superass
uh that that has implementation for all
the formats. So we have JSON W3C JSON LD
implementation for this and also SD dot
implementation for this based on the
format it uh it implements uh that
particular uh credential type.
So uh it takes the unsigned VC u signs
the object with respect to the signature
crypto root and algorithm. So all these
things are defined in this credential
configuration and
so this uh it science uh uh the VC
attaches the pro proof object with the
VC or in case of a jot u attaches the
header with the respective uh components
or elements in case of a jot or SD jot
and it returns the signed VC
uh it returns signed VC as a response
and then the wallet it is able to
consume that. So this is how the flow
for certify looks like.
So this is the highle architecture of
certify.
And now I want to discuss a little bit
about the plugins.
So
so here you can find all the plugins
plug-in related data. Uh this is the
repository for plugins. So we have mock
certify plug-in. Here we have multiple
plugins.
So here we have the multiple plugins is
m
mock vuence plug-in mock csv data pro
plug-in mock id data product plug-in
mock v isuance plug-in. So this one and
then we have Mossip identity certified
plug-in that connects with the fetches
VC in the VC issuance plug-in mode and
uh connects with the Mossip uh identity
uh database for fetching for getting the
identity data then we have postress data
pro plug-in. So here uh for for the data
that that is returned from the data
project plug-in uh different tables can
be defined uh based on the use case that
is related to this use case only or
specific to the use case. Then we have
Sunbird RC certified integration plug-in
that connects with the uh Sunbird uh
Sunbird registry to fetch the data and
uh returns the VC object. So this is the
highle overview on the plugins
uh certify already we have discussed
want to discuss few things on u on
credential configuration. So this how
the credential configuration or
configuration looks like. So this is the
body for a credential configuration.
Here we provide the VC template config
key id which is spec specific key id. Uh
when we add the data in a issuer
metadata
and then we have context urls credential
types sd jot vity this is specific to
sdj jot. So is the unique uh VC type
that is used for the SD jot. We have the
format. So we support three LDP, VC, MSM
doc, VC plus SD URL. This is the URL
that is hosted. Uh we get it as a result
uh like this is the URL uh with where
the public key uh date file hosting is
done.
So we specify that particular URL where
the date did date.json JSON did JSON
file is hosted containing the public key
for all the signatures
like ECC K1 ECC R1 E5519
and with the help of this it is then
attached in the verification method
value of the proof
uh with the K ID appended to it so that
it helps in verification
and then we have the key manager app ID
ref ID so all these values have to be
provided
and we have the claims this SD SD
claims.
This is uh for defining the disclosure
path or SD claim path for SD jot. Then
we have the display that is the display
of the verifiable uh VC type or the
verifiable credential
uh like how whatever name and logo you
want to render it when you want to use
it in web or with the wallet. So this is
defined in the metadata display order
scope uh plug-in configurations
credential subject definition MSM do
claims SDJ claims. So all these fields
are defined. So
you can get all
like whatever is required you'll get in
the postman request for ng certify. So
here's the postman request defined in
the ng certify repo. Get this all.
So you can uh
yeah you can add the VC you can fetch a
particular configuration update
configuration and
like you can fetch it with a credential
configuration key ID. So
this how the request look like or looks
like for a key id. So you get whatever
we added in the in case of add
credential configuration you'll get the
same response here
and you can update and delete. So these
are few APIs for now I'll go to
wellknown. So this is the issure
metadata.
So if you want to check how issue
metadata for different formats look like
you can go to this uh ID for open ID for
VCI specification.
So here you can see the metadata for
different types of formats that is W3C
verifiable credentials and then ISO,
MDOC or MDL and then we have IETF SD
jot. So this is where you can check on
the issuer metadata. So this metadata
is exposed by certifi endpoint.
Yeah. So this is exposed by a certify
endpoint
uh that is the issuer metadata and which
is used consumed consumed by the wallet
uh so that you can they can fetch the um
credential subject to claims uh from
this issuer metadata and the metadata
display that what needs to be displayed
for a verifiable credential uh when they
are rendered in web that is the name and
logo of a particular VC type. So this is
the URL for uh fetching the open id
credential issuer or the credential
issuer metadata. Then we have the date
did metadata also. So here we have the
date file hosted. So we host a date
file. I'll show you sample did file
after this. So whatever key we are
assigning a VC with or whatever keys we
have defined while adding VC types in
the credential configuration uh based on
that uh whatever unique keys or
combinations we have for app ID and ref
ID based on that uh the d.json endpoint
or djson file document will be updated.
So if I show you a sample
metadata document. So this is a sample
metadata document. If I show you a dead
did end
Okay, sorry. Yeah, so this one is the
d.json file.
So you can specify this URL here. So
currently it's configured for mosip. So
if you are using it for your use case
then you can specify your particular URL
and then uh you'll uh you'll be able to
get this tit document when you head this
hit this uh issuance.
/te.json endpoint
and then uh you can uh copy this
document and paste it to the URL uh or
to the to to your particular GitHub URL
so that your D key is hosted from that
particular URL and that will then be
used for the verification of the VC. So
this was on the uh URL part.
Now I want to give you a little overview
on how to set this service locally. So
what all changes you can make. So I've
already showed you the plug-in
architecture. So currently the plug-in
which I'm using is the mock cv data pro
plug-in. So this is how you can specify
which plug-in that you want to use. You
can change this value based on the class
that you find in the plug-in uh plug-in
uh repository.
And like these are some specific
properties defined for this particular
use case. We have a identity data file
CSV file for the identity data.
So here we have defined the CSV.
So whenever certify service builds uh it
uh it takes the data from this CSV file
and returns it as a JSON object uh
through data product plug-in to in
certify certify then uses it to fetch
the template based on the request and
then sign the VC uh create the VC and
then sign it. So this is one thing and
we have like did URL I was telling. So I
have specified this date web URL to my
personal uh GitHub URL my username
GitHub io the repo where I want to host
and the folder. So if I go into the
GitHub and show you this particular
thing. So this is my repo. This is my
username. This is my repo and this is
the folder and this where I have hosted
the date.json file.
So this is one thing and now I'll go to
XML. So you want to run this service
locally. I'll add a runtime dependency.
file plugin
sudo snapshot. So now I have added this.
[Music]
Okay. So runtime dependency is added.
Now
if I try to run the certify service,
I should be able to run the service.
You can use the same way to run the
certify service locally. Now I should be
able to access my data endpoint.
So I'm running it locally. So I am able
to access my data endpoint.
Yeah. So this is the exact URL for D
endpoint and I have three keys in my
table. three unique keys ECC R1,
ECC K1,
ECC R1 and E25519.
I'll quickly go to my DB and show you
the same.
So
this is the table which you can check.
So I have five entries here,
five different use cases and uh this is
where you can check that this is the VC
template. I'll show you the structure
for VC template also. And here I have
configured the display order. Okay, this
is the crypto suit which I have defined
which we have which I want to sign the
VC with. And then we have
the credential type and for credential
type saved in a comma based format. It
comes as a list. So we don't have the
context and credential type for SD J and
MSM block. You can go through the
specification open ID for VC
specification for the metadata. So based
on that only these values are populated
and we have the date URL
so
yeah so this is the table this what a
table looks like and like I have ECC
yeah I have three use cases that is ECC
R1 R1 R1 K1 and D25 so there are three
unique combinations so in my date file
I'm getting three unique keys in the
verification method. So if you'll add
more keys like RSA or something then
you'll get that also. So this is how the
dead works and I can simply copy this
and go and paste it to my GitHub repo
and sometime it will be hosted on this
particular URL.
So this is a hosted public key
that is hosted from my repo. you can
change it uh you can use it modify it
and then use it for your use cases.
So this one is on the uh setup part of
ng certify how you can start the service
locally
and then for uh uh the vc is insurance
flow
you'll have to
yeah you'll have to get an o server au
server attached so you have to use a o
server through which you can
authenticate
and uh then when you have a valid
authentication token
uh with a with a correct scope in the
token and that token will be used in
certify.
So suppose this is my certify request
for farmer credential. So my use case is
far credential. I go to authorization.
So this is the access token which I am
getting from the authorization
that I'm doing through e signet for my
use case.
So this one was the uh the authorization
uh integration of authorization service
or O service to certify to use it uh
locally and then we have uh this is the
VC request. So uh currently my format is
LTPVC.
So for that I need type and context.
So this is the type and this is the
context.
And then we have the proof. So this
proof
this proof has um proof defined like it
may be a
uh it's a like j it is a JWT proof uh so
proof type is JWT. Currently we are
supporting uh JWT only
and there's a proof which uh uh which is
generated by the wallet when we run from
when we use it from the wallet then this
proof is generated by the wallet. We
have a field also present in the table
that is the proof type supported. So
this is the proof type supported. So
these are all the alos which we can use.
This is a jot we support the jot proof
currently and this is the assigning L
value supported for that
proof type. So this everything is can be
checked inside uh in the open ID for VCI
specification. So it is all mentioned
there.
So this was on the VC request part. So
if I want to use SDVC
then I'll comment then I'll I'll remove
the LGBT or I'll change the format to
LDPvc and I'll I'll do not need this
credential definition containing type
and context. I'll only need the VCT and
format and for MSM doc we'll need the
format and the dock type field. So all
these request format and uh metadata
format uh all these uh are specified in
the specification open ID for BCA
specification. So that can be checked
here
and uh when whenever we send this
request you'll get a BC response
containing the credential.
Yeah. So this one is on the
uh request structure and response
structure of certify.
Okay. Now that uh my authentication
server is running. So I'll try to fetch
a VC.
I'll try to download this VC from this
request.
So I'm getting this VC. So this for
LDPVC.
Now I'll change the request type.
I'm just showing a few scenarios that
are already registered
or already there uh configured in my DB.
Okay, this error can be ignored.
Can retry the request
now. So I'm getting another VC this
time. This is the request.
This is the context
I'm getting.
It's with ECC R1. So here if I go to
request body,
I'll be getting it.
So this is the credential type comma
based and this is the
context. So this data model 2 I'm using
this request. So two contexts are there
based on uh that are saved uh in a
sorted format with a comma separated as
a comma separated string and this is
what we have. So it tries like in the
request also it takes the context and
tries to convert it into a sorted comma
separated string and then it tries to
fetch this uh particular row so that it
is matched and we get this VC template.
If you see the structure of this VC
template
decode, you get this structure.
So later we got this VC and you can use
this
to verify.
You can go to uni verifier.
You can paste this VC there
and try to verify it will get verified.
Financial proof is EC ECC R1 discounting
to ECCR1 of 256. This is the
subject
and this is the issuer that is the URL
that is pointing to the host. uh the key
uh the DD URL which I specified or
configured in my DB
in my use case.
So this I will show another one with SD
chart
should be able to fetch it with SD chart
also.
So we have got this SD credential you
can copy this. It will be with
disclosures.
Copy this. You can open it in some dory.
I'll open it here. You can open it with
jot.io or sdj.co.
So here I'm getting the payload for this
for this jot.
So this is on the vc issuance part.
So more or less we have uh covered
everything from uh what NGCertify is
from Benji certify features the features
of NG certify and uh then we have
discuss the architecture highle
architecture the VC issuance flow and
also the uh the VC download like local
how to start up local service and how to
test VC download. So we have covered all
things in this session.
Uh
now I want you to
uh check this uh replay the video and uh
um clear your doubts and then maybe
start uh and maybe uh start playing
around this uh certified service setup
and also you can go through our
documentation
uh on ngtag and ng certify also you can
uh scan this QR code to know more. So,
uh this is all about today's session. Uh
thank you.