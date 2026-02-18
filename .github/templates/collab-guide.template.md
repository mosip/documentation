---
name: Collab Guide Template
description: Template for creating sandbox/collab environment exploration guides
version: 1.0.0
author: MOSIP Documentation Team
applies_to:
  - docs/**/sandbox-details/**
  - docs/**/collab-guide/**
tags:
  - sandbox
  - collab
  - try-it-out
  - getting-started
---

# {PRODUCT_NAME} Collab Guide

**{PRODUCT_NAME} Collab Guide** helps you explore [{PRODUCT_NAME}]({PRODUCT_OVERVIEW_LINK}) in our [Sandbox Collab Environment](https://collab.mosip.net/).

Whether you're a Developer, System Integrator, or an enthusiast eager to dive into the world of {DOMAIN_CONTEXT}, this guide provides you with the necessary information to get started with {PRODUCT_NAME} in our [Collab Environment](https://collab.mosip.net/).

---

## Where can you access the Collab Environment and {PRODUCT_NAME}?

Visit the following links to access {PRODUCT_NAME} in Collab Environment:

| Resource | Link |
|:---------|:-----|
| Collab Environment | [collab.mosip.net](https://collab.mosip.net/) |
| {PRODUCT_NAME} Portal | [{PRODUCT_PORTAL_URL}]({PRODUCT_PORTAL_URL}) |

---

## How can you get sample data to explore {PRODUCT_NAME}?

<!-- Describe the two primary ways users can obtain test data -->

* **Generate your own {DATA_TYPE}**: 
  * To generate your own {DATA_TYPE}, follow the instructions provided in the [{DATA_GENERATION_GUIDE_NAME}]({DATA_GENERATION_GUIDE_LINK}) guide. This guide will walk you through the steps required to create {DATA_TYPE} for testing in the {PRODUCT_NAME} portal.

* **Use Sample {DATA_TYPE}**: 
  * If you want it quick and can't wait to explore '{PRODUCT_NAME}' in 'Collab Environment', you can use the 'Sample {DATA_TYPE}' provided in this guide under the [Explore with Mock Data](#explore-with-mock-data) section.

---

## Which features can you explore in Collab Environment?

<!-- List all explorable features -->

* {FEATURE_1_NAME}
* {FEATURE_2_NAME}
* {FEATURE_3_NAME}
* {FEATURE_4_NAME}

---

## Feature Exploration Guides

### {FEATURE_1_NAME}

<!-- Brief description of the feature -->
{FEATURE_1_DESCRIPTION}

**How to explore:**

* **Option 1 - Generate your own data:**
  * Use the [{DATA_GENERATION_GUIDE_NAME}]({DATA_GENERATION_GUIDE_LINK}) guide to get the {DATA_TYPE} to explore this feature as per the instructions in the [User Guide]({USER_GUIDE_LINK}#{FEATURE_1_ANCHOR}).

* **Option 2 - Use sample data:**
  * Use the sample {DATA_TYPE} provided under [Explore with Mock Data](#explore-with-mock-data) section to explore this feature as per the instructions in the [User Guide]({USER_GUIDE_LINK}#{FEATURE_1_ANCHOR}).

---

### {FEATURE_2_NAME}

{FEATURE_2_DESCRIPTION}

**How to explore:**

* **Option 1 - Generate your own data:**
  * Use the [{DATA_GENERATION_GUIDE_NAME}]({DATA_GENERATION_GUIDE_LINK}) guide to get the {DATA_TYPE} to explore this feature as per the instructions in the [User Guide]({USER_GUIDE_LINK}#{FEATURE_2_ANCHOR}).

* **Option 2 - Use sample data:**
  * Use the sample {DATA_TYPE} provided under [Explore with Mock Data](#explore-with-mock-data) section to explore this feature as per the instructions in the [User Guide]({USER_GUIDE_LINK}#{FEATURE_2_ANCHOR}).

---

### {FEATURE_3_NAME}

<!-- For features requiring additional setup (e.g., wallet, external app) -->

{FEATURE_3_DESCRIPTION}

**Prerequisites:**
* {PREREQUISITE_1} - Use the [{PREREQUISITE_SETUP_GUIDE}]({PREREQUISITE_SETUP_LINK}) to complete the setup.

**How to explore:**

1. {STEP_1}
2. {STEP_2}
3. {STEP_3}
4. {STEP_4}

Refer to the [User Guide]({USER_GUIDE_LINK}#{FEATURE_3_ANCHOR}) for detailed instructions.

---

### {FEATURE_4_NAME}

<!-- For features with specific flow patterns (e.g., cross-device, same-device) -->

{FEATURE_4_DESCRIPTION}

**Prerequisites:**
* {PREREQUISITE_1} - Use the [{PREREQUISITE_SETUP_GUIDE}]({PREREQUISITE_SETUP_LINK}) to complete the setup.

**How to explore:**

1. {STEP_1}
2. {STEP_2}
3. {STEP_3}
4. {STEP_4}

Refer to the [User Guide]({USER_GUIDE_LINK}#{FEATURE_4_ANCHOR}) for detailed instructions.

---

## Explore with Mock Data

Use the sample data provided below to explore {PRODUCT_NAME} features.

<!-- Add sample data sections for each scenario -->

### Sample {DATA_TYPE} - Valid

<!-- Include image if applicable -->
<div align="center">
<figure>
<img src="{VALID_SAMPLE_IMAGE_PATH}" alt="Valid {DATA_TYPE}" width="375">
<figcaption>Valid {DATA_TYPE}</figcaption>
</figure>
</div>

**Sample Data:**

```json
{VALID_SAMPLE_JSON}
```

---

### Sample {DATA_TYPE} - Expired

<div align="center">
<figure>
<img src="{EXPIRED_SAMPLE_IMAGE_PATH}" alt="Expired {DATA_TYPE}" width="375">
<figcaption>Expired {DATA_TYPE}</figcaption>
</figure>
</div>

**Sample Data:**

```json
{EXPIRED_SAMPLE_JSON}
```

---

### Sample {DATA_TYPE} - Invalid

<div align="center">
<figure>
<img src="{INVALID_SAMPLE_IMAGE_PATH}" alt="Invalid {DATA_TYPE}" width="375">
<figcaption>Invalid {DATA_TYPE}</figcaption>
</figure>
</div>

**Sample Data:**

```json
{INVALID_SAMPLE_JSON}
```

---

## Documentation

| Resource | Link |
|:---------|:-----|
| Video Walkthrough | [{PRODUCT_NAME} Video]({VIDEO_LINK}) |
| Overview | [Overview]({OVERVIEW_LINK}) |
| Features | [Features]({FEATURES_LINK}) |
| User Guide | [User Guide]({USER_GUIDE_LINK}) |

---

<!--
===========================================
TEMPLATE USAGE GUIDE
===========================================

This template follows a standardized structure for Inji product collab/sandbox guides.
Replace all placeholders (enclosed in curly braces {}) with actual content.

REQUIRED SECTIONS:
- Introduction with target audience
- Access Links (Collab Environment + Product Portal)
- Ways to get sample data
- Features list
- Feature exploration guides (one per feature)
- Mock data samples
- Documentation links

PLACEHOLDERS REFERENCE:

PRODUCT INFORMATION:
- {PRODUCT_NAME}: e.g., "Inji Web", "Inji Wallet", "Inji Verify"
- {PRODUCT_OVERVIEW_LINK}: Link to product overview page
- {PRODUCT_PORTAL_URL}: e.g., "https://injiweb.collab.mosip.net"
- {DOMAIN_CONTEXT}: e.g., "verifiable credentials", "digital wallets"

DATA & GUIDES:
- {DATA_TYPE}: e.g., "QR codes", "Verifiable Credentials", "credentials"
- {DATA_GENERATION_GUIDE_NAME}: e.g., "Generate QR Code"
- {DATA_GENERATION_GUIDE_LINK}: Link to data generation guide
- {USER_GUIDE_LINK}: Link to end-user guide

FEATURES:
- {FEATURE_N_NAME}: Feature display name
- {FEATURE_N_DESCRIPTION}: 1-2 sentence feature description
- {FEATURE_N_ANCHOR}: URL anchor in user guide (e.g., "verify-by-scanning")

PREREQUISITES (for features requiring setup):
- {PREREQUISITE_1}: e.g., "Inji Wallet installed with credentials"
- {PREREQUISITE_SETUP_GUIDE}: Guide name
- {PREREQUISITE_SETUP_LINK}: Link to setup guide

MOCK DATA:
- {VALID_SAMPLE_IMAGE_PATH}: Relative path to valid sample image
- {VALID_SAMPLE_JSON}: JSON data for valid scenario
- {EXPIRED_SAMPLE_IMAGE_PATH}: Relative path to expired sample image
- {EXPIRED_SAMPLE_JSON}: JSON data for expired scenario
- {INVALID_SAMPLE_IMAGE_PATH}: Relative path to invalid sample image
- {INVALID_SAMPLE_JSON}: JSON data for invalid scenario

DOCUMENTATION:
- {VIDEO_LINK}: YouTube or video platform link
- {OVERVIEW_LINK}: Product overview docs link
- {FEATURES_LINK}: Features page link

STYLE GUIDELINES:
- Use tables for link collections
- Include visual samples with captions
- Provide both "generate your own" and "use sample" options
- Link to User Guide for detailed steps (don't duplicate)
- Use consistent heading hierarchy (H2 for sections, H3 for features)
- Include JSON samples in code blocks for copy-paste

OPTIONAL SECTIONS:
- Add more feature sections as needed
- Add more sample data scenarios if applicable
- Include standards/specifications links for technical features
-->
