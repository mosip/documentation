# Multi-Language Feature.

**Background**
- Mosip Support multi-language feature.

The target users are -
   - MOSIP

**Solution**
1. We wold be using angular i18n for translation.
2. Id object mapping would be changed to support translation.
3. User could select primary language at first time log in.
4. From second time onward it would be the same language.
5. All error messages and information messages would be shown in primary language.
6. Secondary language would be one time and could not be changed.
7. Primary and secondary language would be persisted in DB
8. Multiple language translation file would be generated at design time.
9. Run time new languages could not be added.

**Transliteration should use ICU4j**

We would use virtual keyboard provided by angular to capture user preferred language input.
