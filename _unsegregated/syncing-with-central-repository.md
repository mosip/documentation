# Syncing with Central Repository: Complete Guide

## The Question

Is there a way to automatically sync resources from a central `.github` repository to working repositories?

**Answer**: Yes! Multiple ways, depending on your needs.

---

## Option 1: Git Submodules (Recommended)

**What it does**: Links your central `.github` repo directly into this repo, automatically tracks updates.

### Setup

```bash
cd /Users/keshavsingh/Office/mosipiodocs/mosipiodocs

# Add central repo as submodule
git submodule add https://github.com/yourusername/.github .github/central

# Now you have:
# .github/central/skills/
# .github/central/prompts/
# .github/central/templates/
```

### Update Your Instructions

**File**: `.github/copilot-instructions.md`

```markdown
# MOSIP Documentation AI Instructions

## Central Skills (Synced)

Skills are synced from central repo at: `.github/central/skills/`

### Feature Writing Skill
See: `.github/central/skills/feature-writing/README.md`

This is automatically synced with: https://github.com/yourusername/.github

### Available Skills
- Feature Writing: `.github/central/skills/feature-writing/`
- Link Checking: `.github/central/skills/link-checker/`
- Documentation Review: `.github/central/skills/doc-review/`

### Prompts
Available at: `.github/central/prompts/`

### Templates
Available at: `.github/central/templates/`
```

### Sync Updates

```bash
# Update to latest from central repo
git submodule update --remote .github/central

# Commit the update
git add .github/central
git commit -m "chore: sync central resources"
git push
```

### Auto-sync with GitHub Actions

**File**: `.github/workflows/sync-central-resources.yml`

```yaml
name: Sync Central Resources

on:
  schedule:
    - cron: '0 0 * * 1'  # Weekly on Monday
  workflow_dispatch:      # Manual trigger

jobs:
  sync:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
        with:
          submodules: true
          token: ${{ secrets.GITHUB_TOKEN }}

      - name: Update submodule
        run: |
          git submodule update --remote .github/central

      - name: Check for changes
        id: changes
        run: |
          if [[ -n $(git status --porcelain) ]]; then
            echo "has_changes=true" >> $GITHUB_OUTPUT
          else
            echo "has_changes=false" >> $GITHUB_OUTPUT
          fi

      - name: Commit and push if changed
        if: steps.changes.outputs.has_changes == 'true'
        run: |
          git config user.name "github-actions[bot]"
          git config user.email "github-actions[bot]@users.noreply.github.com"
          git add .github/central
          git commit -m "chore: sync central resources [automated]"
          git push
```

---

## Option 2: GitHub Actions Sync (No Submodule)

If you don't want submodules, sync files directly:

**File**: `.github/workflows/sync-skills.yml`

```yaml
name: Sync Skills from Central Repo

on:
  schedule:
    - cron: '0 0 * * 1'  # Weekly on Monday
  workflow_dispatch:

jobs:
  sync:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
        with:
          token: ${{ secrets.GITHUB_TOKEN }}

      - name: Fetch central repo
        run: |
          # Clone central repo
          git clone https://github.com/${{ github.repository_owner }}/.github /tmp/central-repo

      - name: Sync skills
        run: |
          # Create directory if doesn't exist
          mkdir -p .github/synced

          # Copy skills
          cp -r /tmp/central-repo/skills .github/synced/
          cp -r /tmp/central-repo/prompts .github/synced/
          cp -r /tmp/central-repo/templates .github/synced/

          # Create manifest
          cat > .github/synced/MANIFEST.md << EOF
          # Synced Resources

          Last synced: $(date -u +"%Y-%m-%d %H:%M:%S UTC")
          Source: https://github.com/${{ github.repository_owner }}/.github

          ## Contents
          - Skills: $(ls -1 .github/synced/skills | wc -l) items
          - Prompts: $(ls -1 .github/synced/prompts | wc -l) items
          - Templates: $(ls -1 .github/synced/templates | wc -l) items
          EOF

      - name: Check for changes
        id: changes
        run: |
          if [[ -n $(git status --porcelain) ]]; then
            echo "has_changes=true" >> $GITHUB_OUTPUT
          else
            echo "has_changes=false" >> $GITHUB_OUTPUT
          fi

      - name: Commit and push
        if: steps.changes.outputs.has_changes == 'true'
        run: |
          git config user.name "github-actions[bot]"
          git config user.email "github-actions[bot]@users.noreply.github.com"
          git add .github/synced
          git commit -m "chore: sync resources from central repo [automated]"
          git push
```

