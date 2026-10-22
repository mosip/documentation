# Issues

## Keshav's

- eSignet 1.x JAVA and eSignet 2.x Go stream debate
    - Versions and migration (3 cards and here too the version name calling here should be defined).
- Why eSignet? - (A little smaller icon) - Links will not be here
- Identify which card does not have links (Which it should have)
    - 4. Connect your first app
- Get the content reviewed by Rachik as well once.


## Iteration - 2 
- The statement on the banner about eSignet Docs needs to be revisited. We can avoid the word Modern. (A modern and inclusive Digital Identity Authentication Solution)
- Understand eSignet > Make it "Understand More About eSignet".

- The statement on the banner about eSignet Docs needs to be revisited. We can avoid the word Modern.
- Understand eSignet > Make it "Understand More About eSignet"

Why eSignet? - Second approach with icons/images on the cards is nice if we can have smaller icons, otherwise first one with maybe some highlights around the card to bring some indication these are clickable cards..




## Iteration - 1
The current eSignet home page has most of the right content, but the
sequence feels slightly inverted. A first-time visitor currently
encounters **version selection → integration tracks → what's new → quick
start → introductory material → why eSignet**. [eSignet
Documentation](https://docs.esignet.io/)

I would make the page tell a much more natural story:

**Understand → Choose → Experience → Build → Operate → Go deeper**

**Recommended sequence**

1.  **What is eSignet?**

Keep the short introductory paragraph right at the top, but make it more
outcome-oriented:

**eSignet enables applications to authenticate users using trusted
identity systems through standards such as OpenID Connect --- without
locking applications to a particular identity provider.**

Then retain 3--4 crisp differentiators such as standards-based,
identity-system agnostic, open source, and deployable independently. The
current description already conveys these points well. [eSignet
Documentation](https://docs.esignet.io/)

2.  **Why eSignet?**

Move this immediately below the introduction. Right now, "Why eSignet"
appears quite far down the page, even though it answers the first
question a newcomer is likely to have. [eSignet
Documentation](https://docs.esignet.io/)

I would use perhaps four cards:

**Standards-based authentication** \| **Works with any identity system**
\| **Low-connectivity friendly** \| **Open source & vendor neutral**

3.  **Try eSignet**

Put **Try It Out** very early. This is probably the strongest onboarding
CTA because users can experience a login flow without installing
anything. The current page places this under Quick Start after several
other sections. [eSignet Documentation](https://docs.esignet.io/)

Something like:

**Experience eSignet in 5 minutes**

→ Try the demo\
→ Understand the login flow\
→ Explore mock identities

4.  **Choose what you want to do**

Then introduce the current **Getting Started With eSignet** tracks.
These are actually very good and should become the primary navigation
mechanism. [eSignet Documentation](https://docs.esignet.io/)

I would phrase them from the user\'s perspective:

**I want to integrate my application**\
Connect your application to eSignet as an OIDC Relying Party.

**I want to connect an identity system**\
Integrate an identity provider, registry, or authentication source.

**I want to deploy eSignet**\
Install, configure, deploy, monitor, and operate eSignet.

This is much clearer than organizing the landing page primarily around
the internal documentation structure.

5.  **Get started locally**

Then:

**Local Setup → Using Mock Data → Configure eSignet → Connect your first
application**

The current page has Local Setup and Mock Data in Quick Start, but I
would position them after the visitor has chosen their journey. [eSignet
Documentation](https://docs.esignet.io/)

6.  **Understand eSignet**

Combine the current **New to eSignet? Start here!** content into a
learning/reference section:

About eSignet \| Architecture \| Features \| Principles \| Standards \|
Technology \| Security

One thing I noticed: the current **Technology** card appears to point to
the Standards page as well, which looks like a linking/content issue
worth correcting. [eSignet Documentation](https://docs.esignet.io/)

7.  **Versions & releases**

I would move version selection lower unless there is a strong technical
reason users must select it before doing anything else.

Present it as:

**Current: eSignet 2.x -- Go**\
Recommended for new implementations

**Previous: eSignet -- Java**\
Maintained for existing implementations / features not yet migrated

**Release notes & roadmap**

This is especially important because the page currently asks users to
choose **Go vs Java** before they fully understand the product. [eSignet
Documentation](https://docs.esignet.io/)

8.  **Migrating from eSignet Java**

Keep the current compatibility note, but turn it into a proper migration
callout rather than a footer note:

**Coming from eSignet Java?**

→ What\'s changed\
→ Feature availability\
→ Migration guide\
→ Signup documentation\
→ Planned functionality

The existing page already warns that eSignet 2.0 does not yet include
Signup or wallet-based login, which is useful but currently appears very
late. [eSignet Documentation](https://docs.esignet.io/)

9.  **What\'s new**

I would move this near the bottom. "What\'s New" is valuable for
returning users but is secondary for first-time visitors.

Ideally:

**Latest release \| Release notes \| Roadmap**

10. **Resources & community**

End with:

FAQ \| Glossary \| Resources \| Contribute \| GitHub \| Contact /
Support

The current Resources & Support section already contains most of this.
[eSignet Documentation](https://docs.esignet.io/)

**So visually, I would structure the homepage like this**

**eSignet**\
Authenticate users with trusted digital identities through open
standards.

**Why eSignet?**\
Standards-based · Identity-system agnostic · Open source ·
Low-connectivity friendly

**Try eSignet**\
\[Try the live flow\]

**What do you want to do?**\
\[Integrate my application\] \[Connect an identity system\] \[Deploy
eSignet\]

**Quick Start**\
Local Setup → Mock Identity → Configuration → First Integration

**Learn about eSignet**\
Architecture · Features · Standards · Security · Technology

**Versions & Releases**\
eSignet 2.x / eSignet Java / Releases / Roadmap

**Migrating from eSignet Java?**

**Resources & Support**

The biggest change I would make is **not treating the homepage as a
table of contents**. Treat it as a **decision-and-onboarding page**. A
developer arriving there should be able to answer within about 20
seconds:

**What is this? → Why would I use it? → Can I try it? → Which path
applies to me? → Where do I start?**

That would make the eSignet documentation feel considerably easier to
enter without requiring a major restructuring of the underlying pages.
