# Artifact Signing Keys

<mark style="color:red;">**Page Coming Soon!**</mark>

## Overview

All MOSIP artifacts published to Maven Central are signed using GPG (GNU Privacy Guard). A GPG signature is a small companion file that lets you confirm two things: the artifact came from MOSIP, and it has not been altered since it was published.

### MOSIP Signing Keys

MOSIP publishes its public signing keys so that anyone can verify artifacts independently. The current key is listed below.

**Current Key**

<table><thead><tr><th width="220.37957763671875">Field</th><th>Value</th></tr></thead><tbody><tr><td>Fingerprint</td><td><code>XXXX XXXX XXXX XXXX XXXX XXXX XXXX XXXX XXXX XXXX</code></td></tr><tr><td>Algorithm</td><td>Ed25519</td></tr><tr><td>Active since</td><td>January 2026</td></tr><tr><td>Next rotation</td><td>January 2028</td></tr><tr><td>Keyserver</td><td>https://keys.openpgp.org</td></tr></tbody></table>

**Previous Key**

<table><thead><tr><th width="221.23828125">Field</th><th>Value</th></tr></thead><tbody><tr><td>Fingerprint</td><td><code>XXXX XXXX XXXX XXXX XXXX XXXX XXXX XXXX XXXX XXXX</code></td></tr><tr><td>Algorithm</td><td>RSA 2048</td></tr><tr><td>Status</td><td>Retired — used for artifacts published before January 2026</td></tr></tbody></table>

{% hint style="info" %}
All current and historical MOSIP public keys are concatenated in a single [KEYS file at mosip/mosip-infra](https://github.com/mosip/mosip-infra/blob/master/KEYS).
{% endhint %}

### Import or Download and Verify Keys and Artifacts

Before you can verify an artifact, add the MOSIP public key to your local GPG keyring. Choose one of the following methods — both produce the same result.

#### **Import the MOSIP Public Key**

**From the keyserver** _(requires internet access to keys.openpgp.org)_

```bash
gpg --keyserver hkps://keys.openpgp.org \
  --recv-keys XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
```

#### **Download the Artifact and Its Signature**

Each signed artifact has a companion `.asc` detached signature file published at the same Maven Central coordinates, download both:

```bash
curl -O https://central.sonatype.com/repository/maven-snapshots/io/mosip/<artifact>/<version>/<artifact>.jar
curl -O https://central.sonatype.com/repository/maven-snapshots/io/mosip/<artifact>/<version>/<artifact>.jar.asc
```

### Verify the Artifact

#### Verifying MOSIP Artifacts

When you download a MOSIP artifact from Maven Central, a companion `.asc` file is published alongside it. That file is the detached signature. Running `gpg --verify` against both files tells you whether the artifact is authentic.

Pass the signature file first, then the artifact, to `gpg --verify`:

```bash
gpg --verify <artifact>.jar.asc <artifact>.jar
```

**Good signature**

```
gpg: Good signature from "mosip-admin (MOSIP signing key) <engg_subscriptions@mosip.io>"
```

The artifact is authentic and has not been modified since it was signed.

**Bad signature**

```
gpg: BAD signature from ...
```

Do not use this artifact. It has been tampered with or is corrupt. Re-download from the official Maven Central coordinates and verify again.

**No public key**

```
gpg: Can't check signature: No public key
```

Your keyring does not contain the key that was used to sign this artifact. This can happen with older artifacts signed before January 2026. Import the KEYS file (the second method in Step 1, which includes all historical keys) and try again.

> **A note on "valid" vs "trusted":** A Good signature confirms the file is authentic and unmodified. It does not by itself mean you trust the key holder. The MOSIP signing key is published at `keys.openpgp.org` with a verified email address — the standard mechanism for identity verification in open source artifact signing.
