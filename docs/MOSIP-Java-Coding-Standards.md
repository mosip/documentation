# 1. Introduction
## Context

MOSIP is developed as an open source framework project. The code developed complied to the Java standards and best practices.

## Purpose of this document

This document gives various Java coding standards which arefollowed during the MOSIP development.

## Scope of this document

This document covers the coding standards, which are followed by the Java developers.

# 2. Java files

## 2.1 Number of lines

The number of lines in the Java files is restricted to 2000 lines. Beyond 2000 lines, the java file is refactored into multiple files.

## 2.2 Class and Interface

Each java file contains one public class or interface.

When some private classes and interfaces are associated, this can be in the same file.

Declare the public class and interface as the first declaration in the file.

## 2.3 Ordering

When a java file is written, the following order is maintained,

### 2.3.1 Beginning documentation comment

The beginning comment should be in a C-style comment. Following is the format of the comment.
```
/*  
 * Firstname Lastname
 *           
 * Copyright notice
 */   
```
### 2.3.2 Package statement

The first non-comment line is the package statement.

### 2.3.3 Import statement

- After a line-break below the package statement, import statements are placed. The import statements are grouped and segregated by a line-break. For example,
```
import java.util.List;
import java.util.Map;
import java.time.zone.ZoneRulesException;
import org.mosip.kernel.core.authn.LoginInfo;
import org.mosip.kernel.core.exception.InvalidInputException;
import org.mosip.kernel.core.exception.UnauthenticatedException;
```	
- Do not use asterisk symbol while importing packages.

### 2.3.4 Class comment

- Class comment goes in the order of class description, version and author. For example,
```
/*
 * Class description goes here
 *
 * @version 2.4 05 July 2018
 * @author Rajkumar Mahanty
 *
 */
```
### 2.3.5 Public class or interface definition

- Then the public class or interface is defined.

### 2.3.6 Other related private class or interface definition

- The other private class or interface are followed.

### 2.3.7 Combined example

Please refer the section 10.12

## 3 Inside class or interface

Following is the order of elements inside the class declaration

### 3.1.1 Class comment for documentation

This comment will be going in to the Javadocs

### 3.1.2 Class or interface statement

Class of interface statement

### 3.1.3 Class or interface implementation comment

Additional comments to the Class comment

### 3.1.4 Instance variables

The public class variables are followed by the protected and the private variables.

### 3.1.5 Constructors

The constructor declarations ordered by the number of parameters.

### 3.1.6 Method declarations

The methods are ordered by the functionality. The methods need not to be in the order of scope or accessibility.

# 4 Indentation

The indentation unit it TAB.

## 4.1 Line length

The number of characters in a line should not exceed 80 characters

## 4.2 Wrapping lines

When the number of characters exceed the limit, the line should be broken into multiple lines. The following standard is used during the line breaks,

- Break the line after the comma
- Break before the operator
- From higher-level breaks go to the lower-level breaks.

#5 Comments

There are 2 types of comments in Java.

1. Implementation comments
2. Documentation comments

Both the comment types are used in the source code of MOSIP.

## 5.1 Implementation Comment

This is the comment type used for better understanding of the code. Most of the times, the source code will be maintained by different people. The programmer writes these comments so that the other programmers will come to know the functionality of the code in plain English language. Following lines are used.

### 5.1.1 Block Comments

When the developer needs to explain in detail about some functionality, block comments are used. Block comments are used anywhere in the code. It can be for the class or interface declarations or it can be within the java methods also. Example of block comments,
```
/*
* This is the block comment. This is the block comment. This is the block
* comment. This is the block comment. This is the block comment. This is                
* block comment.
*/
```
### 5.1.2 Single-Line Comments

Single line comments are used for short description. For example,
```
/* This is short description */
if( height > 45) {
    ...

}
```
### 5.1.3 Trailing Comments

Trailing comments are given in the same line where the source code resides. For example,
```
if(height > 45) { /* This is the trailing comment */
    ...

}
```
### 5.1.4 End-Of-Line comments

The end-of-line comments are also used in the source file. For example,
```
if(width > 45) {
    return false; // some description
}

```
## 5.2 Documentation comments

Documentation comments are used to generate the javadoc files. 

# 6 Declarations

## 6.1 Number Per Line

One variable is declared per line.

## 6.2 Placement

Variables are declared at the beginning of the code block.

## 6.3 Class and Interface Declarations

1. When declaring a method, no space are there before and after "(".
2. Open brace  "{" is in the same line as the declaration.
3. Closing brace "}" is in a new line and should match the open braces in the indentation.
4. An empty line is there in between the method declarations.

# 7 Statements

## 7.1 Simple Statements

One statement is there per line.

## 7.2 "return" Statements

The return value is obvious. Parenthesis are not used while returning from the method.

## 7.3 if, if-else, if-else-if-else Statements

Always curly braces are used in the if-else statements. Even though there is a single statement below the if-else statement, curly braces is used. For example,
```
if(width > 45) {
    return false; // some description
}
```
# 8 White Space

## 8.1 Blank Lines

Only for the following situations 2 blank lines are used,

1. Between 2 different sections of the source file
2. If you have more than one class or interface, use 2 blank lines

Only for the following situations, 1 blank line is used,

1. Between method declarations.
2. Between the variable declarations and the method code.
3. Before the block comment or line comment.
4. To provide a better readability in between logical blocks, an empty line are used, wherever applicable.

## 8.2 Blank Spaces

Under the following circumstances, blank space are used,

