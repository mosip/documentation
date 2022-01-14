# Websub

## Overview
WebSub provides a common mechanism for communication between publishers of any kind of Web content and their subscribers, based on HTTP web hooks. Subscription requests are relayed through hubs, which validate and verify the request. Hubs then distribute new and updated content to subscribers when it becomes available. WebSub was previously known as PubSubHubbub. See [W3C Websub](https://www.w3.org/TR/websub/).

In MOSIP [Kafka](https://kafka.apache.org/) message broker has been used to implement the Websub APIs. Message brokers are a natural fit for the implementation of Websub hubs as they serve a similar purpose.

## Websub in MOSIP

MOSIP shares data across services and partners using Websub. MOSIP implements W3C Websub standard.

![](_images/websub.md)

Refer [Websub repo](https://github.com/mosip/websub/tree/1.2.0-rc2) for further details.








