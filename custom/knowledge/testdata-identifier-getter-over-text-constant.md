---
bc-version: [all]
domain: testing
keywords: [testdata, getter, identifier, text-constant, hardcoded, codeunit, testdata-app]
technologies: [al]
countries: [w1]
application-area: [all]
scope: [testdata-app]
---

# Use getter methods instead of text constants for identifiers in the TestData app

## Description

When inserting test data records that reference identifiers (codes, keys, mapping values), it is tempting to pass the raw text literal directly. This creates an invisible coupling: if the real codeunit ever renames or changes the value, every hardcoded call site silently drifts.

The TestData app must instead call the dedicated getter methods exposed by the relevant helper codeunit (e.g. `RecurringLabelHelper`). Getters are the single source of truth and make the connection to production logic explicit and refactor-safe.

This rule applies **exclusively to the TestData app**. Other apps are not in scope.

## Best Practice

Call the appropriate getter for every identifier argument — shipping agent codes, service codes, mapping codes, and similar values.

See sample: `testdata-identifier-getter-over-text-constant.good.al`.

## Anti Pattern

Passing raw text literals (string constants) directly as identifier arguments in TestData insert calls.

See sample: `testdata-identifier-getter-over-text-constant.bad.al`.
