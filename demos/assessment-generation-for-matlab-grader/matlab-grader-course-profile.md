---
profile_version: 1
output_location: FundamentalsOfProgramming/Data
assessment_purpose: summative
qti3_export: false
require_matlab_mcp: true
coding_practice_progression:
  enabled: true
  low:
    - descriptive names
    - string literals for new text
  moderate:
    - descriptive names
    - string literals for new text
    - avoid unsafe dynamic-workspace functions
  high:
    - descriptive names
    - string literals for new text
    - avoid unsafe dynamic-workspace functions
    - concise functions
learning_objectives:
  - objective: Create MATLAB string scalars by combining text, numeric values, and newline characters.
    preferred_submission: Script
    allowed_complexity: [low, moderate]
  - objective: Apply the limitations of floating point arithmetic to computation.
    preferred_submission: Script
    allowed_complexity: [moderate]
---

# Fundamentals of Programming course profile

This versioned profile supplies the reusable defaults for introductory string-construction assessment items. Script submission is preferred because students demonstrate the objective through workspace string variables.

The objective supports low complexity (direct construction) and moderate complexity (several inputs, newline composition, or a simple conditional wording choice). High complexity is intentionally unsupported: adding unrelated algorithms, file I/O, or advanced data structures would not provide stronger evidence of this strings objective.

The coding-practice progression guides authors and gives learner-facing feedback. It is not a graded requirement unless a learning objective explicitly says it is.

The floating-point objective supports moderate complexity through a direct comparison of a computed sum, an exact-match result, and a tolerance-based result. Adding unrelated numerical algorithms would not improve evidence of this objective.
