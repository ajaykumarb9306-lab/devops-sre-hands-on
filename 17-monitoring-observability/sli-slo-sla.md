# SLI, SLO, and SLA

## SLI

Service Level Indicator.

A measurement of service reliability.

Examples:

Availability
Latency
Error rate

Example:

99.95% successful requests

## SLO

Service Level Objective.

The reliability target for an SLI.

Example:

99.9% of requests should succeed during a 30-day period.

## SLA

Service Level Agreement.

A formal agreement describing expected service levels and possible consequences if they are not met.

## Error Budget

If SLO is:

99.9%

Then allowed unreliability is:

0.1%

Error budgets help balance reliability and delivery velocity.

## SRE Principle

Alerts should focus on meaningful service impact rather than every infrastructure fluctuation.
