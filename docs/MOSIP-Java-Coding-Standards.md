# MOSIP Java Coding Standards

## MOSIP - Java Development Coding Standard

### Repository Structure

In MOSIP, the source code modules are categorized under different repositories:

* Commons - This contains common reusable library modules and service modules
  * Kernel - The collection of common reusable library modules and services
  * ID-Repo - The ID Repository services used by many of the MOSIP modules
* Feature Specific Modules (for example)
  * registration
  * registration-processor
  * pre-registration
  * id-authentication

If a new source code module is planned to be added, and if it is a reusable library / service on which other modules will be depending on, then it should be added under Commons, otherwise, it can be created as a separate repository.

### Source Code Organization in a MOSIP Repository

Source code of any feature in MOSIP will be organized as below:

* feature-parent
* feature-core - jar
* feature-common - jar
* feature-service-1 - SpringBoot service
* feature-service-2 - SpringBoot service

#### Feature-Parent Module

This should be a POM module that aggregates all the sub-modules. This should contain,

* List of all sub-modules
* Common properties such as versions used by all sub-modules
* Common dependencies used by all of the sub-modules
* Common maven-plugins used by all sub modules

#### Feature-Core Java Library Module

There should be a JAR module that defines core source code files such as,

* APIs (Application Programming Interfaces)
* SPIs (Service Provider Interfaces)
* Common Utility classes
* Helper classes
* DTO classes
* Custom Exception classes

#### Common Implementation Module

* There can be a JAR module that provides abstract base implementations or common implementations of the APIs and SPIs. Other modules such as service module will be depending on this module using the API/SPI implementations or extending their base implementations.
* Any Service implementation class should have 'Impl' suffix.

#### Spring Boot Service Modules

* A feature can have one or more Spring Boot Service modules, each will have one or more related services.
* Each Spring Boot Service Modules will be deployed as a separate deployment unit such as a docker container. So each will contain the separate `Dockerfile` containing the docker build instructions for that module.
* Each Spring Boot Service Modules should be configured with Swagger configuration (except specific cases where) for easy understanding of the feature, easy unit-testing and verification for the developers.
* No Spring Boot Service module should be used as a dependency to any other module. Any such code dependency should be going inside the Common Implementation module.

### Classes/Interfaces in MOSIP

* In MOSIP following naming of Class/Interfaces their names should be of Camel cases, without any underscore.
* They should have following suffixes in their names and they should be under appropriate package name based on their category,
  * Xyz**Service** - For a Service interface. A service class **should not** be annotated with `@Service`. This will be in the core-module. This will be under `*.spi.xyz.service` package.
  * Xyz**ServiceImpl** - For a Spring Service implementation class. This class should be annotated with `@Service`. This should not be defined in a core-module. It will be defined in a `common` or `service` module. This will be under `*.spi.xyz.service.impl` package.
  * Xyz**RequestDto** - For a Request Data Transfer class in a Service. This will be in the core-module. This will be under `*.xyz.dto` package.
  * Xyz**ResponseDto** - For a Response Data Transfer class in a Service. This will be in the core-module. This will be under `*.xyz.dto` package.
  * Xyz**Entity** or Xyz**Dao**- For an Entity/ Data Access class, which will use JPA annotations for the entity. This will be in the core-module. This will be under or `*.xyz.entity` or `*.xyz.dao` package.
  * Xyz**Repository** - For a JPA Repository interface, which will be extending the base MOSIP Repository interface `io.mosip.kernel.core.dataaccess.spi.repository.BaseRepository`. This will be annotated with @Repository annotation. This will be under `*.xyz.repository` package.
  * Xyz**Controller** - For a Spring Controller class, which will be annotated with @Controller annotation. This will be under `*.xyz.controller` package.
  * Xyz**Configuration** - For a Spring configuration, which will be annotated with @Configuration. This will be under `*.xyz.config` package.
  * Xyz**Util** or Xyz**Utils** - For a utility class. This will expose public static utility methods. This will be under `*.xyz.util` package.
  * Xyz**Helper** - For a helper class. This will be a Spring Component class annotated with @Component. This will expose public instance helper methods. This will be under `*.xyz.helper` package.
  * Xyz**Manager** - For any management class. Also for any class that will connect external module using REST service calls. This will be a Spring Component class annotated with @Component.
  * Xyz**Constants** - For file storing constants. Please prefer to have a Constants file to define common and related constants used across the classes in a feature. This can be inside the core-module or common-module. This will be under `*.xyz.constant` package.
  * Xyz**Exception** - For a custom exception, which will be extending `io.mosip.kernel.core.exception.BaseCheckedException` and `io.mosip.kernel.core.exception.BaseUncheckedException`. This will be defined in a core-module. This will be under `*.xyz.exception` package.
  * Xyz**ExceptionHandler** - For the centralized exception handler class in a service-module, annotated with `@ControllerAdvice` or `@RestControllerAdvice` annotation. This will be under `*.xyz.exception` package.
  * Xyz**Factory** - For any class/interface defining Factory design pattern. This will be under `*.xyz.factory` package.
  * Xyz**builder** - For any class/interface defining Builder design pattern. This will be under `*.xyz.builder` package.
  * Xyz**Facade** - For any class/interface defining Facade design pattern.
  * Xyz**Impl** - For any implementation class that extends an API/SPI interface.
