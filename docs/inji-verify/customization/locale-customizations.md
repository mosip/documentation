# Locale Customizations

Inji Verify offers multi-lingual support. At present, 6 international and 3 Indian Languages are supported.

* Arabic
* English
* French
* Khmer
* Portuguese
* Spanish
* Hindi
* Tamil
* Kannada

### Steps to support a new language

Under `locales` folder, localization of a particular language JSON file has to be added.

Language JSON has to be imported in i18n.ts and load the resources to i18next as follows:

* `import ta from './locales/ta.json';`
* `const resources = { en, ta, kn, hi, fr, ar, pt, es, km };`

Ensure the language display mapping is done in the LanguagesSupported variable in i18n.ts

```ts
export const LanguagesSupported: LanguageObject[] = [
  { label: "English", value: "en" },
  { label: "Português", value: "pt" },
  { label: "தமிழ்", value: "ta" },
  { label: "ಕನ್ನಡ", value: "kn" },
  { label: "हिंदी", value: "hi" },
  { label: "Français", value: "fr" },
  { label: "عربي", value: "ar" },
  { label: "español", value: "es" },
  { label: "ខ្មែរ", value: "km" },
];

```

To use with react, must include the key with the 't' function `<Text>{t('editLabel')}</Text>`

### About libraries

Below specified libraries are used in the Inji Verify react project to support localization:

1. [i18next](https://www.i18next.com/): `i18next` is an internationalization framework. It provides the standard i18n features such as [plurals](https://www.i18next.com/translation-function/plurals), [context](https://www.i18next.com/translation-function/context), [interpolation](https://www.i18next.com/translation-function/interpolation), and [format](https://www.i18next.com/translation-function/formatting). It provides a complete solution to localize products in the web.
2. [react-i18next](https://react.i18next.com/): `react-i18next` is a set of components, hooks, and plugins that sit on top of i18next, and is specifically designed for React.
