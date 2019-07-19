# HTTP Packet Server 

#### Background

This application can be used as an alternative of SFTP server to upload files/packets to File server. This is a service which has REST API exposed to upload files. 


#### Solution


**The key solution considerations are**


- Create a project which provides REST service to upload files.


- REST service can be used by any MOSIP module to upload files through HTTP client.


- Request body model for POST **/uploads**

(curl sample)

```
-H "Content-Type: multipart/form-data" 
-F "packet=@id_proof.pdf;type=application/pdf"
```

- Response body model for POST **/uploads**

```
{
  "fileName": "id_proof.pdf",
  "fileSizeInBytes": 71976
}
```

**Class Diagram**



![Class Diagram](_images/kernel-packetserver-http-cd.png)


## Implementation


**kernel-packetserver-http** [README](../../../kernel/kernel-packetserver-http/README.md)