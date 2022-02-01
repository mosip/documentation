# MOSIP API Documentation

## Overview
This folder contains OpenAPI JSON/YAML files containing documentation for all APIs.  Any update of these files automatically triggers a Github workflow that converts these JSONs to HTML and publishes them in `gh-pages` branch. 

To manually convert the files to HTML, run (example):

```
redoc-cli bundle sbi-openapi.yaml -o ~/Desktop/sbi.html
```
