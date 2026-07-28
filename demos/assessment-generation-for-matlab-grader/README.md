# Grader Assessment Generation

A demo showing how an agent can generate complete MATLAB Grader assessment items from a single learning objective.
The agent interviews you about the objective and assessment context, proposes candidate assessment items at varied difficulty, and writes ready-to-review artifact files for each item you select.

The generator helps instructors save authoring time while producing consistent, research-informed assessment materials that can be reviewed, revised, and shared across MATLAB Grader workflows.

## What you'll do

You'll open this folder in your agent and state a learning objective.
The `matlab-generate-grader-assessments` skill walks you through choosing an assessment item type, picking from generated assessment item ideas, and writing the artifact files into your working directory.
Every generated item lands as a self-contained folder you paste into MATLAB Grader field by field.

If you are planning a course rollout rather than a single item, the instructor setup skill produces an adoption guide first: a recommended item type and assessment purpose, starter prompts for the `matlab-generate-grader-assessments` skill, review gates, and a first-pilot checklist.

## Skills included

| Skill | Role |
|---|---|
| [`matlab-generate-grader-assessments`](skills/matlab-generate-grader-assessments/SKILL.md) | The generator: collects inputs, proposes assessment item options, then writes description, solution, template, tests, and optional QTI 3 interchange files per item. |
| [`matlab-plan-grader-adoption`](skills/matlab-plan-grader-adoption/SKILL.md) | Instructor planning path: produces a course-specific setup guide, starter prompts, review gates, and QTI 3 sharing guidance. |

The `matlab-generate-grader-assessments` skill draws on prompt references under `skills/matlab-generate-grader-assessments/references/`, including a research summary on formative and summative assessment design that shapes how tests and hints are generated.

## Prerequisites

- An agent that can load local Markdown-based skills and write files to the working directory, such as [Claude Code](https://claude.ai/code).
- Access to [MATLAB Grader](https://www.mathworks.com/products/matlab-grader.html) to use the generated content.

Generation itself needs no MATLAB installation.
The output is MATLAB code, so reviewing it in MATLAB before assigning it to students is recommended.

## Setup

1. **Clone this repo** if you haven't already:
   ```bash
   git clone https://github.com/matlab/agent-skills-playground.git
   ```
2. **Open the demo folder** in your agent. Two options:
   - **Claude Code**: from a terminal, `cd` into `demos/assessment-generation-for-matlab-grader/` and run `claude`. The agent will pick up the skills in this folder's `skills/` directory.
   - **Other agents**: point the agent at `demos/assessment-generation-for-matlab-grader/skills/` per the agent's instructions for user-defined skills.

## Walkthrough

Start with a learning objective:

> *Create MATLAB Grader assessment items for this learning objective: use vectorized operations to normalize data.*

The `matlab-generate-grader-assessments` skill takes over and collects the remaining inputs one at a time:

| Input | Choices |
|---|---|
| Assessment item type | Script, Function, Class, or Object usage |
| Class assessment | For Class items: constructor, computed property, instance method, constant property, or operator overloading |
| Number of options | 2 to 6 candidate item ideas (default 4) |
| Assessment purpose | Formative, summative, or both |
| QTI 3 export | Optional interchange files for portability and sharing |

The agent then presents candidate assessment items in a table with difficulty and concept focus.
Pick the ones you want, and the agent generates each item's artifacts sequentially: description, reference solution, learner template, function call block when applicable, and tests.

For the instructor planning path, start instead with:

> *I'm introducing MATLAB Grader in an introductory programming course. Generate an instructor setup guide for the module on writing functions.*

## What gets generated

Each selected assessment item becomes one folder with these files:

| File | Goes into MATLAB Grader field |
|---|---|
| `description.txt` | Assessment Item Description & Instructions |
| `solution.m` | Reference Solution |
| `template.m` | Learner Template |
| `function_call.m` | Code to call your function (Function items only) |
| `tests.m` | Assessments; each `%% Test N:` section becomes a separate test |
| `supporting_class.m` | Supporting Files (Object usage items only) |
| `qti3/` | Optional QTI 3 interchange package for sharing and review |

Generated tests follow quality rules from the skill: randomized inputs via `randi` or `randperm`, one `assessVariableEqual` call per test section, 3 to 5 tests, and at least one hardcoding-detection test on a different numeric range.

Review all generated materials before using them in an assessment.

## Example output

[`examples/vector_range_normalization/`](examples/vector_range_normalization/) is a complete Function-type assessment item produced with this skill for the objective *use vectorized operations to normalize data*, summative purpose.
It shows the artifact set you can expect: student-facing description, reference solution, learner template with blanks, a pre-submit function call block, and four randomized tests including hardcoding detection.
The solution and tests were verified against each other in MATLAB over randomized inputs.

## Evals

[`evals/`](evals/) contains scenario-based checks for these skills: user prompts, scripted replies, and pass-criteria checklists.
Run them after modifying a skill, or read them as worked examples of expected behavior.

## Credits

The concept of generating complete MATLAB Grader assessment items from a learning objective comes from Andre Knoesen (UC Davis) and his [MATLAB Grader Problem Generator](https://github.com/VeriQAi/MatlabGraderProblemGenerator), a web application built on the Anthropic API.
This demo reimplements that idea as portable agent skills, based on the MATLAB Grader Assessment Item Generator skill package by The MathWorks, Inc.

## Related products from MathWorks

- [MATLAB Grader](https://www.mathworks.com/products/matlab-grader.html): browser-based environment for authoring and autograding MATLAB coding assessments.
- [MATLAB](https://www.mathworks.com/products/matlab.html): programming and numeric computing platform.
