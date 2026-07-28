# Hands-On Exercise Patterns

All assessable exercises should become complete MATLAB scripts before feedback
is finalized. Use [script-assessment-patterns.md](script-assessment-patterns.md)
for script scaffolds, expected-output checks, and MATLAB execution workflow.

For instructors, these patterns are meant to be small enough to use during a
normal tutoring exchange. A good exercise should reveal one misconception, run
quickly, and produce evidence the tutor can discuss with the learner.

## Trace Exercise

```text
Goal: Practice shape and element-wise operations.

Predict the value and size of z after each line:

x = [1 2 3];
y = x';
z = x .* y;

What do you expect MATLAB to do, and why?
```

Tutor notes: This exposes row/column orientation and implicit expansion.

Assessment notes: Ask the learner to predict first, then run a complete script
that assigns the expected `z`, prints `size(z)`, and checks the actual value.

Instructor use: This is a strong pre-lab warmup before topics involving vector
operations, plotting, or table variables, because it makes array shape visible.

## Debug Exercise

```text
Goal: Diagnose a matrix dimension error.

This code errors:

a = [1 2 3];
b = [10 20 30];
c = a * b;

What is the error caused by? Choose a fix, then explain whether the intended operation is a dot product or element-wise product.
```

Tutor notes: Ask for `size(a)` and `size(b)` before giving the fix.

Assessment notes: Convert the learner's selected fix into a script that verifies
the intended output. If the objective is element-wise multiplication, compare
`c` against `[10 40 90]`. If the objective is a dot product, compare against
`140`.

Instructor use: This pattern helps students separate two different intentions:
dot product and element-wise multiplication. The tutor should not assume the fix
until the learner states the intended operation.

## Table Exercise

```text
Goal: Distinguish table subsetting forms.

T = table(["A";"B";"A"], [10;20;30], VariableNames=["Group","Value"]);

What is the difference between these?

T(:, "Value")
T{:, "Value"}
T.Value
```

Tutor notes: Focus on table vs array outputs.

Assessment notes: Check `istable`, `class`, `size`, and `isequal`/`isequaln` for
each output form rather than relying on display text.

Instructor use: This pattern is useful before data-analysis assignments because
many table errors come from confusing table subsetting with array extraction.

## Function Exercise

```text
Goal: Add input validation.

Write a function `circleArea(radius)` that returns area and rejects negative radii.
Use an `arguments` block.
```

Tutor notes: Route to testing skill if the learner should write tests.

Assessment notes: For function exercises, create a script that writes or calls
the learner function, exercises representative inputs, verifies errors when
needed, and reports pass/fail results.

Instructor use: This pattern connects function design to assessment. It is a
good bridge from scripts to reusable functions and unit-test thinking.

## Mini-Project Pattern

Use for 15-30 minute sessions:

1. Import a small CSV or create sample data.
2. Clean or filter values.
3. Compute a summary.
4. Visualize the result.
5. Wrap one step in a function.
6. Write one test.

Keep scope narrow enough for feedback in the same session.

Instructor use: Mini-projects work best after students have already practiced
the individual pieces. Keep the goal authentic but bounded: one data source, one
summary, one visualization, and one assessed result.
