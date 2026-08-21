# MATLAB Grader assessment setup

Configure these two assessments in MATLAB Grader. No MATLAB Code assessment is required, so this item has no `tests.m`.

| Requirement / LO evidence | Grader Test Type | MATLAB Grader UI fields | Code to paste | Expected evidence | Optional feedback on incorrect submission | Traceability |
| --- | --- | --- | --- | --- | --- |
| Combine text, `studentName`, and numeric `studentId` into the required message | Variable equals reference solution | Variable name: `welcomeMessage` | Not applicable | Matches the reference string scalar for the randomized primary identifier | Check the required punctuation and spaces in the primary message. | LO: create a string scalar from text and numeric data |
| Transfer the same construction to different inputs and identifier range | Variable equals reference solution | Variable name: `alternateWelcomeMessage` | Not applicable | Matches the reference string scalar for the alternate name and identifier | — | LO: create a string scalar from text and numeric data |

The reference solution creates string scalars with double-quoted text and `string` conversion. These are authoring and instructional expectations; the direct reference checks score the required observable messages.
