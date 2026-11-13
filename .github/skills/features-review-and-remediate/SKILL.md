---
name: features-review-and-remediate
description: >
  Audit, propose, and safely improve an existing Features page against the
  centralized Features standards without requiring release evidence or features.yaml.
argument-hint: "Configure target_page, mode, and pinned standards_revision in Step 0."
---

# Features Page Review and Remediation

## Purpose and Scope

Use this consumer-facing skill to improve an existing Markdown Features page. The page itself is
the required content input. Do not require `features.yaml`, release evidence, or source-code
access.

This skill improves editorial quality; it does not verify product facts. Do not invent,
remove, expand, or correct a feature claim unless the operator supplies an authoritative source
and explicitly requests that change.

## Step 0 - Review Configuration

```yaml
# ─── REQUIRED ──────────────────────────────────────────────────────────────
target_page: "act/arc-120-features.md"                           # repo path or GitHub blob/raw URL; e.g. "docs/features.md"
mode: "audit"                             # audit | suggest | apply

# ─── INTUIRACT STANDARDS ────────────────────────────────────────────────────
standards_mode: "remote"                  # remote | vendored; remote is the default
intuiract_repository: "svahsek/intuiract"
standards_revision: ""                    # required: commit SHA or immutable release tag
standards_vendor_root: ""                 # required only when standards_mode is vendored

# ─── OPTIONAL REVIEW CONTEXT ───────────────────────────────────────────────
repository_style_guide: ""                # repo-relative path, if one exists
approved_finding_ids: []                  # required for review_required changes in apply mode
report_path: "act/"
```

`target_page` is the entry gate:

- A repository-relative Markdown path supports `audit`, `suggest`, and `apply`.
- A GitHub blob/raw URL must identify a file in the current repository. Resolve and verify its
  local path before editing.
- An external published-page URL supports `audit` and `suggest` only. Stop with an error for
  `apply`, because there is no verified writable source file.

Do not begin until `target_page`, `mode`, and `standards_revision` are resolved.

## Step 1 - Load Intuiract Features Standards

Do not assume `standards/content-types/features.yaml` exists in the consumer repository.

In `remote` mode:

1. Fetch the pinned registry:
   `https://raw.githubusercontent.com/svahsek/intuiract/68f07ab50dd4fcfee614463a7ade473ff0300a7e/standards/content-types.yaml`.
2. Read `content_types.features.manifest`.
3. Fetch that manifest from the same pinned revision.
4. Resolve and download its `schema`, `rendering`, `human_rules`, `quick_reference`,
   `overview`, and `writing_guidelines` entrypoints only to the agent's ephemeral session
   workspace.
5. Record the registry URL, manifest URL, resolved commit SHA, and SHA-256 hash of every loaded
   entrypoint in the review report.

Never write Intuiract standards into the consumer repository. If the registry, manifest, or
pinned revision cannot be loaded, stop with an error; do not review against unverified
standards.

`vendored` mode is an explicit offline exception. Load standards only from
`standards_vendor_root`, record hashes and the selected mode in the report, and never switch
modes automatically.

## Standards Precedence

Use the manifest-resolved `writing_guidelines` for feature-page writing guidance.

- The target repository's documented style guide and terminology as higher-priority guidance
  when it exists.
- Generic style guidance only to resolve a gap not covered by repository or Intuiract standards.

## Modes

| Mode | Result |
|---|---|
| `audit` | Report findings only. This is the default. |
| `suggest` | Report findings and a proposed remediation plan; do not edit the page. |
| `apply` | Apply only safe edits and explicitly approved review-required changes. |

## Workflow

### 2. Load and Classify the Page

1. Read the complete target page and preserve its front matter, links, code blocks, and local
   conventions.
2. Use the Features standards loaded in Step 1; do not hardcode asset paths.
3. Determine whether the page is a product-level feature catalog, a feature-group page, or a
   single-feature page. Apply the relevant guidance without forcing a different page type.

### 3. Audit

Record each finding with a location, severity, class, applicable standard, explanation, and
proposed change.

| Area | Check |
|---|---|
| Structure | Heading hierarchy, title and overview, feature grouping, scanability, list consistency, and Markdown validity |
| Editorial quality | Spelling, grammar, punctuation, active voice, plain language, terminology consistency, and concise benefit-first descriptions |
| Style and accessibility | Descriptive links, readable list/table structure, code and UI formatting, and accessible heading order |
| Links and placeholders | Malformed links, unresolved placeholders, empty headings, and broken local links when they can be checked |
| Content integrity | Ambiguous claims, unsupported metrics, missing context, or unclear ownership; report these as review-required, not factual errors |

Use the Features schema and rendering rules as a structural reference, not as a demand to
convert an existing Markdown page into `features.yaml`.

### 4. Classify Findings

| Class | Examples | Apply automatically? |
|---|---|---|
| `auto_fix` | Typo, punctuation, obvious grammar error, Markdown spacing, malformed emphasis, inconsistent list marker | Yes, in `apply` mode |
| `review_required` | Rewriting a feature description, changing benefit language, moving a feature to another group, changing a heading with inbound anchors, adding a cross-reference | Only after explicit approval |
| `blocked_or_uncertain` | Product claim appears inaccurate, metric lacks a source, missing feature detail, link destination cannot be determined | No; explain what source or decision is needed |

Never classify a factual feature claim as `auto_fix`.

### 5. Report and Suggest

In `audit` and `suggest` modes, return a report in this shape:

```yaml
target_page: "path/to/features.md"
mode: "audit"
standards_provenance:
  standards_mode: "remote"
  registry_url: "..."
  manifest_url: "..."
  resolved_commit_sha: "..."
  entrypoint_hashes: {}
summary:
  auto_fix: 0
  review_required: 0
  blocked_or_uncertain: 0
findings:
  - id: "FTR-001"
    location: "line or heading"
    severity: "warning"
    class: "review_required"
    standard: "Features writing guideline: lead with user benefits"
    finding: "Description identifies an implementation detail but not a user outcome."
    proposed_change: "Rewrite after operator approval."
unresolved: []
```

In `suggest` mode, group approved candidates into a minimal edit plan. Do not silently turn a
suggestion into an edit.

### 6. Apply and Verify

1. In `apply` mode, make all `auto_fix` changes and only the `review_required` changes explicitly
   approved by the operator.
2. Keep the diff narrow. Preserve feature claims, product names, URLs, anchors, code, and
   examples unless their change was approved.
3. Re-run the structural, Markdown, link, and style checks applicable in the target repository.
4. Write the final report to `report_path`, including applied, deferred, and unresolved
   findings. If an edit fails a validation check, revert only that edit and report the failure.

## Completion Rules

- Never publish or claim factual verification without a supplied authoritative source.
- Do not create a `features.yaml` file as part of page remediation.
- Do not alter unrelated pages.
- Do not apply a semantic rewrite solely because a general style guide prefers different wording.