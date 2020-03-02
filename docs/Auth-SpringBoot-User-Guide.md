# Guidelines

This document lists out the instructions on how to use the [AuthAdapter](Auth-Adapter) in a Spring Boot application.

* Step 1: [Inject required libraries](#Inject-required-libraries)
* Step 2: [Attach annotations to authorize endpoints](#Attach-annotations-to-authorize-endpoints)
* Step 3: [Use restTemplate for Http calls](#Use-restTemplate-for-Http-calls)

## Inject required libraries

* Add the [AuthAdapter](Auth-Adapter) module to your project as a maven dependency

```xml
<dependency>
    <groupId>io.mosip.kernel</groupId>
    <artifactId>kernel-auth-adapter</artifactId>
    <version>Kernel Parent Version</version>
</dependency>
```

* Add ComponentScan annotation as shown below to your project. This is to create auth adapter bean.

```java
@SpringBootApplication
@ComponentScan(basePackages = "io.mosip.*")
```

## Attach annotations to authorize endpoints

To restrict access to your endpoints, you need to add the **@PreAuthorize** annotation.
Look at the below example for reference.

```java
@PreAuthorize("hasAnyRole('DIVISION_ADMIN', 'SUPERVISOR', 'AGENT')")
@RequestMapping(value = "/api/reference", method = RequestMethod.GET)
```

There are few more methods available apart from hasAnyRole like hasRole. Look in to the [@PreAuthorize](//docs.spring.io/spring-security/site/docs/3.0.x/reference/el-access.html) documentation for more details.

**Note:** Now we support only hasRole and hasAnyRole methods.

## Use restTemplate for Http calls

To make any kind of HTTP or HTTPS calls to a mosip's micro service that also injected the [AuthAdapter](Auth-Adapter), use the standard RestTemplate capabilities as shown below.

* Intially autowire the RestTemplate in the class where you are going to make an API call.

```java
@Autowired
private RestTemplate restTemplate;
```

* Now make the call using the autowired restTemplate as shown in the sample below:

```java
final String uri = "http://localhost:3001/api/location";
LocationDao response = restTemplate.getForObject(uri, LocationDao.class);
```

**Note:** Do not create a new instance of the RestTemplate instead use the autowired one.