---
bc-version: [all]
domain: design
keywords: [procedure, visibility, local, internal, public, access-modifier, encapsulation, scope]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Use the lowest possible visibility for procedures

## Description

Every procedure in AL has a visibility scope that controls who may call it. Declaring a wider scope than necessary exposes implementation details and makes future refactoring harder. Choosing the narrowest scope that satisfies the actual callers keeps objects self-contained, reduces unintended cross-object coupling, and makes the public surface of an app easier to reason about.

## Best Practice

When creating a new procedure, start with the most restrictive option and widen only when a concrete caller requires it:

- **`local`** — the procedure is called only from within the same object. Mark it `local`. It is invisible outside the object.
- **`internal`** — the procedure is called from other objects inside the same app, but never from a dependent app. Mark it `internal`. It is invisible to consumers of your app.
- **`(no modifier / implicit public)`** — the procedure is called from outside the app boundary (e.g. from an extension or a dependent app). Omit the modifier entirely. AL's default visibility is public.

See sample: `procedure-visibility.good.al`.

## Anti Pattern

Declaring a procedure without any modifier (implicit public) when it is only ever called within the same object or the same app. This leaks internal implementation details across app boundaries and prevents safe refactoring.

See sample: `procedure-visibility.bad.al`.
