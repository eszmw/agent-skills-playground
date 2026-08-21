# MATLAB Grader assessment setup

Configure these two assessments in MATLAB Grader. No MATLAB Code assessment is required, so this item has no `tests.m`.

| Requirement / LO evidence | Grader Test Type | MATLAB Grader UI fields | Code to paste | Expected evidence | Optional feedback on incorrect submission | Traceability |
| --- | --- | --- | --- | --- | --- |
| Compute the magnitude of the difference between the supplied values | Variable equals reference solution | Variable name: `absoluteDifference` | Not applicable | Matches the reference floating-point result | — | LO: apply floating-point limitations using a tolerance |
| Compare the magnitude with the supplied tolerance | Variable equals reference solution | Variable name: `areEquivalent` | Not applicable | Matches the reference logical scalar | Check the direction of the comparison between the difference and tolerance. | LO: apply floating-point limitations using a tolerance |

The two direct-reference checks distinguish the numerical difference from the tolerance-based conclusion.
