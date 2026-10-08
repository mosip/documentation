# Development and Integration with eSignet

## Development and Integration with eSignet

This page explains what it actually takes to connect an application to eSignet as a relying party — what has to be built, who builds it (frontend team, backend team, or nobody, since eSignet handles it), and how the pieces fit together. It's meant to give a clear picture of the integration effort at a glance, whether you're the one writing the code or just need to know what to plan for. For exact parameters, error codes, and the full API specification, see the [Development and Integration Deep Dive](https://claude.ai/cowork/development-and-integration-deep-dive.md).

> **Migrating from the Java-based eSignet?** Several endpoint paths and behaviors have changed in the Go version — see [Changes from the Java Implementation](https://claude.ai/cowork/development-and-integration-deep-dive.md#changes-from-the-java-implementation) in the Deep Dive.

### Before You Start

You should already have a registered `client_id` from [Onboarding Form](https://claude.ai/cowork/onboarding-form.md), a private key on your backend for `private_key_jwt` authentication, a registered redirect URI, and a decided set of scopes and claims — all covered in [Onboarding Pre-requisites](https://claude.ai/cowork/onboarding-prerequisites.md). Everything below assumes that's done.

### The Integration at a Glance

Connecting to eSignet comes down to six steps. Only three of them require your team to write code — eSignet handles the rest.

| Step                                                  | Who Builds It                            | What It Involves                                                            |
| ----------------------------------------------------- | ---------------------------------------- | --------------------------------------------------------------------------- |
| 1. Add a "Sign in with eSignet" button                | Relying Party                            | A button that sends the user to eSignet, using eSignet's ready-made package |
| 2. User logs in and gives consent                     | **eSignet - Standard step of OIDC flow** | Happens entirely on eSignet's own screens                                   |
| 3. Receive the user back in your app                  | Relying Party                            | Read the result eSignet sends back and hand it to your backend              |
| 4. Exchange that result for access tokens             | Relying Party                            | Your backend calls eSignet, proving its identity with a private key         |
| 5. Confirm the tokens are genuine and start a session | Relying Party                            | Verify the tokens, then keep the user signed in securely                    |
| 6. (Optional) Retrieve the user's shared details      | Relying Party                            | Call eSignet again if your application needs the user's profile data        |

The sections below walk through each step in a bit more detail.

### Step 1: Add a "Sign in with eSignet" Button

Add a sign-in button or link to your login page that sends the user to eSignet. eSignet provides a ready-made package, `@mosip/sign-in-with-esignet`, that renders this button for you with the recommended branding — your frontend team doesn't need to hand-build the button or the redirect logic behind it. If your application requires eSignet's stricter security options (PAR and/or DPoP), the same package handles those automatically; your team only needs to turn them on.

### Step 2: User Logs In and Gives Consent

Once the user clicks the button, eSignet takes over completely: it shows its own login screen (OTP, biometrics, wallet, or whichever method is enabled), and — if your application is requesting personal details — a consent screen where the user chooses what to share. Your application has no screens to design or build here, and isn't involved again until the user is sent back to you.

### Step 3: Receive the User Back in Your App

After the user finishes on eSignet's screens, they land back on a web address you registered in advance, carrying either a success result or a failure result. Your team needs to handle both cases: on success, pass the result along to your backend for the next step; on failure, show the user a reasonable message instead of a raw error.

### Step 4: Exchange That Result for Access Tokens

Your backend takes the result from Step 3 and calls eSignet directly to receive access tokens — this is the point at which your application actually gets proof of who the user is. This call must happen on your server, never in the browser or a mobile app, because it requires a private key that must never be exposed to end users.

### Step 5: Confirm the Tokens Are Genuine and Start a Session

Before trusting the tokens from Step 4, your backend checks that they're genuine and haven't been tampered with, and confirms the request matches one your application actually made. Once confirmed, your backend keeps the user signed in through its own secure session — the tokens themselves should stay on the server, not be handed to the browser.

### Step 6: Retrieve the User's Shared Details

If your application needs the user's personal details (for example, identity verification data), your backend makes one more call to eSignet using the access token from Step 4 to retrieve exactly what the user consented to share.

Please refer the link here _(Link to be added)_ to deep dive into the development details.

