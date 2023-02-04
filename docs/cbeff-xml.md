# CBEFF

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
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<BIR xmlns="http://standards.iso.org/iso-iec/19785/-3/ed-2/">
    <BIRInfo>
        <Integrity>false</Integrity>
    </BIRInfo>
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
            <Index>98293c98-7b64-4f9a-a209-9cadfd8e4a1e</Index>
            <Format>
                <Organization>Mosip</Organization>
                <Type>7</Type>
            </Format>
            <CreationDate>2022-07-27T15:29:22.987808900Z</CreationDate>
            <Type>Finger</Type>
            <Subtype>Left RingFinger</Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>94</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSADAyMA\.....</BDB>
        <SB>ZXlKNE5XTWlP.....</SB>
        <others>
            <entry key="SPEC_VERSION">0.9.5</entry>
            <entry key="RETRIES">1</entry>
            <entry key="FORCE_CAPTURED">false</entry>
            <entry key="EXCEPTION">false</entry>
            <entry key="PAYLOAD">{"digitalId":"eyJ4NWMiOlsiTUlJR.....</entry>
            <entry key="SDK_SCORE">0.0</entry>
        </others>
    </BIR>
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
            <Index>511e3f9c-e6f4-46b3-bc6d-193a01c6ad67</Index>
            <Format>
                <Organization>Mosip</Organization>
                <Type>7</Type>
            </Format>
            <CreationDate>2022-07-27T15:29:22.987808900Z</CreationDate>
            <Type>Finger</Type>
            <Subtype>Left LittleFinger</Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>94</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSADAyMA\.....</BDB>
        <SB>ZXlKNE5XTWlP.....</SB>
        <others>
            <entry key="SPEC_VERSION">0.9.5</entry>
            <entry key="RETRIES">1</entry>
            <entry key="FORCE_CAPTURED">false</entry>
            <entry key="EXCEPTION">false</entry>
            <entry key="PAYLOAD">{"digitalId":"eyJ4NWMiOlsiTUlJ.....</entry>
            <entry key="SDK_SCORE">0.0</entry>
        </others>
    </BIR>
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
            <Index>f9c11267-9018-44c2-a4d7-5bb1f1cf2555</Index>
            <Format>
                <Organization>Mosip</Organization>
                <Type>8</Type>
            </Format>
            <CreationDate>2022-07-27T15:29:22.988805100Z</CreationDate>
            <Type>Face</Type>
            <Subtype></Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>94</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSADAyMA\.....</BDB>
        <SB>ZXlKNE5XTWlP.....</SB>
        <others>
            <entry key="SPEC_VERSION">0.9.5</entry>
            <entry key="RETRIES">1</entry>
            <entry key="FORCE_CAPTURED">false</entry>
            <entry key="EXCEPTION">false</entry>
            <entry key="PAYLOAD">{"digitalId":"eyJ4NWMiOlsiTUlJR.....</entry>
            <entry key="SDK_SCORE">0.0</entry>
        </others>
    </BIR>
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
            <Index>5d7669c1-1f7d-4810-9cd5-5521a38be151</Index>
            <Format>
                <Organization>Mosip</Organization>
                <Type>7</Type>
            </Format>
            <CreationDate>2022-07-27T15:29:22.988805100Z</CreationDate>
            <Type>Finger</Type>
            <Subtype>Right RingFinger</Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>94</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSADAyMA\.....</BDB>
        <SB>ZXlKNE5XTWlP.....</SB>
        <others>
            <entry key="SPEC_VERSION">0.9.5</entry>
            <entry key="RETRIES">1</entry>
            <entry key="FORCE_CAPTURED">false</entry>
            <entry key="EXCEPTION">false</entry>
            <entry key="PAYLOAD">{"digitalId":"eyJ4NWMiOlsiTUlJR.....</entry>
            <entry key="SDK_SCORE">0.0</entry>
        </others>
    </BIR>
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
            <Index>db6f289e-fb86-4c0d-818e-2fa709660caf</Index>
            <Format>
                <Organization>Mosip</Organization>
                <Type>9</Type>
            </Format>
            <CreationDate>2022-07-27T15:29:22.988805100Z</CreationDate>
            <Type>Iris</Type>
            <Subtype>Left</Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>94</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSADAyMA\.....</BDB>
        <SB>ZXlKNE5XTWlP.....</SB>
        <others>
            <entry key="SPEC_VERSION">0.9.5</entry>
            <entry key="RETRIES">1</entry>
            <entry key="FORCE_CAPTURED">false</entry>
            <entry key="EXCEPTION">false</entry>
            <entry key="PAYLOAD">{"digitalId":"eyJ4NWMiOlsiTUlJRjlqQ.....</entry>
            <entry key="SDK_SCORE">0.0</entry>
        </others>
    </BIR>
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
            <Index>a60f8367-0818-40de-b935-405bc6d0f810</Index>
            <Format>
                <Organization>Mosip</Organization>
                <Type>7</Type>
            </Format>
            <CreationDate>2022-07-27T15:29:22.988805100Z</CreationDate>
            <Type>Finger</Type>
            <Subtype>Left IndexFinger</Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>94</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSADAyMA\.....</BDB>
        <SB>ZXlKNE5XTWlP.....</SB>
        <others>
            <entry key="SPEC_VERSION">0.9.5</entry>
            <entry key="RETRIES">1</entry>
            <entry key="FORCE_CAPTURED">false</entry>
            <entry key="EXCEPTION">false</entry>
            <entry key="PAYLOAD">{"digitalId":"eyJ4NWMiOlsiTUlJR\.....</entry>
            <entry key="SDK_SCORE">0.0</entry>
        </others>
    </BIR>
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
            <Index>b1dd9bef-0e19-42e3-b0ba-0ded02ef429b</Index>
            <Format>
                <Organization>Mosip</Organization>
                <Type>7</Type>
            </Format>
            <CreationDate>2022-07-27T15:29:22.988805100Z</CreationDate>
            <Type>Finger</Type>
            <Subtype>Right IndexFinger</Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>94</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSADAyMA\.....</BDB>
        <SB>ZXlKNE5XTWlP.....</SB>
        <others>
            <entry key="SPEC_VERSION">0.9.5</entry>
            <entry key="RETRIES">1</entry>
            <entry key="FORCE_CAPTURED">false</entry>
            <entry key="EXCEPTION">false</entry>
            <entry key="PAYLOAD">{"digitalId":"eyJ4NWMiOlsiTUlJR.....</entry>
            <entry key="SDK_SCORE">0.0</entry>
        </others>
    </BIR>
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
            <Index>ee0508b6-f42b-4a88-887b-10d71bc10ea0</Index>
            <Format>
                <Organization>Mosip</Organization>
                <Type>7</Type>
            </Format>
            <CreationDate>2022-07-27T15:29:22.988805100Z</CreationDate>
            <Type>Finger</Type>
            <Subtype>Right LittleFinger</Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>94</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSADAyMA\.....</BDB>
        <SB>ZXlKNE5XTWlP.....</SB>
        <others>
            <entry key="SPEC_VERSION">0.9.5</entry>
            <entry key="RETRIES">1</entry>
            <entry key="FORCE_CAPTURED">false</entry>
            <entry key="EXCEPTION">false</entry>
            <entry key="PAYLOAD">{"digitalId":"eyJ4NWMiOlsiTUlJR.....</entry>
            <entry key="SDK_SCORE">0.0</entry>
        </others>
    </BIR>
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
            <Index>614fb188-81c1-4190-af52-050a54fc31b5</Index>
            <Format>
                <Organization>Mosip</Organization>
                <Type>9</Type>
            </Format>
            <CreationDate>2022-07-27T15:29:22.988805100Z</CreationDate>
            <Type>Iris</Type>
            <Subtype>Right</Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>94</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSADAyMA\.....</BDB>
        <SB>ZXlKNE5XTWlP.....</SB>
        <others>
            <entry key="SPEC_VERSION">0.9.5</entry>
            <entry key="RETRIES">1</entry>
            <entry key="FORCE_CAPTURED">false</entry>
            <entry key="EXCEPTION">false</entry>
            <entry key="PAYLOAD">{"digitalId":"eyJ4NWMiOlsiTUlJR.....</entry>
            <entry key="SDK_SCORE">0.0</entry>
        </others>
    </BIR>
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
            <Index>971a3c27-aa02-4041-b8d8-52b402d30cd9</Index>
            <Format>
                <Organization>Mosip</Organization>
                <Type>8</Type>
            </Format>
            <CreationDate>2022-07-27T15:29:22.988805100Z</CreationDate>
            <Type>ExceptionPhoto</Type>
            <Subtype></Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>94</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSADAyMA\.....</BDB>
        <SB>ZXlKNE5XTWlP.....</SB>
        <others>
            <entry key="SPEC_VERSION">0.9.5</entry>
            <entry key="RETRIES">1</entry>
            <entry key="FORCE_CAPTURED">false</entry>
            <entry key="EXCEPTION">false</entry>
            <entry key="PAYLOAD">{"digitalId":"eyJ4NWMiOlsiTUlJR.....</entry>
            <entry key="SDK_SCORE">0.0</entry>
        </others>
    </BIR>
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
            <Index>7ad51076-4d10-4f83-92a4-3954e6797355</Index>
            <Format>
                <Organization>Mosip</Organization>
                <Type>7</Type>
            </Format>
            <CreationDate>2022-07-27T15:29:22.988805100Z</CreationDate>
            <Type>Finger</Type>
            <Subtype>Right MiddleFinger</Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>94</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSADAyMA\.....</BDB>
        <SB>ZXlKNE5XTWlP.....</SB>
        <others>
            <entry key="SPEC_VERSION">0.9.5</entry>
            <entry key="RETRIES">1</entry>
            <entry key="FORCE_CAPTURED">false</entry>
            <entry key="EXCEPTION">false</entry>
            <entry key="PAYLOAD">{"digitalId":"eyJ4NWMiOlsiTUlJR.....</entry>
            <entry key="SDK_SCORE">0.0</entry>
        </others>
    </BIR>
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
            <Index>b055cbde-925b-47b3-bab6-070a57c1a916</Index>
            <Format>
                <Organization>Mosip</Organization>
                <Type>7</Type>
            </Format>
            <CreationDate>2022-07-27T15:29:22.988805100Z</CreationDate>
            <Type>Finger</Type>
            <Subtype>Left MiddleFinger</Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>94</Score>
            </Quality>
        </BDBInfo>
        <BDB>RklSADAyMA\.....</BDB>
        <SB>ZXlKNE5XTWlP.....</SB>
        <others>
            <entry key="SPEC_VERSION">0.9.5</entry>
            <entry key="RETRIES">1</entry>
            <entry key="FORCE_CAPTURED">false</entry>
            <entry key="EXCEPTION">false</entry>
            <entry key="PAYLOAD">{"digitalId":"eyJ4NWMiOlsiTUlJR.....</entry>
            <entry key="SDK_SCORE">0.0</entry>
        </others>
    </BIR>
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
            <Index>02c43091-fe1e-4b6f-acae-e2cb59c1ed9b</Index>
            <Format>
                <Organization>Mosip</Organization>
                <Type>7</Type>
            </Format>
            <CreationDate>2022-07-27T15:29:22.988805100Z</CreationDate>
            <Type>Finger</Type>
            <Subtype>Right Thumb</Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>0</Score>
            </Quality>
        </BDBInfo>
        <SB></SB>
        <others>
            <entry key="SPEC_VERSION"></entry>
            <entry key="RETRIES">0</entry>
            <entry key="FORCE_CAPTURED">false</entry>
            <entry key="EXCEPTION">true</entry>
            <entry key="PAYLOAD"></entry>
            <entry key="SDK_SCORE">0.0</entry>
        </others>
    </BIR>
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
            <Index>5b6e49c6-3a18-4ced-a931-d905860343fd</Index>
            <Format>
                <Organization>Mosip</Organization>
                <Type>7</Type>
            </Format>
            <CreationDate>2022-07-27T15:29:22.988805100Z</CreationDate>
            <Type>Finger</Type>
            <Subtype>Left Thumb</Subtype>
            <Level>Raw</Level>
            <Purpose>Enroll</Purpose>
            <Quality>
                <Algorithm>
                    <Organization>HMAC</Organization>
                    <Type>SHA-256</Type>
                </Algorithm>
                <Score>0</Score>
            </Quality>
        </BDBInfo>
        <SB></SB>
        <others>
            <entry key="SPEC_VERSION"></entry>
            <entry key="RETRIES">0</entry>
            <entry key="FORCE_CAPTURED">false</entry>
            <entry key="EXCEPTION">true</entry>
            <entry key="PAYLOAD"></entry>
            <entry key="SDK_SCORE">0.0</entry>
        </others>
    </BIR>
</BIR>
```