* A service implementation should be always with a combination of Service Interface and its Spring Service Implementation Class. It should not be without a Service Interface defined in core-module.
* Any Spring Component will be annotated with `@Component`. A component may or may not be implementing an interface.
* Any dependency injection of a Spring Service should only to be assigned to a variable of its Service Interface type but not to its Implementation class type.
* For dependency injection of a Spring Component should be assigned to a variable its Interface type if any, otherwise to the class type.

### Using Lombok for Data classes

* All data classes such as DTOs, Entity classes use Lombok annotations to automatically create appropriate constructors, getters and setters.
* Make sure to setup the IDE used for the development for using Lombok.

### MOSIP JPA Repository

* Any JPA repository created in MOSIP should be extending the base MOSIP Repository interface `io.mosip.kernel.core.dataaccess.spi.repository.BaseRepository`.
* Appropriate database configurations properties should be added to the app configuration file.

### Commons/Kernel - MOSIP Common Libraries/Services

* MOSIP has many common libraries and services implemented under Commons/Kernel repository.
* Kernel-Core module contains may common utility classes such as Loggers, DateUtils, StringUtils and Crypto-Core etc… Also many utility services such as Kernel-KeyManager, Kernel-CryptoService, Kernel-Audit-Service, Kernel-Auth-Service, etc... .
* If any common utility needs to be implemented, first check Commons/Kernel if such utility is already present and make sure it is not already implemented in Commons/Kernel. It is always welcomed to contribute any new features/ bug fixes for the existing utilities, instead of creating a new utility.

### REST Services Request and Response:

* Any request and response content in a service in MOSIP should be of application/json content type.
* Any byte arrays to be returned in response should be Base-64-URL encoded within the response.
* If any sensitive information is getting transferred in the request/response, the request/response block should be encrypted using the `MOSIP public key`.
* Any service in MOSIP should never return error code other than 200. One or more errors to be reported in the response be returned as an array as part of `"errors"` attribute.
* Each of the `"error"` attribute should under `"errors"` should have `"errorCode"`, `"errorMessage`" and an optional `"actionMessage"`. \* For any service, possible `"errorCode"`, `"errorMessage"` and the optional `"actionMessage"` should be properly listed documented in its API specification.
* Any request/response body should have proper meta-data such as `"id`, `"version"` and `"requestTime"`/`"responseTime"`, etc... .

For example:

```java
{
  //API Metadata
  "id": "mosip.identity.auth.transactions.read",
  "version": "v1",
  "responseTime": "2019-02-15T07:23:19.590+05:30",
  "errors": [
    {
      "errorCode": "IDA-MLC-002",
      "errorMessage": "Invalid UIN",
      "actionMessage": "Please retry with the correct UIN"
    }
  ]
}
```

## Java Coding Standard

### Number of lines

The number of lines in the Java files is restricted to 2000 lines. Beyond 2000 lines, the java file is refactored into multiple files.

### Class and Interface

Each java file contains one public class or interface.

When some private classes and interfaces are associated, this can be in the same file.

Declare the public class and interface as the first declaration in the file.

### Ordering

When a java file is written, the following order is maintained,

#### Beginning documentation comment

The beginning comment should be in a C-style comment. Following is the format of the comment.

