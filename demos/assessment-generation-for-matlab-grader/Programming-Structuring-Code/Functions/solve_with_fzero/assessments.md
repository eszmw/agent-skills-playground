# MATLAB Grader setup: Find a Function Zero

Purpose: summative  
Complexity: high  
Submission type: Function

| Requirement / LO evidence | Grader Test Type | MATLAB Grader UI fields | Code to paste | Expected evidence | Optional feedback on incorrect submission | Traceability |
| --- | --- | --- | --- | --- | --- | --- |
| The function passes the supplied function handle and initial guess to a zero finder and returns the root. | Variable equals reference solution | Student variable or expression: `root` | — | The call block result equals the reference root within MATLAB Grader's numeric comparison tolerance. | The root must be computed from the supplied function handle and initial guess. | LO: pass functions as arguments using function handles |
| Use the required zero-finding behavior. | Function or Keyword is present | Assessment name: `Use the required zero-finding behavior`; Function or keyword: `fzero` | — | `fzero` is present. | — | LO: pass functions as arguments using function handles |

Set **Code to call your function** to the contents of `function_call.m`. Add the first assessment as **Variable equals reference solution** and the second as **Function or Keyword is present**. Add a transfer call using another scalar function handle and a different initial guess.
