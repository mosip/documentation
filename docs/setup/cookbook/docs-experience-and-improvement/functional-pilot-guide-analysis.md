# Functional Pilot Guide — Strategic Analysis

## Original Prompt

> "We recently worked on MOSIP Functional Pilot guide docs/setup/cookbook. We also made some logical grouping and segregations from a very flat structured content. However I want to understand do you know from the leaders if they have something like this, Should this even be here as part of docs or should be separate. If you know about similar approach if any leaders have taken then what exactly is the content made up of, what sections it contains and what we are missing here. Also, how should I approach the 'Related Reading' and cross linking strategy for content reuse from our docs. Advise me. Give it a deep thought, No shallow approaches."

---

## 1. Do leaders have something like this, and where do they put it?

Yes — and the pattern is clearer than you might expect. Survey the most sophisticated digital public infrastructure projects and you find two distinct models:

**Model A — Integrated (same docs site, demarcated section)**
Used by: Kubernetes, Stripe, HashiCorp

These are primarily developer-audience platforms. The implementation guide lives inside the docs because the audience (technical users) reads both simultaneously — they need the reference docs open in one tab while following the guide in another. Separating them creates friction.

**Model B — Separate product with its own identity**
Used by: DHIS2, OpenCRVS, GovStack, World Bank ID4D

These are government/NGO adoption platforms — same category as MOSIP. DHIS2 has `docs.dhis2.org` for technical docs and a separate `academy.dhis2.org` for implementation courses. OpenCRVS has a dedicated "Implementation Hub" that isn't even part of their technical docs site. The World Bank's ID4D Practitioner's Guide is a standalone publication. GovStack publishes their Implementation Playbook as its own product, separate from technical specs.

**Why the split?** Their audience is different in a critical way. The person who reads a government platform adoption guide is a program manager or country implementation lead — someone who will never touch the API reference, but who needs to make procurement decisions, manage a 14-week project timeline, run a governance committee, and handle field operations. The technical docs are for their engineers. Mixing these creates a cognitive overload problem: the program manager has to scroll past biometric specifications to find the governance cadence.

**Where does MOSIP's Functional Pilot Guide fall?** Squarely in Model B. It is written for a country program manager, not a developer. The closest comparable document is the World Bank ID4D Practitioner's Guide — which is a standalone publication, not part of any technical documentation.

**Recommendation**: Use GitBook's site sections to give the Functional Pilot Guide its own section — same domain (`docs.mosip.io`), separate space, separate navigation, its own landing page. This gives you the separation of Model B without the discoverability cost of a completely different domain. The technical cross-references can still link between sections.

Name it **"MOSIP Functional Pilot Guide"** — not "CookBook." CookBook is a charming internal label, but for government adoption, you want language that signals authority and professionalism.

---

## 2. What the best-in-class examples are made of — and what MOSIP is missing

Gap analysis against the three closest comparables: DHIS2's Implementation Guide, OpenCRVS's Country Implementation documentation, and GovStack's Implementation Playbook.

### What MOSIP has that others don't

- The biometric capture best practices section is unusually detailed — DHIS2 has nothing equivalent because they don't deal with biometrics. This is MOSIP's differentiator.
- The real-life scenario walkthroughs (senior citizen with worn fingerprints, resident in a wheelchair, ABIS duplicate) are excellent. GovStack has abstract scenarios; MOSIP has concrete ones.
- Appendix A and B (checklist and run sheet) are better than most equivalents in the field.

### What's missing, by category

**Pre-adoption chapter — Leaders all have this; MOSIP has none.**

Before a country decides to run a pilot, they need to answer questions that the current guide assumes are already answered. GovStack calls this a "Digital Readiness Assessment." ID4D calls it "Enabling Environment" analysis. The questions are: Does a legal framework for collecting biometric data exist? Who is the data controller? Is there political consensus? What is the existing ID landscape (greenfield vs. brownfield)? Can the country's IT team manage the infrastructure? What budget envelope has been approved?

The cookbook currently opens with the pilot — it doesn't help the country decide whether a pilot is the right move, or whether they're ready for one. This chapter belongs before Week 0.

**Decision frameworks, not just directives — Leaders provide these; MOSIP provides answers.**

The cookbook says "choose whether to host on public cloud or on-prem." It doesn't give a framework for making that choice. OpenCRVS gives a structured decision guide covering sovereignty requirements, team capability, connectivity reliability, and long-term production intent. The cookbook reader is a government official, not a cloud architect. They need criteria, not just options.

