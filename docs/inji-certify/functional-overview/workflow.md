# Workflow

\
**Understanding the workflow:**

1. The identity owner initiates a credential request by accessing the landing page.
2. Upon request, the user is directed to the authentication page, managed by a backend implementing OpenID Connect.
3. The user provides personally identifiable information (PII) to eSignet, which is verified against the identity registry.
4. An authentication code, valid for a single use, is provided to the third-party web service, facilitating token retrieval.
5. Upon successful verification of the access token, the credential is issued to the identity holder.
