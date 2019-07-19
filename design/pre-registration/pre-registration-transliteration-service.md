# Approach for Pre-Registration transliteration Service

**Background**
- Exposing the REST API to transliterate based on language code and value.

The target users are -
   - Pre-Registration UI

The key requirements -

-   transliterate the value based on language code. 


**Solution**

** transliterate:**

-   Create the REST API to transliterate the value based on language. which internally call the ICU4j API.

- Internally call an ICU4j API to generate transliterated value. If it transliterated sucessfully send the response otherwise throw an respetive exception.

**Class Diagram**
![pre-registration transliterate](_images/_class_diagram/pre-registration-transliterate.png)
**Sequence Diagram**
![pre-registration transliterate](_images/_sequence_diagram/pre-registration-transliterate.png)

**Error Code** 
  Code   |       Type  | Message|
-----|----------|-------------|
PRG-TRA-001 |  Error   |  Failed to transliterate

  

**Dependency Modules**

Component Name | Module Name | Description | 
-----|----------|-------------|
ICU4j | Library | To transliterate.
Exception Manager  |  Kernel     |       To prepare the user defined exception and render to the user.
Log        |          Kernel         |   To log the process.



**User Story References**

**User Story No.** |  **Reference Link** |
-----|----------|

