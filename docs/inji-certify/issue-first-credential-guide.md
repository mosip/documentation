# Issue Your First Credential with Inji Certify

## What You'll Achieve

By the end of this guide, you will:
- **Issue a Farmer ID credential** from sample data
- **Download it into a digital wallet** (Inji Web)
- **Understand how the pieces connect** so you can adapt it to your use case

**Time required:** ~10 minutes

---

## Before You Start: Understanding the Big Picture

### What is Inji Certify?

Inji Certify is a **credential issuer** — think of it as a digital stamp office that creates official, verifiable documents.

**Real-world analogy:** Just like a university issues degrees or a government agency issues passports/national IDs, Inji Certify issues digital credentials that are cryptographically signed and tamper-proof.

### The Complete Flow: Who Does What?

```
┌─────────────────┐      ┌─────────────────┐      ┌─────────────────┐
│   Your Data     │ ───▶ │  Inji Certify   │ ───▶ │    Inji Web     │
│   (CSV file)    │      │    (Issuer)     │      │    (Wallet)     │
└─────────────────┘      └─────────────────┘      └─────────────────┘
                                                          │
     "Here's who                "I'll create a            ▼
      qualifies for              signed, official    "I now hold my
      a Farmer ID"               credential"          Farmer ID card"
```

| Component | Role | Real-world equivalent |
|-----------|------|----------------------|
| **Your Data Source** | Contains information about credential holders | Database of registered farmers |
| **Inji Certify** | Creates and signs the credential | Government office issuing the ID |
| **Inji Web** | Receives and stores the credential | Your wallet holding the ID card |

### Why Can't I Get the Credential Directly from Certify?

**Short answer:** Certify is the issuer, not the storage.

Think about it this way: When a government agency issues your passport or national ID, they don't keep it — *you* take it with you in your wallet. Similarly:
- Inji Certify **creates** the credential
- Inji Web (or Inji Mobile Wallet) **stores** and **presents** it when needed

