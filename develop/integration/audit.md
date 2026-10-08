# Audit Plugin

### What the Audit Plugin Does

As eSignet's flow engine runs an authentication or consent flow, it emits a stream of lifecycle events — a flow starting, a step completing or failing, a flow finishing. The audit plugin (called an _observability provider_ internally) receives every one of those events and decides what happens to them next: forward them to your organization's SIEM, write them to a compliance data store, or simply log them locally. eSignet doesn't generate these events from application code you'd need to instrument yourself — they come directly from the flow engine, so a correctly wired audit plugin captures a complete, consistent trail of authentication activity by default.

### How It's Wired

There's no separate registration step for the audit plugin. It's returned alongside your Authn Provider from the same `Init(...)` function for your identity backend (see [Authn Provider](authenticator.md)):

```go
func Init(...) (shared.ConsolidatedAuthnProvider, providers.ObservabilityProvider, error)
```

Whatever you return as the second value becomes the engine's audit sink for the lifetime of the process. If you're building a new identity backend integration and don't need custom audit logging, you can return eSignet's built-in no-op logger instead of writing your own:

```go
return authnProvider, shared.NewNoopAuditor(), nil
```

### The Interface

A provider implements two methods:

```go
type ObservabilityProvider interface {
    // PublishEvent publishes an event to the observability system.
    PublishEvent(ctx context.Context, evt *Event)

    // IsEnabled returns true if observability is enabled and operational.
    IsEnabled() bool
}
```

`PublishEvent` is called once per lifecycle event; `IsEnabled` lets the engine skip building an event entirely when observability isn't active. Each `Event` carries a trace ID (for correlating related events), a type such as `FLOW_STARTED` or `FLOW_COMPLETED`, a status, and a set of event-specific fields — the full list of event types and fields is in the deep dive.

### A Reference Implementations

* **No-Op / Logging Auditor&#x20;**_**(Link TBA)**_ — `shared.NewNoopAuditor()`: no external dependency, just logs each event's fields through the application logger; always enabled. A complete, minimal starting point to copy from. `noop_auditor.go`
* **MOSIP Audit-Manager Auditor&#x20;**_**(Link TBA)**_ — `mosip.NewAuditor(...)`: maps each event onto a MOSIP audit-manager record and posts it asynchronously over HTTP. Full field mapping and config are in the deep dive. `auditor.go`

### How to Implement Your Own

1. Define an `Event → <your record type>` mapping for whatever fields your audit system needs. You don't have to use every field on `Event`, and you can enrich your record with values pulled out of `Data`.
2. Implement `PublishEvent` as fire-and-forget — a goroutine, or a buffered channel to a background worker — so a slow or unavailable audit sink never blocks or fails the authentication flow that generated the event. Derive the goroutine's context from `context.Background()`, not the request context, for the same reason, but carry the trace ID forward for correlated logging.
3. Implement `IsEnabled` to report whether your sink is currently configured and reachable; return `true` unconditionally if that distinction doesn't apply to your implementation.
4. Return your type from your provider package's `Init(...)` function as the second return value.

### Further Details

The [Audit Plugin Deep Dive](https://claude.ai/cowork/audit-plugin-deep-dive.md) has the full event payload and field reference, the complete list of event types the flow engine emits, and the full MOSIP reference implementation.