The same gap exists for: ABIS vendor selection criteria, biometric device acceptance testing standards, and the greenfield-vs-brownfield migration decision.

**Legal and regulatory framework — This is the most significant gap.**

MOSIP covers privacy principles philosophically in the main docs (Appendix C of the cookbook talks about observing privacy during the pilot, which is good). But there is no guidance on what legal infrastructure must exist before a country can legitimately collect biometrics at scale. DHIS2 has a data protection module. ID4D devotes multiple chapters to this. A country's data protection authority will ask: on what legal basis are you collecting biometrics? What is the retention period? What is the deletion process? Who has access? The cookbook doesn't address these questions because they're framed as out of scope — but a government implementation team will hit them immediately.

**Monitoring and evaluation framework — The cookbook has daily reporting metrics. It doesn't have a measurement framework.**

What does "success" look like at the end of a 14-week pilot? The cookbook defines it qualitatively ("the country team is confident it can run MOSIP independently") but doesn't provide measurable indicators. GovStack's playbook defines KPIs with baselines and targets: what is an acceptable registration success rate, what is an acceptable biometric exception rate, what authentication success rate indicates the system is working. Without this, the country's steering committee cannot objectively evaluate the pilot outcome.

**Country experience / case studies — MOSIP has real deployments. None of them are in the cookbook.**

DHIS2's implementation guide is rich with anonymized country experience: "In a Southeast Asian deployment, the team discovered that urban vs. rural connectivity patterns required different sync window configurations." OpenCRVS names countries and describes what they learned. MOSIP has deployments in the Philippines, Morocco, and Ethiopia. None of this experience is surfaced in the cookbook as learning for the next country. This is a serious gap — the cookbook reads as a theoretical plan, not a field-tested guide.

**Scale-up bridge — The cookbook ends at pilot closure. The country is now staring into a void.**

"Recommendations for scale" is listed as a closure deliverable, but the guide provides no framework for what those recommendations should address. How many servers for 10 million registrations vs. 3,000? What governance changes are needed when you move from a pilot team to a national operations center? How does the partner ecosystem (ABIS vendors, biometric device providers) scale? GovStack has an entire "Scaling and Sustainability" module. MOSIP has nothing.

**Templates and downloadable artifacts — Appendix A and B are a start. There should be more.**

Leaders routinely include: project plan templates (the 14-week plan in the cookbook is narrative, not a usable Gantt), risk register template, stakeholder communication plan, vendor evaluation matrix, training attendance register, daily pilot reporting dashboard template. These are the artifacts the country team will actually use. Having them in the guide prevents each country from reinventing them from scratch.

**Change management and communications strategy — Present but underdeveloped.**

The cookbook mentions "media engagement plan" once but doesn't elaborate. Leaders (especially GovStack and World Bank) cover: how to manage resistance from existing ID system owners, stakeholder engagement plan templates, media/PR guidance for the pilot launch, community outreach guidance. A government program manager needs this to navigate internal politics, not just technical execution.

**Cost estimation model — Explicitly disclaimed but not replaced.**

The cookbook explicitly says "pilot cost model does not reflect national rollout costing" but provides no guidance on estimating even pilot costs. Leaders provide cost frameworks — not exact figures, but categories and typical ranges. This is a significant gap for program managers who need to secure budget approval before the pilot can begin.

---

## 3. Cross-linking and Related Reading strategy

The comment in `authentication-and-credentials.md` — `Put Related Reading all across and here as well, linking to eSignet and may be wallet documentation` — is the right instinct implemented in the wrong way.

### Why "Related Reading" sections don't work

They are passive. Readers skip them. They become stale (links break, sections move). They're usually placed at the end of a page where the reader has already either found what they need or given up. Every docs team eventually adds Related Reading sections and then notices no one clicks them.

The underlying problem is different: the reader doesn't know *why* a link is relevant to them *at the point they encounter it*. A link at the end of the page has lost its context.

### The strategy — three mechanisms, each serving a different purpose

**Mechanism 1: Inline delegation links** (the primary mechanism)

These appear mid-sentence, at the exact point of relevance, and they answer a specific question.