This separation follows the international [OpenID4VCI standard](https://openid.net/specs/openid-4-verifiable-credential-issuance-1_0-ID1.html), ensuring your credentials work across different systems worldwide.

### How Do Verifiers Trust the Credential? (The Role of DID)

When someone receives a credential (like a Farmer ID), how do they know it's *really* from the Agriculture Department and not a fake? This is where **DID (Decentralized Identifier)** comes in.

**DID = The issuer's verifiable identity**

```
┌─────────────────────────────────────────────────────────────────────────┐
│                        ISSUANCE (what you're doing)                     │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│   Inji Certify                                                          │
│   ┌─────────────────┐                                                   │
│   │ Private Key 🔐  │ ──── Signs the credential                         │
│   │ DID Identity    │ ──── Embeds "did:web:example.io" in credential    │
│   └─────────────────┘                                                   │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
                         Credential contains:
                         - Farmer's data
                         - Digital signature
                         - Issuer's DID: "did:web:example.io"
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                        VERIFICATION (later)                             │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│   Verifier (e.g., bank checking farmer's ID)                            │
│   1. Sees DID in credential: "did:web:example.io"                       │
│   2. Resolves DID → fetches https://example.io/.well-known/did.json     │
│   3. Gets public key from DID document                                  │
│   4. Verifies signature matches → "Yes, Agriculture Dept issued this!"  │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

**Real-world analogy:**

| Physical World | Digital World |
|----------------|---------------|
| University's official seal/embossing | DID + Digital signature |
| Company registry to verify seal is real | DID document hosted publicly |
| Anyone can look up if seal belongs to that university | Anyone can resolve DID to verify issuer |

**In this tutorial:** The mock setup auto-generates a DID at `http://localhost:8090/v1/certify/.well-known/did.json`. For production, you'd host this DID document at a public URL (like GitHub Pages) so verifiers worldwide can resolve it.

**Summary of roles:**
| Component | Role |
|-----------|------|
| **Inji Certify** | Issues and signs credentials (holds private key) |
| **DID** | Public identity that verifiers use to confirm the signature is genuine |
| **Wallet (Inji Web)** | Stores the credential (no signing role) |

---

## Understanding Data Sources: Where Does Your Data Come From?

Inji Certify needs to know *who* should receive credentials. This data comes from a **data source plugin**.

### Your Options (Simplest to Most Complex)

| Data Source | Best For | Setup Complexity |
|-------------|----------|------------------|
| **CSV File** | This tutorial, quick demos, testing | Easy |
| **PostgreSQL Database** | Organizations with existing databases | Moderate |
| **Custom Plugin** | Special data sources (APIs, legacy systems) | Advance |

### What is "Mock" Mode?

Throughout this guide, you'll see the word **"mock"** — here's what it means:

**Mock = Pre-configured test environment with sample data**

| What's Mocked | What It Means | Why It's Useful |
|---------------|---------------|-----------------|
| **Mock Data** | Sample farmers already in a CSV file | No need to create your own data |
| **Mock Authentication** | Test login (OTP is always `111111`) | No need to set up real identity verification |
| **Mock Plugin** | Ready-to-use code for CSV data | No coding required |

**Important:** Mock mode is for learning and testing. For production, you'll replace mock components with real ones.

---

## What You'll Build in This Tutorial

We'll set up the **Farmer ID** use case:

```
Sample CSV Data                    Farmer ID Credential
┌────────────────────┐            ┌────────────────────────────┐
│ UIN: 5860356276    │            │ FARMER IDENTITY CARD       │
│ Name: Ravi Kumar   │  ───────▶  │ Name: Ravi Kumar           │
│ Village: Pune      │            │ ID: 5860356276             │
│ Crop: Rice         │            │ Village: Pune              │
└────────────────────┘            │ ✓ Digitally Signed         │
                                  │ ✓ Tamper-proof             │
                                  └────────────────────────────┘
```

---

## Prerequisites

Before starting, ensure you have:

| Requirement | Version | Check Command |
|-------------|---------|---------------|
| Docker | 26.0.0+ | `docker --version` |
| Docker Compose | 2.25+ | `docker compose version` |
| Git | Any recent | `git --version` |

**Platform-specific:**
- **Windows:** [Git Bash](https://gitforwindows.org/) for running shell commands
- **Mac:** [GNU sed](https://formulae.brew.sh/formula/gnu-sed) — install with `brew install gnu-sed`
- **Apple Silicon (M1/M2):** You'll need to set a compatibility flag (shown later)

---

## Step-by-Step Guide

### Step 1: Get the Code

```sh
git clone https://github.com/mosip/inji-certify.git
cd inji-certify/docker-compose/docker-compose-injistack
```

**What you just did:** Downloaded Inji Certify and navigated to the Docker setup folder.

### Step 2: Download the Data Plugin

The plugin tells Certify how to read your data source. We'll use the CSV plugin (simplest option).

```sh
mkdir -p loader_path/certify

# Download the mock-certify-plugin
curl -L -o loader_path/certify/mock-certify-plugin-0.5.0.jar \
  "https://repo1.maven.org/maven2/io/mosip/certify/mock-certify-plugin/0.5.0/mock-certify-plugin-0.5.0.jar"
```

**What you just did:** Downloaded a plugin that reads sample farmer data from a CSV file.

### Step 3: Start All Services

```sh
docker compose up -d
```

**Apple Silicon users (M1/M2 Macs):** Run this first:
```sh
export DOCKER_DEFAULT_PLATFORM=linux/amd64
docker compose up -d
```

**What's starting:**
| Service | What It Does | Local URL |
|---------|--------------|-----------|
| Inji Certify | Issues credentials | http://localhost:8090 |
| Inji Web | Digital wallet UI | http://localhost:3001 |
| Mimoto | Backend for Inji Web | http://localhost:8099 |
| PostgreSQL | Stores configuration | localhost:5433 |

Wait 1-2 minutes for services to start, then verify:
```sh
docker compose ps
```

All services should show `Up` or `running`.

### Step 4: Issue Your First Credential

Now the exciting part — let's issue a Farmer ID!

1. **Open your browser:** Go to [http://localhost:3001](http://localhost:3001)

2. **Start the download flow:**
   - Click **"Continue as guest"** (we're using mock authentication)
   - Select **"Farmer Identity Card"** 

3. **Enter sample credentials:**
   - **UIN:** `5860356276` (this is a sample farmer in our CSV)
   - **OTP:** `111111` (mock OTP — always works in test mode)

4. **Download your credential**

🎉 **Congratulations!** You've just issued and received your first verifiable credential!

### Step 5: Verify It Worked

You can verify your credential is genuine using Inji Verify:

1. Go to [https://injiverify.collab.mosip.net/](https://injiverify.collab.mosip.net/)
2. Upload or scan the credential you downloaded
3. It should show as **verified** ✓

---

## What Just Happened? (Behind the Scenes)

```
You entered UIN ──▶ Inji Web asked Certify ──▶ Certify looked up CSV
       │                                              │
       │                                              ▼
       │                                     Found farmer "Ravi Kumar"
       │                                              │
       │                                              ▼
       │                                     Created signed credential
       │                                              │
       ◀───────────────────────────────────────────────
                     Credential delivered to your wallet
```

1. **Authentication:** Mock system verified your OTP (always `111111` in test mode)
2. **Data Lookup:** Certify's CSV plugin found the farmer with UIN `5860356276`
3. **Credential Creation:** Certify created a JSON-LD credential following W3C standards
4. **Digital Signature:** Certify signed it with a cryptographic key (making it tamper-proof)
5. **Delivery:** The signed credential was sent to Inji Web (your wallet)

---

## Try Other Sample Identities

The mock CSV includes these sample farmers:

| UIN | Name | Use this to test... |
|-----|------|---------------------|
| `5860356276` | Ravi Kumar | Standard flow |
| `2154189532` | Another farmer | Multiple credentials |

OTP is always `111111` in mock mode.

---

## Clean Up

When you're done experimenting:

```sh
# Stop services
docker compose down

# Stop and remove all data (clean slate)
docker compose down -v
```

---

## What's Next?

Now that you understand the basics, here's your path forward:

### Path A: Use Your Own Data

Replace the CSV with your own farmer data or connect to a PostgreSQL database.

**CSV approach:**
1. Edit the sample CSV file in the config folder
2. Add your own farmer records
3. Restart services

**PostgreSQL approach:**
- See [Postgres Plugin Guide](https://github.com/mosip/digital-credential-plugins/tree/master/postgres-dataprovider-plugin)

### Path B: Different Credential Types

Want to issue driving licenses, employee IDs, or certificates? You'll need to:
1. Define a credential schema
2. Configure the issuer metadata
3. Set up appropriate data source

See [Credential Configuration Guide](https://github.com/inji/inji-certify/blob/master/docs/Credential-Issuer-Configuration.md)

### Path C: Production Deployment

For real-world deployment with Kubernetes:
- See [Kubernetes Deployment Guide](#production-deployment-with-kubernetes) below

---

## Common Questions

### "Why use Inji Web instead of just calling an API?"

You can use APIs directly! Inji Web is a reference implementation showing how wallets interact with Certify. For API-only testing, use the [Postman collections](https://github.com/inji/inji-certify/tree/master/docs/postman-collections).

### "Can I issue credentials without user authentication?"

The current setup uses OpenID for authentication. For pre-authorized issuance (no user login), this is on the [roadmap](https://github.com/mosip/inji-certify#upcoming-features).

### "What credential formats are supported?"

| Format | Status | Use Case |
|--------|--------|----------|
| JSON-LD (W3C VC 1.1 & 2.0) | ✅ Full support | Standard verifiable credentials |
| SD-JWT | ✅ Full support | Selective disclosure credentials |
| mDoc/mDL | ⚠️ Mock only | Mobile driving licenses (full support coming) |

### "How do I add more fields to my credential?"

Modify the credential template in `certify_init.sql`. See [Rendering Template Guide](https://github.com/inji/inji-certify/blob/master/docs/Rendering-Template.md).

---

## Troubleshooting

### Services Won't Start

```sh
# Check logs
docker compose logs certify

# Common fix: network not created
docker network create mosip_network
docker compose up -d
```

### "Plugin not found" Error

Ensure the JAR file is in the correct location:
```sh
ls -la loader_path/certify/
# Should show: mock-certify-plugin-0.5.0.jar
```

### Credential Download Fails

1. Check Certify is running: `curl http://localhost:8090/v1/certify/actuator/health`
2. Verify you're using a valid sample UIN (`5860356276` or `2154189532`)
3. OTP must be `111111`

### Apple Silicon: Container Architecture Error

```sh
export DOCKER_DEFAULT_PLATFORM=linux/amd64
docker compose down
docker compose up -d
```

---

## Production Deployment with Kubernetes

For production environments requiring scalability, security, and high availability.

### When to Use This

- Issuing credentials to thousands/millions of users
- Required uptime and reliability guarantees  
- Integration with existing enterprise infrastructure

### Prerequisites

| Requirement | Specification |
|-------------|---------------|
| **VMs** | 3 nodes (8 vCPUs, 32 GB RAM, 64 GB Storage each) |
| **Kubernetes** | Cluster with kubectl access |
| **SSL** | Wildcard certificate for your domain |
| **Tools** | kubectl, Helm 3.0+, Ansible 2.12+ |

### Deployment Steps

```sh
# Clone repository
git clone https://github.com/mosip/inji-certify.git
cd inji-certify/deploy

# Deploy Redis
cd redis && ./install.sh

# Initialize database
cd ../db_scripts && ./init_db.sh

# Deploy Inji Certify
cd ../inji-certify && ./install.sh
```

### Verify Deployment

```sh
kubectl get pods -n inji-certify    # All pods should be Running
kubectl get services -n inji-certify
curl -k https://injicertify.yourdomain.net/health
```

For complete production guide, see [Inji Deployment Guide](../readme/setup/deploy.md).

---

## Glossary

| Term | Plain English |
|------|---------------|
| **Verifiable Credential (VC)** | A digital document that's cryptographically signed, like a tamper-proof PDF |
| **Issuer** | The organization creating credentials (you, using Inji Certify) |
| **Holder** | The person receiving and storing the credential |
| **Wallet** | App that stores credentials (Inji Web, Inji Mobile) |
| **DID** | Decentralized Identifier — a unique ID for the issuer that anyone can verify |
| **JSON-LD** | A format for credentials that's machine-readable and follows W3C standards |
| **Mock** | Test/demo mode with pre-configured sample data |

---

## Additional Resources

- [Inji Certify Documentation](https://docs.inji.io/inji-certify/overview)
- [GitHub Repository](https://github.com/mosip/inji-certify)
- [API Documentation](https://mosip.stoplight.io/docs/inji-certify)
- [MOSIP Community Forum](https://community.mosip.io/) — Get help from the community
- [OpenID4VCI Standard](https://openid.net/specs/openid-4-verifiable-credential-issuance-1_0-ID1.html)
- [W3C Verifiable Credentials](https://www.w3.org/TR/vc-overview/)

---

## Placeholders / Content to Add

<!-- 
Areas that would benefit from additional content:

1. [ ] **Screenshots** of Inji Web credential download flow
2. [ ] **Video walkthrough** of this tutorial
3. [ ] **Sample credential JSON** showing the actual output
4. [ ] **Diagram** of the authentication flow
5. [ ] **Guide for creating custom credential schemas**
6. [ ] **Integration examples** with non-MOSIP identity providers
-->
