# MATLAB Grader assessment setup

Configure these three assessments in MATLAB Grader. No MATLAB Code assessment is required, so this item has no `tests.m`.

| Requirement / LO evidence | Grader Test Type | MATLAB Grader UI fields | Code to paste | Expected evidence | Traceability |
| --- | --- | --- | --- | --- | --- |
| Build the plural status message from a name and count | Variable equals reference solution | Variable name: `statusMessage` | Not applicable | Matches the reference string scalar for a count greater than one | LO: create a string scalar from text and numeric data |
| Select singular wording when the count is one | Variable equals reference solution | Variable name: `singleStatusMessage` | Not applicable | Matches the reference string scalar with `measurement` | LO: adapt a string message to a simple numeric condition |
| Transfer plural wording to a substantially different numeric range | Variable equals reference solution | Variable name: `largeStatusMessage` | Not applicable | Matches the reference string scalar with `measurements` | LO: create a string scalar from text and numeric data |

The three direct reference checks provide distinct evidence: plural construction, singular wording, and transfer to a separate range. They avoid duplicate logic and fixed test-count padding.
