# MOSIP Functional Pilot Guide — Documentation Team Recommendations

---

## Context

As part of our ongoing work to improve the documentation experience across MOSIP, we have been reviewing the Functional Pilot Guide — both its structure and its positioning within the broader docs ecosystem. We have also looked at how comparable government-facing digital infrastructure programs approach this type of implementation guidance.

This document shares our observations and a set of proposals for your consideration. We recognize that the guide already reflects significant field experience and we want to build on that foundation, not replace it.

---

## On Positioning: Where Should This Guide Live?

One question worth deliberating on is whether the Functional Pilot Guide belongs embedded within the technical documentation, or whether it deserves its own distinct space.

Our view is that the guide serves a fundamentally different audience from the technical docs. A country program manager, a procurement lead, or a field supervisor will use this guide — and these readers will never need the API reference or the deployment architecture diagrams. Mixing both under the same navigation creates unnecessary cognitive load for them and may also understate the significance of the guide itself.

Programs of comparable scope and government-facing complexity have found it valuable to give their implementation guidance a distinct identity — separate navigation, its own landing page, its own tone — while keeping it under the same documentation domain so that technical cross-references remain intact.

We would propose using GitBook's site sections capability to achieve exactly this: the Functional Pilot Guide would have its own space at the same domain, with its own navigation structure, while still being able to link freely into the technical docs where relevant.

On naming: we would also suggest retiring "CookBook" as the public-facing name. It works well as an internal shorthand, but for a government audience — particularly when the guide is presented to program leads and policy stakeholders — "MOSIP Functional Pilot Guide" carries more weight and better describes what the document actually is.

---

## What the Guide Does Well

Before turning to suggestions, it is worth being clear about what the current guide gets right, because these are the things we should be careful not to dilute.

The **biometric capture best practices** section is genuinely differentiated. The level of operational detail — per-modality guidance, quality threshold explanations, exception handling — is not something you find in implementation guides for platforms that do not deal with biometrics. This is a MOSIP-specific strength and a real value-add for country teams.

The **real-life scenario walkthroughs** are excellent. Concrete situations — a senior citizen with worn fingerprints, a resident in a wheelchair, a detected ABIS duplicate — give operators and supervisors mental models they can actually use in the field. Abstract scenario lists do not achieve the same effect.

The **appendices** (Registration Center Checklist and Day-of Operator Run Sheet) are among the more practical artifacts we have seen in this category of documentation. Making them standalone pages — as we have now done — was the right call, and they should be easy to find and link to independently.

---

## Areas We Could Strengthen

The following areas represent opportunities to make the guide more complete, particularly for the program managers and policy leads who are often the first people a country assigns to evaluate MOSIP adoption.

**A chapter before the pilot begins**

The guide currently opens at Week 0 — the kick-off. But the questions a country team needs to answer before committing to a pilot are not yet addressed. Is the legal and regulatory environment ready for biometric data collection at this scale? Who will serve as the data controller? Is there organizational and political alignment? Has an infrastructure budget been approved? Is the country's situation greenfield or brownfield?

We would suggest adding a pre-pilot chapter that helps a country team — or a MOSIP engagement lead — assess whether the conditions for a successful pilot are in place. This is not about adding barriers; it is about preventing a pilot from starting with unresolved foundational questions that surface halfway through.

**Decision frameworks alongside the decisions**

The guide currently presents choices — cloud vs. on-prem, for instance — without giving the reader a structured way to evaluate them. A country official who is not a cloud architect needs criteria, not just options. A short decision framework (two to three pages) covering the key early choices — infrastructure hosting, brownfield vs. greenfield, vendor evaluation criteria — would significantly reduce the burden on the MOSIP engagement team, who currently have to walk countries through these decisions verbally.

**Legal and regulatory considerations**

