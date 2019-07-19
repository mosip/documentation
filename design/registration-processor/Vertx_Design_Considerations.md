
# Vertx Best Practices

**Background**

Eclipse Vert.x is event driven and non blocking. This means apps can handle a lot of concurrency using a small number of kernel threads. Vert.x lets your app scale with minimal hardware. This document gentle introduction of the best practises to be fallowed in case if support team need to add/update any vertx stages.

The target users are -
Application support team

**Below are the various aspects considered while implementing Vertx*

The key solution considerations are -
1.	Event Loop Instances
	Vertx is single threaded event loop which delivers events to all handlers as they arrive. Vertx instance maintains several event loops, number of event loop depends on the number of cores available.
	
2.	Running blocking code
	There could be scenerio where single threaded event loop could be blocked in which case stages will grind to a complete halt!
	
	If you have a single event loop, and you want to handle 10000 http requests per second, then it’s clear that each request can’t take more than 0.1 ms to process, so you can’t block for any more time than that.
	
	The best way to handle blocking code which could be opertations like long lived database operation and waiting for a result, complex calculations which take significant amount of time etc. is allow this code to execute in another thread. Vertx provides API to handle such blocking code which can be done by using executeBlocking as shown below:
	
```java
vertx.executeBlocking(future -> {
  //Call some blocking API that takes a significant amount of time to return
  	String result = someAPI.blockingMethod("hello");
  	future.complete(result);
}, res -> {
  	System.out.println("The result is: " + res.result());
});
```

4. The Event Bus
The event bus is the nervous system of Vert.x. There is a single event bus instance for every Vert.x instance and it is obtained using the method eventBus.
The event bus supports publish/subscribe, point-to-point, and request-response messaging.

Publish / subscribe messaging:
Messages are published to an address. Publishing means delivering the message to all handlers that are registered at that address.

Point-to-point and Request-Response messaging:
Messages are sent to an address. Vert.x will then route them to just one of the handlers registered at that address.
If there is more than one handler registered at the address, one will be chosen using a non-strict round-robin algorithm.

Currently in MOSIP Point-to-point messaing is used in which case message will be send to consume in non-strict round-robin algorithm.

Send Failures:
Message sends can fail for other reasons, including there are no handlers available to send the message to. In this case the reply handler is sending message about non availability of handler. Alert message will be send in this case notifying support team about this issue.

4. Threading

5. 	Scheduler
In MOSIP there are various requirement where Vertx need to perform an action after a delay, or periodically.In standard verticles you can’t just make the thread sleep to introduce a delay, as that will block the event loop thread.

	1. One-shot Timers:
		A one shot timer calls an event handler after a certain delay, expressed in milliseconds. In MOSIP there is requirement to do some action at some period of time (Retry scenerio) which is done as below:

		```java
		long timerID = vertx.setTimer(1000, id -> {
		  System.out.println("And one second later this is printed");
		});

		System.out.println("First this is printed");
		```
	2. Time scheduling using RxHelper:
RxHelper is a popular library for composing asynchronous and event based programs using observable sequences for the Java VM.
It is very basic scheduler which which work on the time deplay provided. 

	3. Time scheduling using Chime:
		Chime scheduling is similar to cron-style which provides:
		- scheduling with cron-style, interval, union or custom timers:
		- at a certain time of day (to the second)
		- on certain days of the week, month or year
		- with a given time interval
		- with nearly any combination of all of above
		- repeating a given number of times
		- repeating until a given time / date
		- repeating infinite

6.  Deployment