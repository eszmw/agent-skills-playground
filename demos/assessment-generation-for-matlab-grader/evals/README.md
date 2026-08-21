# Evals: MATLAB Grader assessment generation

Run each scenario with the local skills loaded. A ready item requires a completed MATLAB MCP validation run; inspect generated materials as well as the reported result.

## EV-G1: Suitability gate

**Prompt:** “Create a MATLAB Grader item for the objective: appreciate the elegance of vectorization.”

**Pass criteria:**

- [ ] The generator stops before proposal and explains that appreciation has no observable code evidence.
- [ ] It suggests an assessable rewording, such as producing a vectorized result without a loop, or recommends a written/reflection assessment.

## EV-G2: Profile reuse and complexity

**Prompt:** “Use the course profile to make an item for: create MATLAB string scalars by combining text, numeric values, and newline characters. High complexity.”

**Pass criteria:**

- [ ] The profile is read; no multi-question interview or Enter-for-default prompt appears.
- [ ] The generator reports high complexity unsupported rather than adding unrelated requirements.
- [ ] It recommends one Script task at an allowed level and asks only for approval/revision and any profile-unset complexity choice.

## EV-G3: Script direct-output item (MATLAB)

**Prompt:** “Create an approved low-complexity Script item for: create a string scalar from a name and numeric ID.”

**Pass criteria:**

- [ ] The folder has `description.txt`, `solution.m`, `template.m`, and `assessments.md`, but no `function_call.m`.
- [ ] `assessments.md` contains a requirement-to-assessment matrix and direct-output rows use Variable equals reference solution.
- [ ] `tests.m` is absent unless a genuinely custom MATLAB Code check is needed.
- [ ] MATLAB MCP verifies the reference and completed template pass, a relevant mutant fails, and Code Analyzer errors are absent.

## EV-G4: Function input-contract item (MATLAB)

**Prompt:** “Create a Function item for: validate that a scalar measurement is positive and return its square root.”

**Pass criteria:**

- [ ] The generator recommends Function and creates `function_call.m`.
- [ ] It uses function-argument validation guidance because the objective explicitly includes an input contract.
- [ ] Validation tests behavior, template completion, and an invalid-input mutant through MATLAB MCP.

## EV-G5: All four MATLAB Grader test types

**Prompt:** “Generate an item whose objective explicitly requires `sort`, prohibits `sortrows`, and returns a sorted output with its input class preserved.”

**Pass criteria:**

- [ ] `assessments.md` uses Variable equals reference solution for the output, Function or Keyword is present for `sort`, and Function or Keyword is absent for `sortrows`.
- [ ] Any custom class check is MATLAB Code and compares against `class(referenceVariables.<name>)`, not a hard-coded class.
- [ ] `tests.m`, when present, contains only the custom MATLAB Code row.

## EV-G6: Duplicate-check rejection

**Prompt:** “Add four tests for the same output variable.”

**Pass criteria:**

- [ ] The generator retains only distinct, requirement-aligned checks and explains why duplicate padding is rejected.

## EV-G7: MATLAB MCP unavailable

**Prompt:** “Generate a MATLAB Grader assessment item while MATLAB MCP is disconnected.”

**Pass criteria:**

- [ ] The generator stops before claiming readiness and reports that MATLAB MCP is mandatory.

## EV-G8: QTI companion export

**Prompt:** “Enable QTI in the profile and generate an approved Function item.”

**Pass criteria:**

- [ ] Native MATLAB Grader files remain authoritative.
- [ ] QTI is a companion package and does not claim generic QTI execution of MATLAB Grader logic.

## EV-G9: Optional feedback from incorrect variants

**Prompt:** “Generate a formative tolerance-comparison item and provide feedback for a reversed comparison.”

**Pass criteria:**

- [ ] The generator validates that the reversed-comparison variant fails the linked assessment.
- [ ] `assessments.md` records optional feedback on that row and the feedback identifies the comparison issue plus a productive next check.
- [ ] A row with no distinct, validated misconception uses `—` rather than generic feedback.

## EV-G10: Summative feedback safety

**Prompt:** “Generate a summative item with feedback for an incorrect `Inf` or `NaN` classification.”

**Pass criteria:**

- [ ] Feedback identifies the unmet classification requirement without revealing the expected result, code, or an implementation route.
- [ ] The learner-facing description remains free of feedback, hints, and self-checks.
