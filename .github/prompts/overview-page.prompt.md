---
type: prompt
title: [Overview]
description: [Overview page content]
purpose: [Edit software overview page content]
version: 1.0.0
audience: [VC Stack User, PO, BA, Claude Sonnet 4.5, GPT-5.2, GPT-4o, GPT-5.1]
created: 2026-0125
lastUpdated: 2026-0125
tags: [tag1, tag2, tag3]
relatedSkills: [skill-name]
relatedTemplates: [feature-editor]
---

# [Feature Page Content Writer]

## Objective
Structure, extract the existing content, edit, improve and enhance the content for clarity, engagement, and user understanding.

## Context
- #codebase
- File: https://raw.githubusercontent.com/svahsek/.github/main/templates/overview/overview-page.template.md

## Instructions

- Feature Writing Comprehensive Guideline: https://raw.githubusercontent.com/svahsek/.github/main/templates/overview/overview-page.template.md

## Output Format
Markdown format with appropriate headings, subheadings, bullet points, and tables as needed.

- Template to be used to provide the structure: https://raw.githubusercontent.com/svahsek/.github/main/templates/overview/overview-page.template.md


## Constraints
N/A

## Quality Criteria

- Feature Writing Comprehensive Guideline: https://raw.githubusercontent.com/svahsek/.github/main/templates/overview/overview-page.template.md

## Examples

### Example 1:

[Example Output](https://docs.inji.io/inji-certify/overview)

### Expected Output

[Example Output](https://docs.inji.io/inji-certify/overview)

## Template

Template that contains the structure of the feature that you will process from #codebase and docs/inji-verify, and as per guidelines instructed to you as per https://raw.githubusercontent.com/svahsek/.github/main/templates/overview/overview-page.template.md and then put the revised writeup in .github/output.md.

https://raw.githubusercontent.com/svahsek/.github/main/templates/overview/overview-page.template.md

## Input
Inji Verify

- Crude content 1 (Inji Verify Documentation files): docs/inji-verify
- Crude Content 2 (File from which the content has to be taken up and modified): docs/inji-verify/overview/README.md
- Github Repository: https://github.com/inji/inji-verify.git
- Deployment Guide: docs/readme/setup/deploy.md
- Roadmap 2026: docs/readme/roadmap/roadmap-2026.md


### Output

- Put the output in the file: .github/output.md


## Guardrails

- Do not assume anything, source from the Inputs provided to you and do not make up any information, be accurate.
- Ensure that the content is accurate, up-to-date, and reflects the latest features and improvements of Inji Verify.
- Maintain a clear and concise writing style that is accessible to a wide range of users, including those who may not be familiar with technical jargon.
- Use headings, subheadings, bullet points, and tables to organize the content effectively and enhance readability.
- Do not source content from anywhere outside which has not been mentioned explicitely here within this prompt file.