---
hidden: true
---

# Roadmap 2026

Here we present the product roadmap for the entire **Inji Stack** for the calendar year 2025. The **annual product cycle** for the Inji Stack begins in **January** and concludes in **December**.

For detailed module-wise roadmaps, please refer to the following:

* [Inj Wallet](https://docs.inji.io/readme/roadmap/roadmap-2025#inji-wallet)
  * [Inji Mobile](https://docs.inji.io/readme/roadmap/roadmap-2025#inji-mobile)
  * [Inji Web](https://docs.inji.io/readme/roadmap/roadmap-2025#inji-web)
* [Inji Certify](https://docs.inji.io/readme/roadmap/roadmap-2025#inji-certify)
* [Inji Verify](https://docs.inji.io/readme/roadmap/roadmap-2025#inji-verify)

{% hint style="warning" %}
**Prioritization**: Through this roadmap the startegic or adaptive prioritization, if there is, has been indicated as below:

* Add \[ <sup>**➕**</sup> ]: Added new.
* Strategic priortization \[ <sup>**↑**</sup> ] : Brought ahead in schedule.
* Adaptive reschedule \[ <sup>**↓**</sup> ]: Is moved to approaching quarters.
{% endhint %}

## Inji Verify

<details>

<summary><strong>Vision</strong></summary>

By 2026, Inji Verify aims to become a universal, multilingual, and highly interoperable verification platform supporting major credential formats (W3C VC, IETF JWT/SD-JWT, mDoc/mDL, MOSIP UIN VC) and modern revocation mechanisms (status lists, KERI, DEDI, trust registries).\
It will offer customizable verification outputs (SVG/PDF templates, multi-language, multi-QR formats) and seamless verification across online, offline, and proximity flows using OpenID4VP, BLE, offline SDKs, and secure server-side verification.\
With robust revocation and caching, reliable validation will remain possible even in low-connectivity environments. Through native mobile apps and framework-agnostic SDKs, Inji Verify will become a secure, accessible, and developer-friendly global standard for digital credential verification.\
Together, we aim to build a future where credential verification is effortless, trusted, and universally accessible.

</details>



<table><thead><tr><th width="353.7578125">Feature 🛠️</th><th width="402.94140625">Details 📊</th><th width="190.59765625"> Priority📝</th></tr></thead><tbody><tr><td>Claim 169 QR Code</td><td><a href="https://mosip.atlassian.net/browse/INJIVER-1365">https://mosip.atlassian.net/browse/INJIVER-1365</a></td><td>P0</td></tr><tr><td>OpenID4VP - Same device flows alongside Web wallets</td><td><a href="https://mosip.atlassian.net/browse/INJIVER-1437">https://mosip.atlassian.net/browse/INJIVER-1437</a></td><td>P0</td></tr><tr><td>OpenIDVP: Same Device Flow (via DC API)</td><td>https://github.com/mosip/inji-verify/issues/1016</td><td>P1</td></tr><tr><td>Support Server Side VC Verification: ECC- R1</td><td>https://github.com/mosip/inji-verify/issues/1017</td><td>P1</td></tr><tr><td>JSON (W3C) VC</td><td>https://github.com/mosip/inji-verify/issues/1018</td><td>P1</td></tr><tr><td>Upgrade to OpenIDVP final version 1.0</td><td>https://github.com/mosip/inji-verify/issues/1019</td><td>P1</td></tr><tr><td>W3C Data Model 2.0-based JWT VC</td><td>https://github.com/mosip/inji-verify/issues/1020</td><td>P1</td></tr><tr><td>Multi language for SVG Template rendering</td><td>https://github.com/mosip/inji-verify/issues/1021</td><td>P1</td></tr><tr><td>Offline Verification SDK</td><td>https://github.com/mosip/inji-verify/issues/1022</td><td>P2</td></tr><tr><td>BLE based verifiable presentation</td><td>https://github.com/mosip/inji-verify/issues/1023</td><td>P2</td></tr><tr><td>Multi-Lingual Support</td><td>https://github.com/mosip/inji-verify/issues/1024</td><td>P2</td></tr><tr><td>BBS+ Support</td><td>https://github.com/mosip/inji-verify/issues/1025</td><td>P2</td></tr><tr><td>VC Label translation with well known</td><td>https://github.com/mosip/inji-verify/issues/1026</td><td>P2</td></tr><tr><td>Inji Verify SDK Support apart from React applications for Wider Framework Compatibility</td><td>https://github.com/mosip/inji-verify/issues/1027</td><td>P3</td></tr><tr><td>Verify mDoc and mDL</td><td>https://github.com/mosip/inji-verify/issues/1028</td><td>P3</td></tr><tr><td>Support for philisys QR code</td><td>https://github.com/mosip/inji-verify/issues/1029</td><td>P3</td></tr><tr><td>Revocation for SD-JWT and JWT</td><td>https://github.com/mosip/inji-verify/issues/1030</td><td>P3</td></tr><tr><td><p>Trust registry and verifiable data registry/</p><p>Support for</p><ol start="1"><li>keri protocol</li><li>dedi protocol</li></ol></td><td>https://github.com/mosip/inji-verify/issues/1031</td><td>P3</td></tr><tr><td>IETF JWT VC Support</td><td>https://github.com/mosip/inji-verify/issues/1032</td><td>P4</td></tr><tr><td>Native App for Inji Verify - Android device</td><td>https://github.com/mosip/inji-verify/issues/1033</td><td>P4</td></tr><tr><td>Native App for Inji Verify - iOS device</td><td>https://github.com/mosip/inji-verify/issues/1034</td><td>P4</td></tr><tr><td>Revocation for mDoc/ mDL</td><td>https://github.com/mosip/inji-verify/issues/1035</td><td>P4</td></tr><tr><td>Multiple QR Codes embedded in VC in a single PDF</td><td>https://github.com/mosip/inji-verify/issues/1036</td><td>P4</td></tr><tr><td>SVG Rendering for IETF based SD-JWT &#x26; JWT</td><td>https://github.com/mosip/inji-verify/issues/1037</td><td>P3</td></tr><tr><td>PDF Template Support</td><td>https://github.com/mosip/inji-verify/issues/1038</td><td>P4</td></tr><tr><td>VC multiple status List support</td><td>https://github.com/mosip/inji-verify/issues/1039</td><td>P4</td></tr><tr><td>Support for WebVH (Verified History)</td><td>https://github.com/mosip/inji-verify/issues/1040</td><td>P4</td></tr></tbody></table>
