# Validation Rules

Use these rules before declaring a Simulink Exercise ready.

## Required Checks

- Product check: MATLAB, Simulink, and required toolboxes are available or the
  missing products are reported.
- File check: starter and solution `.slx` files exist in the activity folder.
- Open check: both models open or inspect successfully through MCP calls.
- Topology check: `model_read` or `model_overview` confirms the expected model
  structure.
- Starter gap check: starter model contains the intended learner task and is not
  accidentally identical to the solution.
- Dependency check: init scripts, data files, and workspace variables are
  included or documented.
- Simulation check: solution model simulates successfully when simulation is part
  of the activity.

## Behavioral Validation

When expected behavior can be tested automatically:

1. Write a Gherkin validation spec in the activity folder.
2. Run `model_test` against the solution model if the testing workflow is
   available.
3. Record pass/fail status and any traces in `validation-report.md`.

`model_test` requires the component under test to expose at least one Inport.
Self-contained models whose stimulus is an internal source block cannot use it;
for those, write a `matlab.unittest` file that simulates the model and checks
the outputs, run it through `run_matlab_test_file`, and record the substitution
in `validation-report.md`. An automated substitute that passes still counts as
automated validation. Delete any Gherkin spec that cannot run rather than
shipping a test-shaped artifact that does nothing.

If no automated testing is practical, write explicit manual validation criteria
in `instructor-notes.md` and mark the validation status as `partial`.

## Validation Report

`validation-report.md` must include:

- Date generated
- Model file names
- MCP checks performed
- Simulation or behavioral test result
- Starter/solution difference summary
- Required products
- Deferred checks
- Final status: passed, partial, or failed

Never mark validation as passed when model creation, open, topology, or required
dependency checks failed.