The guide touches on privacy and security in Appendix C, and does so thoughtfully. However, the regulatory questions that a country's data protection authority will raise — legal basis for biometric collection, data retention periods, access controls, deletion processes — are not currently addressed. These are questions the country program lead will face before the pilot is approved, not after it concludes. A dedicated section here, even a brief one, would help country teams arrive at those conversations better prepared.

**A measurement framework for pilot success**

The guide currently defines pilot success in qualitative terms. A more structured approach — one that defines what acceptable registration success rates, biometric exception rates, and authentication success rates look like — would give country steering committees something concrete to evaluate against. Without measurable exit criteria, it is difficult for a country to make a confident, evidence-based decision to scale.

**Country field experiences**

The MOSIP program has real deployment experience across multiple countries and contexts. Very little of this experience is reflected in the guide. Anonymized observations from the field — "in a recent deployment, the team found that..." — would make the guide feel grounded in practice rather than in theory, and would give country teams the benefit of lessons already learned by others. We would be glad to work with the implementation team to identify and incorporate these insights in an appropriate form.

**A bridge from pilot to scale**

The guide ends at pilot closure. The country team has signed off, the lessons are documented, and the report is filed — and then the guide goes silent. A brief section on what comes next — how to think about infrastructure sizing for national scale, what governance changes the transition requires, how the partner ecosystem evolves — would complete the journey rather than leaving it open-ended.

**Templates and working artifacts**

The guide would benefit from a richer set of ready-to-use artifacts: a structured project plan template (the current 14-week plan is narrative rather than actionable), a risk register, a stakeholder communication plan, a vendor evaluation matrix, and a daily reporting dashboard template. These are the tools a country program manager will need on day one, and providing them reduces the time spent building from scratch for each new engagement.

**Change management and communications**

The guide briefly mentions a media engagement plan but does not develop this area. A country program lead often faces internal resistance — from existing system owners, from officials with competing priorities, from stakeholders who are uncertain about the technology. A section on stakeholder engagement, communications planning, and managing the change process would help program managers navigate the political dimension of a pilot, not just the technical one.

**Cost orientation**

The guide is transparent that the pilot cost model does not represent national rollout costs, which is the right thing to say. However, it does not provide any orientation on estimating even pilot costs. A cost framework — not a price list, but a clear categorization of what a country should budget for — would help program managers arrive at budget conversations with a realistic picture.

## Extending the Visual Language of the Guide

The guide already uses figures effectively — the 14-week schedule (Figure 3), the registration center floor plan (Figure 6), the operator workflow (Figure 7), and the phased go-live ramp (Figure 8) are strong anchors that make those sections significantly easier to follow. That visual pattern is worth extending to the sections that currently rely on prose alone.

The sections below do not yet have a figure and would benefit from one:

| Section | Suggested diagram | What it would show |
|---|---|---|
| **Pilot Lifecycle at a Glance** | Swimlane timeline | The 8 stages with Country vs. MOSIP vs. shared ownership colour-coded, and critical-path gates marked — a natural companion to Figure 3 |
| **Roles and Responsibilities** | Swimlane or RACI visual | Responsibility split across Country, MOSIP, and vendors at a glance |
| **Infrastructure and Requirements** | System components sketch | How the VMs, ABIS, biometric devices, gateways, and INJI connect — a pilot-scoped view, not the full architecture |
| **Authentication and Credentials** | Sequence diagram | OTP and biometric flows step by step — resident, eSignet, MOSIP, relying party — the same way Figure 7 handled the registration workflow |
| **Governance and Review** | Meeting rhythm diagram | Which forum meets when, who attends, what decisions it owns |
| **Pilot Closure** | Deliverables ownership map | Closure outputs mapped to Country / MOSIP / Joint ownership |

The existing figures set the style and standard — these additions would follow the same approach rather than introduce anything new.

## Proposed Next Steps

Some sections — country field experiences, the measurement framework, decision criteria — would benefit from the implementation team's direct input. Others — the pre-pilot chapter structure, the template artifacts, the cross-linking work, and the diagram additions — are areas we can improve.
