# MATLAB Grader assessment setup

Configure these three distinct assessments in MATLAB Grader. No MATLAB Code assessment is required, so this item has no `tests.m`.

| Requirement / LO evidence | Grader Test Type | MATLAB Grader UI fields | Code to paste | Expected evidence | Optional feedback on incorrect submission | Traceability |
| --- | --- | --- | --- | --- | --- |
| Evaluate the supplied multiplication-first expression | Variable equals reference solution | Variable name: `multiplyThenDivide` | Not applicable | Matches the reference floating-point result | — | LO: apply floating-point limitations to computation |
| Evaluate the supplied division-first expression | Variable equals reference solution | Variable name: `divideThenMultiply` | Not applicable | Matches the reference floating-point result | — | LO: apply floating-point limitations to computation |
| Report the effect of changing operation order | Variable equals reference solution | Variable name: `resultDifference` | Not applicable | Matches the difference between the two reference results | Check that the difference compares results from two distinct operation orders. | LO: apply floating-point limitations to computation |

The three direct-reference checks provide separate evidence for each operation order and its observable effect.