```
/*  
 * Firstname Lastname
 *           
 * Copyright notice
 */   
```

#### Package statement

The first non-comment line is the package statement.

#### Import statement

* After a line-break below the package statement, import statements are placed. The import statements are grouped and segregated by a line-break. For example,

```
import java.util.List;
import java.util.Map;
import java.time.zone.ZoneRulesException;
import org.mosip.kernel.core.authn.LoginInfo;
import org.mosip.kernel.core.exception.InvalidInputException;
import org.mosip.kernel.core.exception.UnauthenticatedException;
```

* Do not use asterisk symbol while importing packages.

#### Class or Interface comment for documentation

This comment will be going in to the Javadocs

```java
/**
 * Class/Interface description goes here
 *
 * @version 2.4 05 July 2018
 * @author Rajkumar Mahanty
 *
 */
```

#### Public class or interface definition

* Then the public class or interface is defined.

#### Other related private class or Interface definition

* Then other private class or interface are followed.

### Inside a class or interface

Following is the order of elements inside the class declaration

#### Constant fields

Constant fields (static and final fields) should be on the top inside a Class

#### Non-final static fields

Then any non-final static fields are followed

#### Instance variables

The public class variables are followed by the protected and the private variables. These can be final or non-final fields.

**Initializing Fields in a class**

* Do not initialize non-primitive fields with null in a Class;
* Always initialize non-static fields from constructors in a Class.
* Avoid using static non-final fields in a class. If it required for any specific reason, avoid initializing it in a constructor or a post-construct method.
* Avoid using static initializers to initialize static final/non-final fields, instead create private static methods and call it for initializing static fields.

#### Constructors

The constructor declarations ordered by the number of parameters.

#### Method declarations

The methods are ordered by the functionality. The methods need not to be in the order of scope or accessibility.

## Indentation

The indentation unit it TAB.

### Line length

The number of characters in a line should not exceed 80 characters

### Wrapping lines

When the number of characters exceed the limit, the line should be broken into multiple lines. The following standard is used during the line breaks,

* Break the line after the comma
* Break before the operator
* From higher-level breaks go to the lower-level breaks.
* Align the new line with the beginning of the expression at the same level on the previous line.

## Comments

There are two types of comments in Java.

1. Implementation comments
2. Documentation comments

Both the comment types are used in the source code of MOSIP.

### Implementation Comment

* This is the comment type used for better understanding of the code. Most of the times, the source code will be maintained by different people. The programmer writes these comments so that the other programmers will come to know the functionality of the code in plain English language. Following lines are used.
* Java source code can have their implementation comments in various parts of code blocks/lines with appropriate description about what the code block or line is doing.
* Specifically the `if-else if-else` conditions can have their descriptions about their various conditional expressions.
* Any complex piece of code such as a regular expression / mathematical expression can be described with appropriate descriptions about it.

#### Block Comments

When the developer needs to explain in detail about some functionality, block comments are used. Block comments are used anywhere in the code. It can be for the class or interface declarations or it can be within the java methods also. Example of block comments:

```java
/*
 * This is the block comment. This is the block comment.
 * This is the block comment. This is the block comment. This is                
 * block comment.
 */
```

#### Single-Line Comments

Single line comments are used for short description. For example,

```java
/* This is short description */
if( height > 45) {
    ...
}
```

#### Trailing Comments

Trailing comments are given in the same line where the source code resides. For example,

```java
if(height > 45) { /* This is the trailing comment */
    ...

}
```

#### End-Of-Line comments

The end-of-line comments are also used in the source file. For example,

```java
if(width > 45) {
    return false; // some description
}
```

### Documentation comments

* Documentation comments are used to generate the javadoc files.
* Every source code file in Java should have proper Java Documentation such as description, Author and Version.
* All Classes, Interfaces, Methods, Fields should have appropriate clear description about each.
* A method documentation should have description about all parameters, exceptions thrown and return value.
* Documentation comments can be of two kinds:
  * Single line documentation comment: `/** COMMENT */`
  *   Multi-line documentation comment:

      ```java
      /** 
       * COMMENT 
       */
      ```

Example:

