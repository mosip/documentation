# Locale Customization <a href="#localecustomization" id="localecustomization"></a>

Inji Web offers multi-lingual support. At present, 3 Indian and 3 international Languages are supported.

1. English
2. Arabic
3. French
4. Tamil
5. Hindi
6. Kannada

## **Steps to support a new language** <a href="#steps" id="steps"></a>

1. Under `locales` folder, localization of a particular language JSON file has to be added.
   
2. Language JSON has to be imported in `i18n.ts` and load the resources to i18next as follows:
   
  * `import ta from './locales/ta.json';` 
  * `const resources = { en, fr, ar, hi, kn, ta };`
    
3. Ensure the language display mapping is done in the LanguagesSupported variable in i18n.ts
    
    ```jsx
    export const LanguagesSupported: LanguageObject[] = [
        {label: "English", value: 'en'},
        {label: "தமிழ்", value: 'ta'},
        {label: "ಕನ್ನಡ", value: 'kn'},
        {label: "हिंदी", value: 'hi'},
        {label: "Français", value: 'fr'},
        {label: "عربي", value: 'ar'}
    ]
    ```
    
4. To use with react, must include the key with the 't' function `<Text>{t('editLabel')}</Text>`

## **About libraries**

Below specified libraries are used in the Inji Web react project to support localization:

1. [i18next](https://www.i18next.com/): `i18next` is an internationalization framework. It provides the standard i18n features such as [plurals](https://www.i18next.com/translation-function/plurals), [context](https://www.i18next.com/translation-function/context), [interpolation](https://www.i18next.com/translation-function/interpolation), and [format](https://www.i18next.com/translation-function/formatting). It provides a complete solution to localize products in the web.
   
2. [react-i18next](https://react.i18next.com/): `react-i18next` is a set of components, hooks, and plugins that sit on top of i18next, and is specifically designed for React.