1. When a keyword followed by parenthesis, a blank space should be given after the keyword. For example,
```
while(age > 60)  {
    ...
}
```
2. In the argument list, the parameters are given a space after comma.

# 9 Naming Conventions
## 9.1 Package names

All the package name in MOSIP application starts with org.mosip

## 9.2 Classes

The names given to classes are always nouns and in camel case.

## 9.3 Interfaces

The names given to interface is always noun and in camel case.

## 9.4 Methods

The method names are always verbs and in camel case. For example,

public void deleteFromCache(String cacheName, String key) {

## 9.5 Variables

The variable names are short and meaningful. Any new observer can understand the meaning of the variable. No single letter variable names are used. Camel case is used when declaring variables.

## 9.6 Constants

The constants are given the name in capital letters. The words in the names are separated by underscore("_").

# 10 Programming Practices

## 10.1 Providing Access to Instance and Class Variables

The instance variables should not be made public unless you have a specific reason.

## 10.2 Referring to Class Variables and Methods

Always use the class name to call the static method. For example,
```
LogFactory.getLogger();
```
## 10.3 Constants

Numerical values should not used in the code directly. Declare them and use it in the code. For example,
```
int MAX_AGE = 60;
while (age > MAX_AGE) {
    ...
}
```
## 10.4 Variable Assignments

Avoid multiple assignments in the same line. For example,
```
int MAX_AGE = 60;
while (age > MAX_AGE) {
    ...
}
```
## 10.5 Lambdas
### 10.5.1 Parameter type inference

Always use parameter type inference. For example,
```
(employee, requesterEmployee) -> employee.name.compareTo(requesterEmployee.name) // PREFER
(Employee employee, Employee requesterEmployee) -> {employee.name.compareTo(requesterEmployee.name)} // PREFER
```
### 10.5.2 Parenthesis when optional

Do not use the parenthesis wherever it is optional

### 10.5.3 Expression lambdas

Avoid using the block lambdas wherever an expression lambda are used. For example,
```
// PREFER
someVar -> someVar.toUpperCase(Constants.SOME_CONST);

// AVOID
someVar -> {
**return** someVar.toUpperCase(Constants.SOME_CONST);
}
```
## 10.6 Functional Interfaces

Whenever calling the functional interface, place them at last in the parameter list. For example,
```
// PREFER
public Foo parse(Locale locale, **Function<Locale,Foo> fn** );

// AVOID
public Foo parse( **Function<Locale,Foo> fn** , Locale locale);
```
## 10.7 Exceptions
### 10.7.1 Specific exceptions

Throw specific exceptions are caught, rather than generic exceptions. For example,
```
public void myMethod()throws Exception{  // AVOID
public void myMethod()throws NumberFormatException{ // PREFER
```
### 10.7.2 Documenting exceptions

The exceptions are documented clearly. For example,
```
/**
* The method description goes here ...
*
* @param input
* @throws PacketNotValidException
* if so and so... happens
*/

public void myMethod(String someInput) throws PacketNotValidException {
```
### 10.7.3 Error and Throwable

Error and Throwable are never caught in MOSIP. For example,

### 10.7.4 Exception hierarchy

All the exceptions in MOSIP extends from the exception module from the mosip-core

## 10.8 Logs
### 10.8.1 Log levels

Logs are classified and logged accordingly. Following are the various log levels used in the MOSIP application.

1. TRACE
2. DEBUG
3. INFO
4. WARN
5. ERROR

The log levels are configured according to the environment such as Development, Testing, UAT or Production. For example, the log levels in production is from WARN. Whereas in Development and Testing environment, it is from TRACE.

### 10.8.2 MOSIP log component

MOSIP's log component from the core-kernel is used to log entries.

### 10.8.3 Always use core-kernel log module

The log module in the core-kernel is used to log all the log entries.

### 10.8.4 MOSIP log format

Every log entry contains the following format,

<date_iso> - <application_id> - <module_id> - <component_id> - <id_type> - <idvalue> - <description>

For example,

2008-09-15T15:53:00+05:00 - ENROLMENT – PACKET_VALIDATOR - VALIDATE – EnrolmentId - 829329 – Packet validator had been called and now we are going to validate the packets.

### 10.8.5 No sensitive information is logged

Care is taken, not to log any sensitive information is logged. Modules leads review the code to ensure that no sensitive information is logged.

## 10.9 Streams

Streams are less readable than the "for" loops. Streams are used wherever necessary.

Exception handling in the streams are carefully handled.

## 10.10 Common utilities

Apache Commons is used to handle the common utilities like StringUtil, FileUtil, Hashcode, toString, null check etc., are

In case if Apache Commons doesn't have the necessary utilities, the util project from mosip-core is used.

## 10.11 Miscellaneous Practices

Following are the miscellaneous practices which are followed in MOSIP.

### 10.11.1 Parentheses

Parentheses are used in the code liberally to improve the readability and for precedence clarity.

### 10.11.2 Returning Values

The return values are made sure that it is understandable.

### 10.11.3 Expressions before '?' in the Conditional Operator

If any binary operator is used before "?" in the ternary operator, then parentheses is used.
```
(age >= 25) ? true : false ;
```
### 10.11.4 Special Comments

Special comments are used to give a hint for further development. Following are the special comments used in MOSIP project,

- NOTE
- OPTIMIZE
- TODO
- FIXME

## 10.12 Sample Java code
```
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
# References

<div>http://www.oracle.com/technetwork/java/codeconventions-150003.pdf</div>
<div>https://www.jfokus.se/jfokus17/preso/Java-SE-8-best-practices.pdf</div>