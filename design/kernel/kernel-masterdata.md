﻿# Sync services

#### Background

This service can be used for Create, Fetch, Update and Delete operation on Master Data Entities.

#### Solution



**The key solution considerations are**

- Create a project which provides REST service to perform CRUD on Master Data Tables.


- REST service can be used by any MOSIP module through HTTP client.




**Class Diagram** (Sample for one entity)

![CD](_images/kernel-masterdata-cd.png)


**ERD**

![Module Diagram](_images/kernel-masterdata-erd.png)


## Implementation


**kernel-masterdata-service** [README](../../../kernel/kernel-masterdata-service/README.md)
