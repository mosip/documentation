# Audit Plugin

The audit plugin interface provides two methods to audit any action in eSignet. An instance of this audit plugin is injected into all the services of eSignet, and almost all the events are audited using this plugin.

Below is the eSignet audit interface,

```java
public interface AuditPlugin {

    /**
     + Plugin method to audit all the actions in the eSignet service.
     +
     +  @param action Action to audit @{@link Action}
     +  @param actionStatus Action status to audit @{@link ActionStatus}
     +  @param audit @{@link AuditDTO} during this action
     +  @param t Any error / exception occurred during this action, null if no errors / exception found.
     */
    void logAudit(Action action, ActionStatus status, AuditDTO audit, Throwable t);

    /**
    + Plugin method to audit all the actions in the eSignet service.
    +
    +  @param username Session username for audit
    +  @param action Action to audit @{@link Action}
    +  @param actionStatus Action status to audit @{@link ActionStatus}
    +  @param audit @{@link AuditDTO} during this action
    +  @param t Any error / exception occurred during this action, null if no errors / exception found.
    */
	void logAudit(String username, Action action, ActionStatus status, AuditDTO audit, Throwable t);
}
```

{% hint style="info" %}
For the latest version of the interface please check our code base - [AuditPlugin.java](https://github.com/mosip/esignet/blob/master/esignet-integration-api/src/main/java/io/mosip/esignet/api/spi/AuditPlugin.java)
{% endhint %}

## How to implement this plugin?

The Audit plugin implementation class must be annotated with `ConditionalOnProperty` with `mosip.esignet.integration.audit-plugin` property.

Below is an example of how the Audit plugin can be implemented.

```java
@ConditionalOnProperty(value = "mosip.esignet.integration.audit-plugin", havingValue = "mock-audit-service")
@Component
@Slf4j
public class LoggerAuditService implements AuditPlugin {
    //Implement audit plugin methods
}
```