```java
/*
 * Copyright 2002-2018 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.mosip.orm;
import org.mosip.dao.SomeDAO;
import org.mosip.exception.SMSException;

/**
 * This class does the so and so activity. And more description goes here. And
 * more description goes here. And more description goes here. And more
 * description goes here. And more description goes here.
 *
 * @author SadanandGowda
 * @since v1.0
 */

public class SampleReference extends SomeSuperClass {
   /**
    * someClass is used for so and so purpose
    */

    @Nullable
    private final Object someClass;
   /**
    * someIdentifier is used to identify something
    */

    @Nullable
    private final Object someidentifier;

   /**
    * Create some functionality with the with the given message, unless so and so
    * functionality.
    *
    * @param msg
    *     the display message
    * @param cause
    *     the source exception
    */

    public SampleReference(String message, Throwable cause) {
        super (message, cause);
        this.someClass = null ;
        this.someidentifier = null ;
    }

   /**
    * Sends the SMS to the given phone number
    *
    * @param someClass
    *     this is for this purpose
    * @param mobileNumber
    *     the mobile number to which the SMS have to be sent
    * @param msg
    *     the message sent to the phone number
    * @return
    */

    public String sendSMS(Class<?> someClass, int mobileNumber, String msg) {
        // the SMS sending code comes here.
    }
}
```

## Declarations

### Number of variables per line

One variable is declared per line.

### Placement of variables

Variables are declared at the beginning of the code block. For example,

```java
void myMethod() {
    int int1 = 0;         // beginning of method block

    if (condition) {
        int int2 = 0;     // beginning of "if" block
        ...
    }
}
```

### Class and Interface Declarations

* No space between a method name and the parenthesis "(" starting its parameter list
* Open brace "{" appears at the end of the same line as the declaration statement
* Closing brace "}" starts a line by itself indented to match its corresponding opening statement,
* Except when it is a null statement the "}" should appear immediately after the "{"
* An empty line is there in between the method declarations.

```java
class Sample extends Object {
    int ivar1;
    int ivar2;

    Sample(int i, int j) {
        ivar1 = i;
        ivar2 = j;
    }

    int emptyMethod() {}

    ...
}
```

### Methods

* A method should follow the "Single Responsibility" principle that will perform only one task. If it seems to do multiple sub-tasks, each sub-tasks should be created as a new method and then be invoked in that method.
* If there is a logic even of a single line getting repeated in more than one place, it should be made as a separate method.
* A method line count should not exceed 80 lines. If required break the blocks of code in the method to separate methods.
* Methods are separated by a blank line.

#### Method Parameters

1. Never re-assign a parameter value. This may lead to unpredictable bugs.
2. Don't use too many number of parameters. Keep the maximum number of method parameters to 5 for simplicity.
3. Prefer method parameter type to be more generic such as a Super Interface or Super Class. For example, `List` instead of `ArrayList`.

#### Method Return Statement

1. Never return null for an Array return type. Return an empty array of 0 like `return new String[0]`.
2. Never return null for a Set/List/Map collection return types. Return corresponding empty values such as `Collections.emptySet()`, `Collections.emptyList()` or `Collections.emptyMap()`;
3. Prefer method return type to be more generic such as a Super Interface or Super Class. For example, `List` instead of `ArrayList`.
4.  Avoid having multiple return statements in a method. Prefer to provide a single point of exit to a method. For example:

    ```java
    //AVOID BELOW
    private int getStatus() {
    	if(condition1) {
    		return Status.SUCCESS;
    	} else if (condition2) {
    		return Status.FAILURE;
    	} else {
    		return Status.UNKNOWN;
    	}
    }

    //PREFER BELOW
    private int getStatus() {
    	int status;

    	if(condition1) {
    		status = Status.SUCCESS;
    	} else if (condition2) {
    		status = Status.FAILURE;
    	} else {
    		status = Status.UNKNOWN;
    	}

    	return status;
    }
    ```
5. Use `Optional` return type to avoid null checking. When there is possible to return `null` for a method, return `Optional.empty()`.
6. Use `OptionalInt`, `OptionalLong` return types for a method when there is an unknown value of Integer/Long to be returned like `-1`;

## Statements

### Simple Statements

Each line should contain at most one statement. Example:

```java
argv++;         // Correct
argc--;         // Correct  
argv++; argc--; // AVOID!
```

### Compound Statements

*   Compound statements are statements that contain lists of statements enclosed in braces

    ```java
    { 
    	Statement1;
    	Statement2;
    	Statement3;
    }
    ```
