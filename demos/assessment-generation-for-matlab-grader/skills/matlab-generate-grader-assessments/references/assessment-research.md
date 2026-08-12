# Research-Informed MATLAB Code Assessment

Use this reference before generating MATLAB Grader assessment item descriptions, templates,
solutions, and tests. It is a compact evidence map, not a full literature review.
The goal is to turn published assessment research into practical generation rules
for MATLAB code assessments.

## Core Assessment Method

Every generated item must make four things explicit:

1. **Learning objective**: the MATLAB concept or engineering computation being assessed.
2. **Observable evidence**: variables, function outputs, object state, method behavior,
   errors, plots, tables, or constraints that demonstrate the objective.
3. **Assessment purpose**: formative, summative, or mixed.
4. **Test strategy**: randomized checks, edge cases, hardcoding detection, tolerance,
   and any required or prohibited constructs.

This follows constructive alignment: assessment tasks should directly require the
student behavior named in the learning objective. If the objective is about vectorized
array operations, do not assess only numeric output if a loop-based solution would pass
unless implementation method is intentionally unconstrained. If the objective is
algorithm correctness, prefer output behavior over style checks.

## Formative Assessment Rules

Use formative design when the item is for practice, tutoring, homework drafts,
recitation, lab preparation, self-checking, or revision.

- Keep the task small enough that feedback can lead to another attempt.
- Include a "Before you submit" or equivalent self-check prompt in the description.
- Use diagnostic test names that identify the concept being checked.
- Prefer visible, interpretable checks over opaque trick cases.
- Include one transfer or hardcoding-detection check, but do not make the item depend
  mainly on traps.
- Where possible, give students a way to inspect the relevant MATLAB evidence:
  variable value, class, size, function output, object property, warning, or error.
- Feedback implied by test names should identify goal, current evidence, and next
  action, such as "Check vector orientation for row and column inputs."

## Summative Assessment Rules

Use summative design when the item is for exams, graded assessment item sets,
final submissions, or high-stakes grading.

- Align each test with the stated learning objective and avoid assessing unrelated
  behavior.
- Use independent tests so one setup mistake does not create misleading duplicate
  failures.
- Include randomized inputs and at least one different-range hardcoding-detection test.
- Include edge cases when they are part of the objective or domain.
- Use tolerances for floating-point results and exact checks for class, size, and
  discrete values.
- Avoid revealing the full hidden test strategy in the student-facing description.
- Avoid grading code style, function presence, or keyword absence unless the objective
  explicitly requires a method or prohibits a shortcut.
- Keep tests deterministic in structure even when inputs are randomized: each test should
  compute its expected value from the generated input.

## Mixed Formative and Summative Rules

Use mixed design when the instructor wants the same item to support practice and later
grading.

- Write the student-facing description with formative self-checks.
- Keep the generated tests robust enough for summative use.
- Separate conceptual hints from answer-revealing details.
- Use test names that are diagnostic but not so specific that they give away a hidden
  implementation.
- Include hardcoding detection and edge cases, but keep at least one basic correctness
  check that helps learners verify progress.

## MATLAB Code Evidence Model

Choose evidence based on assessment item type:

| Assessment item type | Primary evidence | Secondary evidence |
| --- | --- | --- |
| Script | Workspace variables: existence, class, size, value, tolerance | Required or prohibited functions when objective-specific |
| Function | Return values across scalar, vector, matrix, and edge inputs | Input validation behavior when required |
| Class | Constructor-created object state, property values, method outputs | Operator behavior, constant access, object arrays |
| Object usage | Object array construction and computed output variable | Specific element properties and aggregation behavior |

Use MATLAB Grader-friendly checks:

- `assessVariableEqual` for values, cells, strings, arrays, structs, and object properties
  that can be evaluated in the assessment workspace.
- Randomized setup values with expected outputs computed in the test.
- `randperm(19)-10` when detecting swapped values, orientation mistakes, or hardcoding.
  Skew the sample when assessing location statistics; this distribution has mean and median exactly 0.
- `randi([lo, hi])` when the range matters more than permutation.
- Explicit numeric tolerance when comparing floating-point values.

## Test Suite Pattern

For each item, generate 3 to 5 tests:

1. Basic correctness on representative randomized data.
2. Shape/type/contract check: class, size, function signature behavior, or object type.
3. Edge or transfer case aligned with the objective.
4. Hardcoding-detection case using a clearly different numeric range.
5. Optional method-specific check only if the objective requires or prohibits a construct.

Do not include all five tests if fewer tests cleanly measure the objective. Avoid redundant
tests that all fail for the same reason.

## Description Pattern

Student-facing descriptions should include:

- The task and the assessed MATLAB concept.
- Required file, function, class, or variable names.
- Expected input/output contract.
- Any constraints required by the learning objective.
- Formative self-checks when the assessment purpose includes formative use.
- Only non-answer-revealing hints for summative use.

## Selected Sources

- Biggs, J. (1996). Enhancing teaching through constructive alignment. *Higher
  Education, 32*, 347-364. DOI: 10.1007/BF00138871.
- Black, P., & Wiliam, D. (1998). Assessment and classroom learning. *Assessment in
  Education: Principles, Policy & Practice, 5*(1), 7-74. DOI:
  10.1080/0969595980050102.
- Bowen, J. D. (2004). An automated grading system for teaching MATLAB to freshman
  engineers. *ASEE Annual Conference & Exposition Proceedings*.
- Hattie, J., & Timperley, H. (2007). The power of feedback. *Review of Educational
  Research, 77*(1), 81-112. DOI: 10.3102/003465430298487.
- Introduction to MATLAB zyBook by Amirtharajah. MathWorks MATLAB Grader textbook
  listing. Use as a MATLAB Grader-aligned instructional reference for introductory
  MATLAB assessment items, especially when designing self-paced formative practice
  and automatically assessed code exercises.
- Messer, M., Brown, N. C. C., Kölling, M., & Shi, M. (2024). Automated grading and
  feedback tools for programming education: A systematic review. *ACM Transactions on
  Computing Education, 24*(1). DOI: 10.1145/3636515.
- Paiva, J. C., Leal, J. P., & Figueira, Á. (2022). Automated assessment in computer
  science education: A state-of-the-art review. *ACM Transactions on Computing
  Education, 22*(3). DOI: 10.1145/3513140.
- Ramos, J., Trenas, M. A., Gutiérrez, E., & Romero, S. (2013). E-assessment of
  MATLAB assignments in Moodle: Application to an introductory programming course for
  engineers. *Computer Applications in Engineering Education, 21*(4), 728-736.
- Shute, V. J. (2008). Focus on formative feedback. *Review of Educational Research,
  78*(1), 153-189. DOI: 10.3102/0034654307313795.
