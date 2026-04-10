---
name: release-notes
description: 'Generate release notes for this repository using the shared central schema and rendering rules.'
argument-hint: 'Provide release version and date'
---

# Release Notes

## Central Standard
Fetch the release-notes manifest from the central standards repository.

Manifest URL:
https://raw.githubusercontent.com/<owner>/<repo>/main/.github/standards/content-types/release-notes.yaml

## Procedure
1. Read the manifest.
2. Fetch the schema and rendering files listed in entrypoints.
3. Gather this repository's release inputs:
   - merged PRs
   - linked issues
   - notable discussions
   - validated test evidence
4. Build a release-notes YAML payload.
5. Validate against the shared schema.
6. Render Markdown using the shared rendering rules.
7. Save output to docs/release-notes/<version>.md