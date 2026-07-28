# Research Summary for MATLAB AI Tutor Setup Guides

Use this as a concise instructor-facing evidence map. It is not a full
literature review. The point is to connect each tutor behavior in the setup
guide to a defensible learning principle and a practical implementation choice.

## Evidence Map

| Tutor behavior | Research basis | Practical setup-guide implication |
| --- | --- | --- |
| Active learning | STEM active learning is associated with better exam performance and lower failure rates than traditional lecturing in a broad meta-analysis. The ICAP framework also distinguishes passive, active, constructive, and interactive engagement, with deeper engagement expected when learners generate, explain, or interact around ideas. | Ask learners to predict output, inspect values, explain reasoning, revise code, or test behavior before receiving a complete explanation. |
| Hint ladders | Scaffolding research frames tutoring as contingent support that helps the learner do what they could not yet do alone. Cognitive tutor research also treats help timing and amount as an "assistance dilemma": too little support stalls learning, while too much can remove productive thinking. | Use ordered help levels: concept hint, diagnostic question, analogous example, one focused syntax hint, then a worked next step only after learner effort. |
| Debugging as evidence gathering | Programming education research on novice debugging shows that beginners often search unsystematically or "flail" rather than form and test hypotheses. Debugging instruction should make evidence visible: error text, line numbers, values, sizes, classes, and minimal reproductions. | For debugging sessions, require the exact error, expected behavior, observed behavior, inspected variables, and a verified repair before moving to transfer. |
| Teach-the-agent critique | Learning-by-teaching and teachable-agent research suggests learners can deepen understanding when they explain concepts, monitor another agent's reasoning, and correct errors. The value comes from generating and evaluating explanations, not from passively reading a polished answer. | Ask learners to critique tutor explanations, find a bug in a proposed solution, explain a MATLAB rule back to the tutor, or improve a flawed example. |
| Output-based assessment | Formative assessment research emphasizes evidence about current performance and actionable next steps. In programming, runnable outputs, tests, warnings, and variable checks give stronger evidence than visual inspection alone. | For hands-on MATLAB tasks, define expected variables, sizes, classes, values, tolerances, required functions, and tests before judging correctness. Run code when correctness matters. |
| Human feedback and tutor evaluation | Feedback research shows that feedback can be powerful but depends on its focus and quality. Effective feedback clarifies the goal, current performance, and next action; it should address the task and process, not only praise or correction. | Review tutor feedback for verdict, reason, misconception, evidence, and next step. Use `matlab-evaluate-tutor-quality` on transcripts before scaling a course pilot. |
| Assignment guardrails | Academic integrity guidance and assessment design both depend on preserving the learning objective and the meaning of submitted work. AI tutor support should distinguish concept help, debugging help, and review from completing restricted work for the learner. | Require learner attempts for graded work, prefer analogous examples and tests, avoid final submission-ready solutions, and record policy-sensitive tutoring decisions in transcript logs when instructor review is expected. |

## Instructor-Facing Rationale

Use this paragraph when a generated setup guide needs a short research basis:

```text
This tutor setup emphasizes active learning, scaffolded hints, evidence-based
debugging, formative feedback, and policy-aware assignment support. These choices
come from research showing that students learn more when they actively generate,
explain, test, and revise ideas; that feedback is most useful when it identifies
the goal, evidence, misconception, and next step; and that tutoring support must
preserve the learning task rather than replace student work.
```

## Design Rules Derived from the Evidence

- Prefer learner action before explanation: predict, inspect, explain, revise,
  test, or transfer.
- Keep help contingent: increase specificity only after evidence of learner
  need.
- Treat MATLAB output as evidence: values, sizes, classes, warnings, errors, and
  tests should drive feedback.
- Use feedback to close a loop: goal, current evidence, misconception, next
  action.
- Preserve the assignment objective: do not provide submission-ready work when
  the course policy or context suggests restricted help.
- Evaluate a sample of transcripts before broad deployment and revise prompts
  when the same weakness appears repeatedly.

## Selected Sources

- Chi, M. T. H., & Wylie, R. (2014). The ICAP framework: Linking cognitive
  engagement to active learning outcomes. *Educational Psychologist, 49*(4),
  219-243. DOI: 10.1080/00461520.2014.965823.
- Biswas, G., Leelawong, K., Schwartz, D., Vye, N., & the Teachable Agents
  Group at Vanderbilt. (2005). Learning by teaching: A new agent paradigm for
  educational software. *Applied Artificial Intelligence, 19*(3-4), 363-392.
  DOI: 10.1080/08839510590910200.
- Fitzgerald, S., McCauley, R., Hanks, B., Murphy, L., Simon, B., & Zander, C.
  (2008). Debugging: Finding, fixing and flailing, a multi-institutional study
  of novice debuggers. *Computer Science Education, 18*(2), 93-116. DOI:
  10.1080/08993400802114508.
- Freeman, S., Eddy, S. L., McDonough, M., Smith, M. K., Okoroafor, N., Jordt,
  H., & Wenderoth, M. P. (2014). Active learning increases student performance
  in science, engineering, and mathematics. *PNAS, 111*(23), 8410-8415. DOI:
  10.1073/pnas.1319030111.
- Hattie, J., & Timperley, H. (2007). The power of feedback. *Review of
  Educational Research, 77*(1), 81-112. DOI: 10.3102/003465430298487.
- Koedinger, K. R., & Aleven, V. (2007). Exploring the assistance dilemma in
  experiments with cognitive tutors. *Educational Psychology Review, 19*,
  239-264. DOI: 10.1007/s10648-007-9049-0.
- Kluger, A. N., & DeNisi, A. (1996). The effects of feedback interventions on
  performance: A historical review, a meta-analysis, and a preliminary feedback
  intervention theory. *Psychological Bulletin, 119*(2), 254-284. DOI:
  10.1037/0033-2909.119.2.254.
- Shute, V. J. (2008). Focus on formative feedback. *Review of Educational
  Research, 78*(1), 153-189. DOI: 10.3102/0034654307313795.
- Wood, D., Bruner, J. S., & Ross, G. (1976). The role of tutoring in problem
  solving. *Journal of Child Psychology and Psychiatry, 17*(2), 89-100. DOI:
  10.1111/j.1469-7610.1976.tb00381.x.