The format is not "see [link]" — it's "your technical team should follow the [Registration Client configuration guide](link) to configure the biometric threshold values." The subject ("your technical team") signals to the program manager reader that this link is for someone else. The verb ("configure") signals what action the link enables. The noun phrase ("biometric threshold values") signals what information it contains.

This pattern does two things: it makes the cookbook self-contained for the program manager (they don't need to follow the link to keep reading), while giving them something concrete to hand to their technical lead.

The rule: link at first meaningful mention of a technical concept that has a dedicated page in the main docs. Not every mention — only where the reader might need to go deeper.

**Mechanism 2: Phase-specific "Your technical team needs these" callouts**

At the start of each cookbook chapter, a `{% hint style="info" %}` block — but not generic "see also" content. Specifically:

```
{% hint style="info" %}
**Technical resources for this phase**
Before Week 2 begins, your technical lead should have reviewed:
- [ID Schema design guide] — to define country-specific fields
- [Master Data Guide] — to structure administrative hierarchy and facility data
- [Registration Client configuration] — to set biometric quality thresholds
{% endhint %}
```

The framing matters: "before [week X] begins" makes it actionable. "Your technical lead should have reviewed" makes it a delegatable task. The program manager reads this and can send three specific links to their technical team with a clear timeline attached.

This replaces the diffuse "Related Reading" with a structured delegation tool.

**Mechanism 3: "Go deeper if" conditional links** (end of section, not end of page)

After each major operational section (not at page level — at section level within a page), provide 2-3 conditional links of the form:

- "To understand why biometric quality thresholds matter for authentication success later: [Biometric Specification](link)"
- "To adjust the threshold values for your registration environment: [Registration Client Configuration Guide](link)"

The conditional ("to understand why... / to adjust...") makes it immediately clear whether this link is for the current reader or not. A program manager reads "to adjust the threshold values" and knows that's for their technical lead. A technical architect reads both and follows the one they need.

No more than three per section. If you have more than three "go deeper" links, you have a content gap — something that should be in the cookbook itself but isn't.

### Content reuse — the hard rule

The question underlying all cross-linking is: when does the cookbook include content vs. link to it?

| Include in the cookbook | Always link to main docs, never duplicate |
|---|---|
| Operational context (when and why) | Technical specifications |
| Checklists and run sheets | Configuration parameters and their values |
| Judgment guidance (which option and why) | API details |
| Real-world caveats and warnings | Architecture descriptions |
| Role assignments | Version-specific installation steps |
| | Anything that changes with a platform release |

**The gray zone** — step-by-step how-to content that exists in both the main docs and the cookbook:

The rule: the cookbook provides the *when*, *why*, and *who*. The main docs provide the *how*. "Onboard all operators before the training week begins — see [Admin Portal Operator Onboarding](link)" — the cookbook says when to do it, who does it, and why it matters. The main docs say the exact steps. Never reproduce the steps in the cookbook because they will drift from the main docs the moment the admin portal UI changes.

### Specifically for authentication-and-credentials.md

The comment says "add Related Reading linking to eSignet and wallet documentation." What to actually do:

1. First mention of "eSignet" — inline link to the eSignet integration docs
2. First mention of "mock relying-party portal" — inline link to the eSignet mock RP setup guide
3. First mention of "INJI Wallet" — inline link to the Inji Wallet documentation
4. End of the OTP authentication section — "Your technical team needs these" callout with: eSignet configuration guide, Configuring eSignet for MOSIP (from the Interoperability section)
5. End of the INJI Wallet section — similar callout with: INJI Wallet deployment guide, Verified Credentials documentation

No "Related Reading" section. Each link earns its place by answering a specific question at a specific point in the reader's journey.

---

## Summary: the three decisions

| Decision | Recommendation |
|---|---|
| **Where does it live?** | Its own GitBook site section. Same domain, separate space, separate navigation, its own identity. Public name: MOSIP Functional Pilot Guide, not CookBook. |
| **What's missing?** | Pre-adoption readiness chapter (before Week 0), decision frameworks, legal/regulatory framework, country case studies, M&E framework, scale-up bridge, more downloadable templates, change management guidance, cost estimation model. |
| **Cross-linking strategy?** | Three mechanisms: inline delegation links (mid-sentence, at point of relevance), phase-specific "your technical team needs these" callouts (start of each chapter), "go deeper if" conditional links (end of each section). Never a passive "Related Reading" list. Never duplicate content that lives in the main docs. |
