# Onboarding Pre-requisites

## Onboarding Pre-requisites

Before you request registration through the [Onboarding Form](integrate-with-e-signet.md), there are a handful of things worth having ready on your side — your development stack, a way to handle the tokens eSignet returns, a key pair, and a callback endpoint that knows what to do with the result. Getting these in place first means the registration step itself is just filling in details you already have, rather than something that blocks you halfway through.

### 1. Prepare Your Development Environment

Pick the technology stack you'll build your integration in — PHP, Python, Java, Node, Kotlin, Swift, or whatever your team already works in — and choose an OpenID Connect client library for it. _(Refer to the library list here) \<LINK TO BE ADDED>_

### 2. Plan for UserInfo JWT Handling

eSignet returns its UserInfo response as a signed, or signed-and-encrypted, JWT rather than plain JSON. Choose a JWT library or plugin compatible with your stack that can decrypt, verify, and parse it before your application reads the claims inside.

### 3. Generate and Manage Cryptographic Keys

eSignet supports only confidential clients, authenticated using the `private_key_jwt` method — your application proves its identity with a JWT it signs using its own private key, rather than a shared secret sent over the wire. That means a key pair is something you'll need before you can register at all:

* Generate a key pair, and store the **private key** securely — password-protected, hardened storage such as a vault or HSM, never checked into code or shared over email.
* Share the **public key** with eSignet in JWK (JSON Web Key) format. This is the key eSignet uses to verify the digital signature on your authorization requests, and to encrypt the `user_info` response it sends back to you.
* Use **different key pairs for development, test, and production** — never reuse a key pair across environments.
* **Rotate keys every 6–12 months**, or immediately if a key is ever compromised.
* The generated key pair must default to **"signing"** usage.

> **Note:** Only RSA key format is currently supported; additional formats are planned.

#### What Is JWK Format?

JWK (JSON Web Key) is a JSON data structure representing a set of public keys, using either the Elliptic Curve or RSA family of algorithms. It's the format eSignet expects when you share your public key during registration. [Learn more about JWK](https://claude.ai/cowork/TODO-link).

#### Converting a Public Key to JWK

If you already have a public key as a `.PEM` file, here's the quickest way to convert it to JWK for testing:

1. Visit this [site](https://russelldavies.github.io/jwk-creator/).
2. Select **Public Key Use** as **Signing**.
3. Select **Algorithm** as **RS256**.
4. Select **Key ID** as an alpha-numeric random string.
5. Paste your public key's PEM-encoded content into **PEM encoded key**.
6. Click **Convert**.

### 4. Design Your Callback API

Your callback API is the endpoint eSignet redirects the user's browser back to once authentication finishes — successfully or not. It's worth designing this endpoint's behavior deliberately, since it's the last hop before control returns to your application:

* The endpoint should render a user interface promptly, so the user isn't left staring at a blank screen while your backend processes the result.
* On **successful authentication**, the user is redirected back with an **authorization code**.
* On **failure**, the user is redirected without a code, but with an **error code** instead.
* Your application should handle both cases explicitly before letting the user proceed any further.

The exact URL patterns you're allowed to register for this endpoint are covered in the [Onboarding Form](integrate-with-e-signet.md), once you're ready to submit them.

***
