# MATLAB Grader assessment configuration prompt

Create `assessments.md`, not a padded test script. Start with a requirement-to-assessment matrix, then include exact MATLAB Grader setup directions for every row.

Use **Variable equals reference solution** for ordinary output equality. Use **MATLAB Code** only for a custom property that direct reference equality cannot check. Its code must obtain expected values from `referenceVariables.<name>`; it must not reproduce the solution algorithm. When class matters, compare to `class(referenceVariables.<name>)`.

Use **Function or Keyword is present** only for an explicitly required named construct. Use **Function or Keyword is absent** only for an explicitly prohibited shortcut. Do not add construct tests merely to make a suite longer.

Each row must identify its learning-objective evidence, UI field values, code to paste when applicable, expected evidence, and traceability. Reject duplicate checks. Generate `tests.m` only when at least one row is MATLAB Code; each section then corresponds to exactly one MATLAB Code row.
