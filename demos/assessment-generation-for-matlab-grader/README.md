# MATLAB Grader assessment generation

This demo generates MATLAB Grader assessment items from learning objectives that have observable MATLAB-code evidence. The workflow is profile-driven, uses only Script and Function submissions, and requires a working MATLAB MCP session for generation preflight and validation.

## Prerequisites

- An agent that can load the local skills and write course materials.
- MATLAB with a connected MATLAB MCP session. The generator verifies code, templates, mutants, and assessment traceability through that session; it does not mark an item ready when MCP validation cannot run.
- Access to [MATLAB Grader](https://www.mathworks.com/products/matlab-grader.html) to configure the completed item.

## Course profile and suitability gate

[`matlab-grader-course-profile.md`](matlab-grader-course-profile.md) is the committed, versioned source of reusable defaults: output location, purpose, QTI preference, MCP requirement, coding-practice guidance, and the allowed `low`, `moderate`, and `high` complexity levels for each objective.

On first use, the generator conducts explicit setup for missing profile values. It never asks an instructor to press Enter for a default. On later uses it reads the profile, first evaluates whether the objective has observable code evidence, and then recommends Script or Function with a rationale. If the objective is unsuitable, it stops with an assessable rewording or a better assessment modality. If the requested complexity is unsupported, it reports that rather than adding unrelated difficulty.

The generator proposes one titled task and task statement per objective. The only follow-up is approval or revision, plus a complexity decision if the profile does not already specify one. “Both” is explained only when selected: the item is designed for formative revision and later summative use.

## What gets generated

Each item has the following instructor-facing files:

| File | MATLAB Grader use |
| --- | --- |
| `description.txt` | Assessment Item Description & Instructions |
| `solution.m` | Reference Solution |
| `template.m` | Learner Template |
| `function_call.m` | Code to call your function, for Function items only |
| `assessments.md` | Authoritative setup guide and requirement-to-assessment matrix |
| `tests.m` | Only for rows configured as MATLAB Code assessments |
| `qti3/` | Optional companion interchange package |

`assessments.md` has one row per assessment. It identifies the Grader Test Type, exact UI fields, any code to paste, expected evidence, and learning-objective traceability.

## Configuring MATLAB Grader

For each row in `assessments.md`, select the listed test type and enter its UI fields exactly:

- **Variable equals reference solution**: enter the listed student variable or expression. Use this for direct output equality; MATLAB Grader compares it with the reference solution.
- **MATLAB Code**: paste only the supplied custom check. Expected values must come from `referenceVariables.<name>`, so the check does not duplicate reference logic. For class-sensitive outcomes, compare with `class(referenceVariables.<name>)`.
- **Function or Keyword is present**: use only when the objective explicitly requires the named construct.
- **Function or Keyword is absent**: use only when the item explicitly requires an implementation rather than a named prohibited shortcut.

The generator rejects duplicated checks and never pads an item to a fixed number of tests. `tests.m` contains only MATLAB Code rows; the other three Grader test types are represented solely by their documented setup in `assessments.md`.

## Quality gates and validation

Before an item is ready, the workflow:

1. Runs MATLAB Code Analyzer and applies MATLAB coding guidance to the solution, template, function-call block, and transient validation code.
2. Rejects analyzer errors and resolves or reports warnings. Generated materials use descriptive names, modern string syntax, and no shadowed built-ins or unsafe dynamic-workspace functions.
3. Creates a temporary, class-based `matlab.unittest` harness outside the item folder. MATLAB MCP runs it against the reference solution, a completed template, and targeted incorrect variants.
4. Fails validation if the reference does not pass, a concept-specific mutant does not fail, or a description/template/assessment requirement disagrees.

This confirms MATLAB behavior and the documented Grader configuration model. It does not replace the instructor’s final paste/configuration and preview in MATLAB Grader. Function argument-validation guidance is used only when an objective explicitly includes an input-contract outcome; introductory functions do not receive an `arguments` block by default.

## Example course materials

[`FundamentalsOfProgramming/Data/`](FundamentalsOfProgramming/Data/) contains regenerated Script items for string construction:

- `create_a_student_welcome_message` — low complexity.
- `build_a_multiline_event_notice` — moderate complexity.
- `generate_a_data_collection_status_message` — moderate complexity.

The profile records that this strings objective does not support high complexity without distorting what is being assessed.

## Evals

[`evals/README.md`](evals/README.md) contains scenario-based checks, including unsuitable objectives, profile reuse, infeasible complexity, all four MATLAB Grader test types, reference-variable custom checks, duplicate rejection, quality gates, and MCP failures.

## Credits

This demo is inspired by Andre Knoesen’s [MATLAB Grader Problem Generator](https://github.com/VeriQAi/MatlabGraderProblemGenerator), a web application built on the Anthropic API.
