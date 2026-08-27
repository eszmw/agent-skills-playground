---
name: matlab-generate-grader-assessments
description: Generate MATLAB Grader assessment items that are suitability-gated, profile-driven, feedback-aware, and validated through MATLAB MCP. Produces Script or Function items with MATLAB Grader assessment setup instructions.
license: MathWorks BSD-3-Clause (see LICENSE)
metadata:
  author: MathWorks
  version: "2.0"
---

# MATLAB Grader Assessment Item Generator

Generate complete, reviewable MATLAB Grader assessment items from an observable MATLAB-code learning objective. This skill supports only **Script** and **Function** submissions. It does not generate Class or Object-usage assessment items.

An item folder contains `description.txt`, `solution.m`, `template.m`, `assessments.md`, and, for Function items, `function_call.m`. `tests.m` is created only when the item needs one or more **MATLAB Code** assessments.

## Staged loading

Read `matlab-grader-course-profile.md` in the course-material root before
proposing an item. If it is absent, complete the one-time setup below first.

Load reference files only for the current stage:

| Stage | Load |
| --- | --- |
| Suitability and proposal | `references/assessment-item-types.md`, `references/options-prompt.md` |
| Student artifacts | `references/description-prompt.md`, `solution-prompt.md`, `template-prompt.md` |
| Function artifacts | `references/function-call-prompt.md` |
| Assessment configuration | `references/tests-prompt.md` |
| Assessment rationale or feedback design | `references/assessment-research.md` |
| QTI export | `references/qti3-prompt.md` |
| Combined output | `references/all-grader-items-template.md` |

Do not preload references for later stages.

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

For each objective, present exactly one recommended title and task statement. Titles must describe the learning behavior and must not include a command or keyword checked by an assessment for that item. Ask only for approval or revision, and for a complexity decision only when the profile leaves it undecided. Explain “both” only when it is selected: the same item is designed for formative revision and later summative use.

## Combined single-file output

After the requested item proposals are approved and before generating artifacts, ask once per batch whether the user wants a combined `AllGraderItems.md` output. Do not ask again when the user has already explicitly requested or declined it.

- If the user selects combined output, read `references/all-grader-items-template.md` and create `AllGraderItems.md` in the profile output location.
- The file is an instructor-facing companion, not a replacement for the native item folders. Include each generated item’s title, student description, submission type, reference solution, learner template, assessment setup, and only optional feedback entries supported by validated incorrect variants. When the reference solution is a Function, also include the standard field **How to call the function (when the learner clicks 'Run')** containing the `function_call.m` content.
- If the user declines combined output, generate only the native item folders and their enabled QTI companions.

## Generate the native artifacts

Create one folder named with a snake_case title under the profile output location.

### Description, solution, template, and call block

- Generate only Script or Function code. Use descriptive names, modern string syntax for new text, and no shadowed built-ins, `eval`, `evalin`, or `assignin`.
- Keep description and template requirements consistent with the solution.
- For **summative** items, descriptions must contain no hints, self-checks, suggested functions, solution approaches, or answer-revealing implementation guidance. State a function, construct, or approach directly in the numbered instructions only when the learning objective explicitly requires it.
- For **formative** items, a brief non-answer-revealing self-check is allowed. For **both**, include only the formative guidance explicitly approved for revision use and do not reveal summative assessment details.
- For Function items, create `function_call.m` as a short student-facing call block with representative inputs and no assertions. In combined single-file output, present this block under **How to call the function (when the learner clicks 'Run')**.
- Create QTI 3 as an optional companion only when enabled by the profile. It preserves native artifacts but does not execute MATLAB Grader logic in a generic QTI player.

### MATLAB Grader assessment model

`assessments.md` is the authoritative MATLAB Grader setup guide. It must contain a requirement-to-assessment matrix and one row per configured assessment with:

| Requirement / LO evidence | Grader Test Type | MATLAB Grader UI fields | Code to paste | Expected evidence | Optional feedback on incorrect submission | Traceability |
| --- | --- | --- | --- | --- | --- |

Use these test types precisely:

