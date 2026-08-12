# Transcript Review Examples

Use these calibrated examples to evaluate real or synthetic MATLAB tutoring
transcripts. They are intentionally compact so instructors can compare severity,
scores, and recommended prompt or skill updates.

## Calibration Set

| Example | Main calibration point | Expected concern | Score pattern |
| --- | --- | --- | --- |
| MATLAB accuracy issue | Tutor gives an incorrect or unverified MATLAB claim. | Accuracy must be checked before pedagogy can compensate. | MATLAB accuracy 1-2; feedback may also drop. |
| Strong active learning | Tutor asks learner to predict, inspect, revise, and transfer. | Good model for course pilots. | Active learning 4; transfer 4. |
| Weak active learning | Tutor explains fluently but does not require learner action. | Learner may read passively. | Active learning 1-2. |
| Assignment guardrail boundary | Learner asks for a homework solution before showing work. | Tutor must preserve course policy. | Guardrails 1-2 if final code is given; 3-4 if bounded. |
| Feedback quality improvement | Tutor says "correct" without misconception or next step. | Feedback should close a learning loop. | Feedback quality 1-2. |
| Debugging support pattern | Tutor uses error text, `size`, `class`, reproduction, and tests. | Strong debugging behavior. | Debugging support 4. |
| Transfer prompt example | Tutor changes data shape or context after initial success. | Transfer should be specific, not generic. | Transfer 3-4. |

## Example A: MATLAB Accuracy Issue

Transcript excerpt:

```text
Learner: If x = [1 2 3], can I use x^2 to square each element?
Tutor: Yes. In MATLAB, x^2 squares each element of the vector, so you get [1 4 9].
```

Findings:

- **High MATLAB accuracy**: The tutor incorrectly says `x^2` squares each
  vector element. MATLAB requires `x.^2` for element-wise powers; `x^2` is matrix
  power and is invalid for a non-square vector. Evidence: tutor claim in second
  turn.

Scores:

- MATLAB accuracy: 1
- Active learning: 1
- Assignment guardrails: N/A
- Feedback quality: 1
- Debugging support: N/A
- Transfer prompts: 1

Recommended prompt or skill update:

- Add: "When explaining MATLAB operators, distinguish matrix operations from
  element-wise operations and verify behavior when the expression may error."

## Example B: Strong Active Learning

Transcript excerpt:

```text
Tutor: Before running this, predict the size and value of y:
y = [1 2 3].^2
Learner: I think y is 1-by-3 and equals [1 4 9].
Tutor: Good. Now run size(y) and class(y). What evidence do you see?
Learner: size is 1 3, class is double.
Tutor: Revise this example for a column vector and predict what changes.
```

Findings:

- **Strength active learning**: The tutor required prediction, evidence
  inspection, and revision before transfer. Evidence: "predict the size and
  value", "run size(y) and class(y)", "Revise this example for a column vector".

Scores:

- MATLAB accuracy: 4
- Active learning: 4
- Assignment guardrails: N/A
- Feedback quality: 4
- Debugging support: N/A
- Transfer prompts: 4

Recommended prompt or skill update:

- Keep this pattern as a model: prediction -> MATLAB evidence -> revision ->
  transfer with one changed dimension.

## Example C: Weak Active Learning

Transcript excerpt:

```text
Learner: I do not understand table indexing.
Tutor: In MATLAB, T.Var extracts the contents of a variable, while T(:, "Var")
returns a table. You should use T.Var for calculations. Dot indexing is common.
```

Findings:

- **Medium active learning**: The explanation is accurate but entirely passive;
  the learner is not asked to predict, inspect, classify, or revise. Evidence:
  tutor gives explanation and stops.

Scores:

- MATLAB accuracy: 3
- Active learning: 1
- Assignment guardrails: N/A
- Feedback quality: 2
- Debugging support: N/A
- Transfer prompts: 1

Recommended prompt or skill update:

- Replace passive endings with: "Classify these two expressions by output type:
  `T.Var` and `T(:, "Var")`. Which one can be passed directly to `mean`, and
  why?"

## Example D: Assignment Guardrail Boundary

Transcript excerpt:

```text
Learner: This is my homework. Write the full function for problem 3.
Tutor: Sure. Here is the complete function...
```

Findings:

- **High assignment guardrails**: The learner identified the task as homework,
  but the tutor agreed to write the full function. This bypasses the learner's
  assignment work. Evidence: "This is my homework" followed by "Here is the
  complete function".

Scores:

- MATLAB accuracy: Not enough evidence
- Active learning: 1
- Assignment guardrails: 1
- Feedback quality: 1
- Debugging support: N/A
- Transfer prompts: 1

Recommended prompt or skill update:

- Add a hard rule: "When the learner says homework, lab submission, project,
  quiz, exam, or graded work, ask for their attempt and provide concept help,
  diagnostics, analogous examples, or one bounded next step. Do not provide a
  complete submission-ready answer."

## Example E: Feedback Quality Improvement

Transcript excerpt:

```text
Learner: Is avgSpeed = mean(T(:, "Speed")) right?
Tutor: No, that is wrong. Use T.Speed.
```

Findings:

- **Medium feedback quality**: The tutor gives a verdict and correction but not
  the reason, evidence, misconception, or next action. Evidence: "No, that is
  wrong. Use T.Speed."

Scores:

- MATLAB accuracy: 3
- Active learning: 1
- Assignment guardrails: N/A
- Feedback quality: 2
- Debugging support: 1
- Transfer prompts: 1

Recommended prompt or skill update:

- Use feedback formula: verdict, MATLAB reason, evidence to inspect, and next
  learner action. Example: "`T(:, "Speed")` returns a table, but `mean` needs
  numeric contents here. Check `class(T(:, "Speed"))` and `class(T.Speed)`, then
  revise one line."

## Example F: Debugging Support Pattern

Transcript excerpt:

```text
Learner: My function errors with "Arrays have incompatible sizes".
Tutor: Paste the exact line that errors and predict the sizes of the operands.
Learner: a is 1-by-4 and b is 4-by-1.
Tutor: Verify with size(a) and size(b). Then make a two-line reproduction with
only those variables before changing the function.
Learner: The reproduction fails. I changed b to b.' and the test passes.
Tutor: Good. Add one test for a column-vector input so this does not regress.
```

Findings:

- **Strength debugging support**: The tutor used exact error text, operand
  sizes, a minimal reproduction, a focused repair, and a regression test.
  Evidence: "Verify with size(a) and size(b)" and "make a two-line reproduction".

Scores:

- MATLAB accuracy: 4
- Active learning: 4
- Assignment guardrails: N/A
- Feedback quality: 4
- Debugging support: 4
- Transfer prompts: 3

Recommended prompt or skill update:

- Keep this debugging sequence as the default: exact error -> expected behavior
  -> inspected values/sizes/classes -> minimal reproduction -> focused repair ->
  verification test.

## Example G: Transfer Prompt

Transcript excerpt:

```text
Tutor: You fixed the row-vector case. Now change only one thing: make x a column
vector. Predict the size of x.^2 before running it.
```

Findings:

- **Strength transfer prompts**: The tutor changes one meaningful dimension,
  array orientation, and asks for prediction before execution. Evidence:
  "change only one thing: make x a column vector".

Scores:

- MATLAB accuracy: 4
- Active learning: 4
- Assignment guardrails: N/A
- Feedback quality: 3
- Debugging support: N/A
- Transfer prompts: 4

Recommended prompt or skill update:

- Use transfer prompts that change exactly one meaningful dimension: array
  shape, data type, indexing form, missing value, or edge case.
