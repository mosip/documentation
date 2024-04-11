# Knowledge Based Authentication

Knowledge-Based Authentication (KBA) is a security measure to verify the identity of an individual based on information that is typically known only to the individual being authenticated. This method relies on the understanding that the person requesting access to a system or service possesses certain private information that only the legitimate user would know.

In KBA, users are often asked to provide answers to specific questions or prompts that are related to their personal history or identity. These questions could cover a range of topics like:

1. Personal information (e.g., date of birth, address, social security number)
2. Account-related details (e.g., last transaction amount, account creation date)
3. Preferences or history (e.g., favorite color, first pet's name)

eSignet has expanded its authentication options to include KBA as one of its factors. With eSignet's integration capabilities, existing ID repositories storing user specific details can now be easily integrated with eSignet. This integration enables OpenID based login, allowing users to access relying party services seamlessly.

The below mentioned scenario describes a user attempting to download a VC (Verifiable Credential) from the list of VC issuers through their mobile wallet (for example., Inji mobile wallet). The user is verified using Knowledge-based authentication (KBA) through eSignet.

### Prerequisite:

1. Resident has installed a mobile wallet (for example., Inji app) on their mobile device
2. Resident has received the policy number from their insurance provider, which would be required for KBA

### Steps

1. The resident accesses their digital wallet (e.g., Inji mobile wallet) and taps on the plus '+' button.
2. Resident selects their preferred issuer from the available list.
3. Resident provides their **Policy Number**, **Full Name**, and **Date of Birth** as credentials for KBA login.
4. Resident clicks on the Login button.
5. Upon successful completion, the user downloads their Insurance Card into their digital wallet (Inji mobile wallet).

<figure><img src="../.gitbook/assets/KBA eSignet1.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/KAB eSignet2.png" alt=""><figcaption></figcaption></figure>
