
# Search

* [POST /search](#post-fetch)

### POST /search

This service searches the master data details. 

#### Resource URL
<div>https://mosip.io/v1/admin/search</div>

#### Resource details

Resource Details | Description
------------ | -------------
Response format | The response will be sent in the Response Header and also a JSON message will be returned. 
Requires Authentication | no

#### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
entity|Yes|This is the entity name. | -NA- | machines
conditionandoperators|No|This is the WHERE clause which is used to filter the entity. This is an array. | -NA- | []
order|Yes|This is the order in which the filter criteria is applied.| -NA- | 1
column_name|Yes|This is the column name for which the filter is applied.| -NA- | machinename
operator|Yes|This is the operator for which the filter is applied.| -NA- | EQUALS
column_value|Yes|This is the column value for which the filter is applied.| -NA- | DYJD7252
type|Yes|This is the data type of the filter.| -NA- | string


#### Example Request
```JSON
{
    "id": "mosip.admin.masterdata.fetch",
    "version":"1.0",
    "requesttime":"2007-12-03T10:15:30Z",
    "request": {
        "entity": "machines",
        "conditionandoperators":[
            {   
                "order":1,
                "column_name":"machinename",
                "operator":"EQUALS",
                "column_value":"DYJD7252",
                "type":"string"
            },
            {   
                "order":2,
                "column_name":"is_active",
                "operator":"EQUALS",
                "column_value":"false"
                "type":"boolean"
            }
        ],
        "operator" : "AND"
    }
}
```
#### Example Response

Success Response 

```
JSON:
{
    "id": "mosip.admin.masterdata.fetch",
    "ver": "1.0",
    "responsetime": "2007-12-03T10:15:30Z",
    "response": {
        "machines": [
            {
                "machineid":"string",
                "machinename":"string",
                "macid":"string",
                "serialnumber":"string",
                "isactive":"string"
            }
        ]
    }
}

```

Error Responses

1. Invalid credentials: If the passed credentials is not correct. 
```JSON
{
    "id": "mosip.admin.masterdata.fetch",
    "ver": "1.0",
    "responsetime": "2007-12-03T10:15:30Z",
    "errors":[
        {
            "errorCode": "ADMN_MST_FTCH_AUTH_ERR_INVALIDCREDENTIALS",
            "message": "The passed in credentials is not correct"
        }    
    ]
}
```

2. Invalid entity: If the passed in entity is not correct. 
```JSON

{
    "id": "mosip.admin.masterdata.fetch",
    "ver": "1.0",
    "responsetime": "2007-12-03T10:15:30Z",
    "errors":[
        {
            "errorCode": "ADMN_MST_FTCH_AUTH_ENTITY_INVALID",
            "message": "The passed in entity is not correct"
        }    
    ]
}

```

3. Invalid fields: If the passed fields are not correct. 
```JSON

{
    "id": "mosip.admin.masterdata.fetch",
    "ver": "1.0",
    "responsetime": "2007-12-03T10:15:30Z",
    "errors":[
        {
            "errorCode": "ADMN_MST_FTCH_AUTH_FLDS_INVALID",
            "message": "The passed in fields are not correct"
        }    
    ]
}

```
