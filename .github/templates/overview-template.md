> ❗ **Important!** Before you proceed, you should be aware of the relevant standards. Please read the following before proceeding:
>
>   * [{STANDARD_1_NAME}]({STANDARD_1_URL})
>   * [{STANDARD_2_NAME}]({STANDARD_2_URL})
>   <!-- Add more standards as needed -->


## Overview

{PRODUCT_NAME} enables {TARGET_USERS} to {CORE_FUNCTIONALITY}. It follows the standard of {PRIMARY_STANDARD}. {ADDITIONAL_CONTEXT_ABOUT_PRODUCT}.

In particular, {PRODUCT_NAME} focuses on {SPECIFIC_ROLE} and provides the following features:

| Feature                                                                 | Coverage |
|:------------------------------------------------------------------------|:---------|
| {FEATURE_1}                                                             | ✅        |
| {FEATURE_2}                                                             | ✅        |
| {FEATURE_3}                                                             | ✅        |
| {FEATURE_4}                                                             | ❌        |
| {FEATURE_5}                                                             | ❌        |
<!-- Add or remove features as needed. Use ✅ for supported and ❌ for unsupported -->

To know more about features available in {PRODUCT_NAME} please refer to [this documentation]({FEATURES_DOCUMENTATION_LINK}).

## Architecture

{BRIEF_ARCHITECTURE_DESCRIPTION}. It interacts with {EXTERNAL_SYSTEMS} via {INTERACTION_METHOD}.

For a detailed view of {PRODUCT_NAME}'s architecture and components, check this [link]({ARCHITECTURE_DOCUMENTATION_LINK}).

## Plugin Support
<!-- This section is optional. Include only if your product supports plugins -->

{PRODUCT_NAME} provides a **plugin-based architecture** that enables modular, extensible, and customizable workflows.

### Types of Plugins

* **{PLUGIN_TYPE_1}**
  {PLUGIN_TYPE_1_DESCRIPTION}
* **{PLUGIN_TYPE_2}**
  {PLUGIN_TYPE_2_DESCRIPTION}
    * Currently supported integrations: {SUPPORTED_INTEGRATIONS}.

### How to Use Plugins

* **[Overview: Choosing the Right Plugin]({PLUGIN_OVERVIEW_LINK})** – Learn the differences between the plugin types and how to decide which suits your requirements.
* **[{PLUGIN_1_NAME}]({PLUGIN_1_LINK})** – {PLUGIN_1_BRIEF_DESCRIPTION}.
* **[{PLUGIN_2_NAME}]({PLUGIN_2_LINK})** – {PLUGIN_2_BRIEF_DESCRIPTION}.

### Advanced: Creating Custom Plugins

For advanced users, you can develop your own plugins by implementing the `{PLUGIN_INTERFACE_NAME}` interface:

```{LANGUAGE}
{PLUGIN_INTERFACE_CODE_SNIPPET}
```

* **Reference Implementation:** [{REFERENCE_IMPLEMENTATION_NAME}]({REFERENCE_IMPLEMENTATION_LINK})
* Once a custom plugin has been developed refer to this [document]({CUSTOM_PLUGIN_DEPLOYMENT_LINK}) to deploy the plugin.

## Deployment

{PRODUCT_NAME} supports two modes of deployment to cater to different users with different purposes:

1.  **Local Development Setup**

    * Intended for experimentation and user experience. Local Setup can be carried out in two ways:
        * **Local Setup with Docker Compose**
            * Recommended for users who want to experience the product from a technical/backend perspective.
            * Refer to [this guide]({DOCKER_COMPOSE_SETUP_LINK}) to try this mode of setup.
        * **Local Setup without Docker Compose**
            * Recommended for developers or community contributors who want to perform debugging or gain a deeper understanding of the {PRODUCT_NAME} codebase.
            * Refer to [this guide]({LOCAL_DEV_SETUP_LINK}) to try this mode of setup.
    * This is for developers, community members, and country representatives to explore the application, demonstrate its usage to external stakeholders, or conduct proof-of-concepts (POCs).

