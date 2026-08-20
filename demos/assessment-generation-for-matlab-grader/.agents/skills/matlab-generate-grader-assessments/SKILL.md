---
name: matlab-generate-grader-assessments
description: Generate MATLAB Grader assessment items that are suitability-gated, profile-driven, and validated through MATLAB MCP. Produces Script or Function items with MATLAB Grader assessment setup instructions.
license: MathWorks BSD-3-Clause (see LICENSE)
metadata:
  author: MathWorks
  version: "2.0"
---

# MATLAB Grader Assessment Item Generator

Generate complete, reviewable MATLAB Grader assessment items from an observable MATLAB-code learning objective. This skill supports only **Script** and **Function** submissions. It does not generate Class or Object-usage assessment items.

An item folder contains `description.txt`, `solution.m`, `template.m`, `assessments.md`, and, for Function items, `function_call.m`. `tests.m` is created only when the item needs one or more **MATLAB Code** assessments.

## Required inputs and references

Read these files before generating:

- `matlab-grader-course-profile.md` in the course-material root. If it is absent, conduct the one-time explicit setup in the next section and write it before proceeding.
- `references/assessment-research.md`
- `references/assessment-item-types.md`
- `references/description-prompt.md`, `solution-prompt.md`, `template-prompt.md`, and `function-call-prompt.md` as applicable.
- `references/tests-prompt.md` for the Grader assessment model.
- `references/qti3-prompt.md` only if the course profile enables QTI.

MATLAB MCP is mandatory. Confirm that a working MATLAB MCP session can run a small MATLAB command before proposing or generating an item. If it cannot, stop and say that generation is blocked; do not claim that code or assessments have been validated.

Use `matlab-read-doc` when current MATLAB Grader behavior or MATLAB syntax needs verification. Use `matlab-debugging` only to diagnose a failed MATLAB MCP validation.

## One-time course profile setup

Create `matlab-grader-course-profile.md` with YAML front matter and readable Markdown body. Ask explicit questions for only missing values; never present “press Enter for defaults.”

The front matter must include:

```yaml
---
profile_version: 1
output_location: assessments
assessment_purpose: summative
qti3_export: false
require_matlab_mcp: true
coding_practice_progression:
  enabled: true
  low: [descriptive names, string literals for new text]
  moderate: [descriptive names, string literals for new text, avoid unsafe dynamic-workspace functions]
  high: [descriptive names, string literals for new text, avoid unsafe dynamic-workspace functions, concise functions]
learning_objectives:
  - objective: "..."
    allowed_complexity: [low, moderate]
    preferred_submission: Script
---
```

Document that `low`, `moderate`, and `high` are the only complexity labels. The coding-practice progression is an authoring gate and learner guidance; it is not a student scoring criterion unless a future objective explicitly makes it assessable.

## Suitability and proposal gate

Before generation, determine whether the objective has observable MATLAB-code evidence: a workspace variable, function output, required construct, prohibited shortcut, or input-contract behavior.

- If it does not, stop. Explain why MATLAB Grader cannot directly observe the objective, propose an assessable rewording, or recommend another modality such as a written explanation, design review, or manual rubric.
- If it does, recommend Script or Function and give a brief rationale.
- Read the objective’s allowed complexity from the profile. If the requested level is not supported, report that it is unsupported and do not add unrelated requirements to inflate complexity.

For each objective, present exactly one recommended title and task statement. Ask only for approval or revision, and for a complexity decision only when the profile leaves it undecided. Explain “both” only when it is selected: the same item is designed for formative revision and later summative use.

## Generate the native artifacts

Create one folder named with a snake_case title under the profile output location.

### Description, solution, template, and call block

- Generate only Script or Function code. Use descriptive names, modern string syntax for new text, and no shadowed built-ins, `eval`, `evalin`, or `assignin`.
- Keep description and template requirements consistent with the solution.
- For Function items, create `function_call.m` as a short student-facing call block with representative inputs and no assertions.
- Create QTI 3 as an optional companion only when enabled by the profile. It preserves native artifacts but does not execute MATLAB Grader logic in a generic QTI player.

### MATLAB Grader assessment model

`assessments.md` is the authoritative MATLAB Grader setup guide. It must contain a requirement-to-assessment matrix and one row per configured assessment with:

| Requirement / LO evidence | Grader Test Type | MATLAB Grader UI fields | Code to paste | Expected evidence | Traceability |
| --- | --- | --- | --- | --- | --- |

Use these test types precisely:

- **Variable equals reference solution** for direct output equality. Put the student variable or expression in the relevant UI field; do not recreate expected logic in code.
- **MATLAB Code** only for custom checks that direct equality cannot express. Derive expected values from `referenceVariables.<name>`; never recreate reference-solution logic. For class-sensitive results, compare the student class with `class(referenceVariables.<name>)`, never a hard-coded class literal.
- **Function or Keyword is present** only when the objective explicitly requires that named construct.
- **Function or Keyword is absent** only when the item explicitly requires implementation rather than a named prohibited shortcut.

Create `tests.m` only for MATLAB Code rows. Split it into clearly labeled sections, one per custom assessment. Do not use a fixed number of tests. Every check must be distinct, objective-aligned, and traceable. Reject duplicated test logic.

Fail generation when the description, template, solution, stated requirements, and `assessments.md` disagree.

## Quality gates and validation

Before marking output ready:

1. Use `matlab-review-code` for every generated reference solution, template, function-call block, and temporary validation code. Run MATLAB Code Analyzer and consult the MATLAB coding guidelines. Errors fail generation. Resolve warnings or report why they remain. Enforce descriptive names, modern string usage, no shadowed built-ins, and no unsafe dynamic-workspace functions.
2. Invoke `matlab-validate-function-arguments` only for Function items whose objective or profile explicitly includes an input contract or argument-validation outcome. Do not add an `arguments` block merely because an item is a Function item.
3. In a temporary location outside the instructor-facing item folder, create a class-based `matlab.unittest` harness. Use `matlab-testing` and run it through MATLAB MCP against the reference solution, a completed learner template, and targeted incorrect variants. Confirm the reference and completed template pass, concept-specific mutants fail, and every requirement in the matrix is represented.
4. Do not leave the transient harness in the instructor-facing item folder. Report the MCP run result and its limits: it validates MATLAB behavior and the documented configuration model, while the instructor still pastes/configures the rows in MATLAB Grader.

## Output summary

For each item, report its title, approved complexity, folder, files, number and type of configured assessments, and the completed MATLAB MCP validation result. Never claim validation when MATLAB MCP did not complete.

## Credits

This skill is inspired by Andre Knoesen’s [MATLAB Grader Problem Generator](https://github.com/VeriQAi/MatlabGraderProblemGenerator), a web application built on the Anthropic API.
