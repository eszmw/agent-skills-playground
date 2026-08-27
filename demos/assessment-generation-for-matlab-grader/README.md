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

`assessments.md` has one row per assessment. It identifies the Grader Test Type, exact UI fields, any code to paste, expected evidence, optional feedback on incorrect submissions, and learning-objective traceability.

## Configuring MATLAB Grader

For each row in `assessments.md`, select the listed test type and enter its UI fields exactly:

- **Variable equals reference solution**: enter the listed student variable or expression. Use this for direct output equality; MATLAB Grader compares it with the reference solution.
- **MATLAB Code**: for Script items, derive custom expected values from
  `referenceVariables.<name>`. For Function items, assign test inputs, call
  both the learner function and `reference.<functionName>`, then compare their
  outputs with `assessVariableEqual`. This avoids recreating reference logic.
- **Function or Keyword is present**: use only when the objective explicitly requires the named construct.
- **Function or Keyword is absent**: use only when the item explicitly requires an implementation rather than a named prohibited shortcut.

The generator rejects duplicated checks and never pads an item to a fixed number of tests. `tests.m` contains only MATLAB Code rows; the other three Grader test types are represented solely by their documented setup in `assessments.md`.

## Feedback on incorrect submissions

The generator can add optional feedback to an assessment row when a targeted incorrect
variant exposes a useful misconception. Formative feedback can name a productive next
check and, when useful, a guided correction. Summative feedback is diagnosis only: it
identifies the unmet requirement without revealing code, expected values, solution steps,
or hidden-test details. Rows without a distinct, validated misconception have no feedback.

## Quality gates and validation

Before an item is ready, the workflow:

1. Runs MATLAB Code Analyzer and applies MATLAB coding guidance to the solution, template, function-call block, and transient validation code.
2. Rejects analyzer errors and resolves or reports warnings. Generated materials use descriptive names, modern string syntax, and no shadowed built-ins or unsafe dynamic-workspace functions.
3. Creates a temporary, class-based `matlab.unittest` harness outside the item folder. MATLAB MCP runs it against the reference solution, a completed template, and targeted incorrect variants.
4. Fails validation if the reference does not pass, a concept-specific mutant does not fail, a nonempty feedback entry lacks a linked mutant, or a description/template/assessment requirement disagrees.

This confirms MATLAB behavior and the documented Grader configuration model. It does not replace the instructor’s final paste/configuration and preview in MATLAB Grader. Function argument-validation guidance is used only when an objective explicitly includes an input-contract outcome; introductory functions do not receive an `arguments` block by default.

## Example course materials

[`FundamentalsOfProgramming/Data/`](FundamentalsOfProgramming/Data/) contains eight summative Script items:

- Floating-point limitations: `compare_floating_point_values_with_tolerance` (low) and `floating_point_tolerance_check` (moderate).
- Textual strings: `create_a_student_welcome_message` (low) and `generate_a_data_collection_status_message` (moderate).
- Whitespace in strings: `concatenate_strings_with_whitespace` (low) and `build_a_multiline_event_notice` (moderate).
- Special values: `generate_and_identify_special_values` (low) and `classify_special_value_arithmetic` (moderate).

The profile allows high complexity for floating-point and special-value objectives only. Standalone strings and whitespace objectives support low and moderate complexity.

## Evals

[`evals/README.md`](evals/README.md) contains scenario-based checks, including unsuitable objectives, profile reuse, infeasible complexity, all four MATLAB Grader test types, reference-based custom checks, duplicate rejection, quality gates, and MCP failures.

Run `python scripts/validate_skill_layout.py` to verify source/install parity,
Script-and-Function-only scope, staged reference loading, and current Function
assessment guidance.

## Selected Sources

- Biggs, J. (1996). Enhancing teaching through constructive alignment. *Higher
  Education, 32*, 347-364. DOI: 10.1007/BF00138871.
- Black, P., & Wiliam, D. (1998). Assessment and classroom learning. *Assessment in
  Education: Principles, Policy & Practice, 5*(1), 7-74. DOI:
  10.1080/0969595980050102.
- Bowen, J. D. (2004). An automated grading system for teaching MATLAB to freshman
  engineers. *ASEE Annual Conference & Exposition Proceedings*.
- Hattie, J., & Timperley, H. (2007). The power of feedback. *Review of Educational
  Research, 77*(1), 81-112. DOI: 10.3102/003465430298487.
- Introduction to MATLAB zyBook by Amirtharajah. MathWorks MATLAB Grader textbook
  listing. Use as a MATLAB Grader-aligned instructional reference for introductory
  MATLAB assessment items, especially when designing self-paced formative practice
  and automatically assessed code exercises.
- Messer, M., Brown, N. C. C., Kölling, M., & Shi, M. (2024). Automated grading and
  feedback tools for programming education: A systematic review. *ACM Transactions on
  Computing Education, 24*(1). DOI: 10.1145/3636515.
- Paiva, J. C., Leal, J. P., & Figueira, Á. (2022). Automated assessment in computer
  science education: A state-of-the-art review. *ACM Transactions on Computing
  Education, 22*(3). DOI: 10.1145/3513140.
- Ramos, J., Trenas, M. A., Gutiérrez, E., & Romero, S. (2013). E-assessment of
  MATLAB assignments in Moodle: Application to an introductory programming course for
  engineers. *Computer Applications in Engineering Education, 21*(4), 728-736.
- Shute, V. J. (2008). Focus on formative feedback. *Review of Educational Research,
  78*(1), 153-189. DOI: 10.3102/0034654307313795.

## Credits

This demo is inspired by Andre Knoesen’s [MATLAB Grader Problem Generator](https://github.com/VeriQAi/MatlabGraderProblemGenerator), a web application built on the Anthropic API.
