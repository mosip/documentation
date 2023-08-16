# Biometrics in Digital Identity- A Primer

Driven by major advances in biometric technology, biometric identification is now ubiquitous. From employee ID to national ID, or access control at housing societies to airport security, the use of biometric identification and authentication is growing rapidly. Even in personal spaces such as smartphones, biometrics-based log-in solutions have grown, with 77% of smartphone devices now using fingerprint or face biometrics to enable access. Encryption keys, passwords, and passcodes are being replaced with biometrics faster than ever. Computer Science experts predict that the range of options currently available to consumers in terms of biometric modalities used, and the way they are used, will only expand. 

In the first blog post of our series on biometrics, we present a primer on the basic concepts and terminologies that we will keep returning to. We believe that this is necessary to fully understand the debates around the role of biometrics in digital identity. Through this blog series, we hope to unpack various dimensions of the debate, identify unanswered questions, ideate on current solutions, and explore how such technologies can be safely leveraged to meet the objectives of UNDP’s Sustainable Development Goals (SDGs).

Derived from the Greek words ‘bio’ (life) and ‘metrics’ (to measure”, biometrics (\ ˌbī-ō-ˈme-triks \) is defined as the measurement and analysis of unique physical or behavioural characteristics to verify personal identity. The physical characteristics pertain to the individual and include fingerprints, facial features, iris patterns, and even DNA. Behavioural characteristics are related to the way a person behaves-the manner in which one speaks, writes, or walks (gait), which differentiates him/her from others. Some of the characteristics are a blend of physical and behavioural aspects. For instance, the voice of a person is mostly behavioural. However, it also depends on physical aspects such as age, health, and size of oral cavity, among others. These unique physical or behavioural characteristics can help identify a person or verify personal identity. Globally, dedicated scientific streams are working on each of these characteristics.  However, their effectiveness and usability vary significantly. Before we discuss a few of these characteristics and what makes them unique, let us try to understand some of the terminology. 

## Identification, Authentication, and Authorisation

Identification, Authentication, and Authorisation are terms often used interchangeably.  However, they are different.
Let us understand them with some simple examples:

Logging in to an email account requires three sequential steps:

1. 	_**Identification**_: The login page asks, ‘Who are you?’, and you respond with your e-mail ID, which could be your name or a random ID that you had selected while setting up the account. For the e-mail platform, you are identified through your User ID. However, you will still need to authenticate yourself to access your e-mails.
    
2. 	_**Authentication (Verification)**_: After providing your e-mail ID, you are required to key in your password and further ‘authenticate’ yourself. In general, the system challenges you to prove who you are by producing something unique that you possess which the system can verify; a shared secret that you have, such as a password.
 	
3. 	_**Authorisation**_: Once you are through with the authentication, you are ‘Authorised’ to access your emails.

Governance in large organisations, with more people than can be recognised through facial memory recall, requires some form of unique identification and identity verification process during transactions. 

Typically, in developed countries, modern primary health centres are well distributed. Almost all children in these nations are born in such health care facilities and issued birth certificates. The time and place of birth (location) recorded on a birth certificate makes the person unique in the country’s civil registry system. The ID systems in such countries (with ~100% coverage of civil registry systems) leverage the birth registry system for uniqueness and build their ID system from that point onwards. 

In developing countries, however, the reality is a bit different. The penetration of primary health centres is nowhere near 100%, as a vast majority of children are born at home. The issuing of birth certificates and coverage of the civil registry system also fall short of 100% coverage. The advancement of biometric technology over the last decade has enabled countries with large populations to uniquely identify people based on their biometrics, and thereby foster good governance with foundational identity systems.

### Foundational Identity Systems 

* These systems use identification mechanisms to ensure the uniqueness of identities in a system.
* They compare a combination of biometric and demographic information of a candidate, with what exists in the system. If a match is found, the candidate is considered a potential duplicate and rejected after due deliberation. 
* Countries that collect biometrics as a requirement to establish uniqueness in their foundational ID system can further leverage biometrics for authentication. 
* Biometric authentication generally uses a 1:1 approach.
* Foundational Identity Systems register a resident by storing and recording his/her unique biometric and demographic information in the system and issuing a national ID number against it. When there is a need to prove their identity at a later stage in a different context or circumstance, the ID, and a combination of demographic and/or biometric information, are passed through the system.
* The incoming information is matched with pre-existing records for the same ID.
* A successful match (authentication) grants the resident access (authorisation) to the service that they initially wanted to avail.

Both offline and online authentication mechanisms are possible. During **online** authentication, the match happens at a central location where identities or biometrics are stored as part of the registration process. There are also decentralised authentication models, where information pertaining to a subset of the population is made available for a match. Finally, **offline** authentication models use alternate arrangements for a local match such as biometric smart cards and QR codes, where matching happens locally.

### Biometric Modalities

Artists usually leave behind some kind of secret signature on the art they produce. Cavemen used fingerprints to ‘sign’ their cave paintings. Indeed, biometrics date back beyond the prehistoric era to the age of the Neanderthals, evidence of which is found in the Panel de las Manos at El Castillo, the earliest known cave art. A handprint on these cave frescoes resulting from a prehistoric artist blowing pigment against his/her hand, created the first indelible signature of an artist.  This is estimated to be at least 37,300 years old. It is interesting to note that the Neanderthals, and later, prehistoric cavemen, already aware of the uniqueness associated with fingerprints and wanted to leave a personal and distinct mark on their paintings which they believed could not be imitated or duplicated easily.

Fingerprints were also used in Babylonia (~1500BC) to execute contracts written on clay tablets, signed by both parties. One could consider this to be the first form of ensuring non-repudiation using biometrics against handwritten signatures. Studies on biometrics started early on in the written history of humanity. The stream has evolved, transforming itself into a robust and reliable scientific platform for various identification or authentication requirements.
While a plethora of biometric modalities is available, only a few have proved to be useful in identifying use cases and authenticating them. Let us explore some of them and understand what makes them unique, without comparing their effectiveness, usability, risks, or reliability.


**Fingerprint Recognition**
Fingerprints are nearly always unique, difficult to change, and less vulnerable to aging, unlike a person's face.  They, thereby, inspire confidence as a reliable biometric. The most popular of all biometrics for a long while, fingerprint recognition is truly standalone, due to the ease of use, reliability, and the advanced technology stage at which it operates.
What makes a fingerprint unique? Human skin is made up of three layers. The raised portions of the skin's outer layer on human fingers and toes are called friction ridges while the low lines between them are called valleys. When friction ridges leave their impression on a surface, fingerprints are formed. Fingerprint technologies focus on capturing this unique pattern, leveraging it for identification or verification purposes.

**Iris and Retina Recognition**
The iris is the coloured, ring-shaped region in the eye whose patterns are unique and different for each individual. Today, iris recognition is considered to be one of the most reliable and accurate biometric modalities available.

Iris and retina recognition are generally categorised as ocular-based technologies which are less vulnerable to aging or alteration. The patterns of the retina’s blood vessels are unique,  which are what retinal scans take advantage of.

**Facial Recognition**
Many unique features are associated with the face. Traditional facial recognition algorithms focus on the relative size, shape, or position of the eyes, cheekbones (which give structure to one’s face), nose, and jaw. There are three-dimensional face recognition sensors that can assess the face's third dimension (depth) features such as the eye sockets and nose size. Skin texture analysis is another approach, where the unique lines, patterns, or spots on someone's face are converted to digitally verifiable representations.

**Voice Recognition**
Multiple parts of the human body are involved in producing aural sound, including the vocal cords, throat, nose, mouth, and larynx. Since these are physical and unique aspects of the human body, the sounds produced by their orchestration is also unique. When sounds are clubbed with a person’s behaviour, be it speech delivery or the volume of the voice, the resultant combination is unique to that individual. Voice biometrics capture multiple attributes of the voice to arrive at the voiceprint of a person. Acquisitions are done by asking the person to read out a fixed text or a set of numbers, or to say something completely random, based on the algorithms used. This voiceprint is then used for identification or authentication requirements. It is important to note, however, that unlike with the iris or fingerprints, a person's voice is expected to change over time.

**DNA Recognition**
Deoxyribonucleic acid contains a unique genetic code or a blueprint of a human body. The DNA molecule is composed of a series of smaller molecules within. The order in which these smaller molecules are arranged makes for the uniqueness of each individual. The extraction of DNA characteristics or DNA analysis is a highly time-consuming and expensive activity. In addition, DNA may not be an effective modality in distinguishing monozygotic (identical) twins. However, it provides the most reliable form of identification and is therefore used in forensics.

**Other biometric modalities include**:

*	Hand/Finger Geometry: Geometric features such as finger length or hand width
*	Signature Recognition: Could be static (visual comparison of signatures) or dynamic (how the signature is made on a specific signing device)
*	Gait Recognition: Using an individual’s style of walking
*	Typing Recognition: Rhythm or pattern of typing
*	Electrocardiogram: A measurement of heartbeat pattern
*	Palm Print Recognition: A combination of fingerprints and hand geometry
*	Finger Vein Recognition: Using vein patterns beneath the skin’s surface
*	Ear Recognition: Using the shape of the outer ear

Stay tuned for Part 2 of this series!

### Resources and References:
* History.com
* Dons Maps
*	Biometricupdate.com
* M2sys blog
*	The Evolution of Fingerprinting - Hurtado, McGowan, Munoz
* North American Investigations - The History and Evolution of Fingerprint Identification (Darrin)
* Ancientpages.com
*	[https://www.nature.com/](https://www.nature.com/)
*	[https://findbiometrics.com/](https://findbiometrics.com/)

Content Credits: Sanjith Sundaram (Head - Biometric Ecosystem)
Write to: sanjith@mosip.io