**Then reference synced resources**:

```markdown
# .github/copilot-instructions.md

## Central Skills (Auto-synced)

Skills synced to: `.github/synced/skills/`

Last sync: See `.github/synced/MANIFEST.md`

### Feature Writing
Location: `.github/synced/skills/feature-writing/README.md`
```

---

## Option 3: Local Sync Script

For manual control:

**File**: `scripts/sync-central.sh`

```bash
#!/bin/bash
# Sync resources from central repo

set -e

GITHUB_USER="${GITHUB_USER:-yourusername}"
CENTRAL_REPO="https://github.com/${GITHUB_USER}/.github.git"
SYNC_DIR=".github/synced"
TEMP_DIR=$(mktemp -d)

echo "🔄 Syncing from ${CENTRAL_REPO}..."

# Clone central repo
git clone --depth 1 "${CENTRAL_REPO}" "${TEMP_DIR}"

# Create sync directory
mkdir -p "${SYNC_DIR}"

# Sync resources
echo "📦 Copying skills..."
cp -r "${TEMP_DIR}/skills" "${SYNC_DIR}/" 2>/dev/null || echo "No skills found"

echo "📝 Copying prompts..."
cp -r "${TEMP_DIR}/prompts" "${SYNC_DIR}/" 2>/dev/null || echo "No prompts found"

echo "📋 Copying templates..."
cp -r "${TEMP_DIR}/templates" "${SYNC_DIR}/" 2>/dev/null || echo "No templates found"

# Create manifest
cat > "${SYNC_DIR}/MANIFEST.md" << EOF
# Synced Resources

**Last synced**: $(date -u +"%Y-%m-%d %H:%M:%S UTC")
**Source**: ${CENTRAL_REPO}
**By**: $(git config user.name)

## Contents
- Skills: $(find ${SYNC_DIR}/skills -type f 2>/dev/null | wc -l) files
- Prompts: $(find ${SYNC_DIR}/prompts -type f 2>/dev/null | wc -l) files
- Templates: $(find ${SYNC_DIR}/templates -type f 2>/dev/null | wc -l) files

## Available Resources

### Skills
$(find ${SYNC_DIR}/skills -name "README.md" -type f 2>/dev/null | sed 's|.github/synced/skills/||' | sed 's|/README.md||' | sed 's|^|- |' || echo "None")

### Prompts
$(find ${SYNC_DIR}/prompts -name "*.md" -type f 2>/dev/null | sed 's|.github/synced/prompts/||' | sed 's|^|- |' || echo "None")

### Templates
$(find ${SYNC_DIR}/templates -name "*.md" -type f 2>/dev/null | sed 's|.github/synced/templates/||' | sed 's|^|- |' || echo "None")
EOF

# Cleanup
rm -rf "${TEMP_DIR}"

echo "✅ Sync complete!"
echo ""
echo "Synced to: ${SYNC_DIR}/"
echo "Manifest: ${SYNC_DIR}/MANIFEST.md"
echo ""
echo "To commit:"
echo "  git add ${SYNC_DIR}"
echo "  git commit -m 'chore: sync central resources'"
echo "  git push"
```

**Usage**:
```bash
chmod +x scripts/sync-central.sh

# Sync resources
./scripts/sync-central.sh

# Commit if you want
git add .github/synced
git commit -m "chore: sync central resources"
git push
```

---

## Option 4: Watch for Changes (Advanced)

