# MATLAB and Simulink Activity Rules

Use these rules when adding MATLAB and Simulink work to a course. In MATLAB
Course Designer terms, every piece of learner-facing work is a learning
activity inside an ordered module.

## Alignment Rules

- Every activity must map to one module objective and one observable learner
  performance.
- Every generated activity must have a stable Course Designer placement:
  module order, activity order, title, and learning activity type.
- Use only native Course Designer activity types: Reading, Video, MATLAB
  Exercise, and Simulink Exercise. Do not create discussion, generic
  assignment, project, quiz, standalone MATLAB Grader, or QTI 3 activity types.
- Use MATLAB activities for computation, programming, data analysis,
  visualization, algorithmic thinking, apps, and toolbox workflows.
- Use Simulink activities for dynamic systems, block diagrams, simulation,
  controls, physical modeling, model verification, and system-level workflows.
- Do not add both MATLAB and Simulink work to a module by default. Add both only
  when the objective needs both textual code and model-based reasoning.

## MATLAB Exercise Learning Activity Patterns

Build MATLAB Exercises with `matlab-create-course-activity`:

1. Use `matlab-create-course-activity` to wrap the existing `matlab-generate-grader-assessments` skill and generate
   the shared MATLAB Grader-style component parts: student-facing description,
   learner template, reference solution, and tests.
2. Validate `solution.m`, `template.m`, and `tests.m` with MATLAB MCP Server
   tool calls.
3. Split `description.txt` into `background.m` and `task.m` plaintext files for
   copy/paste into the MATLAB Course Designer web application. `background.m`
   must set task context, explain the learning objective, and provide high-level
   information learners need. `task.m` must provide the concrete instructions
   learners follow, including required functions, variables, filenames,
   expected outputs, and constraints.
4. Add MATLAB Course Designer authoring fields such as module placement,
   learning activity order, estimated time, prerequisite context, product
   requirements, learner setup notes, and persistence notes.

Do not hand-write the shared MATLAB Exercise component parts before trying
`matlab-create-course-activity`. Use MATLAB Agentic Toolkit skills inside or after that
workflow when code, data, toolbox workflows, or validation need MATLAB-specific
refinement.

Choose one:

- Guided script: learners complete a script and inspect variables or plots.
- Function implementation: learners write reusable code with testable outputs.
- Data analysis lab: learners import, clean, analyze, and visualize data.
- Live-script lesson: learners combine explanation, code, and interpretation.
- App or workflow activity: learners use a MATLAB app or toolbox workflow.

Use MATLAB Agentic Toolkit skills when refining executable MATLAB code,
validating functions, designing additional tests, analyzing data, or preparing
live-script content after the `matlab-create-course-activity` baseline exists.

## Simulink Exercise Learning Activity Patterns

Choose one:

- Model interpretation: learners inspect a provided model and explain behavior.
- Model completion: learners add blocks, parameters, or connections.
- Simulation experiment: learners vary parameters and analyze outputs.
- Controller or algorithm design: learners tune or implement system behavior.
- Verification activity: learners test model behavior against requirements.

Use `simulink-create-course-activity` for Simulink Exercises that require model files.
That skill creates the starter and solution `.slx` files, validates them with
MATLAB MCP Server tool calls through the Simulink Agentic Toolkit workflow, and
writes Course Designer import metadata. Use broader Simulink Agentic Toolkit
skills for specialized model construction, inspection, configuration, or
behavioral tests inside that workflow.

## Cognitive Load Controls

- Provide starter artifacts for first exposure to a new tool or workflow.
- Avoid asking learners to learn MATLAB syntax, Simulink modeling, and new
  domain theory for the first time in the same task.
- Segment long labs into preparation, guided build, experiment, and reflection.
- Split long tasks into multiple ordered learning activities when that better
  matches Course Designer navigation.
- State expected runtime, expected output, and the evidence learners submit.

## Assessment Fit

- Use `matlab-create-course-activity` as the wrapper for MATLAB Exercise
  code-correctness evidence from scripts, functions, classes, or object usage.
- Put written explanations, design decisions, interpretation prompts, and
  reflection questions inside Reading, MATLAB Exercise, or Simulink Exercise
  instructions rather than creating unsupported activity types.
- For Simulink work, include explicit model behavior criteria because generic
  cartridge readers will not execute the model.
