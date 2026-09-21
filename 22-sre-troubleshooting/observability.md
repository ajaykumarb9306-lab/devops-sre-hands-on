# Observability During Incidents

Use multiple signals together.

## Metrics

Answer:

- When did it start?
- How large is the impact?
- Is resource saturation present?

## Logs

Answer:

- What error occurred?
- Which component generated it?
- What request or dependency failed?

## Traces

Answer:

- Where was time spent?
- Which service/dependency failed?

## Events

Answer:

- What changed?
- Was a pod restarted?
- Was a deployment performed?
- Was infrastructure modified?

## Correlation

Deployment
    |
    v
Error Rate Increase
    |
    v
Latency Increase
    |
    v
User Impact

Correlation does not automatically prove causation, but it provides a strong investigation path.
