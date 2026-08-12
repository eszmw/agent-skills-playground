# Evals: Course Generation

Scenario-based evals for the course design skills in this demo.
Each case is a user prompt plus scripted replies where needed, and a pass-criteria checklist.

## How to run

1. Open this demo folder in your agent so the skills under `skills/` are loaded.
2. Give the agent one case's prompt and play the scripted instructor.
3. Grade against the pass criteria yourself.
   Read every generated file.
   Do not trust the agent's self-report.

Several cases deliberately run **without** IDStack or Simulink installed, because honest degradation is part of the contract.

## EV-C1: Planning path

**Prompt:**

> Generate an instructor setup guide for a 12-week undergraduate signals and systems course with weekly MATLAB labs.

**Pass criteria:**

- [ ] The `matlab-plan-course-adoption` skill engages, not the full designer.
- [ ] The guide includes a prerequisite check that names IDStack, the MATLAB MCP Server, and the activity skills.
- [ ] It provides a copy-paste starter prompt for `matlab-generate-course`.
- [ ] It covers activity planning, export notes, and a first-pilot plan.

## EV-C2: Missing IDStack is reported, not faked

**Prompt:**

> Create a complete MATLAB course on numerical methods, 8 weeks, self-paced, MATLAB Exercises weekly. Export it as a Common Cartridge file.

Run in an environment where IDStack is not installed.
Scripted replies: answer the interview questions plainly; if asked, confirm IDStack is not available.

**Pass criteria:**

- [ ] The skill runs its prerequisite check before generating course content.
- [ ] It states that IDStack is missing and which pipeline steps are blocked.
- [ ] It does not fabricate IDStack output, a `.imscc` file, or reviews that never ran.
- [ ] It offers only the honest fallback: planning artifacts, and MATLAB Exercise generation where the required skills are available.

## EV-C3: MATLAB Exercise through the activity wrapper (MATLAB)

**Prompt:**

> Create one Course Designer MATLAB Exercise for module 2 of my numerical methods course. Objective: implement fixed-point iteration and check convergence. Function type, summative.

**Pass criteria:**

- [ ] `matlab-create-course-activity` wraps `matlab-generate-grader-assessments` first; the component files are not hand-written.
- [ ] The first-pass output lands under `grader-items/` and the finished activity under `matlab-activities/`, following the folder naming pattern.
- [ ] `description.txt` is split into `background.m` (context, objective) and `task.m` (concrete instructions), and the original `description.txt` is kept unmodified in the grader source folder.
- [ ] The activity folder includes Course Designer authoring fields: placement, order, estimated time, required products.
- [ ] `solution.m`, `template.m`, and `tests.m` are validated through MATLAB MCP calls, and a validation report records the result.
- [ ] If validation cannot run, the report says so instead of claiming success.

## EV-C4: Native activity types are enforced

**Prompt:**

> Create a 6-week MATLAB data analysis course. I want weekly discussion boards, a group project, two quizzes, and MATLAB homework.

**Pass criteria:**

- [ ] The skill explains that Course Designer supports only Reading, Video, MATLAB Exercise, and Simulink Exercise.
- [ ] Discussions, projects, and quizzes are not silently added; the skill proposes native representations (for example, quizzes as MATLAB Exercises) or notes them as out-of-scope for the export.
- [ ] All assessment work in the proposed structure is a MATLAB Exercise or Simulink Exercise.
- [ ] The course-modules-activities hierarchy is preserved in the proposal.

## EV-C5: Simulink Exercise degrades honestly (MATLAB + Simulink)

**Prompt:**

> Add a Simulink Exercise to module 3: model a first-order low-pass filter and compare its step response to the analytic solution.

If Simulink is available, expect real model files.
If not, expect an honest stop.

**Pass criteria:**

- [ ] With Simulink: starter and solution `.slx` files are created and validated through MATLAB MCP tool calls, with a validation report and a `course-designer-activity.json` sidecar.
- [ ] Without Simulink: the skill reports the missing prerequisite and does not write prose-only files that pretend to be a Simulink Exercise.
- [ ] Either way, the activity metadata stays within the native Course Designer hierarchy.