* The enclosed statements should be indented one more level than the compound statement.
* The opening brace should be at the end of the line that begins the compound statement; the closing brace should begin a line and be indented to the beginning of the compound statement.
*   Braces are used around all statements, even single statements, when they are part of a control structure, such as an if-else or for statement. This makes it easier to add statements without accidentally introducing bugs due to forgetting to add braces. For example:

    ```java
    //COMPOUND STATEMENT
    if(list.size() == 2) {
    	list.remove(0)
    	list.remove(0)
    } else {
    	list.add("element1");
    	list.add("element2");
    }

    //AVOID BELOW
    if(list.isEmpty()) 
    	list.add("element")
    else 
    	list.remove(0);

    //PREFERRED WAY
    if(list.isEmpty()) {
    	list.add("element")
    } else {
    	list.remove(0);
    }
    ```

### "return" Statements

*   A return statement with a value should not use parentheses unless they make the return value more obvious in some way. Example:

    ```java
    return;
    return myDisk.size();
    return (size ? size : defaultSize);
    ```
* Refer to [Method return statement](MOSIP-Java-Coding-Standards.md#method-return-statement) for more information.

### if, if-else, if-else if-else Statements

*   Always curly braces are used in the if-else statements. Even though there is a single statement below the if-else statement, curly braces is used. For example,

    ```java
    if(width > 45) {
    	return false; // some description
    }
    ```
*   If there is a Boolean value to be returned in a method or assigned to a variable based on an if-else condition, the condition itself should be returned or assigned instead of `true` or `false` for the condition. For example,

    ```java
    if(isEmpty()) return true; else return false; //AVOID

    return isEmpty(); //PREFER
    ```
* Prefer "switch" statement when possible over having multiple “if-else if-else if-else” statements.

### Conditional Expressions

* If any binary operator is used before "?" in the ternary operator, then parentheses is used.

```java
(age >= 25) ? "VALID" : "INVALID" ;
```

* Prefer if-else statement over conditional expressions if it gets complex with the condition or the statements.
* Avoid using nested conditional expressions for better readability.

### "switch" Statements

* A switch statement should have the following form:

```java
switch (condition) {
case ABC:
    statements;
    /* falls through */
case DEF:
    statements;
    break;
case XYZ:
    statements;
    break;
default:
    statements;
    break;
}
```

* Every time a case falls through (doesn't include a break statement), add a comment where the break statement would normally be. This is shown in the preceding code example with the `/* falls through */` comment.
* Every switch statement should include a `default` case. The break in the default case is redundant, but it prevents a fall-through error if later another case is added.

## White Space

### Blank Lines

Only for the following situations 2 blank lines are used,

1. Between 2 different sections of the source file
2. If you have more than one class or interface, use 2 blank lines

Only for the following situations, 1 blank line is used,

1. Between method declarations.
2. Between the variable declarations and the method code.
3. Before the block comment or line comment.
4. To provide a better readability in between logical blocks, an empty line are used, wherever applicable.

### Blank Spaces

Under the following circumstances, blank space are used,

1. When a keyword followed by parenthesis, a blank space should be given after the keyword. For example,

```java
while(age > 60)  {
    ...
}
```

1. In the argument list, the parameters are given a space after comma.

## Naming Conventions

### Package names

All the package name in MOSIP application starts with **io.mosip**. Refer to [Classes/Interfaces in MOSIP](MOSIP-Java-Coding-Standards.md#classesinterfaces-in-mosip) section for various kinds or classes and the package names under which they should be kept.

### Classes

The names given to classes are always nouns and in camel case. Refer to [Classes/Interfaces in MOSIP](MOSIP-Java-Coding-Standards.md#classesinterfaces-in-mosip) section for various kinds or classes and their names.

### Interfaces

The names given to interface is always noun and in camel case. Refer to [Classes/Interfaces in MOSIP](MOSIP-Java-Coding-Standards.md#classesinterfaces-in-mosip) section for various kinds or interfaces and their names.

### Methods

The method names are always verbs and in camel case. For example

```java
public void deleteFromCache(String cacheName, String key) {
    ...
}
```

### Variables

The variable names are short and meaningful. Any new observer can understand the meaning of the variable. No single letter variable names are used. Camel case is used when declaring variables.

### Constants

* The constants are given the name in capital letters. The words in the names are separated by underscore.
* String literals should not be used in the code directly. Declare them as constant in the class.
* Magic Numbers should not be used in code, they should be declared as constants.
* Create Xyz**Constants** class to group related and reused constants within a module/feature.

## Programming Practices

### Providing Access to Instance and Class Variables

* The instance variables should not be made public unless you have a specific reason.
* Provide the most restrictive access to the fields, methods and Inner Classes such as `private`, default or `protected`. Avoid giving `public` access to them unless it is really required. Avoid using public non-final fields in a Class.

### Referring to Class Variables and Methods

Always use the class name to call the static method. For example,

```java
LogFactory.getLogger();
```

### Constants

Numerical values should not be used in the code directly. Declare them and use it in the code. For example,

```java
int MAX_AGE = 60;
while (age > MAX_AGE) {
    ...
}
```

### Variable Assignments

* Avoid multiple assignments in the same line. For example,

```java
int a, b = 10 // AVOID
// PREFER
int a = 10;
int b = 10;
```

* Prefer primitive type variables over boxed types wherever possible. For example, prefer `int`, `boolean` and `long` over their Boxed counterparts such as `Integer`, `Boolean` and `Long`.
* Prefer variable type to be more generic such as a Super Interface or Super Class. For example, `List` instead of `ArrayList`.

## Optional

* Use `Optional` return type in a method to avoid null checking. When there is possible to return `null` for a method, return `Optional.empty()`.
* Use `OptionalInt` or `OptionalLong` return type in a method when there is an unknown value of Integer/Long to be returned like `-1`;
* Avoid getting value from `Optional` using `Optional.get()` without checking for `Optional.isPresent()` condition, otherwise use `Optional.orElse()` .
* Use primitive optional classes such as `OptionalInt` or `OptionalLong` over `Optional<Integer>` or `Optional<Long>`.

### Lambdas

#### Lambda Expressions

* Prefer Method Reference over a Lambda Expression

```java
Function<Employee, String> = employee -> employee.getName() // AVOID
Function<Employee, String> = employee::getName // PREFER
```

* Keep Lambda Expressions Short and Self-explanatory so that it is easy to understand. . Provide clear understandable name to the parameters in Lambda Expressions.
*   Always use parameter type inference. For example,

    ```java
    (employee, requesterEmployee) -> employee.name.compareTo(requesterEmployee.name) // PREFER
    (Employee employee, Employee requesterEmployee) -> {employee.name.compareTo(requesterEmployee.name)} // PREFER
    ```
*   Do not use the parenthesis for a single parameter lambda expression.

    ```java
    (employee) -> employee.getName().compareTo("ABC") // AVOID
    employee -> employee.getName().compareTo("ABC") // PREFER
    ```
* Use “Effectively Final” Variables in Lambda Expressions. It is not required to mark every target variable as final.
* Avoid mutating Object Variables in Lambda Expression.
* Avoid using the block lambdas wherever an expression lambda are used. For example:

```java
// PREFER
someVar -> someVar.toUpperCase(Constants.SOME_CONST);
// AVOID
someVar -> {
**return** someVar.toUpperCase(Constants.SOME_CONST);
}
```

### Functional Interfaces

* Prefer Standard Functional Interfaces over creating a similar one unless it is really required. Use Standard Functional interfaces, which are gathered in the `java.util.function` package, satisfy most developers' needs in providing target types for lambda expressions and method references.
* On a new Functional Interface declaration always use `@FunctionalInterface` annotation. This is not only for the documentation purpose but also to avoid accidentally breaking the Functional Interface behavior.
* Instantiate Functional Interfaces with Lambda Expressions instead of creating anonymous inner class instances for that.
* Whenever calling the functional interface, place them at last in the parameter list.

For example:

```java
// PREFER
public Foo parse(Locale locale, **Function<Locale,Foo> fn** );

// AVOID
public Foo parse( **Function<Locale,Foo> fn** , Locale locale);
```

### Streams

* Prefer Streams over for loops. Streams are more readable and functional than the "for" loops, as they support operations such as map, flatMap, filter, reduce and collect.
* Exception handling in the streams are carefully handled.
* Avoid mutating objects within `Collection.forEach()` or `Stream.forEach()`, use `Stream.collect()` instead. For example use `Stream.collect(Collectors.toList())` instead of mutating a list for collecting elements to a list.
* Use parallel streams where ever possible to boost performance, whenever it does not involve sort/order/limit intermediate operations.

### Exceptions

MOSIP applications should never allow to exit abruptly because of a critical error. Even if there is a critical error there should be a graceful exit with proper information about the error.

#### Exception hierarchy

* Each feature should be defining their own Checked and Unchecked Exceptions by extending `io.mosip.kernel.core.exception.BaseCheckedException` and `io.mosip.kernel.core.exception.BaseUncheckedException` .
*
  * The Checked and Unchecked exceptions should be used appropriately as needed. Make sure which one to use when based on the exception handling requirement.

#### Throwing exceptions

Throw specific exceptions in a method, rather than generic exceptions. For example,

```java
public void myMethod()throws Exception{  // AVOID
public void myMethod()throws NumberFormatException{  // PREFER
```

#### Documenting exceptions

The exceptions are documented clearly. For example,

```java
/**
 * The method description goes here ...
 *
 * @param input
 * @throws PacketNotValidException
 * if so and so... happens
 */
public void myMethod(String someInput) throws PacketNotValidException {
```

#### Catching exceptions

* Always prefer to use **try-with-resource** block when applicable like instantiating a Input or Output stream/reader or Connection, which are AutoCloseable.
* The following example uses a try-with-resources statement to automatically close a `java.sql.Statement` object:

```java
public static void viewTable(Connection con) throws SQLException {
    String query = "select COF_NAME, SUP_ID, PRICE, SALES, TOTAL from COFFEES";
    try (Statement stmt = con.createStatement()) {
        ResultSet rs = stmt.executeQuery(query);
        ...
        }
    } catch (SQLException e) {
        JDBCTutorialUtilities.printSQLException(e);
    }
}
```

* A try-with-resources statement can have catch and finally blocks just like an ordinary try statement.
* Always catch specific exceptions over a more generic exceptions like Exception/Throwable class. For example,

```java
// AVOID BELOW
try {
    ...
} catch(Exception e) {  //AVOID
    ...
}
// PREFER BELOW
try {
    ...
} catch(RestException e) { // PREFER
    ...
}
```

* Never leave a catch block empty. Either handle the exception, or say proper reason for doing nothing in it.

```java
// AVOID BELOW
try {
   ...
} catch(NumberFormatException e) {} // AVOID
//PREFER BELOW
try {
   ...
} catch(NumberFormatException e) {
   // This exception condition will never occur as schema validation is already performed. 
   // So nothing handled here.
}
```

* Use multi-catch blocks wherever possible to club common handling of multiple exceptions.
* Always log exceptions to file in a catch block for debugging purpose.

```java
try {
   ...
} catch(NumberFormatException e) {
   // Log exception
   logger.error(...)
   // Handle exception
   ...
}
```

* Error and Throwable are never caught in MOSIP.

#### Exception handling in a Service module

* Any service module should handle their exceptions in a common place such as a common Exception Handler which can be annotated with `@ControllerAdvice` or `@RestControllerAdvice`
* Any service in MOSIP should never return error code other than 200. One or more errors to be reported in the response be returned as an array as part of `"errors"` attribute.

### Logs

#### Log levels

Logs are classified and logged accordingly. Following are the various log levels used in the MOSIP application.

1. TRACE
2. DEBUG
3. INFO
4. WARN
5. ERROR

The log levels are configured according to the environment such as Development, Testing, UAT or Production. For example, the log levels in production is from WARN. Whereas in Development and Testing environment, it is from TRACE.

#### MOSIP log component

MOSIP's log component from the core-kernel is used to log entries. The log module in the core-kernel is used to log all the log entries.

* First create a logger utility class under the core module of the feature like below:

```java
import io.mosip.kernel.core.logger.spi.Logger;
import io.mosip.kernel.logger.logback.appender.RollingFileAppender;
import io.mosip.kernel.logger.logback.factory.Logfactory;
/**
 * Logger for XYZ module which provides implementation from kernel logback.
 * 
 * @author XXX
 *
 */
public final class XYZLogger {
	
	private static RollingFileAppender mosipRollingFileAppender;
	
	static {
		mosipRollingFileAppender = new RollingFileAppender();
		mosipRollingFileAppender.setAppend(true);
		mosipRollingFileAppender.setAppenderName("fileappender");
		mosipRollingFileAppender.setFileName("logs/id-auth.log");
		mosipRollingFileAppender.setFileNamePattern("logs/id-auth-%d{yyyy-MM-dd}-%i.log");
		mosipRollingFileAppender.setImmediateFlush(true);
		mosipRollingFileAppender.setMaxFileSize("1mb");
		mosipRollingFileAppender.setMaxHistory(3);
		mosipRollingFileAppender.setPrudent(false);
		mosipRollingFileAppender.setTotalCap("10mb");
	}

	/**
	 * Instantiates a new XYZ logger.
	 */
	private XyzLogger() {
	}

	/**
	 * Method to get the rolling file logger for the class provided.
	 *
	 * @param clazz
	 *            the clazz for which the logger instance to be created.
	 * @return the logger
	 */
	public static Logger getLogger(Class<?> clazz) {
		return Logfactory.getDefaultRollingFileLogger(mosipRollingFileAppender, clazz);
	}
}
```

* To log any information/error/debug in a class,
  * create a logger instance in that class as below: `private static Logger mosipLogger = XYZLogger.getLogger(MyClass.class);`
  * In appropriate places invoke the appropriate log method of mosipLogger such as `error`, `debug` or `info` with appropriate parameters passed to it.

#### MOSIP log format

Every log entry contains the following format,

```
<date_iso> - <application_id> - <module_id> - <component_id> - <id_type> - <idvalue> - <description>
```

For example,

```
2008-09-15T15:53:00+05:00 - ENROLMENT – PACKET_VALIDATOR - VALIDATE – EnrolmentId - 829329 – Packet validator had been called and now we are going to validate the packets.
```

#### No sensitive information is logged

* Never log any sensitive information such as user credentials, individual identity information to the log, mask the data if required before logging.
* Care should be taken, not to log any sensitive information is logged. Modules leads to review the code to ensure that no sensitive information is logged.

### Audit Logging in MOSIP

* Any service in MOSIP should invoke Kernel's AuditManager REST Service for audit logging of the status of the services such as
  * Success
  * Failure
  * Exception occurred - the error codes and error messages.
* Define the appropriate Audit Modules and Audit Events for any feature and use pass them appropriately in the Audit Parameters while invoking the Audit REST service.
* Make sure to invoke the Audit REST service Asynchronously to prevent any time lagging in response because of the Audit REST service call.

### Common utilities

Apache Commons is used to handle the common utilities like StringUtil, FileUtil, Hashcode, toString, null check etc., are

In case if Apache Commons doesn't have the necessary utilities, the util project from mosip-core is used.

### Miscellaneous Practices

Following are the miscellaneous practices which are followed in MOSIP.

#### Parenthesis

Parenthesis are used in the code liberally to improve the readability and for precedence clarity.

#### Type Casting

* Never type cast a variable without doing `instanceof` checking.
* Avoid unnecessary type casting when the type of the value/expression is already assigned to a correct variable type/return type.

#### Generics

* Avoid using Generic classes without Parameter types. For example:

```java
List nameList = new ArrayList(); // AVOID
List<String> nameList = new ArrayList<>(); //PREFER
```

* Use diamond operator while constructing Generic objects. For example:

```java
new HashMap<String, List<String>>() //AVOID
new HashMap<>() //PREFER
```

#### Method Calls Chaining

* While chaining multiple method calls, keep one method call per line for better clarity and easy debugging of any issue (especially to get line number in exception stack trace where exactly is the error/exception occurs). For example:

```java
MessageDialog.makeText(text)
	.setGravity(Gravity.TOP, 0, 0)
	.setView(layout)
	.show();
```

#### Special Comments

* Special comments are used to give a hint for further development. Following are the special comments used in the MOSIP project,
  * TODO
  * FIXME
  * NOTE
  * OPTIMIZE
* It should be made sure to track the above comments, perform action accordingly, and remove them when they become irrelevant.

## References

* [Java Code Conventions ](http://www.oracle.com/technetwork/java/codeconventions-150003.pdf)
* [Java SE 8 Best Practices ](https://www.jfokus.se/jfokus17/preso/Java-SE-8-best-practices.pdf)
