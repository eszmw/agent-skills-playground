# Research-Informed MATLAB and Simulink Course Design

Use this reference before generating learning objectives, module structure, and
learning activity plans for MATLAB Course Designer courses. It is a compact
evidence map focused on MATLAB- and Simulink-enabled courseware. It intentionally
does not reproduce the generic instructional design sources used by IDStack.

## Purpose

Before invoking IDStack, translate the instructor interview into a
MATLAB/Simulink-specific course design brief:

1. Target learner profile and prior MATLAB/Simulink experience.
2. Course-level outcomes stated as observable computational or modeling work.
3. Ordered modules that progress from guided use to independent transfer.
4. Learning activities with the right artifact type: MATLAB Exercise, Simulink
   Exercise, Video, or Reading.
5. Evidence for each objective: code output, model behavior, simulation result,
   design decision, reflection, or project artifact.
6. Required products, toolboxes, starter files, solution files, and validation
   method.

Pass this brief downstream to IDStack as context for needs analysis, learning
objectives, assessment design, and course-builder prompts.

## Evidence Strength Labels

These labels are local to this file:

| Label | Meaning |
| --- | --- |
| M1 | Peer-reviewed MATLAB/Simulink course implementation with student outcome or satisfaction evidence. |
| M2 | Published MATLAB/Simulink course implementation, activity design, or pedagogical framework with structured rationale but limited direct outcome evidence. |
| M3 | Published MATLAB/Simulink courseware, product documentation, or educator resource that constrains artifact structure but is not learning-outcome research. |

## Course Design Rules

### 1. Start With Tool-Specific Prerequisites

Separate learner readiness into MATLAB, Simulink, mathematics, domain knowledge,
and engineering workflow readiness. A learner can know the domain but lack
MATLAB syntax, or know MATLAB but lack block-diagram modeling fluency.

Course design implications:

- Put MATLAB syntax and data-flow prerequisites before open-ended modeling.
- Put Simulink navigation, signal inspection, and parameter changes before model
  construction.
- Use starter artifacts when a module introduces a new tool and a new domain
  concept at the same time.
- Include setup checks for MATLAB Online, Simulink, toolboxes, data files, and
  model dependencies before graded work.

### 2. Sequence From Guided Simulation to Independent Design

MATLAB/Simulink courseware should move through a progression:

1. Inspect a provided script or model.
2. Modify parameters and predict behavior.
3. Complete a small missing code or model component.
4. Validate behavior against expected outputs or signals.
5. Transfer the workflow to a new case, data set, plant, controller, or design
   constraint.

This sequence keeps early activities focused on interpretation and reduces the
risk that learners fail because of tool mechanics rather than the target
engineering concept.

### 3. Make Prediction and Interpretation Explicit

For simulation-based modules, ask learners to predict behavior before running a
simulation, inspect the actual output, and explain differences. This supports
the learner-centered pattern described in MATLAB/Simulink simulation
methodology studies: students interact with a scenario, discuss expected
evolution, and connect the visual simulation to real-world behavior.

Course design implications:

- Add "predict before run" prompts to Simulink Exercises.
- Include signal or plot interpretation questions after simulation.
- Ask learners to compare a mathematical expectation with MATLAB/Simulink
  output.
- Put interpretation prompts inside Reading, MATLAB Exercise, or Simulink
  Exercise activities when interpretation matters more than code correctness.

### 4. Use MATLAB Exercises for Code Evidence

Use MATLAB Exercises when the objective requires evidence from scripts,
functions, classes, object usage, data analysis, visualization, or numerical
computation.

Generation implications:

- Use `matlab-create-course-activity`, which wraps `matlab-generate-grader-assessments`, to generate
  `description.txt`, `template.m`, `solution.m`, and `tests.m`.
- Validate generated `.m` files with MATLAB MCP Server calls.
- Split `description.txt` into `background.m` and `task.m` plaintext files for
  copy/paste into MATLAB Course Designer. Keep context, learning objective, and
  high-level prerequisite information in `background.m`; put concrete learner
  instructions, required names, expected outputs, and constraints in `task.m`.
- Add Course Designer-only fields after validation: module placement, estimated
  time, prerequisite context, product requirements, and persistence notes.

### 5. Use Simulink Exercises for Model Evidence

Use Simulink Exercises when the objective requires evidence from model
structure, signal behavior, simulation results, parameter sweeps, controller
behavior, physical modeling, verification, or model-based design workflow.

Generation implications:

- Use `simulink-create-course-activity` to generate starter and solution `.slx` files.
- Validate that both models open and that the solution model simulates when
  simulation is part of the task.
- Keep the starter gap explicit: missing block, incomplete subsystem,
  parameter-completion task, connection task, or experiment task.
- Include expected signals, tolerances, model behavior, and validation method in
  instructor notes.

### 6. Prefer Integrated Exercise Sequences After Foundational Tool Fluency

Use integrated exercise sequences after learners have completed smaller MATLAB
and/or Simulink
activities that teach the required tool operations. Published MATLAB/Simulink
PBL examples commonly combine modeling, simulation, design decisions,
collaboration, and real-world context; that combination is valuable but can
overload novices if introduced too early.

Course design implications:

- Put integrated design work late in a module sequence or split it across
  multiple MATLAB Exercises and Simulink Exercises.
- Use MATLAB for analysis, parameter calculation, visualization, or validation.
- Use Simulink for dynamic models, controller behavior, physical systems, or
  simulation experiments.
