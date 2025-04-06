# Locale customization

## Steps to Support a new language

* Under `locales` folder, localization of a particular language JSON file has to be added.
* Language JSON has to be imported in `i18n.ts` and load the resources to i18next as follows. `import fil from './locales/fil.json';` `const resources = { en, fil, ar, hi, kn, ta };`
* To ensure the language needs to be included in the const `SUPPORTED_LANGUAGES`. 
* To use with react, must include the key with the 't' function
  
```
const { t } = useTranslation('common');
<Text>{t('editLabel')}</Text>

```

## About libraries

1. [i18next](https://www.i18next.com/)
2. [react-i18next](https://react.i18next.com/)
3. [expo-localization](https://docs.expo.dev/versions/latest/sdk/localization/)

* Inji Wallet has the capability to support multiple languages.
* `i18next` is an internationalization framework. It provides the standard i18n features such as [plurals](https://www.i18next.com/translation-function/plurals), [context](https://www.i18next.com/translation-function/context), [interpolation](https://www.i18next.com/translation-function/interpolation), and [format](https://www.i18next.com/translation-function/formatting). It provides a complete solution to localize products from the web to mobile and desktop.
* `react-i18next` is a set of components, hooks, and plugins that sit on top of i18next, and is specifically designed for React.
* `expo-localization` allows you to localize the app, customizing the experience for specific regions, and languages. It also provides access to the locale data on the native device.
