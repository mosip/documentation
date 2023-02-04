# CBEFF XML

## CBEFF

* Standards:
  * ISO 19785-3
  * [OASIS patron format ISO/IEC JTC 1 SC 37 - biometrics](https://www.ibia.org/cbeff/iso/bir-header-identifiers)
    * Patron identifier 257
    * Patron format identifier 11
  * [OASIS Binary Data Block Format Identifiers](https://www.ibia.org/cbeff/iso/bdb-format-identifiers) for Format Type ISO/IEC JTC 1 SC 37-biometrics
    * Patron identifier 257
    * BDB patron format identifier
      * 7 for finger image
      * 2 for finger minutiae
      * 8 for face image
      * 9 for iris image
* [MOSIP Schema](https://github.com/mosip/mosip-config/blob/v1.2.0.1-B2/mosip-cbeff.xsd) is similar to [OASIS Schema](https://docs.oasis-open.org/bioserv/BIAS/v2.0/csprd01/schemas/cbeff\_ed2.xsd), with an optional attribute called others added from the LTS version.
* MOSIP's [CBEFF Utils](https://github.com/mosip/commons/tree/v1.2.0/kernel/kernel-cbeffutil-api) can be used to create and validate CBEFF XML data.

## CBEFF Sample

```xml
<?xml version="1.0" encoding="UTF-8"?>
<BIR xmlns="http://standards.iso.org/iso-iec/19785/-3/ed-2/">
   <BIRInfo>
      <Integrity>false</Integrity>
   </BIRInfo>
   <!-- right index finger -->
   <BIR>
      <Version>
         <Major>1</Major>
         <Minor>1</Minor>
      </Version>
      <CBEFFVersion>
         <Major>1</Major>
         <Minor>1</Minor>
      </CBEFFVersion>
      <BIRInfo>
         <Integrity>false</Integrity>
      </BIRInfo>
      <BDBInfo>
         <Format>
            <Organization>Mosip</Organization>
            <Type>7</Type>
         </Format>
         <CreationDate>2019-06-27T13:40:06.209Z</CreationDate>
         <Type>Finger</Type>
         <Subtype>Right IndexFinger</Subtype>
         <Level>Raw</Level>
         <Purpose>Enroll</Purpose>
         <Quality>
            <Algorithm>
               <Organization>HMAC</Organization>
               <Type>SHA-256</Type>
            </Algorithm>
            <Score>100</Score>
         </Quality>
      </BDBInfo>
      <BDB>RklSAD...</BDB>
   </BIR>
   <!-- right middle finger -->
   <BIR>
      <Version>
         <Major>1</Major>
         <Minor>1</Minor>
      </Version>
      <CBEFFVersion>
         <Major>1</Major>
         <Minor>1</Minor>
      </CBEFFVersion>
      <BIRInfo>
         <Integrity>false</Integrity>
      </BIRInfo>
      <BDBInfo>
         <Format>
            <Organization>Mosip</Organization>
            <Type>7</Type>
         </Format>
         <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
         <Type>Finger</Type>
         <Subtype>Right MiddleFinger</Subtype>
         <Level>Raw</Level>
         <Purpose>Enroll</Purpose>
         <Quality>
            <Algorithm>
               <Organization>HMAC</Organization>
               <Type>SHA-256</Type>
            </Algorithm>
            <Score>100</Score>
         </Quality>
      </BDBInfo>
      <BDB>RklSAD...</BDB>
   </BIR>
   <!-- right ring finger -->
   <BIR>
      <Version>
         <Major>1</Major>
         <Minor>1</Minor>
      </Version>
      <CBEFFVersion>
         <Major>1</Major>
         <Minor>1</Minor>
      </CBEFFVersion>
      <BIRInfo>
         <Integrity>false</Integrity>
      </BIRInfo>
      <BDBInfo>
         <Format>
            <Organization>Mosip</Organization>
            <Type>7</Type>
         </Format>
         <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
         <Type>Finger</Type>
         <Subtype>Right RingFinger</Subtype>
         <Level>Raw</Level>
         <Purpose>Enroll</Purpose>
         <Quality>
            <Algorithm>
               <Organization>HMAC</Organization>
               <Type>SHA-256</Type>
            </Algorithm>
            <Score>100</Score>
         </Quality>
      </BDBInfo>
      <BDB>RklSAD...</BDB>
   </BIR>
   <!-- right little finger -->
   <BIR>
      <Version>
         <Major>1</Major>
         <Minor>1</Minor>
      </Version>
      <CBEFFVersion>
         <Major>1</Major>
         <Minor>1</Minor>
      </CBEFFVersion>
      <BIRInfo>
         <Integrity>false</Integrity>
      </BIRInfo>
      <BDBInfo>
         <Format>
            <Organization>Mosip</Organization>
            <Type>7</Type>
         </Format>
         <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
         <Type>Finger</Type>
         <Subtype>Right LittleFinger</Subtype>
         <Level>Raw</Level>
         <Purpose>Enroll</Purpose>
         <Quality>
            <Algorithm>
               <Organization>HMAC</Organization>
               <Type>SHA-256</Type>
            </Algorithm>
            <Score>100</Score>
         </Quality>
      </BDBInfo>
      <BDB>RklSAD...</BDB>
   </BIR>
   <!-- left index finger -->
   <BIR>
      <Version>
         <Major>1</Major>
         <Minor>1</Minor>
      </Version>
      <CBEFFVersion>
         <Major>1</Major>
         <Minor>1</Minor>
      </CBEFFVersion>
      <BIRInfo>
         <Integrity>false</Integrity>
      </BIRInfo>
      <BDBInfo>
         <Format>
            <Organization>Mosip</Organization>
            <Type>7</Type>
         </Format>
         <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
         <Type>Finger</Type>
         <Subtype>Left IndexFinger</Subtype>
         <Level>Raw</Level>
         <Purpose>Enroll</Purpose>
         <Quality>
            <Algorithm>
               <Organization>HMAC</Organization>
               <Type>SHA-256</Type>
            </Algorithm>
            <Score>100</Score>
         </Quality>
      </BDBInfo>
      <BDB>RklSAD...</BDB>
   </BIR>
   <!-- left middle finger -->
   <BIR>
      <Version>
         <Major>1</Major>
         <Minor>1</Minor>
      </Version>
      <CBEFFVersion>
         <Major>1</Major>
         <Minor>1</Minor>
      </CBEFFVersion>
      <BIRInfo>
         <Integrity>false</Integrity>
      </BIRInfo>
      <BDBInfo>
         <Format>
            <Organization>Mosip</Organization>
            <Type>7</Type>
         </Format>
         <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
         <Type>Finger</Type>
         <Subtype>Left MiddleFinger</Subtype>
         <Level>Raw</Level>
         <Purpose>Enroll</Purpose>
         <Quality>
            <Algorithm>
               <Organization>HMAC</Organization>
               <Type>SHA-256</Type>
            </Algorithm>
            <Score>100</Score>
         </Quality>
      </BDBInfo>
      <BDB>RklSAD...</BDB>
   </BIR>
   <!-- left ring finger -->
   <BIR>
      <Version>
         <Major>1</Major>
         <Minor>1</Minor>
      </Version>
      <CBEFFVersion>
         <Major>1</Major>
         <Minor>1</Minor>
      </CBEFFVersion>
      <BIRInfo>
         <Integrity>false</Integrity>
      </BIRInfo>
      <BDBInfo>
         <Format>
            <Organization>Mosip</Organization>
            <Type>7</Type>
         </Format>
         <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
         <Type>Finger</Type>
         <Subtype>Left RingFinger</Subtype>
         <Level>Raw</Level>
         <Purpose>Enroll</Purpose>
         <Quality>
            <Algorithm>
               <Organization>HMAC</Organization>
               <Type>SHA-256</Type>
            </Algorithm>
            <Score>100</Score>
         </Quality>
      </BDBInfo>
      <BDB>RklSAD...</BDB>
   </BIR>
   <!-- left little finger -->
   <BIR>
      <Version>
         <Major>1</Major>
         <Minor>1</Minor>
      </Version>
      <CBEFFVersion>
         <Major>1</Major>
         <Minor>1</Minor>
      </CBEFFVersion>
      <BIRInfo>
         <Integrity>false</Integrity>
      </BIRInfo>
      <BDBInfo>
         <Format>
            <Organization>Mosip</Organization>
            <Type>7</Type>
         </Format>
         <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
         <Type>Finger</Type>
         <Subtype>Left LittleFinger</Subtype>
         <Level>Raw</Level>
         <Purpose>Enroll</Purpose>
         <Quality>
            <Algorithm>
               <Organization>HMAC</Organization>
               <Type>SHA-256</Type>
            </Algorithm>
            <Score>100</Score>
         </Quality>
      </BDBInfo>
      <BDB>RklSAD...</BDB>
   </BIR>
   <!-- right thumb finger -->
   <BIR>
      <Version>
         <Major>1</Major>
         <Minor>1</Minor>
      </Version>
      <CBEFFVersion>
         <Major>1</Major>
         <Minor>1</Minor>
      </CBEFFVersion>
      <BIRInfo>
         <Integrity>false</Integrity>
      </BIRInfo>
      <BDBInfo>
         <Format>
            <Organization>Mosip</Organization>
            <Type>7</Type>
         </Format>
         <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
         <Type>Finger</Type>
         <Subtype>Right Thumb</Subtype>
         <Level>Raw</Level>
         <Purpose>Enroll</Purpose>
         <Quality>
            <Algorithm>
               <Organization>HMAC</Organization>
               <Type>SHA-256</Type>
            </Algorithm>
            <Score>100</Score>
         </Quality>
      </BDBInfo>
      <BDB>RklSAD...</BDB>
   </BIR>
   <!-- left thumb finger -->
   <BIR>
      <Version>
         <Major>1</Major>
         <Minor>1</Minor>
      </Version>
      <CBEFFVersion>
         <Major>1</Major>
         <Minor>1</Minor>
      </CBEFFVersion>
      <BIRInfo>
         <Integrity>false</Integrity>
      </BIRInfo>
      <BDBInfo>
         <Format>
            <Organization>Mosip</Organization>
            <Type>7</Type>
         </Format>
         <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
         <Type>Finger</Type>
         <Subtype>Left Thumb</Subtype>
         <Level>Raw</Level>
         <Purpose>Enroll</Purpose>
         <Quality>
            <Algorithm>
               <Organization>HMAC</Organization>
               <Type>SHA-256</Type>
            </Algorithm>
            <Score>100</Score>
         </Quality>
      </BDBInfo>
      <BDB>RklSAD...</BDB>
   </BIR>
   <!-- face -->
   <BIR>
      <Version>
         <Major>1</Major>
         <Minor>1</Minor>
      </Version>
      <CBEFFVersion>
         <Major>1</Major>
         <Minor>1</Minor>
      </CBEFFVersion>
      <BIRInfo>
         <Integrity>false</Integrity>
      </BIRInfo>
      <BDBInfo>
         <Format>
            <Organization>Mosip</Organization>
            <Type>8</Type>
         </Format>
         <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
         <Type>Face</Type>
         <Level>Raw</Level>
         <Purpose>Enroll</Purpose>
         <Quality>
            <Algorithm>
               <Organization>HMAC</Organization>
               <Type>SHA-256</Type>
            </Algorithm>
            <Score>100</Score>
         </Quality>
      </BDBInfo>
      <BDB>RklSAD...</BDB>
   </BIR>
   <!-- right iris -->
   <BIR>
      <Version>
         <Major>1</Major>
         <Minor>1</Minor>
      </Version>
      <CBEFFVersion>
         <Major>1</Major>
         <Minor>1</Minor>
      </CBEFFVersion>
      <BIRInfo>
         <Integrity>false</Integrity>
      </BIRInfo>
      <BDBInfo>
         <Format>
            <Organization>Mosip</Organization>
            <Type>9</Type>
         </Format>
         <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
         <Type>Iris</Type>
         <Subtype>Right</Subtype>
         <Level>Raw</Level>
         <Purpose>Enroll</Purpose>
         <Quality>
            <Algorithm>
               <Organization>HMAC</Organization>
               <Type>SHA-256</Type>
            </Algorithm>
            <Score>100</Score>
         </Quality>
      </BDBInfo>
      <BDB>RklSAD...</BDB>
   </BIR>
   <!-- left iris -->
   <BIR>
      <Version>
         <Major>1</Major>
         <Minor>1</Minor>
      </Version>
      <CBEFFVersion>
         <Major>1</Major>
         <Minor>1</Minor>
      </CBEFFVersion>
      <BIRInfo>
         <Integrity>false</Integrity>
      </BIRInfo>
      <BDBInfo>
         <Format>
            <Organization>Mosip</Organization>
            <Type>9</Type>
         </Format>
         <CreationDate>2019-06-27T13:40:06.211Z</CreationDate>
         <Type>Iris</Type>
         <Subtype>Left</Subtype>
         <Level>Raw</Level>
         <Purpose>Enroll</Purpose>
         <Quality>
            <Algorithm>
               <Organization>HMAC</Organization>
               <Type>SHA-256</Type>
            </Algorithm>
            <Score>100</Score>
         </Quality>
      </BDBInfo>
      <BDB>RklSAD...</BDB>
   </BIR>
</BIR>
```
