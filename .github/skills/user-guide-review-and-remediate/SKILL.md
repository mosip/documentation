---
name: user-guide-review-and-remediate
description: >
  Audit, suggest, and safely improve an existing Markdown User Guide against
  pinned Intuiract standards without requiring release evidence or generated YAML.
argument-hint: "Configure target_page, mode, and pinned standards_revision in Step 0."
---

# User Guide Review and Remediation

## Purpose and Scope

This consumer skill remediates an existing Markdown page. It uses DITA, Diataxis, and TGDP as
editorial models only. It never creates XML, a guide map, generated YAML, or factual content.

## Step 0 - Review Configuration

```yaml
target_page: ""                           # repository path or GitHub blob/raw URL
mode: "audit"                             # audit | suggest | apply

standards_mode: "remote"                  # remote | vendored; remote is the default
intuiract_repository: "svahsek/intuiract"
standards_revision: ""                    # required: commit SHA or immutable release tag
standards_vendor_root: ""                 # required only when standards_mode is vendored

repository_style_guide: ""                # repository-relative path, if one exists
approved_finding_ids: []                  # required for review_required changes in apply mode
report_path: "docs/reports/user-guide-remediation-report.yaml"
```

`target_page` is the entry gate. A repository-relative Markdown path supports every mode. A
GitHub blob/raw URL must identify a file in the current repository and resolve to its local path
before editing. An external published-page URL supports `audit` and `suggest` only; stop for
`apply` because no writable source file is verified.

Do not begin until `target_page`, `mode`, and `standards_revision` are resolved.

## Step 1 - Load Intuiract User Guide Standards

Do not assume standards files are present in the consumer repository.

In `remote` mode:

1. Fetch `https://raw.githubusercontent.com/svahsek/intuiract/c2a8ad9840217f2e8e3f07f6826a7ac9a8e93f4f/standards/content-types.yaml`.
2. Read `content_types.user-guide.manifest`, then fetch that manifest from the same pinned revision.
3. Resolve and download its `content_model`, `rendering`, `human_rules`, `quick_reference`,
   `overview`, and `writing_guidelines` entrypoints only to the agent's ephemeral session workspace.
4. Record the registry URL, manifest URL, resolved commit SHA, and SHA-256 hash of every loaded
   entrypoint in the review report.

Never write Intuiract standards into the consumer repository. If the registry, manifest, or
pinned revision cannot be loaded, stop with an error; do not review against unverified standards.
`vendored` mode is an explicit offline exception: load only from `standards_vendor_root`, record
the mode and hashes, and never switch modes automatically.

## Step 2 - Classify the Page

Read the complete page and preserve its front matter, links, code blocks, anchors, and local
conventions. Segment it and classify every unit according to the loaded `content_model`. Record
the compass axes, structural signals, candidate type, and high/medium/low confidence. Low-
confidence units emit `UGD-CLASSIFY-AMBIGUOUS` and are not scored against `TPC-*` rules.

The target repository's style guide and terminology take precedence over generic wording
preferences. They do not override the loaded safety rules.

## Step 3 - Audit

Check:

- purpose, audience, heading hierarchy, scanability, and Markdown structure;
- task goal, prerequisites, ordered steps, and expected result;
- tutorial starting state and verification checkpoints;
- reference precision and troubleshooting symptom-to-resolution path;
- active voice, sentence clarity, terminology, links, code/UI formatting, accessibility, and placeholders;
- ambiguous claims, missing facts, unsupported metrics, and unclear ownership.

Assign finding IDs in document order (`UGD-0001`, `UGD-0002`, and so on). Every finding must
cite exactly one loaded rule ID and include the triggering evidence.

| Class | Apply in `apply` mode? |
|---|---|
| `auto_fix` — spelling, punctuation, grammar, non-semantic active voice, Markdown/list formatting | Yes |
| `review_required` — restructuring, splitting sections, task rewrites, links, terminology, prerequisites, or expected outcomes | Only when listed in `approved_finding_ids` |
| `blocked_or_uncertain` — product behavior, facts, metrics, missing procedure, or ambiguous ownership | Never; request an authoritative source |

## Step 4 - Suggest, Apply, and Verify

- `audit`: return findings only.
- `suggest`: return findings and a minimal remediation plan; do not edit.
- `apply`: make all `auto_fix` edits and only approved `review_required` edits. Keep the diff
  narrow and preserve claims, URLs, anchors, code, and examples unless approved.

Write `report_path` using the loaded `audit_report_schema`. At minimum:

```yaml
target_page: "docs/example.md"
mode: "audit"
page_classification:
  units:
    - unit_id: "u1"
      line_range: [10, 18]
      classified_type: "task"
      classification_confidence: "high"
      structural_signals: ["imperative_verbs", "ordered_list"]
findings:
  - id: "UGD-0001"
    rule_id: "TPC-001"
    severity: "warning"
    check_type: "heuristic"
    class: "review_required"
    location: {unit_id: "u1", line_range: [10, 18]}
    evidence: "Numbered steps have no preceding goal statement."
    requires_approval: true
unresolved: []
```

Re-run deterministic checks after edits. If an edit fails re-validation, revert only that edit
and report it. `blocked_or_uncertain` findings always remain in `unresolved`.

## Completion Rules

- Never invent or change a product fact without an authoritative source.
- Do not create generated YAML as part of User Guide remediation.
- Do not alter unrelated pages.

<!-- Guide
target_page: "docs/user-guide.md"
mode: "audit"
standards_mode: "remote"
intuiract_repository: "svahsek/intuiract"
standards_revision: "<pinned commit SHA>"
report_path: "docs/reports/user-guide-remediation-report.yaml"
-->
