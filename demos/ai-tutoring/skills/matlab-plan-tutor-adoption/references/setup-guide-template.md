# Setup Guide Template

Use this reference when generating an instructor setup guide from a learning
objective, course title, or course description.

## Context Mapping

Choose the best-fit context from the input.

**Introductory MATLAB programming**

- Triggers: "intro", "beginner", "first programming", "arrays", "indexing",
  "scripts", "functions", "plotting", "loops".
- Emphasis: active learning, small code prediction, misconception checks,
  scaffolded hands-on exercises.
- Guardrails: ask for attempts on homework; allow concept explanations and
  analogous examples.

**Engineering computation**

- Triggers: "engineering", "numerical methods", "ODE", "linear systems",
  "simulation", "modeling", "optimization", "signals".
- Emphasis: MATLAB correctness, units, assumptions, plots, verification,
  interpretation of results.
- Guardrails: protect submitted calculations and reports; encourage sanity
  checks and test cases.

**Data analysis lab**

- Triggers: "data", "tables", "timetables", "import", "cleaning", "statistics",
  "visualization", "lab".
- Emphasis: reproducible workflows, table operations, plots, missing data,
  interpretation, short scripts.
- Guardrails: allow debugging of learner scripts; avoid completing full lab
  notebooks before learner work.

**Graded homework, lab, project, quiz, or exam support**

- Triggers: "homework", "graded", "assignment", "lab submission", "project",
  "quiz", "exam", "take-home".
- Emphasis: policy-aware help, hint ladders, debugging attempts, tests,
  instructor-visible transcript or report.
- Guardrails: require learner attempt; avoid final submission-ready solutions;
  prefer concept hints, diagnostics, analogous examples, and review.

**Mixed or uncertain**

- Triggers: broad course descriptions or multiple goals.
- Emphasis: narrow first pilot to one topic and one assessable activity.
- Guardrails: use conservative assignment boundaries until policy is supplied.

## Output Format

```markdown
# MATLAB AI Tutor Setup Guide: [Course or Objective]

## Best Fit
- Context:
- Why this fit:
- Secondary considerations:

## Recommended Tutor Configuration
- Primary skills:
- Optional skills:
- When to use MATLAB execution:
- When to keep the exchange conversational:

## Starter Prompt for Students
[Instructor-ready prompt text.]

## Guardrails
- Default policy:
- Allowed help:
- Restricted help:
- Escalation pattern:

## First-Week Pilot
1. Concept check:
2. Hands-on task:
3. Debugging or revision moment:
4. Reflection, transcript, or report review:

## Reviewing Evidence
- Session reports:
- Transcript logs:
- Evaluation sample:
- What to revise after 5-10 sessions:

## Research Basis
[Include only when requested or useful for instructor adoption. Use
`research-summary.md` for the concise evidence map.]

## Instructor Checklist
- [ ] Pick one module or lab.
- [ ] State AI-use rules.
- [ ] Use the starter prompt.
- [ ] Collect session reports or selected transcripts.
- [ ] Review a small sample with `matlab-evaluate-tutor-quality`.
- [ ] Revise prompts, guardrails, or exercises.
```

## Demo Kit Guidance

When the instructor wants a quick demonstration or first pilot, point them to
`assets/demo-kit/instructor-demo-kit-guide.md`. Use the kit to avoid inventing
new examples: it includes a sample transcript, MCQ set, hands-on MATLAB
assessment script named `array_indexing_assessment.m`, syllabus AI-use
language, and links to report and dashboard artifacts.

## Skill Sequence Patterns

Use these patterns in the "Recommended Tutor Configuration" section.

- Introductory programming: `matlab-tutor-learners`,
  `matlab-coach-programming`, `matlab-create-mcq-practice`,
  `matlab-create-hands-on-exercises`.
- Engineering computation: `matlab-tutor-learners`,
  `matlab-coach-programming`, `matlab-create-hands-on-exercises`,
  `matlab-coach-debugging`.
- Data analysis lab: `matlab-tutor-learners`,
  `matlab-coach-programming`, `matlab-create-hands-on-exercises`,
  `matlab-coach-debugging`, MATLAB data-analysis toolkit skills when
  needed.
- Graded work: add `matlab-apply-assignment-guardrails` before detailed help
  and use `matlab-create-ai-policy` to generate `AI-POLICY.md` before the
  pilot. Use `matlab-log-tutor-sessions` or
  `matlab-report-tutor-sessions` when instructor review is expected.

## Review Evidence Examples

Use concrete examples of what an instructor should look for:

- **Session report**: topics covered, strengths, growth areas, MCQ results,
  hands-on script outcomes, debugging evidence, and next practice.
- **Transcript log**: exact tutor and learner turns, MATLAB evidence, guardrail
  decisions, learner revisions, and omitted or synthetic content labels.
- **Evaluation review**: severity-ranked findings and scores for MATLAB
  accuracy, active learning, assignment guardrails, feedback quality, debugging
  support, and transfer prompts.

## Research Basis Guidance

When instructors ask why the setup guide recommends active learning, hint
ladders, debugging evidence, teach-the-agent critique, output-based assessment,
feedback review, or assignment guardrails, read
[research-summary.md](research-summary.md) and include the shortest useful
rationale. Do not turn every setup guide into a literature review.
