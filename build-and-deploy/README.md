---
description: >-
  Effortlessly deploy and configure eSignet with comprehensive guides,
  architecture insights, and mock environments.
icon: list-tree
---

# Deploy

This section is about taking eSignet beyond your own machine — deploying and configuring it for a real environment, where it needs to be sized, secured, and set up to match your organization's own requirements. eSignet supports two deployment paths: brought up locally with Docker Compose for evaluation and development, or deployed on-premise with full flexibility to configure it around your infrastructure and use case.

If you're looking to run eSignet locally to try it out or develop against it, see [Quickstart's Local Setup](../local-deployment/local-setup/) instead — that's the Docker Compose–based path for a single developer's machine, and it's covered there rather than here. This section is for planning and carrying out an actual deployment.

### In This Section

* [**Deployment Architecture**](deployment-arch.md) — how eSignet's components are typically laid out in a real deployment, and the infrastructure and sizing considerations that come with it. _(page to be added)_
* [**On-Prem Deployment Guide**](on-prem-deployment-guide.md) — step-by-step guidance for deploying and configuring eSignet on your own infrastructure, tailored to your organization's requirements. _(page to be added)_

### Which Codebase to Deploy

The latest stable, deployable codebase is always on the `master` branch of the [eSignet repository](https://github.com/mosip/esignet). Feature development and bug fixes happen on separate feature or development branches first and are merged into `master` once ready — so `master` is the branch to deploy from, not a feature branch.

{% hint style="info" icon="github" %}
Note: For deployment and testing, it is recommended to use either the master branch or the official released tags.
{% endhint %}
