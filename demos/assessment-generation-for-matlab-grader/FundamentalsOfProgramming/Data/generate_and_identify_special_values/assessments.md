# MATLAB Grader assessment setup

Configure these six assessments in MATLAB Grader. No MATLAB Code assessment is required, so this item has no `tests.m`.

| Requirement / LO evidence | Grader Test Type | MATLAB Grader UI fields | Code to paste | Expected evidence | Optional feedback on incorrect submission | Traceability |
| --- | --- | --- | --- | --- | --- |
| Generate an overflow value | Variable equals reference solution | Variable name: `overflowResult` | Not applicable | Matches the reference `Inf` value | Check how MATLAB represents a value beyond the largest finite double. | LO: interpret special numeric values |
| Generate an indeterminate value | Variable equals reference solution | Variable name: `indeterminateResult` | Not applicable | Matches the reference `NaN` value | Check how MATLAB represents the indeterminate expression. | LO: interpret special numeric values |
| Report the overflow classification | Variable equals reference solution | Variable name: `isOverflow` | Not applicable | Matches the reference logical scalar | Check the classification of the overflow result. | LO: identify `Inf` |
| Report the indeterminate-value classification | Variable equals reference solution | Variable name: `isIndeterminate` | Not applicable | Matches the reference logical scalar | Check the classification of the indeterminate result. | LO: identify `NaN` |
| Identify the overflow value with `isinf` | Function or Keyword is present | Function or keyword: `isinf` | Not applicable | Student code includes `isinf` | — | LO: identify `Inf` |
| Identify the indeterminate value with `isnan` | Function or Keyword is present | Function or keyword: `isnan` | Not applicable | Student code includes `isnan` | — | LO: identify `NaN` |

The direct-reference checks evaluate the generated values and reported classifications. The two construct-presence checks are included because the objective explicitly requires `isinf` and `isnan`.
