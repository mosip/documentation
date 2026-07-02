## proposed IA

My recommendation: MOSIP Functional Pilot Guide — it's unambiguous, professional, and will sit naturally alongside the other guides in the MOSIP docs navigation.

✻ Worked for 32s

❯ Now, as per docs information architecture principles and also as per topic based authoring ways suggest me some better logical segregation for this large content page such that I break this further into logical units/topics/pages

Let me analyze the full 25-section document against information architecture and topic-based authoring principles before making recommendations.

Searched for 2 patterns, ran 1 shell command

Now I have full context — the content, the existing docs/setup/ structure, and the MOSIP navigation patterns. Let me map the 25 sections against IA and topic-based authoring principles.

Analysis: Problems with the Current Structure

Before recommendations, here's what the current flat page violates:

┌────────────────────┬─────────────────────────────────────────────────────────────────────────────────────────────────────────────┐ │ Principle │ Problem │ ├────────────────────┼─────────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │ One topic = one │ Single page mixes concept, task, and reference topics — e.g., hardware specs (reference) sits next to │ │ purpose │ governance cadence (reference) sits next to registration workflow (task) │ ├────────────────────┼─────────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │ Audience alignment │ A program manager, technical lead, and field operator all need different parts — currently forced to scroll │ │ │ past irrelevant content │ ├────────────────────┼─────────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │ Progressive │ No hierarchy — everything is at the same depth │ │ disclosure │ │ ├────────────────────┼─────────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │ Reusability │ Appendix A (Center Checklist) and Appendix B (Run Sheet) are buried and can't be linked to independently │ ├────────────────────┼─────────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │ Findability │ 25 sections in one page means zero left-nav discoverability in GitBook │ └────────────────────┴─────────────────────────────────────────────────────────────────────────────────────────────────────────────┘

```
Proposed Structure: 1 Page → 19 Pages

Organized by pilot lifecycle phase (the reader's mental model), with topic type labeled for each page.

📁 MOSIP Functional Pilot Guide        ← parent section in GitBook nav
│
├── README.md  — Overview              [CONCEPT] Merge §1+2+3+4
│   What is a MOSIP Pilot, objectives,
│   scope, assumptions, lifecycle at a glance
│
├── 📁 Planning
│   ├── execution-plan.md              [TASK]      §7 — Week-by-Week Plan
│   ├── roles-and-responsibilities.md  [REFERENCE] §8 — RACI across Country + MOSIP
│   ├── team-resourcing.md             [REFERENCE] §9 — Country team staffing table
│   └── governance.md                 [REFERENCE] §23 — Meeting cadence
│
├── 📁 Infrastructure and Requirements
│   ├── hardware-requirements.md       [REFERENCE] §5 — VMs, laptops, devices, scanners
│   └── software-requirements.md       [REFERENCE] §6 — Platform components, owners
│
├── 📁 Pilot Design
│   └── participant-mix.md             [TASK]      §10 — Demographic distribution
│
├── 📁 Training
│   └── training-and-scenarios.md      [TASK]      §14 — Training streams + real-life scenarios
│
├── 📁 Platform Readiness
│   ├── functional-capabilities.md     [REFERENCE] §15 — Capability checklist
│   └── sandbox-hardening.md           [TASK]      §16 — Clean + tighten before go-live
│
├── 📁 Field Operations
│   ├── registration-center-setup.md   [TASK+REF]  §17 — Center layout, staff, per-kit config
│   ├── registration-workflow.md       [TASK]      §18 — Step-by-step operator script
│   ├── online-offline-registration.md [CONCEPT]   §11 — Modes and trade-offs
│   └── biometric-capture.md           [TASK]      §19 — Best practices per modality
│
├── 📁 Authentication and Credentials
│   ├── esignet-authentication.md      [TASK]      §12 — OTP + biometric flows
│   └── inji-wallet.md                 [TASK]      §13 — Credential issuance + edge cases
│
├── 📁 Go-Live
│   ├── user-acceptance-testing.md     [TASK]      §20 — UAT exit criteria + scenarios
│   ├── pre-golive-readiness.md        [TASK]      §21 — Readiness sweep
│   └── golive-strategy.md             [TASK]      §22 — Internal then external, ramp
│
├── 📁 Closure
│   └── pilot-closure.md               [TASK]      §25 — Formal closure + deliverables
│
└── 📁 Reference
    ├── critical-success-factors.md    [REFERENCE] §24 — Risks + mitigations
    ├── registration-center-checklist.md [REFERENCE] Appendix A — Print-ready checklist
    ├── operator-run-sheet.md          [REFERENCE] Appendix B — Day-of run sheet
    └── security-and-privacy.md        [CONCEPT]   Appendix C — Security principles observed

Key Decisions Explained

Merge §1+2+3+4 → single Overview page
All four are conceptual background that a reader needs once. Splitting them creates unnecessary navigation hops before they reach actionable content.

Split §5 (Hardware) from §6 (Software)
Different audiences read these at different times — procurement reads hardware specs in Week 0; the technical team reads software requirements later. Keeping them separate also lets you link directly to hardware-requirements.md from the Infrastructure section.

Separate §23 (Governance) into Planning, not Go-Live
Governance structure is defined at pilot kick-off, not at go-live. Placing it in Planning aligns with when the reader actually needs it.

Elevate Appendices to first-class Reference pages
Appendix A (Center Checklist) and Appendix B (Run Sheet) are operationally critical documents. Field supervisors need to link to them directly — not scroll to the bottom of a 2,000-line page. As standalone pages they're also printable and linkable.

Split "Authentication + Credentials" from "Field Operations"
Sections 12 and 13 (eSignet, INJI Wallet) cover the authentication and credentialing phase of the resident journey — distinct from the registration phase covered in 17/18/19. Keeping them separate clarifies the sequence: register → process → authenticate → issue credential.

§24 (Critical Success Factors) → Reference, not Closure
A program manager reads this at the start of planning to avoid known pitfalls, and refers back to it throughout. Burying it at §24 (near the end) in the current doc means it's read too late.

Audience Map (who reads which section)

┌─────────────────────────────┬──────────────────────────────────────────────────────────────────────────┐
│          Audience           │                       Sections they primarily need                       │
├─────────────────────────────┼──────────────────────────────────────────────────────────────────────────┤
│ Program Manager             │ Overview, Planning, Governance, Critical Success Factors, Closure        │
├─────────────────────────────┼──────────────────────────────────────────────────────────────────────────┤
│ Technical Lead              │ Infrastructure, Platform Readiness, Sandbox Hardening, UAT               │
├─────────────────────────────┼──────────────────────────────────────────────────────────────────────────┤
│ Field Operator / Supervisor │ Registration Center, Registration Workflow, Biometric Capture, Run Sheet │
├─────────────────────────────┼──────────────────────────────────────────────────────────────────────────┤
│ Country Procurement         │ Hardware Requirements, Software Requirements                             │
├─────────────────────────────┼──────────────────────────────────────────────────────────────────────────┤
│ Trainer                     │ Training and Scenarios, Participant Mix                                  │
└─────────────────────────────┴──────────────────────────────────────────────────────────────────────────┘

This structure lets each audience navigate directly to their section without scrolling through irrelevant content.

```
