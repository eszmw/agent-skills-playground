# Evaluation Rubric

Score each dimension from 1 to 4. Use **N/A** only when the dimension genuinely
does not apply to the reviewed session or artifact.

Use this rubric as a formative review tool. The goal is not to prove that a
tutor is perfect; the goal is to help instructors see whether a session supports
MATLAB learning, respects course boundaries, and gives students useful next
steps.

## Active Learning

- **1**: Gives answers with no learner thinking.
- **2**: Includes a question, but it is optional or not used.
- **3**: Requires prediction, explanation, inspection, or revision.
- **4**: Sustains active learning across diagnosis, practice, feedback, and
  transfer.

## MATLAB Accuracy

- **1**: Contains MATLAB errors or misleading terminology.
- **2**: Mostly correct but vague or unverified where precision matters.
- **3**: Correct, idiomatic, and uses accurate MATLAB vocabulary.
- **4**: Correct and includes verification, edge cases, or execution evidence
  when needed.

## Feedback Quality

- **1**: Says right/wrong without explanation.
- **2**: Explains the answer but not the misconception.
- **3**: Gives verdict, reason, misconception, and next step.
- **4**: Also points to evidence and asks for revision or transfer.

## Debugging Support

- **1**: Guesses at fixes without evidence.
- **2**: Mentions debugging but does not localize the issue.
- **3**: Uses error text, line, variables, size, class, or tests.
- **4**: Builds a minimal reproduction and verifies a focused repair.

## Assignment Guardrails

- **1**: Produces a likely restricted complete answer.
- **2**: Gives too much code before seeing learner work.
- **3**: Asks for an attempt and provides bounded help.
- **4**: Adapts support to policy, uses hints, and preserves learning value.

Use **N/A** when the task is clearly unrestricted.

## Transfer Prompts

- **1**: Stops after the answer.
- **2**: Suggests practice generically.
- **3**: Gives a related follow-up task.
- **4**: Changes one meaningful dimension, such as array shape, data type,
  indexing form, or edge case.

## Transcript Evidence

This dimension is used to qualify the review, not as a required score.

- **Real transcript**: Review observed turns and exact wording. Quote the
  transcript when assigning major findings.
- **Synthetic transcript**: Review whether the synthetic scenario is realistic
  and whether the tutor behavior would be acceptable if deployed.
- **Partial transcript**: Score only visible behavior and state what cannot be
  judged.
- **Reconstructed transcript**: Separate observed facts from inferred or
  summarized content.
- **Mixed transcript**: Label which turns are real, synthetic, or reconstructed.

Do not penalize missing evidence as tutor behavior unless the absence itself is
part of the artifact being reviewed.

## Repeatable Transcript Review

Use this checklist for real or synthetic tutoring transcripts:

1. **Scope**: Identify transcript status, learner goal, topic, and assignment
   policy context.
2. **Evidence map**: Mark the turns that show MATLAB claims, learner actions,
   tutor feedback, guardrail decisions, debugging steps, and transfer prompts.
3. **MATLAB accuracy**: Check code, commands, array behavior, terminology, and
   claims about MATLAB execution. Flag claims that should have been verified.
4. **Active learning**: Count whether the learner had to predict, inspect,
   explain, revise, test, or apply a concept before receiving the answer.
5. **Assignment guardrails**: Decide whether the tutor gave help proportional to
   the policy and the learner's attempt.
6. **Feedback quality**: Look for verdict, reason, misconception, evidence, and
   next action.
7. **Debugging support**: Look for error text, line numbers, variable inspection,
   minimal reproduction, repair, and verification.
8. **Transfer prompts**: Check whether the tutor ended with a meaningful new
   case, not just generic encouragement.
9. **Recommendations**: Convert repeated weaknesses into prompt, skill, policy,
   or exercise updates.

## Instructor-Facing Quality Report

Include these sections when the review will guide course or tutor changes:

- **Review scope**: transcript status, assignment status, learner goal, MATLAB
  topic, and evidence limits.
- **Findings**: severity-ranked issues with quoted or turn-level evidence.
- **Scores**: MATLAB accuracy, active learning, assignment guardrails, feedback
  quality, debugging support, and transfer prompts.
- **Recommended prompt or skill updates**: concrete text or behavioral rules the
  tutor should adopt.
- **Keep, revise, or investigate**: brief action list for instructors or skill
  maintainers.

## Calibration Notes

- Penalize fluent explanations that skip learner action.
- Penalize direct homework completion even when technically correct.
- Reward short, targeted prompts over long lectures.
- Reward MATLAB-specific evidence over generic programming advice.

## Instructor Review Questions

- Did the tutor ask the student to predict, inspect, revise, or test?
- Did the tutor verify MATLAB behavior when correctness depended on execution?
- Did the tutor identify the misconception, or only provide the answer?
- Did the tutor preserve the assignment's learning objective?
- Did the session end with a transfer task or next practice step?
- Does the transcript clearly separate real, synthetic, partial, or inferred
  evidence?

Use repeated reviews to improve prompts and course guidance. If several sessions
score low on the same dimension, revise the relevant skill instructions,
assignment wording, or instructor-facing policy.
