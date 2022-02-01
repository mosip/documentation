# Reporting

## Overview

Details of reporting framework can be found here <TODO add link>

The framework has been used to create a set of default dashboards using Kibana. Dashboards give a visual display of metrics and important data to track the status of various pre and post-enrollment processes. This data helps ID issuers with improving efficiency, forecasting, and better decision-making.


## Default dashboards
The following dashboards are configured on Kibana as the default implementation

* Combined dashboard
  ![](_images/reports-combined-dashboard.png)
  
* Pre Registration dashboard
  ![](_images/reports-preregistration-1.png)
  ![](_images/reports-preregistration-1.png)
  
* Pre Reg Operations dashboard
  ![](_images/reports-preregistration-operations-1.png)
  ![](_images/reports-preregistration-operations-2.png)
  
* Registration dashboard
  ![](_images/reports-registration-1.png)
  ![](_images/reports-registration-2.png)
  
* Authentication dashboard
  ![](_images/reports-authentication.png)
  
* Registration Profile dashboard
  ![](_images/reports-registration-profile-1.png)
  ![](_images/reports-registration-profile-2.png)
  
* ID Issuance Profile dashboard
  ![](_images/reports-id-issuance-1.png)
  ![](_images/reports-id-issuance-2.png)

The source files of the default dashboards are available here <TODO add link>

## How to customize?
* Setup a data pipeline for populating data from database to elastic search. Details are given here <TODO add link>
* After data is populated in elastic search, one can create custom dashboards in Kibana. Details are given here <TODO add link>
