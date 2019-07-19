# SMS Notification Service

#### Background

This service can be used to generate RID for the requested CenterID and MachineID. Service has REST API exposed to fetch generated RID. 


#### Solution


**The key solution considerations are**


- Create a project which provides REST service to generate RID for the requested CenterID and MachineID. Append timestamp and sequence in RID


- REST service can be used by any RegProc module to fetch RID through HTTP client.


- Request for GET **/generate/rid/{centerid}/{machineid}**

https://mosip.io/v1//generate/rid/10002/10032

- Response body model for POST **/generate/rid/{centerid}/{machineid}**

```
{
  "id": null,
  "version": null,
  "responsetime": "2019-05-07T04:30:40.061Z",
  "metadata": null,
  "response": {
    "rid": "10002100320001920190507043040"
  },
  "errors": null
}
```


**Class Diagram**



![Class Diagram](_images/kernel-ridgenerator-cd.png)



## Implementation


**kernel-ridgenerator-service** [README](../../../kernel/kernel-ridgenerator-service/README.md)
