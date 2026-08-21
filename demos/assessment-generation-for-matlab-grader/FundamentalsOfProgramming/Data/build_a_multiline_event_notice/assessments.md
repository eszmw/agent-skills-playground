# MATLAB Grader assessment setup

Configure these two assessments in MATLAB Grader. No MATLAB Code assessment is required, so this item has no `tests.m`.

| Requirement / LO evidence | Grader Test Type | MATLAB Grader UI fields | Code to paste | Expected evidence | Optional feedback on incorrect submission | Traceability |
| --- | --- | --- | --- | --- | --- |
| Recreate the complete five-line text using the supplied fragments | Variable equals reference solution | Variable name: `joke` | Not applicable | Matches the reference string scalar exactly | Check the required line order and punctuation in the completed string. | LO: use whitespace and line breaks in string concatenation |
| Use `newline` to create the required line breaks | Function or Keyword is present | Function or keyword: `newline` | Not applicable | Student code includes `newline` | The required line-break construct is not present. | LO: use `newline` in string concatenation |

The direct reference check evaluates the complete joke. The second assessment is included because the objective explicitly requires `newline`.
