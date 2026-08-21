---
profile_version: 1
output_location: Functions
assessment_purpose: both
qti3_export: true
require_matlab_mcp: true
coding_practice_progression:
  enabled: true
  low: [descriptive names, string literals for new text]
  moderate: [descriptive names, string literals for new text, avoid unsafe dynamic-workspace functions]
  high: [descriptive names, string literals for new text, avoid unsafe dynamic-workspace functions, concise functions]
learning_objectives:
  - objective: "Use mathematical functions to use MATLAB as a calculator."
    allowed_complexity: [moderate]
    preferred_submission: Script
  - objective: "Use the documentation to locate functions and determine how to use them."
    allowed_complexity: [moderate]
    preferred_submission: Script
  - objective: "Write simple functions with inputs, outputs, and side effects, and ensure the functions are on your MATLAB path."
    allowed_complexity: [moderate, high]
    preferred_submission: Function
  - objective: "Pass functions as arguments by using function handles."
    allowed_complexity: [moderate, high]
    preferred_submission: Function
---

# MATLAB Grader course profile

This profile supports the `Functions.mlx` lesson. MATLAB MCP validation is required, and QTI 3 companion packages are enabled.

The supported complexity labels are `low`, `moderate`, and `high`. The coding-practice progression is an authoring gate and learner guidance; it is not a student scoring criterion unless a future objective explicitly makes it assessable.

Item-level purpose overrides:

- `compute_calculator_expressions` is summative.
- `integrate_with_documented_option` is formative. It measures the observable outcome of finding and using an optional documented argument; the act of consulting documentation itself remains learner-directed.
- The four Function items are summative.

MATLAB Grader runs submitted function files in its assessment environment. It cannot reliably determine whether a learner manually added a folder to a persistent MATLAB path, so path placement is instructional setup rather than a scored requirement.
