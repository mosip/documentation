# Release Information Architecture Proposal - 1

## Context
The current release listing model has become difficult to navigate as entries grow across both MOSIP platform releases and independent component releases.

## Current Issues

1. Single mixed timeline for different release streams
- Platform and component releases appear together, making it hard to identify relevance quickly.

2. Scale and scanability problem
- The release list has grown long enough that users struggle to locate a specific release quickly.

3. Naming and linkage inconsistency
- Mixed naming styles, occasional typos, and mixed relative/absolute linking patterns create ambiguity.

4. Duplicate index maintenance
- Both `summary.md` and releases index pages act as master lists, increasing drift and maintenance errors.

5. Ambiguity in applicability
- Users cannot easily determine whether an item applies to MOSIP platform, a specific component, or both.

## Why Users Feel Overwhelmed

1. Too much mixed information in one list
2. No first-class route by component
3. Hard to compare what changed and whether migration is needed
4. No clear support status framing (for example LTS, stable, beta, patch)

## How Leading Product Docs Typically Handle This

1. Separate release streams first
- Platform releases and component releases are indexed separately.

2. Keep a unified feed as secondary
- One combined feed may exist, but it is not the primary navigation surface.

3. Add filterable metadata
- Filters typically include product/component, release type, date range, support status, and breaking-change indicator.

4. Include "what changed for me" summaries
- Highlight breaking changes, upgrade actions, migration steps, and security items.

5. Generate indexes from structured metadata
- Avoid hand-maintained long lists where ordering and links drift.

## Proposed Solution for MOSIP Docs

### 1) Two-layer release IA

Layer 1: Release Hub
- Clear entry cards:
  - MOSIP Platform Releases
  - Component Releases
  - All Releases (combined)

Layer 2: Stream pages
- Platform Releases page (latest first)
- Component Releases page (latest first)
- Optional per-component pages (Android RC, DSL, API Test Commons, PMS, Resident Services, and others)

### 2) Metadata-driven release records

Use structured release metadata fields (YAML frontmatter or manifest), such as:
- `release_date`
- `stream` (platform/component)
- `component_name`
- `version`
- `release_type` (major/minor/patch/beta/dp)
- `support_status`
- `breaking_changes` (true/false)
- `upgrade_from` (optional)

### 3) Standardized release summary blocks

Each release page should include:
- Scope: platform/component
- Compatibility / target audience
- Breaking changes
- Migration steps (if needed)
- Key enhancements and bug fixes
- Test report links

### 4) Navigation simplification

In `summary.md`:
- Keep only a concise "Latest Releases" section for each stream
- Add "View all" links to dedicated stream index pages
- Avoid maintaining one very long mixed chronological list

## Suggested Rollout Plan

### Phase 1 (Quick Win)

1. Split current release list into:
- Platform Releases
- Component Releases

2. Show latest 10 in each list
3. Add "View all" links to stream pages

### Phase 2

1. Create component-specific release index pages
2. Standardize release page headers and summary blocks

### Phase 3

1. Introduce metadata manifest and auto-generated index pages
2. Remove manual ordering burden from `summary.md`

### Phase 4

1. Add release comparison and filter views
2. Add breaking-changes-only and migration-required views

## Expected Outcomes

1. Faster release discovery
2. Reduced ambiguity about applicability
3. Better upgrade decision-making
4. Lower maintenance overhead and fewer broken/misaligned links

## Notes for Implementation

- Preserve existing release page URLs to avoid link breakage.
- Introduce new index pages and progressively redirect navigation there.
- Treat the combined feed as secondary; stream-first navigation should be the default.



# Release information architecture proposal - 2

You are entirely right to call that out. Let’s look at this with a much deeper analytical lens.

Looking closely at your active GitBook live hierarchy (from *Partner Management System Revamp 1.3.0-beta.5* down through *Registration Processor 1.2.1.3*, *v1.2.2.0 DSL*, and *0.2.0 Infra*), the problem isn't just that things are mixed up. The problem is a **fundamental clash of versioning lifecycles** causing an architectural collapse in the sidebar.

Here is a rigorous analysis of *why* it's broken under GitBook's hood, followed by a concrete, execution-ready blueprint.

---

## Part 1: Deep Architectural Analysis

### 1. The Core Problem: The "Release Object" Mismatch

MOSIP has two entirely different release objects masquerading as the same thing in your docs:

* **The Platform Milestone:** (e.g., `v1.2.0 Asymmetric Amoeba`). This represents a holistic ecosystem state. It has a long lifespan, specific deprecation horizons, and strict upgrade paths.
* **The Component Sprint:** (e.g., `Partner Management System 1.3.0-beta.5`, `API Test Commons`, `Infra`). These are modular, move fast, deploy independently, and iterate asynchronously.

When you force both into a flat chronological list, a minor beta patch for a test utility pushes a critical core platform update down the page. The user loses all context of **dependency**.

### 2. The GitBook Constraint Profile

