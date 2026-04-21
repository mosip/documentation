# SVG based Credential Rendering

### 1. Overview

SVG Template Rendering enables **issuer-controlled visual representation of Verifiable Credentials (VCs)** in **Inji Web**, aligned with the W3C VC Render Method specification.

Instead of relying on static HTML layouts, Inji Web dynamically renders credentials using:

* **SVG templates hosted by issuers**
* **renderMethod (**&#x73;vg-mustach&#x65;**) in VC**
* **inji-vc-renderer library for binding VC data → SVG**

### 2. Why This Feature Matters

#### Key Benefits

**1. Issuer-Controlled Branding**

* Governments, universities, enterprises can define:
  * Layout
  * Colors
  * Logos
  * Field placement

**2. Standardized Rendering (W3C Aligned)**

* Uses **W3C VC Render Method**
* Ensures **interoperability across wallets & verifiers**

**3. Better User Experience**

* Human-readable credentials (like real certificates)
* Not just raw JSON or basic UI cards

**4. Reusability Across Ecosystem**

* Same VC renders consistently in:
  * Inji Web
  * Wallets
  * Verifier portals (e.g., Mimoto)

**5. Security via Template Integrity**

* `digestMultibase` ensures:
  * Template is **not tampered**
  * Trusted rendering source

### 3. Supported Credential Types

#### Supported

* **W3C JSON-LD VC 2.0 credentials**
* Credentials containing:

```
"renderMethod": {
  "type": "TemplateRenderMethod",
  "renderSuite": "svg-mustache"
}
```

#### Example Use Cases

* National ID
* Farmer Registry Certificate
* Pollution Certificate
* Student ID / Hall Ticket
* Vaccination Certificate

### 4. How does the Flow Work? (User Flow)

#### Step-by-Step Flow (Inji Web)

**Step 1: VC Acquisition**

* User:
  * Downloads VC OR
  * Receives via wallet OR
  * Scans QR (OpenID4VP)

**Step 2: Detect Rendering Capability**

* Inji Web checks:
  * VC format = JSON-LD 2.0
  * `renderMethod` present
  * `renderSuite` = `svg-mustache`

**Step 3: Invoke Renderer**

* Call `renderSvg(vcJsonData)` (from `inji-vc-renderer`)

**Step 4: Fetch Template**

* Extract template URL from VC
* Fetch SVG from issuer endpoint

**Step 5: Verify Integrity**

* Compare `digestMultibase` (VC) vs actual template hash

* If mismatch → ❌ fail rendering

**Step 6: Pre-processing (Library Logic)**

From renderer capabilities:

*   Locale transformation:

  gender → gender.eng / gender.fr
*   QR Code injection:

  `credentialSubject.qrCodeImage`

* Multi-line formatting:
  * Benefits
  * Address fields

**Step 7: Placeholder Replacement**

Example:
```
<svg>{{credentialSubject/fullName}}</svg>
```
-->

```
<svg>John Doe</svg>
```

**Step 8: Render Output**
* SVG displayed in UI
* Optional:
  * Convert SVG → PDF (download/share)

**Step 9: Fallback Flow**

If not eligible:

➡️ Use existing:

* HTML templates
* Default credential card UI

[Image] - Flow

### 5. Current Limitations

#### Technical Constraints

**1. Only SVG Templates Supported**

* No support for:
  * HTML templates (via renderMethod)
  * Other render suites

**2. Strict JSON Pointer Compliance**

* Placeholders must follow:

```
{{credentialSubject/name}}
```

* Incorrect mapping → rendering failure

**3. Template Hosting Dependency**

* Template must be:
  * Publicly accessible
  * Highly available

**4. Integrity Dependency**

* If `digestMultibase` fails:
  * Rendering is blocked

**5. Limited Dynamic Layout Handling**

* Complex layouts (tables, dynamic sections) require:
  * Careful SVG design

**6. No Offline Template Support (Currently)**

* Requires network fetch

**7. Partial Credential Rendering Edge Cases**

* When VP shares:
  * Partial credentials
  * Multiple credentials

→ Template may not align

### 6. Test the Feature Today

#### How to Enable

**Step 1: Configure Inji Certify**

Set:

```
mosip.certify.data-provider-plugin.rendering-template-id=<TEMPLATE_ID>
```

**Step 2: Add renderMethod in VC Template**

```
"renderMethod": [{
  "type": "TemplateRenderMethod",
  "renderSuite": "svg-mustache",
  "template": {
    "id": "https://issuer-host/template.svg",
    "mediaType": "image/svg+xml",
    "digestMultibase": "<digest>"
  }
}]
```

**Step 3: Host SVG Template**

* Ensure:
  * Public URL
  * Correct MIME: `image/svg+xml`

**Step 4: Issue Credential**

* Via OpenID4VCI flow
* Ensure VC contains `renderMethod`

**Step 5: Load in Inji Web**

* Upload VC OR
* Use OpenID4VP flow

**Step 6: Verify Rendering**

Expected:

* ✅ SVG visual card appears
* ✅ Correct data binding
* ✅ Branding applied

**Step 7: Negative Testing**

* Remove template URL → expect error
* Change digest → expect integrity failure
* Break placeholders → expect incorrect rendering
