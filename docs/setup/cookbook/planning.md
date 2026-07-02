# Planning

## Project Execution Plan (Week-by-Week)

The plan below compresses the pilot into approximately 14 weeks. Pre-week 0 activities --- particularly biometric device procurement and infrastructure approvals --- should begin as soon as the pilot is approved.

+-------------------------+-------------------------+-------------------------+ | **Window** | **Theme** | **Activities** | +=========================+=========================+=========================+ | Week 0 | Kick-off, MOSIP | MOSIP introduction; | | | introduction and | high-level demo of | | | \*migration prep | MOSIP, INJI and | | | | eSignet; _acquire | | | | source data and | | | | database structure for | | | | any legacy migration in | | | | scope._ | +-------------------------+-------------------------+-------------------------+ | Week 1 | Infrastructure | Begin procurement and | | | readiness | shipping of biometric | | | | devices; readiness | | | | check of on-prem or | | | | cloud hardware | | | | (compute, storage, | | | | networking); \*continue | | | | acquiring legacy source | | | | data. | +-------------------------+-------------------------+-------------------------+ | Weeks 2--3 | ID schema, master data, | Define country ID | | | customisation | schema and master data; | | | | identify customisation | | | | needs; obtain SMS / | | | | email gateway details; | | | | start customisation; | | | | deploy MOSIP onto the | | | | country environment; | | | | \*start data quality | | | | analysis for any legacy | | | | migration. | +-------------------------+-------------------------+-------------------------+ | Week 4 | Customisation, | Publish data quality | | | configuration and | analysis; complete | | | platform readiness | customisation; finalise | | | | email and SMS | | | | configuration. | +-------------------------+-------------------------+-------------------------+ | Weeks 5--6 | Integration and | Build the legacy | | | \*migration utility | migration utility; | | | | integrate biometric | | | | components into the | | | | country environment; | | | | deploy ABIS, SDKs and | | | | the manual adjudication | | | | system; configure SMS | | | | in the platform. | +-------------------------+-------------------------+-------------------------+ | Weeks 7--8 | Pilot system readiness | User acceptance | | | | testing; functional | | | | training for the | | | | country technical | | | | staff; biometric | | | | functional training. | +-------------------------+-------------------------+-------------------------+ | Weeks 9--10 | Field readiness | Operator and supervisor | | | | training; migration | | | | training; field pilot | | | | preparation; | | | | calibration of | | | | registration Centers | | | | for go-live. | +-------------------------+-------------------------+-------------------------+ | Weeks 11--14 | Pilot go-live | Field execution: legacy | | | | migration, new | | | | registrations up to | | | | 3,000 residents, | | | | authentication | | | | exercises, INJI Wallet | | | | usage, helpdesk | | | | operation; pilot | | | | closure and report | | | | preparation. | +-------------------------+-------------------------+-------------------------+ | _This is just an indicative execution plan. The actual execution plan with | | dates to be prepared based understanding and agreement between the country | | and MOSIP team_ | | | | \*_For brown-field pilots only ; A brown-field pilot re-uses issued | | National ID from a legacy system by migrating the ID data into MOSIP._ | +-----------------------------------------------------------------------------+

### Critical dependencies

* On-prem or cloud infrastructure and the necessary access for installation must be ready before the start of Week 1 or 2.
* Biometric device procurement and shipping typically takes 6 to 8 weeks. The country team supports the customs clearance process.
* The country lead finalises the ID schema and provides the master data inputs.
* SMS and email gateway access is configured ahead of customisation completion in Week 4.
*

{% hint style="info" %}
**If you only do one thing in week 0** Place the biometric device order and lock the infrastructure environment. Everything downstream depends on these two long-lead items.
{% endhint %}

_Figure 3 --- Indicative 14-week schedule. Country-led streams (navy), MOSIP-led / shared streams (teal) and critical-path / gate items (orange)._

## Roles and Responsibilities

Responsibilities are split between the country program and the MOSIP team. The matrix below covers technical resources, setup, rollout, management and procurement.

***

**Category** **Activity** **Responsibility**

***

Technical resources Country technical team Country & field staff

```
                  MOSIP pilot deployment team      MOSIP

                  Government resource for ID       Country
                  schema and master data           
                  preparation                      

                  Functional training; operator    MOSIP + Country
                  and supervisor training          

                  Field staff for registration     Country
```

Pilot setup GitHub private account, Docker Country account creation and access

```
                  ID schema, master data           Country + MOSIP

                  MOSIP deployment in the country  MOSIP with Country
                  environment                      support

                  Customisation                    MOSIP
```

Rollout Resident pre-registration Country

```
                  Resident registration at         Country
                  Centers, ID issuance             

                  ID authentication using          Country
                  relying-party portal and INJI    

                  Feedback, metrics collection,    Country
                  report generation                

                  Pilot closure sign-off           Country + MOSIP
```

Management Initial pilot plan MOSIP

```
                  Pilot plan finalisation          Country

                  Pilot project management         Country + MOSIP

                  Governance structure             Country + MOSIP
```

Procurement On-prem / cloud environment Country

```
                  ABIS, biometric SDKs, manual     MOSIP
                  adjudication system              

                  SMS / email gateway              Country

                  SSL certificates                 Country or MOSIP

                  Biometric devices for            MOSIP
                  registration and authentication  
                  (fingerprint slap scanner, dual  
                  iris scanner, fingerprint        
                  authentication device)           

                  Face camera for registration     Country

                  PCs / laptops, printers and      Country
                  scanners                         
```

***

## Resourcing the Country Team

The country team is the Center of gravity of the pilot. They run the deployment, register residents, and inherit the system at sign-off --- so resourcing them well is the single biggest predictor of success.

***

**Role** **Count** **Responsibilities**

***

Project Manager 1 Owns the country program. Reports to the steering committee, manages dependencies, and signs off the pilot.

Senior Technical 1 or more Functional and technical owner of Lead MOSIP within the country team. First point of contact for field issues. Becomes the in-house MOSIP expert for future scale.

Junior Technical 3 or more Hands-on engineers handling Engineers deployment support, configuration, integrations and incident response.

Field Operators 5 or more Run the registration kits at the Centers. Identified, trained and certified by the country team.

Field Supervisors 1 per registration Supervise operators, manage Center exceptions and run the day-to-day helpdesk.

Adjudicators 1 or more Handle manual adjudication for biometric duplicates and quality exceptions.

### Communications 1 Coordinates resident outreach, focal point appointment scheduling and notification content for SMS and email.

{% hint style="info" %}
**Identify operators and supervisors early** Operators and supervisors must be identified by the country team well before the training window. Onboarding is hands-on and assumes participants are available for a continuous training block, not part-time.
{% endhint %}

## Governance and Review Cadence

A lightweight, predictable governance structure keeps decisions moving without burying the technical team in meetings.

***

**Forum** **Membership** **Cadence**

***

Pilot Governance Country representatives, Pilot kick-off and Committee MOSIP, key stakeholders. Set at major milestones. up during kick-off.

Weekly technical Country and MOSIP technical Weekly or as review Leads discussed in the kick-off meeting, throughout the pilot

Steering committee Executive members from the Bi-weekly or at gate country and MOSIP. decisions.

Pilot readiness Members of the Streering After User review commitee, Tech leads from the Acceptance Testing country and MOSIP

### Closure meeting All stakeholders After registrations are completed; final sign-off.

{% hint style="info" %}
**Always close with lessons learned** Block the last 30 minutes of each weekly review for 'what surprised us this week'. The compiled list becomes the lessons-learned annex of the closure report. It also helps in mid-course corrections during the pilot.
{% endhint %}
