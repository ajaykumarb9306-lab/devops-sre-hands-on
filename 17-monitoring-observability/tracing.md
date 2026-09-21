# Distributed Tracing

Distributed tracing follows requests across multiple services.

## Example

Client
 |
API Gateway
 |
Application
 |
Payment Service
 |
Database

Each operation is represented by a span.

Multiple spans form a trace.

## Important Concepts

Trace ID
Span ID
Parent span
Duration
Status
Attributes

## Tracing Helps Find

Slow dependencies
Database latency
API bottlenecks
Service failures
Cross-service errors

## OpenTelemetry

OpenTelemetry provides vendor-neutral instrumentation for:

Metrics
Logs
Traces

Telemetry can be exported to observability platforms such as New Relic, Prometheus-compatible systems, and other backends.
