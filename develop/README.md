---
description: Build, integrate, and enhance solutions with eSignet.
icon: square-terminal
---

# Developer Guide

This section is for anyone building with eSignet directly, rather than just running it: engineers standing up an instance, integrating a relying party, writing a custom authenticator or audit plugin, or tuning a deployment's configuration for their environment. If [Quickstart](https://claude.ai/cowork/quickstart.md) got you a working login on your own machine, this is where you go next to understand how eSignet is actually put together and how to shape it around your own system.

The pages here are grouped by what you're trying to do, not just by topic — start with **Understand eSignet** if you're getting oriented, jump to **Configure Your Deployment** if you already know eSignet and need to tune a specific setting, or go straight to **Integrate With eSignet** if you're connecting a relying party or writing a plugin today.

### Understand eSignet

Before configuring or integrating anything, it helps to know how the pieces fit together.

* [**Architecture**](architecture/) — how eSignet is composed under the hood: its major building blocks and how they interact with each other and with the systems around it.
* [**Building Blocks**](architecture/components.md) — a closer look at the individual services that make up an eSignet deployment, and what each one is responsible for.&#x20;

<table data-view="cards"><thead><tr><th data-hidden data-card-cover data-type="image">Cover image</th><th data-hidden data-card-target data-type="content-ref"></th></tr></thead><tbody><tr><td><a href="../.gitbook/assets/Architecture.png">Architecture.png</a></td><td><a href="architecture/">architecture</a></td></tr><tr><td><a href="../.gitbook/assets/eSignet Components.png">eSignet Components.png</a></td><td><a href="architecture/components.md">components.md</a></td></tr></tbody></table>

### Configure Your Deployment

Property-by-property reference for tuning eSignet to your own environment, once it's up and running.

<table data-view="cards"><thead><tr><th data-hidden data-card-cover data-type="image">Cover image</th><th data-hidden data-card-target data-type="content-ref"></th></tr></thead><tbody><tr><td><a href="../.gitbook/assets/Configure eSignet.png">Configure eSignet.png</a></td><td><a href="configuration/">configuration</a></td></tr></tbody></table>

### Integrate With eSignet

Everything you need to connect a relying party or extend eSignet with your own plugins.

<table data-view="cards"><thead><tr><th data-hidden data-card-cover data-type="image">Cover image</th><th data-hidden data-card-target data-type="content-ref"></th></tr></thead><tbody><tr><td><a href="../.gitbook/assets/Integration GUides.png">Integration GUides.png</a></td><td><a href="integration/">integration</a></td></tr></tbody></table>

### Look Up API Details

Full set of APIs eSignet exposes, for whenever you need exact request and response details rather than a walkthrough.

<table data-view="cards"><thead><tr><th data-hidden data-card-cover data-type="image">Cover image</th><th data-hidden data-card-target data-type="content-ref"></th></tr></thead><tbody><tr><td><a href="../.gitbook/assets/API Details.png">API Details.png</a></td><td><a href="api.md">api.md</a></td></tr></tbody></table>
