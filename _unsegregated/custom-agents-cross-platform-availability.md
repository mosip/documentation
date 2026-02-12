# Custom Agents: Cross-Platform Availability

## The Question

Can custom agents created with GitHub be used in Google Docs, Microsoft Word, and other platforms?

---

## The Answer

**Partially yes, but with important distinctions.** Let me clarify what works where.

---

## What You're Creating vs Where It Works

### MCP Servers (What We've Been Discussing)

**Where they work**:
- ✅ **Claude Code** (desktop app) - anywhere you use Claude Code
- ✅ **Your local machine** - across all repositories
- ❌ **NOT inside Google Docs/MS Word interface** - they don't run there

**What they can do**:
- ✅ **Read from** Google Docs, Gmail, Drive (via API)
- ✅ **Write to** Google services (create docs, send emails)
- ✅ **Access data** from any service with an API
- ❌ **Cannot** add UI elements to Google Docs/MS Word

### Real-World Example

**When using Claude Code**:
```
You're writing docs in VS Code/Claude Code
  ↓
Your MCP agent can:
  - Search your Gmail for related discussions
  - Pull context from Google Docs
  - Read your Drive files
  - Get JIRA issues
  - Check Slack conversations
  ↓
Agent provides this context to help you write
```

**When working INSIDE Google Docs**:
```
You're inside Google Docs web interface
  ↓
Your MCP agent CANNOT directly run here
  ↓
BUT you could build a different type of integration (see below)
```

---

## Different Integration Types

### 1. MCP Server (Local Agent)

**Runs**: On your computer with Claude Code
**Accessible**: Any repository in Claude Code
**Can access**: Google/MS services via API

```
┌─────────────────┐
│  Claude Code    │
│  (your machine) │
│                 │
│  ┌───────────┐  │
│  │MCP Server │  │──API──> Gmail
│  │(Agent)    │  │──API──> Google Drive
│  │           │  │──API──> JIRA
│  └───────────┘  │──API──> Slack
└─────────────────┘
```

### 2. Browser Extension (Runs in Browser)

**Runs**: In Chrome/Firefox/Edge
**Accessible**: Any webpage (including Google Docs, MS Office Online)
**Can access**: What the webpage exposes + any APIs you configure

```
┌─────────────────────┐
│  Browser            │
│                     │
│  ┌───────────────┐  │
│  │Extension      │  │
│  │(runs on every │  │
│  │ webpage)      │  │
│  └───────────────┘  │
│         ↓           │
│  Google Docs page   │
│  MS Office Online   │
└─────────────────────┘
```

**Example**: Grammarly works this way - in Google Docs, Gmail, etc.

### 3. Google Workspace Add-on (Runs Inside Google Apps)

**Runs**: Inside Google Docs/Sheets/Gmail sidebar
**Accessible**: Only in Google Workspace
**Can access**: Google APIs + external APIs

```
┌─────────────────────────┐
│  Google Docs            │
│                         │
│  ┌──────────┐           │
│  │Document  │  Sidebar: │
│  │          │  ┌──────┐ │
│  │          │  │ Your │ │
│  │          │  │Add-on│ │
│  │          │  └──────┘ │
│  └──────────┘           │
└─────────────────────────┘
```

### 4. Microsoft Office Add-in (Runs Inside MS Office)

**Runs**: Inside Word/Excel/PowerPoint (Online or Desktop)
**Accessible**: Only in Microsoft Office apps
**Can access**: Microsoft Graph API + external APIs

---

## What Each Type Can Do

| Integration Type | Works in Claude Code | Works in Google Docs | Works in MS Word | Accesses Gmail/Drive | Best For |
|-----------------|---------------------|---------------------|------------------|---------------------|----------|
| **MCP Server** | ✅ Yes | ❌ No | ❌ No | ✅ Via API | Claude Code workflows |
| **Browser Extension** | ❌ No | ✅ Yes | ✅ Online only | ✅ Via API | Cross-platform web |
| **Google Add-on** | ❌ No | ✅ Yes | ❌ No | ✅ Native access | Google-only users |
| **MS Office Add-in** | ❌ No | ❌ No | ✅ Yes | ✅ Via API | Microsoft-only users |
| **Web Service** | ✅ Via API | ✅ Via calls | ✅ Via calls | ✅ Via API | Universal access |

---

## Your Use Case: Documentation Agent

### Option 1: MCP Server (Easiest Start)

**Create once, use in Claude Code everywhere**

**When to use**:
- Writing documentation in VS Code/Claude Code
- Want to pull context from multiple sources
- Need it across all your projects

**Example**:
```
Working in Claude Code on mosipiodocs repo
  ↓
Ask: "What are recent Gmail discussions about authentication?"
  ↓
MCP agent searches Gmail
  ↓
Provides context for documentation
```

### Option 2: Google Workspace Add-on (For Google Docs Users)

**Works inside Google Docs interface**

**When to use**:
- Team primarily uses Google Docs
- Want AI assistant in the sidebar
- Need to work directly in Google Docs interface

### Option 3: Browser Extension (Universal)

**Works everywhere in browser**

**When to use**:
- Want it everywhere (Google Docs, MS Office Online, GitHub, etc.)
- Team uses multiple platforms
- Need consistent experience across tools

---

## Recommended Approach

### Phase 1: Start with MCP Server (Now)

**Why**:
- ✅ Easiest to create
- ✅ Works with Claude Code (what you're using)
- ✅ Can access Gmail, Drive, JIRA, Slack
- ✅ No deployment needed (runs locally)

### Phase 2: Add Browser Extension (Later)

**If** your team wants it in Google Docs interface:
- Create Chrome extension
- Inject AI assistant sidebar
- Connect to same backend as MCP server

### Phase 3: Google Workspace Add-on (Optional)

**If** you want deep Google Workspace integration:
- Official Google Add-on
- Published in Google Workspace Marketplace
- Native integration with Docs/Sheets/Gmail

---

## Quick Comparison for Your Needs

| Need | MCP Server | Browser Extension | Google Add-on |
|------|-----------|-------------------|---------------|
| **Use in Claude Code** | ✅ Yes | ❌ No | ❌ No |
| **Use in Google Docs** | ❌ No | ✅ Yes | ✅ Yes |
| **Access Gmail** | ✅ Via API | ✅ Via API | ✅ Native |
| **Access Drive** | ✅ Via API | ✅ Via API | ✅ Native |
| **Works offline** | ✅ Yes (local) | ❌ No | ❌ No |
| **Setup complexity** | Easy | Medium | Hard |
| **Distribution** | Just you | All team (install) | All team (publish) |

---

## Bottom Line

**Your MCP Server**:
- ✅ Works in Claude Code (any repository)
- ✅ Can READ from Google Docs, Gmail, Drive
- ✅ Can WRITE to Google services
- ❌ Does NOT appear in Google Docs UI

**To appear IN Google Docs/MS Word**:
- Need browser extension OR
- Google Workspace Add-on OR
- Microsoft Office Add-in

**My Recommendation**:
1. **Start**: Build MCP server (works in Claude Code now)
2. **Test**: Use it for a few weeks, validate value
3. **Expand**: If team wants it in Google Docs, build browser extension
4. **Scale**: If widely adopted, create official add-ons

---

## Key Takeaway

MCP servers run **on your local machine** with Claude Code and can **access** Google/Microsoft services via APIs, but they don't appear **inside** the Google Docs or MS Word interface. For that, you'd need a browser extension or official add-on.

---

*Related: MCP Servers, Browser Extensions, Google Workspace Add-ons, Microsoft Office Add-ins*
