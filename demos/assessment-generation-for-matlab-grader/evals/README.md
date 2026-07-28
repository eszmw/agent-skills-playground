# Evals: Assessment Generation for MATLAB Grader

Scenario-based evals for the two skills in this demo.
Each case is a user prompt plus scripted replies for the questions the skill asks, and a pass-criteria checklist.

## How to run

1. Open this demo folder in your agent so the skills under `skills/` are loaded.
2. Give the agent one case's prompt, then answer its questions with the scripted replies.
3. Grade the output against the pass criteria yourself.
   Read every generated file.
   Do not trust the agent's self-report.

Cases marked **MATLAB** need a MATLAB session to verify the generated code actually runs.

## EV-G1: Function item end to end (MATLAB)

**Prompt:**

> Create MATLAB Grader assessment items for this learning objective: compute summary statistics of a numeric vector.

**Scripted replies:** Function type, 4 options, current directory, summative, no QTI 3. Select option 1.

**Pass criteria:**

- [ ] The skill collects inputs one at a time before generating, and presents an options table with difficulty spread.
- [ ] Output folder is snake_case and contains exactly `description.txt`, `solution.m`, `template.m`, `function_call.m`, `tests.m`.
- [ ] `description.txt` is plain text with no markdown markers and states the required function signature.
- [ ] `template.m` keeps the exact function signature and variable names from `solution.m`, with `% YOUR CODE HERE` blanks.
- [ ] `function_call.m` starts with the three required instructor comments and contains no assertions.
- [ ] `tests.m` has 3 to 5 `%% Test N:` sections, one `assessVariableEqual` per test, randomized inputs via `randi` or `randperm`, at least one hardcoding-detection test on a different range, and no `try/catch`, `fprintf`, or `if/else`.
- [ ] MATLAB check: `solution.m` runs, and each test's expected expression equals the solution output for randomized inputs.

## EV-G2: Script item

**Prompt:**

> Generate a MATLAB Grader assessment item. Learning objective: use logical indexing to filter a data vector. Script type, 2 options, summative, no QTI. Pick the easier one.

**Pass criteria:**

- [ ] No `function_call.m` is generated for a Script item.
- [ ] Tests assess workspace variables, not function calls.
- [ ] The solution is a pure script with a clear primary output variable that the tests reference by name.

## EV-G3: Class item, constructor property assignment

**Prompt:**

> Create a Class assessment item for the objective: define a MATLAB class with a constructor that assigns properties. Assess constructor property assignment. 2 options, formative, no QTI. Take option 1.

**Pass criteria:**

- [ ] The skill asks which class aspect to assess (or honors the one given) before generating.
- [ ] `solution.m` is a bare `classdef` file with no wrapper function.
- [ ] `template.m` blanks only the property-assignment lines inside the constructor; everything else matches the solution exactly.
- [ ] The description tells students the file and classdef name must match, and hints use a different analogous class.
- [ ] Formative purpose shows in the output: a "Before you submit" self-check and diagnostic test names.

## EV-G4: Object usage split

**Prompt:**

> Create an Object usage assessment item: students use a provided class to compute a summary value from an object array. 2 options, summative, no QTI. Take option 1.

**Pass criteria:**

- [ ] `supporting_class.m` is written separately from `solution.m`, split on the `%%%` delimiters.
- [ ] `solution.m` contains only the student script portion.
- [ ] The description shows the class interface without revealing the full classdef source.
- [ ] Tests check array length, an element property, the output variable, and hardcoding.

## EV-G5: QTI 3 companion package

**Prompt:**

> Re-run EV-G1's item and also create QTI 3 interchange files.

**Pass criteria:**

- [ ] Native MATLAB Grader files are still present and unmodified; QTI 3 is additive, not a replacement.
- [ ] A `qti3/` folder exists inside the item folder with a manifest and one item XML.
- [ ] The manifest references the item XML by a package-relative path.
- [ ] The XML is well formed (no markdown fences, parses as XML).

## EV-G6: Instructor setup guide

**Prompt:**

> I teach an introductory MATLAB course. Generate an instructor setup guide for a module on writing and testing functions.

**Pass criteria:**

- [ ] The `matlab-plan-grader-adoption` skill engages, not the generator.
- [ ] The guide recommends an assessment item type and purpose with reasons.
- [ ] It includes at least one copy-paste starter prompt for the `matlab-generate-grader-assessments` skill.
- [ ] It defines review gates for the generated files and a first-pilot checklist.
- [ ] QTI 3 is not pushed on the instructor unless portability was requested.
