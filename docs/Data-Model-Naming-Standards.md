## Audience
* Data Modelers
* DBAs
* Database Developers
* Application Developers

A simple and consistent naming convention for database objects, when followed rigorously, can help database application developers greatly.

## Common Naming Standards

Following common standards are followed

* **Singular names to the entities**
* **Object name length to be less than 30 chars**
* **Lower case object names separated by underscore (_)**
* **Only defined abbreviations are used**
* **No prefix or suffix to the table names**
* **Each table is defined an alias, this alias is used in constraints and index names**


## Database Naming Standards

The database names will follow the below naming convention
**mosip_(abbreviated value of the module name)**

**Ex: mosip_prereg**

## Schema Naming Standards
Schema name is named after the DB name, by default, without mosip_. If there are more than one schemas in a DB, then a proper single word name is assigned, either full word or an abbreviated word.
**Ex: prereg**

## Table Naming Standards

* Table name can have one or two words that describe the contents of the table separated by underscore (_).
* Table name should always be in singular. 
* An alias for each table is defined, this alias can be used in various other places like reference keys, indexes, constraints, etc.

## Index Naming Standards

Indexes are named as idx_(table-alias)_(column-abbreviation)

## Key Naming Standards (Primary, Unique, Foreign Keys)

**Primary Key:** Each table should have a primary key, the key should be named as “pk_(table-alias)_(column-name)”. If it is a composite key, then in place of column name any meaning full name can be provided. 

**Unique Key:** If a surrogate is used as PK then create a unique key, on fields that uniquely defines a business key. The naming of the unique key should be “uk_(table-alias)_(column-names)”.

**Foreign Key:** Any references from a table with the other tables, the creating a foreign key is mandatory. This helps maintain referential integrity. Foreign key can be named as fk__(table-alias1)_(table-alias2)

## Attribute Standards

Standardize the attribute implementation defined the following common datatypes used across mosip system. The datatype sizes are defined to consider multi language storage support, which may vary based on the implementation.

|Attribute |Attribute Description|Type|Size|
|-------------------- |-------------------------------------------|--------------------------------|----------------|
|vid|Virtual ID|character varying|36|
|uin|Unique Identification Number-Encrypted|character varying|500|
|reg_id|Registration ID|character varying|39|
|_code|Code|character varying|64|
|_descr|Description|character varying|256|
|_type|Type|character varying|128|
|_name|Name|character varying|128|
|_id|Identification Code / Number|character varying|36|
|_addr_line|address line|character varying|256|
|_loc_line|location line|character varying|128|
|country|country|character varying|64|
|pin|pin|character varying|16|
|_comment / _remarks| Comments / remarks captured as part of a transaction|character varying|1024|
|count | |smallint| |
|_by| |character varying|256|
|ref_id|Reference id |character varying|64|
|ref_id_type|Reference ID Type|character varying|64|
|is_active | |boolean| |
|cr_by | |character varying|256|
|cr_dtimes | |timestamp| |
|upd_by  | |character varying|256|
|upd_dtimes | |timestamp| |
|is_deleted | |boolean| |
|del_dtimes | |timestamp||

## Acronyms 

The following acronyms are used in the data model

|Abbreviation|Description||Abbreviation|Description|
|----------------------|----------------------|---|----------------------|----------------------|
|ack|Acknowledgement||active|Active|
|addr|Address||autn|Authentication|
|bio|Biometric||cd|Code|
|cr|Created||del|Deleted|
|demo|Demographic||descr|Description|
|dob|Date of Birth||dt|Date|
|dtime|Date Time||dtimes|Date Timestamp|
|expiry|Expiry||fk|Foreign Key|
|ibio|Individual Biometric||id|Identifier|
|ida|Identity and authentication||idem|Individual Demographic|
|idsvr|ID Issuance Server||idsw|ID Issuance Software|
|Idx|Index||ins|Insert|
|ip|IP Address||lang|Language |
|last|Last||lh|Left Hand|
|lst|List||mref|Master Reference|
|msg|Message||mstr|Master|
|ntv |Native||nxt|Next|
|otp|One Time Password||parent|Parent|
|pct|Percentage||pk|Primary Key|
|pkt|Packet||preid|Pre ID Issuance|
|prev|Previous||pwd|Password|
|rcvd|Received||regn|Registration|
|remark|Remarks||rh|Right Hand|
|seq|Sequence ||status|Status|
|tkn|Token||total|Total|
|trn|Transaction ||ttyp|Transaction Type|
|typ|Type||uin|Unique Identification Number|
|upd|Update||usrl|User Login|
|vid|Virtual ID||wfl|Workflow|
|audit|Audit||dtimesz|Date Timestamp with Time Zone.|
|kernel|Kernel||reg|Registration|
|regprc|Registration Processor||prereg|Pre Registration|
