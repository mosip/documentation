# Anonymous Profiling Support

## Overview

* Allow for reporting and analytics on a limited set of attributes on various flows of ID in MOSIP. 
* The limited set should not violate the privacy of the person or be pointing to specific individuals.
* The flows would cover pre-registration, registration, id issue/rejection, updates, authentication, credential issue, credential verification.

In order to achieve this if we can publish either a fixed anonymized profile or a dynamic anonymized profile of the users and the same is accessible to a search engine such as elastic search it can be used for analytics. 
This anonymous profile can be either stored or published in an analytics stream one time or both. 
Storage brings certain capabilities and limitations and also creates some change in the system. 
Publishing is fairly easy to plugin but brings with it some limitations in usage.

##
