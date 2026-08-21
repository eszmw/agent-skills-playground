# MATLAB Grader setup: Mark a midpoint

Purpose: summative  
Complexity: high  
Submission type: Function

| Requirement / LO evidence | Grader Test Type | MATLAB Grader UI fields | Code to paste | Expected evidence | Optional feedback on incorrect submission | Traceability |
| --- | --- | --- | --- | --- | --- | --- |
| The function returns the midpoint of the two input points. | Variable equals reference solution | Student variable or expression: `midpoint` | — | The call block assigns the same two-element vector as the reference solution. | — | LO: function input and output |
| The function adds the required plot side effect. | MATLAB Code | Assessment name: `Adds filled yellow midpoint marker` | See `tests.m`, section `Assessment: The function adds a filled yellow midpoint marker`. | A circular marker at `referenceVariables.midpoint` has a yellow face color. | The midpoint marker must be present, yellow, filled, and located at the returned midpoint. | LO: function side effect |

Set **Code to call your function** to the contents of `function_call.m`. Add the first assessment as **Variable equals reference solution**. Add the second as **MATLAB Code** and paste the matching section from `tests.m`.