Auto-sync when central repo changes:

**File**: `.github/workflows/watch-central-repo.yml`

```yaml
name: Watch Central Repo for Changes

on:
  repository_dispatch:
    types: [central-repo-updated]
  workflow_dispatch:

jobs:
  sync:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      - name: Sync resources
        run: |
          bash scripts/sync-central.sh

      - name: Create PR
        uses: peter-evans/create-pull-request@v5
        with:
          commit-message: "chore: sync central resources"
          title: "🔄 Sync resources from central repo"
          body: |
            Central repository was updated. This PR syncs the latest resources.

            - Skills
            - Prompts
            - Templates

            See `.github/synced/MANIFEST.md` for details.
          branch: sync-central-resources
```

**Then in your central repo**, add webhook to trigger this:

```bash
# When you update central repo, trigger sync in other repos
curl -X POST \
  -H "Authorization: token ${GITHUB_TOKEN}" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/yourusername/mosipiodocs/dispatches \
  -d '{"event_type":"central-repo-updated"}'
```

---

## Comparison

| Method | Pros | Cons | Best For |
|--------|------|------|----------|
| **Git Submodule** | ✅ True sync, version tracked, works offline | ❌ Requires submodule commands | Teams comfortable with git |
| **GitHub Actions Sync** | ✅ Automated, no submodules, simple | ❌ Not real-time, requires Actions | Set and forget automation |
| **Manual Script** | ✅ Full control, works anywhere | ❌ Manual trigger required | When you want control |
| **Watch Changes** | ✅ Auto-updates on central changes | ❌ Complex setup, requires webhooks | High-sync frequency needs |

---

## Recommended Approach: Git Submodules + Auto-sync

### Quick Setup:

```bash
# Add submodule
git submodule add https://github.com/yourusername/.github .github/central

# Initial commit
git add .gitmodules .github/central
git commit -m "chore: add central resources as submodule"
git push
```

### Update `.github/copilot-instructions.md`:

```markdown
# Documentation AI Instructions

## Central Resources (Synced via Submodule)

Resources synced from: https://github.com/yourusername/.github
Local path: `.github/central/`

### Skills
- Feature Writing: `.github/central/skills/feature-writing/`
- Documentation Review: `.github/central/skills/doc-review/`

### Prompts
- API Documentation: `.github/central/prompts/documentation/api-reference.md`
- Tutorial: `.github/central/prompts/documentation/tutorial.md`

### Templates
- Good Docs: `.github/central/templates/gooddocs/`

## Syncing
Automatically synced weekly via GitHub Actions.
Manual sync: `git submodule update --remote .github/central`
```

### Add Auto-sync Action

Create `.github/workflows/sync-central-resources.yml` (see Option 1 above)

---

## Benefits of This Setup

**Git Submodules + Auto-sync gives you**:
- ✅ Resources are locally available (works offline)
- ✅ Auto-synced weekly (set and forget)
- ✅ Manual sync when needed: `git submodule update --remote`
- ✅ Version tracked in git (can roll back)
- ✅ True sync (not just copying files)
- ✅ Works with all git tools

---

## Quick Reference

### Daily Use

```bash
# Update central resources manually
git submodule update --remote .github/central
git add .github/central
git commit -m "chore: update central resources"
git push
```

### Verify Sync Status

```bash
# Check current version
cd .github/central
git log -1

# Check for updates
git fetch
git log HEAD..origin/main
```

### Clone This Repo on New Machine

```bash
# Clone with submodules
git clone --recursive https://github.com/yourusername/mosipiodocs

# Or if already cloned
git submodule init
git submodule update
```

---

## Summary

**Best approach**: Git Submodules + Auto-sync GitHub Action

This gives you:
- Local access to resources
- Automatic weekly updates
- Manual control when needed
- Version tracking
- Works offline

**Alternative**: Direct URL references (simplest, but requires internet)

---

*Related: Git Submodules, GitHub Actions, Central Repository, Resource Syncing*