Since GitBook lacks automated collections, a naive separation strategy fails because:

* **Maintenance Overhead Escalates:** If you split lists manually, every single component tag update requires updating multiple index files. Human error scales linearly.
* **Sidebar Bloat:** If you give every component version its own page, the left-hand sidebar expands into a multi-scroll nightmare, destroying the discovery of core user guides.

---

## Part 2: The Proposed Structural Blueprint

To fix this permanently, we must transition from a **Chronological Stream** model to an **Ecosystem Module** model.

### Step 1: High-Impact Sidebar Redesign (`SUMMARY.md`)

We will collapse the flat list into two high-level groupings. Component logs will no longer get their own individual pages in the main sidebar; instead, they are consolidated into target parent pages.

```markdown
### 🚀 ROADMAP AND RELEASES
* [Overview & Version Matrix](roadmap-and-releases/releases.md)
* [Platform Core Releases](roadmap-and-releases/platform-core.md)

### 📦 COMPONENT ECOSYSTEM
* [Registration & Client Modules](components/registration-ecosystem.md)
* [Identity & Authentication](components/identity-auth.md)
* [Partner & Admin Services](components/partner-admin.md)
* [Infrastructure & Tooling](components/infra-tooling.md)

```

---

### Step 2: The Core Landing Page Strategy (`releases.md`)

The new landing page serves as a router. Instead of a text dump, it should leverage an anchored, scannable summary table mapping components directly back to the supported core platform version.

#### Latest Deployment Matrix

| Ecosystem Component | Latest Version | Release Date | Target Core Platform | Release Notes |
| --- | --- | --- | --- | --- |
| **Partner Management (PMS)** | `1.3.0-beta.5` | May 20, 2026 | `v1.2.x` / `v1.3.x` | [View Notes](https://docs.mosip.io/1.2.0/roadmap-and-releases/releases/partner-management-system-revamp-1.3.0-beta.5) |
| **Registration Processor** | `1.2.1.3` | Apr 22, 2026 | `v1.2.0` | [View Notes](https://docs.mosip.io/1.2.0/roadmap-and-releases/releases/registration-processor-1.2.1.3-and-id-repository-1.2.3.0) |
| **ID Repository** | `1.2.3.0` | Apr 22, 2026 | `v1.2.0` | [View Notes](https://docs.mosip.io/1.2.0/roadmap-and-releases/releases/registration-processor-1.2.1.3-and-id-repository-1.2.3.0) |
| **Android Reg Client** | `v1.0.1` | Apr 10, 2026 | `v1.2.0` | [View Notes](https://docs.mosip.io/1.2.0/roadmap-and-releases/releases/android-registration-client-v1.0.1) |

---

### Step 3: Component Consolidation via Tabs & Accordions

Instead of 50 separate files for components like *API Test Commons* or *DSL*, you group related components onto single files using GitBook's native **Tab components** for separation, and **Accordions** for version depth.

For example, inside `components/partner-admin.md`:

```markdown
# Partner & Admin Services Ecosystem

# This page tracks independent releases for the Partner Management System (PMS) and Core Admin Services.

{% tabs %}
{% tab title="Partner Management System (PMS)" %}
### Current Stable / Beta
* **Version 1.3.0-beta.5** (May 20, 2026) — [Full Release Notes](../path)

### Changelog Archive
{% accordion %}
{% title %}Version 1.3.0-beta.4 (Feb 4, 2026){% endtitle %}
* Bug fixes for registration token validation.
* [View Legacy Notes](../path)
{% endaccordion %}

{% accordion %}
{% title %}Version 1.2.2.2 Patch (Legacy){% endtitle %}
* Hotfix for partner onboarding workflows.
{% endaccordion %}
{% endtab %}

{% tab title="Admin Services" %}
### Current Release
* **Version 1.2.1.3** (Sept 5, 2025) — [Full Release Notes](../path)
{% endtab %}
{% endtabs %}

```

---

## Part 3: Operational Migration Plan

If you want to execute this change smoothly without breaking existing incoming bookmarks/URLs (which would cause a massive SEO and UX penalty for your community), follow this sequence:

1. **Draft the New Architecture Behind the Scenes:** Create the new composite files (`registration-ecosystem.md`, `partner-admin.md`, etc.) without linking them in `SUMMARY.md` yet.
2. **Port the Content via Copy/Paste:** Move the release notes of the sub-pages into the Accordion and Tab structures of the new consolidation pages.
3. **Deploy Redirect Maps (Crucial GitBook Step):** GitBook supports a `redirects.json` file at the root of your repository. Map all your old individual patch URLs to the new consolidated pages and section anchors.
```json
{
  "roadmap-and-releases/pms-revamp-1.3.0-beta.4": "components/partner-admin#version-130-beta4"
}

```


4. **Swap the `SUMMARY.md`:** Replace the old flat sidebar list with the new modular layout.

This transformation takes your documentation from a raw dumping ground of chronological events to an intentional, architectural map of the MOSIP software state.
