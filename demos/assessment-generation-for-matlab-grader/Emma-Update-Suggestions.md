# MATLAB Grader–Aligned, Quality-Gated Assessment Generator

## Approved implementation

- Support only Script and Function submissions, with a profile-driven suitability and complexity gate.
- Require a versioned `matlab-grader-course-profile.md` and a working MATLAB MCP session before generation.
- Generate one approved recommendation per objective, then obtain only approval/revision and any unset complexity choice.
- Make `assessments.md` the authoritative MATLAB Grader configuration and use `tests.m` only for MATLAB Code assessments.
- Quality-gate generated code with MATLAB Code Analyzer and coding guidelines; validate behavior in a transient `matlab.unittest` harness through MATLAB MCP.
- Refresh documentation, evaluations, and the three introductory strings items. The profile supports low and moderate complexity only; high is documented as unsupported.

## Quality rules

Direct outputs use **Variable equals reference solution**. Custom MATLAB Code checks use `referenceVariables.<name>` for expected values. Construct-presence and construct-absence checks are used only when the learning objective explicitly requires them. Duplicate or padded checks are rejected.

Generated materials use descriptive names and modern string syntax and exclude unsafe dynamic-workspace functions. Function argument validation is introduced only for an explicit input-contract learning outcome.

Summative assessment descriptions must not include hints, self-checks, solution approaches, or answer-revealing implementation guidance. If an objective requires a specific function, construct, or approach, state that requirement directly in the numbered task instructions and configure the corresponding assessment only when the objective makes it assessable. Formative descriptions may include a brief, non-answer-revealing self-check.
