# Kernel Transliteration

#### Background

This library can be used for transliteration. It contains a methods that accept three arguments:

- Source Language ISO code


- Target Language ISO code


- Input String


#### Solution



**The key solution considerations are**

- Create an interface Transliteration having required method declaration to transliterate source to target language, which will be exposed to the other applications.


- Create a project which implements Transliteration from provided IBM icu4j API.


- Transliterator can be used in any MOSIP module to transliterate  language after adding its implementation to their class path.



**Class Diagram**


![Class Diagram](_images/kernel-transliteration-cd.png)


## Implementation


**kernel-transliteration-icu4j** [README](../../../kernel/kernel-transliteration-icu4j/README.md)