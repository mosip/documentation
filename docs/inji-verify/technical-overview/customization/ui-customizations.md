# UI Customizations

Inji Verify is built using [tailwind CSS](https://tailwindcss.com/) library.

Below sections provides instructions on how themes can be customized in Inji Verify application.

### **Steps:**

Inji Verify uses two different files to handle the customization in UI.

1. **tailwind.config.js:**

Here, properties related to the font and colors for each component is maintained.

```javascript
/** @type {import('tailwindcss').Config} */

module.exports = {
  content: ["./src/**/**/*.{js,jsx,ts,tsx}"],
  theme: {
    extend: {
      fontFamily: {
        base: "var(--iv-font-base)",
      },
      fontSize: {
        lgBoldTextSize: "26px",
        boldTextSize: "19px",
        lgMediumTextSize: "24px",
        mediumTextSize: "20px",
        lgNormalTextSize: "16px",
        normalTextSize: "14px",
        smallTextSize: "12px",
        verySmallTextSize: "11px",
      },
      maxHeight: {
        0: "0",
        "1/4": "25%",
        "1/2": "50%",
        "3/4": "75%",
        full: "100%",
      },
      colors: {
        primary: "var(--iv-primary-color)",
        logoStart: "var(--iv-logo-start-color)",
        background: "var(--iv-background-color)",
        whiteText: "var(--iv-white-text)",
        headerLabelText: "var(--iv-header-label-text)",
        headerDescriptionText: "var(--iv-header-description-text)",
        offlineLabel: "var(--iv-offline-label-text)",
        offlineDescription: "var(--iv-offline-description-text)",
        tabsBackGround: "var(--iv-verificationMethodTabs-bg-color)",
        horizontalLine: "var(--iv-horizontal-line)",
        headerBackGround: "var(--iv-header-background-color)",
        pageBackGroundColor: "var(--iv-page-background-color)",
        success: "var(--iv-success)",
        invalid: "var(--iv-invalid)",
        expired: "var(--iv-expired)",
        successText: "var(--iv-successText)",
        invalidText: "var(--iv-invalidText)",
        expiredText: "var(--iv-expiredText)",
        successBorder: "var( --iv-successBorder)",
        invalidBorder: "var(--iv-invalidBorder)",
        expiredBorder: "var(--iv-expiredBorder)",
        successAlert: "var(--iv-success-alert)",
        warningAlert: "var(--iv-warning-alert)",
        errorAlert: "var(--iv-error-alert)",
        arrowBackGround: "var(--iv-arrow-background)",
        stepperBackGround: "var(--iv-stepper-background)",
        stepperLabel: "var(--iv-stepper-label)",
        stepperDescription: "var(--iv-stepper-description)",
        cameraDeniedLabel: "var(--iv-camera-denied-label-color)",
        cameraDeniedDescription: "var(--iv-camera-denied-description-color)",
        uploadDescription: "var(--iv-upload-description)",
        copyRightsText: "var(--iv-copyrights-text)",
        copyRightsBorder: "var(--iv-copyrights-border)",
        activeTabText: "var(--iv-active-tab-text)",
        activeTabBackground: "var(--iv-active-tab-background)",
        inactiveTabText: "var(--iv-inactive-tab-text)",
        inactiveTabBackground: "var(--iv-inactive-tab-background)",
        disableTabBackground: "var(--iv-disabledTab-bg)",
        disableTabText: "var(--iv-disabledTab-text)",
        documentIcon: "var(--iv-document-icon)",
        disabledButtonBg: "var(--iv-disabled-button-bg)",
        selectorBorder: "var(--iv-selector-border)",
        sortByBorder: "var(--iv-sortBy-border)",
        sortByText: "var(--iv-sortBy-text)",
        selectorPannelTitle: "var(--iv-selector-pannel-title)",
        selectorPannelSubTitle: "var(--iv-selector-pannel-sub-title)",
        qrCodeTimer: "var(--iv-qr-code-timer)",
      },
      backgroundImage: {
        "default_theme-gradient":
          "linear-gradient(90deg, #FF5300 0%, #FB5103 16%, #F04C0F 31%, #DE4322 46%, #C5363C 61%, #A4265F 75%, #7C1389 90%, #5B03AD 100%)",
        "default_theme-lighter-gradient":
          "linear-gradient(90deg, rgba(255, 83, 0, 0.08) 0%, rgba(251, 81, 3, 0.08) 16%, rgba(240, 76, 15, 0.08) 31%, rgba(222, 67, 34, 0.08) 46%, rgba(197, 54, 60, 0.08) 61%, rgba(164, 38, 95, 0.08) 75%, rgba(124, 19, 137, 0.08) 90%, rgba(91, 3, 173, 0.08) 100%)",
        "purple_theme-gradient":
          "linear-gradient(90deg, #5a31ee 0%, #8f69ec 100%)",
        "purple_theme-lighter-gradient":
          "linear-gradient(83.99deg, #f9fafc 38.27%, #F8FBFF 93.3%)",
        "car_theme-gradient":
          "linear-gradient(90deg, #52AE32 0%, #006535 100%)",
        "car_theme-lighter-gradient":
          "linear-gradient(83.99deg, rgba(211, 246, 199, 0.08) 38.27%, rgba(82, 174, 50, 0.08) 93.3%)",
      },
    },
  },
  safelist: [
    "bg-default_theme-gradient",
    "bg-default_theme-lighter-gradient",
    "hover:bg-default_theme-gradient",
    "bg-purple_theme-gradient",
    "bg-purple_theme-lighter-gradient",
    "hover:bg-purple_theme-gradient",
    "bg-car_theme-gradient",
    "bg-car_theme-lighter-gradient",
    "hover:bg-car_theme-gradient",
  ], //Listing possible class names in the safelist, ensures Tailwind generates those styles.
  plugins: [],
};
```

2. **Index.css**

```css
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer base {
  [class="default_theme"] {
    --iv-font-base: "Inter", sans-serif;
    --iv-primary-color: #951f6f;
    --iv-logo-start-color: #ffb600;
    --iv-background-color: #ffffff;
    --iv-white-text: #ffffff;
    --iv-header-label-text: #000000;
    --iv-header-description-text: #000000;
    --iv-offline-label-text: #2c2c2c;
    --iv-offline-description-text: #7b7b7b;
    --iv-header-background-color: #f2fcff;
    --iv-verificationMethodTabs-bg-color: #ffffff;
    --iv-horizontal-line: #ff7f00;
    --iv-page-background-color: #fafbfd;
    --iv-success: #ecfff6;
    --iv-invalid: #ffdedd;
    --iv-expired: #fff5e3;
    --iv-successText: #1f9f60;
    --iv-invalidText: #cb4241;
    --iv-expiredText: #d98c00;
    --iv-successBorder: #abefc6;
    --iv-invalidBorder: #d68e8d;
    --iv-expiredBorder: #e2ca9f;
    --iv-success-alert: #57a04b;
    --iv-warning-alert: #d98c00;
    --iv-error-alert: #cb4241;
    --iv-arrow-background: #f2fcff;
    --iv-stepper-background: #fafbfd;
    --iv-stepper-label: #868686;
    --iv-stepper-description: #535353;
    --iv-camera-denied-label-color: #000000;
    --iv-camera-denied-description-color: #707070;
    --iv-upload-description: #8e8e8e;
    --iv-copyrights-text: #707070;
    --iv-copyrights-border: #707070;
    --iv-active-tab-text: #ffffff;
    --iv-active-tab-background: #ff7f00;
    --iv-inactive-tab-text: #000000;
    --iv-inactive-tab-background: #ffffff;
    --iv-disabledTab-bg: #e5e7eb;
    --iv-disabledTab-text: #4b5563;
    --iv-document-icon: #000000;
    --iv-selector-border: #e4e7ec;
    --iv-sortBy-border: #d0d5dd;
    --iv-sortBy-text: #344054;
    --iv-disabled-button-bg: #c1c1c1;
    --iv-gradient-scanning-line: linear-gradient(
      90deg,
      #ff5300 0%,
      #fb5103 16%,
      #f04c0f 31%,
      #de4322 46%,
      #c5363c 61%,
      #a4265f 75%,
      #7c1389 90%,
      #5b03ad 100%
    );
    --iv-selector-pannel-title: #101828;
    --iv-selector-pannel-sub-title: #475467;
    --iv-qr-code-timer: #8e8e8e;
  }
  [class="purple_theme"] {
    --iv-font-base: "Gentium Plus", serif;
    --iv-primary-color: #5a31ee;
    --iv-logo-start-color: #8f69ec;
    --iv-background-color: #ffffff;
    --iv-white-text: #ffffff;
    --iv-header-label-text: #000000;
    --iv-header-description-text: #7b7b7b;
    --iv-offline-label-text: #2c2c2c;
    --iv-offline-description-text: #7b7b7b;
    --iv-header-background-color: #f7f1ff;
    --iv-verificationMethodTabs-bg-color: #f7f1ff;
    --iv-horizontal-line: #bcaaf3;
    --iv-page-background-color: #fafbfd;
    --iv-success: #4b9d1f;
    --iv-invalid: #d73e3e;
    --iv-expired: #d98c00;
    --iv-successText: #1f9f60;
    --iv-invalidText: #cb4241;
    --iv-expiredText: #d98c00;
    --iv-successBorder: #abefc6;
    --iv-invalidBorder: #d68e8d;
    --iv-expiredBorder: #e2ca9f;
    --iv-success-alert: #57a04b;
    --iv-warning-alert: #d98c00;
    --iv-error-alert: #d73e3e;
    --iv-arrow-background: #f7f1ff;
    --iv-stepper-background: ;
    --iv-stepper-label: #000000;
    --iv-stepper-description: #2c2c2c;
    --iv-camera-denied-label-color: #000000;
    --iv-camera-denied-description-color: #707070;
    --iv-upload-description: #2c2c2c;
    --iv-copyrights-text: #2c2c2c;
    --iv-copyrights-border: #2c2c2c;
    --iv-active-tab-text: #ffffff;
    --iv-active-tab-background: #5a31ee;
    --iv-inactive-tab-text: #000000;
    --iv-inactive-tab-background: #ffffff;
    --iv-disabledTab-bg: #e5e7eb;
    --iv-disabledTab-text: #4b5563;
    --iv-document-icon: #000000;
    --iv-selector-border: #e4e7ec;
    --iv-search-border: #d5d8e2;
    --iv-searAll-text: #535353;
    --iv-disabled-button-bg: #c1c1c1;
    --iv-gradient-scanning-line: linear-gradient(
      90deg,
      #8f69ec 0%,
      #5a31ee 100%
    );
    --iv-selector-pannel-title: #101828;
    --iv-selector-pannel-sub-title: #475467;
    --iv-qr-code-timer: #8e8e8e;
  }
  [class="car_theme"] {
    --iv-font-base: "Inter", sans-serif;
    --iv-primary-color: #278834;
    --iv-logo-start-color: #ffb600;
    --iv-background-color: #ffffff;
    --iv-white-text: #ffffff;
    --iv-header-label-text: #000000;
    --iv-header-description-text: #000000;
    --iv-offline-label-text: #2c2c2c;
    --iv-offline-description-text: #7b7b7b;
    --iv-header-background-color: #f2fcff;
    --iv-verificationMethodTabs-bg-color: #ffffff;
    --iv-horizontal-line: #ff7f00;
    --iv-page-background-color: #fafbfd;
    --iv-success: #1f9f60;
    --iv-invalid: #cb4241;
    --iv-expired: #d98c00;
    --iv-successText: #1f9f60;
    --iv-invalidText: #cb4241;
    --iv-expiredText: #d98c00;
    --iv-successBorder: #abefc6;
    --iv-invalidBorder: #d68e8d;
    --iv-expiredBorder: #e2ca9f;
    --iv-success-alert: #1f9f60;
    --iv-warning-alert: #d98c00;
    --iv-error-alert: #cb4241;
    --iv-arrow-background: #f2fcff;
    --iv-stepper-background: #fafbfd;
    --iv-stepper-label: #868686;
    --iv-stepper-description: #535353;
    --iv-camera-denied-label-color: #000000;
    --iv-camera-denied-description-color: #707070;
    --iv-upload-description: #8e8e8e;
    --iv-copyrights-text: #707070;
    --iv-copyrights-border: #707070;
    --iv-active-tab-text: #ffffff;
    --iv-active-tab-background: #ff7f00;
    --iv-inactive-tab-text: #000000;
    --iv-inactive-tab-background: #ffffff;
    --iv-disabledTab-bg: #e8e8e8;
    --iv-disabledTab-text: #4d4d4d;
    --iv-document-icon: #000000;
    --iv-selector-border: #e4e7ec;
    --iv-sortBy-border: #d0d5dd;
    --iv-sortBy-text: #344054;
    --iv-disabled-button-bg: #c1c1c1;
    --iv-gradient-scanning-line: linear-gradient(
      90deg,
      #52ae32 0%,
      #006535 100%
    );
    --iv-selector-pannel-title: #101828;
    --iv-selector-pannel-sub-title: #475467;
    --iv-qr-code-timer: #8e8e8e;
  }
}

body {
  margin: 0;
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", "Roboto", "Oxygen",
    "Ubuntu", "Cantarell", "Fira Sans", "Droid Sans", "Helvetica Neue",
    sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

code {
  font-family: source-code-pro, Menlo, Monaco, Consolas, "Courier New",
    monospace;
}

/* scanning line */

@keyframes scan-desktop {
  0% {
    transform: translateY(-168px);
  }
  50% {
    transform: translateY(168px);
  }
  100% {
    transform: translateY(-168px);
  }
}

.scanning-line {
  width: 100%;
  height: 2px;
  background: var(--iv-gradient-scanning-line);
  z-index: 100000;
  box-shadow: 1px 2px 8px 1px var(--iv-gradient-scanning-line);
  animation: scan-mobile 3s infinite;
  @media (min-width: 1024px) {
    animation: scan-desktop 3s infinite;
  }
}

/* loader */

@keyframes spin {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}

.animate-spin {
  animation: spin 1s linear infinite;
  -webkit-animation: spin 1s linear infinite; /* For Safari */
}

#loader {
  will-change: transform;
}

/* Reduce scrollbar width */
.custom-scrollbar::-webkit-scrollbar {
  width: 4px; /* For vertical scrollbar */
  height: 4px; /* For horizontal scrollbar */
}

/* Scrollbar track */
.custom-scrollbar::-webkit-scrollbar-track {
  background: #f1f1f1;
  border-radius: 4px;
}

/* Scrollbar thumb */
.custom-scrollbar::-webkit-scrollbar-thumb {
  background: #888;
  border-radius: 4px;
}

/* Modal slide-up effect */
@keyframes slide-up {
  from {
    transform: translateY(100%);
  }
  to {
    transform: translateY(0);
  }
}

.slide-up-container {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  background: white;
  animation: slide-up 0.3s ease-in-out;
  border-radius: 10px 10px 0 0;
}
```

### **Setting Defaults for Inji Verify Application :**

In the env.config.js file, below properties is used to customize the application during the deployment.

```javascript
window._env_ = {
DEFAULT_TITLE: "Inji Verify",
DEFAULT_THEME: "default_theme",
DEFAULT_LANG: "en",
DEFAULT_FONT_URL: "https://fonts.googleapis.com/css?family=Inter",
DEFAULT_FAVICON: "favicon.ico",
OVP_QR_HEADER: "INJI_OVP://",
INTERNET_CONNECTIVITY_CHECK_ENDPOINT: "https://dns.google/",
INTERNET_CONNECTIVITY_CHECK_TIMEOUT: "10000",
VERIFY_SERVICE_API_URL: "/v1/verify",
VERIFIABLE_CLAIMS_CONFIG_URL: "/assets/config.json",
VP_REQUEST_STATUS_LONGPOLL_TIMEOUT: "60000",
}
```

**DEFAULT\_TITLE:** - This property helps you to specify the default title of the Inji Verify during the deployment.

**DEFAULT\_THEME:** This property helps you to customize the theme, currently Inji Verify Supports two different Themes

1. Default Theme - default\_theme
2. Purple Theme - purple\_theme
3. Car Theme - car\_theme

**DEFAULT\_LANG:** - This property helps you to specify the default language during the deployment.

**DEFAULT\_FONT\_URL:** - This property helps you to specify the default font of the Inji Verify during the deployment.

**DEFAULT\_FAVICON:** - This property helps you to specify the default favicon file of the Inji Verify during the deployment.