- Include design constraints, validation criteria, and reflection prompts inside
  the supported Exercise or Reading activities.

### 7. Connect Courseware Artifacts to Course Designer Structure

MATLAB Course Designer organizes courses as modules containing learning
activities, and supports files, scripts, models, assessments, videos, and
readings as authoring materials. Use that structure as the design target, not
only as an export format.

Course design implications:

- Every module must contain ordered learning activities.
- Every MATLAB Exercise must have a validated `matlab-generate-grader-assessments` source and Course
  Designer metadata.
- Every Simulink Exercise requiring files must have starter and solution `.slx`
  files plus validation evidence.
- Videos and readings should support a following MATLAB Exercise or Simulink
  Exercise, not replace it.
- Common Cartridge is a persistence format; preserve metadata needed for future
  direct Course Designer API creation.

## Objective Patterns

Prefer objectives that name both the tool action and the disciplinary evidence.

| Weak objective | Better MATLAB/Simulink objective |
| --- | --- |
| Understand simulation. | Predict, simulate, and interpret the transient response of a first-order system in Simulink. |
| Learn MATLAB plotting. | Write a MATLAB script that imports measured data, computes summary metrics, and plots labeled results for design comparison. |
| Use controls tools. | Tune a controller in Simulink and justify the chosen gain values using overshoot, settling time, and steady-state error evidence. |
| Learn numerical methods. | Implement and validate a MATLAB function that compares two numerical methods on the same engineering model. |

## Module Patterns

### MATLAB-first module

1. Reading or short video: domain and MATLAB setup.
2. Guided MATLAB Exercise: inspect and run starter code.
3. MATLAB Exercise: complete function or script.
4. MATLAB Exercise: interpret output and errors.

### Simulink-first module

1. Reading or short video: system concept and model interface.
2. Simulink Exercise: inspect a provided model and predict behavior.
3. Simulink Exercise: complete starter model and compare with solution behavior.
4. MATLAB Exercise: analyze logged simulation data.
5. Reading or Exercise prompt: explain design decisions and validation.

### Integrated exercise sequence

1. Problem brief with real-world constraints.
2. MATLAB setup or parameter-calculation activity.
3. Simulink modeling activity with starter and solution models.
4. Validation activity using simulation output, plots, or tests.
5. Final MATLAB Exercise or Simulink Exercise containing the required code,
   model, interpretation, and validation evidence.

## IDStack Handoff Checklist

Before running IDStack, prepare a short design brief containing:

- Course audience and MATLAB/Simulink readiness assumptions.
- Candidate course objectives using observable tool-and-domain verbs.
- Proposed ordered modules with one-sentence purpose for each.
- Candidate learning activity mix for each module.
- Which activities require `matlab-create-course-activity`.
- Which activities require `simulink-create-course-activity`.
- Product/toolbox requirements and validation expectations.

Use this brief as input to IDStack's needs analysis, learning-objectives,
assessment-design, and course-builder steps.

## Selected Sources

- Durán, M. J., Gallardo, S., Toral, S. L., Martínez-Torres, R., & Barrero,
  F. J. (2007). "A learning methodology using Matlab/Simulink for undergraduate
  electrical engineering courses attending to learner satisfaction outcomes."
  *International Journal of Technology and Design Education, 17*, 55-73.
  DOI: 10.1007/s10798-006-9007-z. [M1]
- Lorimer, S., Davis, J. A., & Tronchin, O. (2019). "Using LEGO Mindstorms and
  MATLAB in curriculum design of active learning activities for a first-year
  engineering computing course." *ASEE Annual Conference & Exposition*. [M2]
- Sharma, R., & Nagchaudhuri, A. (2014). "Implementing problem-based learning
  projects to synthesize feedback controllers using MATLAB/Simulink and
  students' assessment." *ASEE Annual Conference & Exposition*. [M2]
- Pena, P., Utschig, T., & Tekes, A. (2022). "Reinforcing student learning by
  MATLAB Simscape GUI program for introductory level mechanical vibrations and
  control theory courses." *International Journal of Mechanical Engineering
  Education*. DOI: 10.1177/03064190221085038. [M1]
- González-Cortés, J. J., Cantero, D., & Ramírez, M. (2025). "Project-Based
  Learning in Bioprocess Engineering: MATLAB Software as a Tool for
  Industrial-Scale Bioreactor Design." *Computer Applications in Engineering
  Education*. DOI: 10.1002/cae.22811. [M1]
- Qaisi, A. A. (2025). "Designing a STEM-Based Instructional Unit Using
  MATLAB-Simulink: A Pedagogical Framework for Technical Education." *IJFMR*.
  [M2]
- Romero-Cano, L. A., & Hernández, H. (2025). "Modular simulation as a teaching
  tool: Integrating MATLAB-Simulink into Heat Transfer courses to promote active
  learning in chemical engineering education." *Education for Chemical
  Engineers, 53*, 171-177. DOI: 10.1016/j.ece.2025.07.004. [M1]
- MathWorks. "MATLAB Course Designer." Product documentation and overview. Use
  as the structural source for Course Designer activity and assessment artifact
  expectations. [M3]
- MathWorks. "MATLAB and Simulink Courseware." Use as an implementation
  reference for courseware types: full courses, lectures, labs, projects,
  apps, interactive examples, videos, and readings. [M3]
