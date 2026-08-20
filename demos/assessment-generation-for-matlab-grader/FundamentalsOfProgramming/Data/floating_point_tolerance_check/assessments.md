# MATLAB Grader assessment setup

Configure these four distinct assessments in MATLAB Grader. No MATLAB Code assessment is required, so this item has no `tests.m`.

| Requirement / LO evidence | Grader Test Type | MATLAB Grader UI fields | Code to paste | Expected evidence | Traceability |
| --- | --- | --- | --- | --- | --- |
| Compute the floating-point sum from the supplied addends | Variable equals reference solution | Variable name: `computedSum` | Not applicable | Matches the reference floating-point result | LO: apply floating-point limitations to computation |
| Quantify the rounding difference from the mathematical target | Variable equals reference solution | Variable name: `difference` | Not applicable | Matches `computedSum - expectedSum` in the reference solution | LO: apply floating-point limitations to computation |
| Distinguish strict equality from mathematical expectation | Variable equals reference solution | Variable name: `exactMatch` | Not applicable | Matches the reference logical scalar for exact comparison | LO: apply floating-point limitations to computation |
| Apply the supplied tolerance to the magnitude of the difference | Variable equals reference solution | Variable name: `isWithinTolerance` | Not applicable | Matches the reference logical scalar for tolerance-based comparison | LO: apply floating-point limitations to computation |

The four direct-reference checks provide separate evidence for computation, difference, strict equality, and tolerance-based reasoning. `abs` is instructional guidance, not a separately scored named-construct requirement.
