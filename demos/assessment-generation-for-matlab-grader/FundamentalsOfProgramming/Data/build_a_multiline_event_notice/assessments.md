# MATLAB Grader assessment setup

Configure these two assessments in MATLAB Grader. No MATLAB Code assessment is required, so this item has no `tests.m`.

| Requirement / LO evidence | Grader Test Type | MATLAB Grader UI fields | Code to paste | Expected evidence | Traceability |
| --- | --- | --- | --- | --- | --- |
| Combine title, numeric day, room, and line breaks in the required three-line notice | Variable equals reference solution | Variable name: `eventNotice` | Not applicable | Matches the reference string scalar for the primary event | LO: create a multiline string scalar from text and numeric data |
| Apply the same multiline construction to distinct values | Variable equals reference solution | Variable name: `alternateEventNotice` | Not applicable | Matches the reference string scalar for the alternate event | LO: create a multiline string scalar from text and numeric data |

`newline` and `string` are demonstrated in the reference solution. The assessment measures the observable complete notices; it does not add a construct-presence check because the objective does not require one named implementation method.
