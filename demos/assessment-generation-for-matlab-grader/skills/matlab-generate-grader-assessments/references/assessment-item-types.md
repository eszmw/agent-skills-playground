# Supported MATLAB Grader assessment item types

| Type | Learner submission | Primary observable evidence | Extra artifact |
| --- | --- | --- | --- |
| Script | `.m` script | Workspace variables and required/prohibited constructs | None |
| Function | `.m` function | Outputs for specified calls and, when explicit, input-contract behavior; assessed with MATLAB Code | `function_call.m` |

Do not generate Class or Object-usage assessment items.

Each item folder contains `description.txt`, `solution.m`, `template.m`, and `assessments.md`. Add `function_call.m` only for Function items. Add `tests.m` only when an `assessments.md` row uses the MATLAB Code test type.

`assessments.md` is the source of truth for MATLAB Grader configuration. Its requirement-to-assessment matrix must show that every stated requirement has one distinct, objective-aligned assessment and may include feedback on a validated incorrect submission. Feedback is optional for each assessment.

For Function items, do not configure **Variable equals reference solution**. Use **MATLAB Code** for each output check. In each assessment, assign test inputs, call the learner function and `reference.<functionName>` with those inputs, then compare the outputs with `assessVariableEqual`.
