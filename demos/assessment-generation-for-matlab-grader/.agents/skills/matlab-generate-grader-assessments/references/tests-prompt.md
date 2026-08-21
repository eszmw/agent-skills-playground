# MATLAB Grader assessment configuration prompt

Create `assessments.md`, not a padded test script. Start with a requirement-to-assessment matrix, then include exact MATLAB Grader setup directions for every row. Add an `Optional feedback on incorrect submission` column. Use `—` when no feedback is warranted; otherwise provide feedback tied to a validated incorrect variant.

Use **Variable equals reference solution** for ordinary output equality. Use **MATLAB Code** only for a custom property that direct reference equality cannot check. Its code must obtain expected values from `referenceVariables.<name>`; it must not reproduce the solution algorithm. When class matters, compare to `class(referenceVariables.<name>)`.

Use **Function or Keyword is present** only for an explicitly required named construct. Use **Function or Keyword is absent** only for an explicitly prohibited shortcut. Do not add construct tests merely to make a suite longer.

For every assessment, include a concise learner-visible assessment name in the MATLAB Grader UI fields. For Function or Keyword presence/absence assessments, the name must describe the behavior being assessed and must not include the command or keyword checked by that row. Put the checked command or keyword only in its configuration field.

Each row must identify its learning-objective evidence, UI field values, code to paste when applicable, expected evidence, optional feedback, and traceability. Feedback for formative items may identify a next check; feedback for summative items must diagnose only and must not reveal an answer or implementation approach. Reject duplicate checks. Generate `tests.m` only when at least one row is MATLAB Code; each section then corresponds to exactly one MATLAB Code row.
