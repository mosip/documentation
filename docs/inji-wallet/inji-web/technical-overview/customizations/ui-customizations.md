# UI Customization

Inji Web is built using [tailwind CSS](https://tailwindcss.com/) library. 

Below sections provides instructions on how themes can be customized in Inji Web application.

## **Steps:**

InjiWeb uses two different files to handle the customization in UI.

**1. tailwind.config.js:** 

Here, properties related to the font and colors for each component is maintained.
    
    ```jsx
    /** @type {import('tailwindcss').Config} */
    module.exports = {
        darkMode: 'selector',
        content: [
            "./src/**/**/*.{js,jsx,ts,tsx}",
        ],
        theme: {
            extend: {
                fontFamily:{
                    base: 'var(--iw-font-base)',
                },
                colors: {
                    iw: {
                        background: 'var(--iw-color-background)',
                        header: 'var(--iw-color-header)',
                        footer: 'var(--iw-color-footer)',
                        title: 'var(--iw-color-title)',
                        subTitle: 'var(--iw-color-subTitle)',
                        searchTitle: 'var(--iw-color-searchTitle)',
                        primary: 'var(--iw-color-primary)',
                        helpAccordionHover: 'var(--iw-color-helpAccordionHover)',
                        shadow: 'var(--iw-color-shadow)',
                        spinningLoaderPrimary: 'var(--iw-color-spinningLoaderPrimary)',
                        spinningLoaderSecondary: 'var(--iw-color-spinningLoaderSecondary)',
                        navigationBar: 'var(--iw-color-navigationBar)',
                        languageGlobeIcon: 'var(--iw-color-languageGlobeIcon)',
                        languageArrowIcon: 'var(--iw-color-languageArrowIcon)',
                        languageCheckIcon: 'var(--iw-color-languageCheckIcon)',
                        closeIcon: 'var(--iw-color-closeIcon)',
                        searchIcon: 'var(--iw-color-searchIcon)',
                        tileBackground: 'var(--iw-color-tileBackground)',
                        shieldSuccessIcon: 'var(--iw-color-shieldSuccessIcon)',
                        shieldErrorIcon: 'var(--iw-color-shieldErrorIcon)',
                        shieldLoadingIcon: 'var(--iw-color-shieldLoadingIcon)',
                        shieldSuccessShadow: 'var(--iw-color-shieldSuccessShadow)',
                        shieldErrorShadow: 'var(--iw-color-shieldErrorShadow)',
                        shieldLoadingShadow: 'var(--iw-color-shieldLoadingShadow)',
                    }
                }
            },
        },
        plugins: [require('tailwindcss-rtl')],
    }
    
    ```
    
  **2. index.css**
  
        * This file maintains the css properties for each theme in the css variables.
        * During the deployment, the theme properties will get applied based on the theme selected.
    
    ```jsx
    
    @layer base {
        :root {
            --iw-font-base: "Inter", sans-serif;
            --iw-color-background: #FFFFFF;
            --iw-color-header: #000000;
            --iw-color-shieldLoadingIcon: #ff914b;
            --iw-color-shieldSuccessShadow: #f1f7ee;
            --iw-color-shieldErrorShadow: #FEF2F2;
            --iw-color-shieldLoadingShadow: #f6dfbe;
        }
        .purple_theme {
            --iw-font-base: "Gentium Plus", serif;
            --iw-color-background: #bcaaf3;
            --iw-color-header: #8f69ec;
            --iw-color-shieldErrorIcon: #4518de;
            --iw-color-shieldLoadingIcon: #5b32f1;
            --iw-color-shieldSuccessShadow: #f1f7ee;
            --iw-color-shieldErrorShadow: #FEF2F2;
            --iw-color-shieldLoadingShadow: #f6dfbe;
        }
    }
    ```
    
   ## **Setting Defaults for Inji Web Application :** 
    
    In the env.config.js file, below properties is used to customize the application during the deployment.
    
    ```jsx
    window._env_ = {
    		...
    		DEFAULT_LANG: "en",
        DEFAULT_THEME: "",
        DEFAULT_TITLE: "Inji Web",
        ...
    };
    ```
    
  **DEFAULT_THEME:** This property helps you to customize the theme, currently Inji Web Supports two different Themes
    
    1. Default Theme - “”
    2. Purple Theme - “purple_theme”
    
  **DEFAULT_LANG:** - This property helps you to specify the default language during the deployment.
    
  **DEFAULT_TITLE:** - This property helps you to specify the default title of the INJIWEB during the deployment.