- **Variable equals reference solution** only for direct equality of exactly one student variable in a Script submission. Put that single variable in the relevant UI field; do not recreate expected logic in code. Do not use this test type for Function submissions.
- **MATLAB Code** for custom checks that direct equality cannot express, including one assessment that compares multiple student variables and every Function-submission output check. A Function assessment must be self-contained: assign its test inputs, call the learner function, call the matching reference function through `reference.<functionName>`, then compare the learner output with `assessVariableEqual`. For example, `greeting = greetUser(name); greetingReference = reference.greetUser(name); assessVariableEqual('greeting', greetingReference);`. Never recreate reference-solution logic or assume that `function_call.m` variables or `referenceVariables` exist in the assessment workspace. For class-sensitive results, compare the learner class with `class(reference.<functionName>(...))`, never a hard-coded class literal.
- **Function or Keyword is present** only when the objective explicitly requires that named construct.
- **Function or Keyword is absent** only when the objective explicitly requires implementation rather than a named prohibited shortcut.

For Script submissions, **Variable equals reference solution** passes a learner value within ±0.1% relative tolerance or ±0.0001 absolute tolerance of the reference value. Use this default for ordinary numeric comparisons, including floating-point roundoff. To override either tolerance, configure the assessment as **MATLAB Code** and call `assessVariableEqual` with `RelativeTolerance` or `AbsoluteTolerance`.

For every configured assessment, provide a concise learner-visible assessment name in its MATLAB Grader UI fields. An assessment name for a **Function or Keyword is present** or **Function or Keyword is absent** row must describe the behavior being assessed and must not include the command or keyword checked by that row. Put the checked command or keyword only in the relevant configuration field.

Create `tests.m` only for MATLAB Code rows. Split it into clearly labeled sections, one per custom assessment. Do not use a fixed number of tests. Every check must be distinct, objective-aligned, and traceable. Reject duplicated test logic.

Fail generation when the description, template, solution, stated requirements, and `assessments.md` disagree.

### Optional feedback on incorrect submissions

During item development, create and validate targeted incorrect variants for plausible conceptual or syntactic mistakes. For each distinct assessment row, generate feedback only when a validated variant reveals a useful misconception. Do not add generic or duplicate feedback merely to fill every row.

- For **formative** items, feedback identifies the failed requirement and a productive next check. A guided correction is allowed when it is educationally useful.
- For **summative** items, feedback is diagnosis only: identify the unmet requirement or misconception without code, expected values, solution steps, or hidden-test details.
- For **both** items, label any guided feedback as formative-only so instructors can omit it in a summative deployment.
- Put the optional text in the matrix column and tell the instructor to paste it into the feedback field for that MATLAB Grader assessment. Use `—` when feedback is not appropriate.

## Quality gates and validation

Before marking output ready:

1. Use `matlab-review-code` for every generated reference solution, template, function-call block, and temporary validation code. Run MATLAB Code Analyzer and consult the MATLAB coding guidelines. Errors fail generation. Resolve warnings or report why they remain. Enforce descriptive names, modern string usage, no shadowed built-ins, and no unsafe dynamic-workspace functions.
2. Invoke `matlab-validate-function-arguments` only for Function items whose objective or profile explicitly includes an input contract or argument-validation outcome. Do not add an `arguments` block merely because an item is a Function item.
3. In an operating-system temporary directory outside the repository and instructor-facing item folder, create a class-based `matlab.unittest` harness. Use `matlab-testing` and run it through MATLAB MCP against the reference solution, a completed learner template, and targeted incorrect variants. Confirm the reference and completed template pass, concept-specific mutants fail, every requirement in the matrix is represented, and every nonempty feedback entry is backed by its linked mutant.
4. Do not leave the transient harness in the instructor-facing item folder. Report the MCP run result and its limits: it validates MATLAB behavior and the documented configuration model, while the instructor still pastes/configures the rows in MATLAB Grader.

## Output summary

For each item, report its title, approved complexity, folder, files, number and type of configured assessments, number of optional feedback entries, and the completed MATLAB MCP validation result. When created, also report the path to `AllGraderItems.md`. Never claim validation when MATLAB MCP did not complete.

## Credits

This skill is inspired by Andre Knoesen’s [MATLAB Grader Problem Generator](https://github.com/VeriQAi/MatlabGraderProblemGenerator), a web application built on the Anthropic API.
