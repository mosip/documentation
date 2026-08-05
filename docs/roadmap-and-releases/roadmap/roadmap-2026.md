---
layout:
  width: default
  title:
    visible: true
  description:
    visible: true
  tableOfContents:
    visible: true
  outline:
    visible: true
  pagination:
    visible: true
  metadata:
    visible: true
  tags:
    visible: true
  actions:
    visible: true
---

# Roadmap 2026 & Beyond

Here we present the eSignet product roadmap for 2026 and our strategic horizon forward. This roadmap outlines the planned features, progress, and release details for eSignet.

> **Annual product cycle** of eSignet commences in **January** and concludes in **December**.

<details>

<summary>Vision</summary>

In 2026, eSignet will focus on strengthening its foundation and expanding advanced authentication capabilities. The year begins with a full migration from Java 11 to Java 21 across all eSignet components, improving performance, security, and long-term maintainability. eSignet will introduce Face Authentication to support on-the-go, high-assurance user verification, followed by Single Sign-On (SSO) to enable seamless access across services. The Signup module will evolve into a standalone identity verification portal, and the year will conclude with the addition of CIBA support, enabling secure and user-friendly decoupled authentication. Continuous performance and stability improvements will run throughout the year to ensure eSignet remains production-ready at scale.

</details>

<table><thead><tr><th width="113.83984375">Priority 🗓️</th><th width="366.38671875">Features 🛠️</th><th width="127.890625">Details📝</th><th width="131.02734375">Status 📊</th><th>Release 📌</th></tr></thead><tbody><tr><td>P1</td><td><strong>eSignet Go Version (GA)</strong> <br>Deliver a stable release of eSignet for production deployments.</td><td><i class="fa-github">:github:</i> <a href="https://github.com/orgs/mosip/projects/22/views/3?reload=1&#x26;filterQuery=milestone%3AeSignet_thunder_2.0.0_beta.1%2CeSignet_v2.0.0">Milestone</a></td><td>🟠 In Progress</td><td>v2.0.0</td></tr><tr><td>P1</td><td><strong>Java 21 Migration</strong>:<br>Upgrade all eSignet repositories from Java 11 to Java 21 to improve performance, security, and long-term maintainability.</td><td><i class="fa-jira">:jira:</i> <a href="https://mosip.atlassian.net/browse/ES-2763">2763</a></td><td>🟢 Completed</td><td>v1.8.0</td></tr><tr><td>P1</td><td><strong>eSignet Performance Improvements (v1.7.x with MOSIP ID)</strong>:<br>Optimise eSignet service performance and stability when integrated with MOSIP ID for high-volume identity transactions.</td><td><i class="fa-jira">:jira:</i> <a href="https://mosip.atlassian.net/browse/ES-2829?search_id=df55b20b-63ce-46ba-8d59-f2b00d4c6666">2829</a></td><td>🟢 Completed</td><td>v1.8.0</td></tr><tr><td>P1</td><td><strong>UserInfo as Encrypted JWE</strong>:<br>Support returning UserInfo as encrypted JWE, passing signed JWTs securely to relying parties.</td><td><i class="fa-jira">:jira:</i> <a href="https://mosip.atlassian.net/browse/ES-2744">2744</a></td><td>🟢 Completed</td><td>v1.8.0</td></tr><tr><td>P1</td><td><strong>Signup Form Enhancements – Multiple Input Types</strong>:<br>Enhance Signup forms to support diverse input types for better usability and extensibility.</td><td><i class="fa-jira">:jira:</i> <a href="https://mosip.atlassian.net/browse/ES-2699">2699</a></td><td>🟢 Completed</td><td>v1.8.0</td></tr><tr><td>P1</td><td><strong>Face Authentication with eSignet</strong>:<br>Introduce face authentication as a high-assurance, on-the-go authentication factor in eSignet.</td><td><i class="fa-github">:github:</i> TBA</td><td>🔵 Planned</td><td></td></tr><tr><td>P1</td><td><strong>Wallet-based login using OpenID4VP</strong><br>Standard way to request specific credentials from a wallet and receive verified presentation</td><td><i class="fa-github">:github:</i> TBA</td><td>🔵 Planned</td><td></td></tr><tr><td>P1</td><td><strong>Passkey Authentication Support</strong><br>Enable passkeys for passwordless, phishing-resistant authentication.</td><td><i class="fa-github">:github:</i> TBA</td><td>🔵 Planned</td><td></td></tr><tr><td>P1</td><td><strong>CIBA Support in eSignet</strong></td><td><i class="fa-github">:github:</i> TBA</td><td>🔵 Planned</td><td></td></tr><tr><td>P3</td><td><strong>MFA Support – User Level</strong>:<br>Allow users to manage and use multiple authentication factors during login.</td><td><i class="fa-github">:github:</i> TBA</td><td>🔵 Planned</td><td></td></tr><tr><td>P2</td><td><strong>Single Sign-On (SSO) Super App Support</strong>:<br>Enable SSO capabilities to support super apps and seamless cross-application login experiences.</td><td><i class="fa-github">:github:</i> TBA</td><td>🔵 Planned</td><td></td></tr></tbody></table>

***

**Acronyms and Legends**:

<i class="fa-github">:github:</i> TBA - 'Github Issues Link - To Be Added'