2.  **Deployment with Kubernetes cluster**

    * Designed for production environments.
    * Enables users to host and utilize the product at scale.
    * Click [here]({K8S_DEPLOYMENT_LINK}) to learn more about this mode of deployment.

<!-- Add custom plugin deployment instructions if applicable -->
If you are creating your own custom plugin, you can refer to [this link]({CUSTOM_PLUGIN_K8S_LINK}) to know steps to deploy custom plugins using Kubernetes.

## Configurations

In this section, you will find the key configurations required to enable specific features or to run the application.

### {CONFIGURATION_SECTION_1_NAME}

{CONFIGURATION_SECTION_1_DESCRIPTION}:

```properties
{CONFIGURATION_PROPERTIES}
```

**Note**: {CONFIGURATION_NOTE}

To know more about this configuration please refer to [this link]({CONFIGURATION_DOCUMENTATION_LINK}).

### {CONFIGURATION_SECTION_2_NAME}
<!-- Add more configuration sections as needed -->

{CONFIGURATION_SECTION_2_DESCRIPTION}. Refer [here]({CONFIGURATION_SECTION_2_LINK}) to know about the properties.

## Databases

Refer to [SQL scripts]({DB_SCRIPTS_LINK}) and go through its README.

## Upgrades

### Upgrade from {OLD_VERSION} to {NEW_VERSION}

Please refer to step-by-step [migration guide]({MIGRATION_GUIDE_LINK}) for upgrade from {OLD_VERSION} to {NEW_VERSION}.

## Upcoming Features

* {UPCOMING_FEATURE_1}
* {UPCOMING_FEATURE_2}
* {UPCOMING_FEATURE_3}
* {UPCOMING_FEATURE_4}

**Note**: {UPCOMING_FEATURES_NOTE}

## Documentation

* **API Documentation:**
  API endpoints, base URL (`{API_BASE_URL}`), and mock server details are available via Stoplight and Swagger documentation: [{PRODUCT_NAME} API Documentation]({API_DOCUMENTATION_LINK}).

* **Product Documentation:**

    * To know more about {PRODUCT_NAME} from a functional and use case perspective, you can refer to our main document: [Overview | Inji]({PRODUCT_OVERVIEW_LINK})
    * {PRODUCT_NAME} is part of Inji Stack, to know more about Inji Stack you can refer to our stack document: [Inji | Inji]({INJI_STACK_LINK})

## Contribution & Community

We welcome contributions from everyone!

* [Check here]({CODE_CONTRIBUTION_LINK}) to learn how you can contribute code to this application.
* If you have any questions or run into issues while trying out the application, feel free to post them in the [MOSIP Community]({COMMUNITY_LINK}) — we'll be happy to help you out.


---

<!-- 
===========================================
TEMPLATE USAGE GUIDE
===========================================

This template follows a standardized structure for Inji product overview pages.
Replace all placeholders (enclosed in curly braces {}) with actual content.

REQUIRED SECTIONS:
- Overview
- Architecture  
- Deployment
- Documentation
- Contribution & Community

OPTIONAL SECTIONS (include if applicable):
- Plugin Support (for products with plugin architecture)
- Databases (for products with database dependencies)
- Upgrades (when migration guides exist)

PLACEHOLDERS LEGEND:
- {PRODUCT_NAME}: e.g., "Inji Mobile Wallet", "Inji Web Wallet", "Inji Verify"
- {TARGET_USERS}: e.g., "end users", "verifiers", "holders"
- {CORE_FUNCTIONALITY}: Brief description of what the product does
- Use ✅ for supported features and ❌ for unsupported/planned features

STYLE GUIDELINES:
- Keep descriptions concise and action-oriented
- Link to detailed documentation rather than duplicating content
- Use tables for feature comparisons
- Include code snippets for configuration examples
-->
