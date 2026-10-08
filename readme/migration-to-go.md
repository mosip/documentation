---
hidden: true
---

# Migration to Go

### Background

eSignet was originally built on Java([refer here](https://app.gitbook.com/s/ylzvZHp30DQ3rNCClELV/#overview)), and the platform's early growth, its adoption across implementations, and its maturity as a standards-compliant identity solution were all built on that foundation. As eSignet's role has expanded, however, so has the case for revisiting what runs underneath it. This page lays out why the eSignet team made the decision to migrate the platform's core authentication engine to Go, what approach was taken to get there, and what it means for the product going forward.

It is a deliberate architectural decision, made for two concrete reasons: long-term sustainability through shared engineering ownership, and a meaningful gain in runtime performance. Both are explained below, along with the approach taken to realize them without disrupting anything the product already promises its users and adopters.

### The Case for Migration

#### 1. Sustainability Through Shared Ownership

Open-source infrastructure is only as durable as the community maintaining it. For most of its life, eSignet's core engine has been maintained by a single team. That's workable, but it isn't the most resilient model for a piece of infrastructure that governments and service providers are expected to depend on for years.

The opportunity to move to **Go** emerged directly from this concern. [WSO2](https://wso2.com/), an established identity and access management vendor, had already begun building a Go-based identity engine — the [Thunder engine](https://thunderid.dev/) — addressing much of the same problem space as eSignet, though it was still at an early stage of development. Rather than build a comparable engine from scratch and maintain it alone, eSignet's team chose to partner with WSO2 and build on the Thunder engine together, jointly maturing it and shaping it to meet the OpenID Connect and FAPI 2.0 compliance a national-scale identity backend requires.

This changes eSignet's maintenance model in a substantive way. The Thunder engine now has two engineering teams with a direct stake in its correctness, security, and continued development — eSignet's own team and WSO2's. This collaboration is scoped specifically to the Thunder engine: WSO2's broader identity platform and its enterprise-focused capabilities sit outside it and remain WSO2's own roadmap, just as eSignet's own product layer remains eSignet's alone to maintain. This kind of shared ownership over the shared engine is a stronger long-term guarantee of maintainability than any single team building it alone, and it's the primary reason this migration was worth undertaking.

#### 2. Performance and Efficiency

The second driver is more straightforward: Go, as a runtime, is materially better suited to the kind of high-throughput, low-latency authentication workloads that a national identity backend needs to sustain. In practice, this has translated into eSignet achieving meaningfully better throughput on comparable or smaller infrastructure footprints than the Java-based engine required.

For adopters, this matters in very concrete terms: lower hosting and scaling costs from better throughput per unit of infrastructure, more headroom under peak load (such as large-scale enrollment drives or high-traffic authentication events), and a system that stays responsive as usage grows without a proportional increase in resource spend.

### The Approach: Building on Thunder, Not Apart From It

#### Two Products Built for Two Different Problems

It's worth being precise about what the Thunder engine is, and isn't. WSO2 builds Thunder as part of a broader identity and access management platform aimed at workforce identity, internal applications, and enterprise service ecosystems — that broader platform, and its enterprise-focused features, sit outside eSignet's collaboration with WSO2. eSignet exists to solve a different problem: it is a country- and government-focused digital identity layer, built specifically to implement the global interoperability standards that let a nation's foundational ID system work seamlessly across banking, healthcare, welfare, and every other sector that depends on trusted identity verification.

What eSignet and WSO2 jointly develop is the [Thunder engine](https://thunderid.dev/) itself — the Go-based identity core shared between them. On its own, a Go-based engine doesn't make a standards-compliant national identity backend, so both teams worked together to build the RFC-level support the engine needed for this: FAPI 2.0 compliance, along with the assurance levels, consent architecture, and eKYC capabilities specific to eSignet's mandate as a national ID solution.

#### One Codebase, Kept in Sync

Rather than maintaining a Go-based engine as a separate, parallel codebase, eSignet is built as a layer on top of the Thunder engine itself — using the Thunder engine's repository as the foundation and adding the eSignet-specific product layer on top of it: its OIDC and FAPI 2.0 compliance behavior, consent handling, biometric and OTP authentication support, verified claims, and everything else that constitutes eSignet's product experience.

This means eSignet's engine tracks the Thunder engine's ongoing development directly, and eSignet's own engineering work continues to shape that development rather than sitting downstream of it. As both teams keep hardening and extending the shared engine, eSignet inherits those improvements as a natural part of staying current with it, rather than through a separate porting effort each time. The two teams develop the engine in an ongoing collaborative relationship rather than a one-time handoff, which is precisely the sustainability model this migration was intended to create.

### What Stays the Same

None of this is visible to the people eSignet ultimately serves, and that is by design.

The eSignet user interface remains exactly as it was under the Java-based engine. End users authenticating through eSignet, whether via [OTP, biometrics, or password](https://docs.esignet.io/home/esignet-2.0.0/readme/features), will notice no difference in how the product looks, behaves, or responds. Nothing about the user experience has changed as a result of this migration.

Deployment doesn't change either. The Thunder engine is packaged as part of the eSignet service itself, not as a separate system an implementer needs to install, configure, or maintain on its own. Bringing up eSignet Go is still just a matter of deploying the eSignet service, exactly as it was with the Java-based platform. The fact that the underlying engine is developed jointly by two engineering teams is an upstream detail — it doesn't introduce a new moving part for anyone deploying or running eSignet to worry about.

The same holds for standards compliance. eSignet's Go-based engine carries forward the same OpenID Connect, OAuth 2.0, and FAPI 2.0 capabilities the Java-based platform supported — see [Standards](standards.md) for the specific set implemented. As with the Java version, a small number of RFCs outside eSignet's current scope remain intentionally unimplemented, and may be added in a future release. No feature, compliance guarantee, or integration contract the Java version provided has been dropped or diminished in the move. Relying parties integrating against eSignet's OIDC endpoints today will find the same standards-based surface they always have.

In short: the engine underneath has changed meaningfully. What eSignet does, and what it guarantees to the people and systems that depend on it, has not.

### Why This Makes eSignet a Stronger Product

Taken together, this migration strengthens eSignet along exactly the dimensions that matter most for infrastructure meant to serve at national scale:

* **More durable, better resourced.** eSignet's core engine is now maintained by two engineering organizations instead of one, reducing the risk that comes with any single point of ownership over critical infrastructure.
* **More efficient to run.** Better throughput on comparable infrastructure lowers the operational cost of running eSignet at scale, for MOSIP and for every adopter running it independently.
* **No loss of trust or compatibility.** Every standard eSignet complied with before, it complies with now. Every integration built against it continues to work exactly as it did.
* **Positioned to keep improving.** Because eSignet now develops in step with the Thunder engine's own roadmap, it benefits on an ongoing basis from engineering investment happening outside its own team, rather than depending solely on its own resourcing.
