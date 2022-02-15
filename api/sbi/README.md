# SBI API documentation

This folder contains JSON schema YAMLs for various objects used in SBI. 

To generate HTML pages:
* Install [`generate-schema-doc`](https://pypi.org/project/json-schema-for-humans/).
* Run
```
generate-schema-doc --expand-buttons --no-minify --config show_breadcrumbs=false cover.yaml`
```
* Remove top line in HTML "type: Object" as we don't want to appear it as a title of documentation.

