# Simple Way to Reference Central Repository Skills

## The Question

How do I simply reference a skill (like "feature writing") from my central `.github` repository in another repo?

---

## Simple 3-Step Setup

### Step 1: Add Reference to Your `copilot-instructions.md`

**Edit**: `.github/copilot-instructions.md` (in your working repo, e.g., mosipiodocs)

**Add this at the top**:

```markdown
# Documentation AI Instructions

## Central Skills Repository

I have reusable skills at: https://github.com/yourusername/.github/tree/main/skills

### Feature Writing Skill
Location: https://github.com/yourusername/.github/blob/main/skills/feature-writing/README.md

When writing feature documentation:
1. Fetch the skill instructions from central repo
2. Follow the guidelines and templates provided
3. Use the examples as reference

**To use**: Reference the skill content below or fetch it dynamically.
```

### Step 2: Choose How to Include the Skill

**Option A: Copy-paste the skill content** (simplest, works immediately):

```markdown
## Feature Writing Skill (from central repo)

### When to Use
Use when documenting a new feature for MOSIP modules.

### Structure
1. Feature Overview
2. User Benefits
3. Technical Details
4. Configuration
5. Examples
6. Troubleshooting

### Template
[Copy the template from your central repo here]
```

**Option B: Direct URL reference** (Claude Code can follow links):

```markdown
## Feature Writing Skill

See: https://github.com/yourusername/.github/blob/main/skills/feature-writing/README.md

When documenting features, follow the guidelines at the link above.

Quick summary:
- Use the feature template structure
- Include user benefits section
- Provide configuration examples
- Add troubleshooting tips
```

### Step 3: Use It

**In your prompt to Claude Code, simply say**:

```
"I need to write feature documentation.
Use the Feature Writing Skill from my central repo referenced in .github/copilot-instructions.md"
```

**OR just ask**:

```
"Create feature documentation for [feature name] following my feature writing guidelines"
```

Claude Code will automatically:
1. Read `.github/copilot-instructions.md`
2. See the reference to your skill
3. Follow those guidelines

---

## Even Simpler: Direct URL Reference

**Just add this to `.github/copilot-instructions.md`**:

```markdown
# Documentation Instructions

## Skills from Central Repo

### Feature Writing
See: https://github.com/yourusername/.github/blob/main/skills/feature-writing/README.md

When documenting features, follow the guidelines at the link above.
```

**That's it!** Claude Code can follow GitHub links and will reference that skill.

---

## Example Structure

### Your Central Repo

```
github.com/yourusername/.github/
└── skills/
    └── feature-writing/
        ├── README.md           # Main skill documentation
        ├── template.md         # Feature doc template
        └── examples/
            └── example-feature.md
```

### In Your Working Repo (mosipiodocs)

**File**: `.github/copilot-instructions.md`

```markdown
# MOSIP Documentation AI Instructions

## Feature Writing Skill

Use guidelines from: https://github.com/yourusername/.github/blob/main/skills/feature-writing/README.md

When writing feature documentation:
- Start with user-facing benefits
- Include configuration steps
- Provide code examples
- Add troubleshooting section

Template: https://github.com/yourusername/.github/blob/main/skills/feature-writing/template.md
```

---

## Using It in Practice

```
You: "Write feature documentation for biometric authentication"

Claude Code:
1. Reads .github/copilot-instructions.md
2. Sees reference to feature-writing skill
3. Can fetch the template from that URL
4. Generates documentation following those guidelines
```

---

## Optional: Helper Script for Frequent Use

If you use this skill often:

**File**: `scripts/use-feature-skill.sh`

```bash
#!/bin/bash
# Quick access to feature writing skill

SKILL_URL="https://raw.githubusercontent.com/yourusername/.github/main/skills/feature-writing"

case "$1" in
  "template")
    curl -s "${SKILL_URL}/template.md"
    ;;
  "guidelines")
    curl -s "${SKILL_URL}/README.md"
    ;;
  "example")
    curl -s "${SKILL_URL}/examples/example-feature.md"
    ;;
  *)
    echo "Usage: $0 {template|guidelines|example}"
    ;;
esac
```

**Usage**:
```bash
chmod +x scripts/use-feature-skill.sh

# View the template
./scripts/use-feature-skill.sh template

# View guidelines
./scripts/use-feature-skill.sh guidelines

# See example
./scripts/use-feature-skill.sh example
```

---

## Summary

**Simplest approach**:
1. ✅ Add GitHub URL to `.github/copilot-instructions.md`
2. ✅ Tell Claude Code to use that skill
3. ✅ Done!

**Claude Code automatically**:
- Reads your instructions file
- Can access GitHub URLs
- Follows the guidelines

**No complex setup needed!** Just reference the URL and Claude Code will use it.

---

## What Makes This Simple

- ✅ No submodules
- ✅ No sync scripts
- ✅ No copying files
- ✅ Just a URL reference
- ✅ Always uses latest from central repo
- ✅ Works immediately

## Trade-off

- ❌ Requires internet connection
- ❌ No version pinning (always latest)
- ❌ If central repo is down, reference breaks

**For offline/stable version**: Use Git submodules (see next guide)

---

*Related: Central Repository, Skills, AI Instructions, GitHub References*
