# AI Tutoring

A demo showing how a coordinated set of skills turns an agent into a course-aware MATLAB tutor.
The tutor coaches programming concepts, guides debugging with evidence, runs practice activities, applies course AI-use policies, and reports learner progress without becoming a shortcut to final answers.

For learners, the tutor provides immediate coaching when they are stuck between instructor or peer-support sessions.
For instructors, the package includes policy generation, assignment guardrails, transcript logging, session reports, dashboards, and a quality-evaluation rubric for reviewing tutor sessions before scaling a pilot.

## What you'll do

You'll open this folder in your agent and either start a tutoring session as a learner or run an instructor pilot.
The skills coordinate: a core tutoring skill sets the coaching behavior, a topic skill routes MATLAB questions, and policy skills constrain what the tutor will do on graded work.
Reporting skills capture what happened so an instructor can review it.

## Skills included

**Tutoring:**

| Skill | Role |
|---|---|
| [`matlab-tutor-learners`](skills/matlab-tutor-learners/SKILL.md) | Research-informed conversational tutoring behavior, with its sources cited in the skill's references. Start every learner session here. |
| [`matlab-coach-programming`](skills/matlab-coach-programming/SKILL.md) | MATLAB topic routing and programming concept coaching. |
| [`matlab-coach-debugging`](skills/matlab-coach-debugging/SKILL.md) | Evidence-based debugging instruction using errors, output, `size`, `class`, and tests. |
| [`matlab-create-hands-on-exercises`](skills/matlab-create-hands-on-exercises/SKILL.md) | Complete script-based practice with output assessment. |
| [`matlab-create-mcq-practice`](skills/matlab-create-mcq-practice/SKILL.md) | Multiple choice concept checks with adaptive feedback. |

**Instructor and policy:**

| Skill | Role |
|---|---|
| [`matlab-plan-tutor-adoption`](skills/matlab-plan-tutor-adoption/SKILL.md) | Course-specific adoption guide generator for prompts, guardrails, pilots, and review workflows. |
| [`matlab-create-ai-policy`](skills/matlab-create-ai-policy/SKILL.md) | Instructor interview that generates an LMS-ready `AI-POLICY.md` file. |
| [`matlab-apply-assignment-guardrails`](skills/matlab-apply-assignment-guardrails/SKILL.md) | Policy-aware support for graded or homework-like work. |
| [`matlab-log-tutor-sessions`](skills/matlab-log-tutor-sessions/SKILL.md) | Running transcript logs for instructor sharing and evaluation. |
| [`matlab-report-tutor-sessions`](skills/matlab-report-tutor-sessions/SKILL.md) | Learner-facing, instructor-shareable, aggregate, and dashboard HTML reports. |
| [`matlab-evaluate-tutor-quality`](skills/matlab-evaluate-tutor-quality/SKILL.md) | Tutor-session review rubric and quality report workflow. |

## Prerequisites

- An agent that can load local Markdown-based skills, such as [Claude Code](https://claude.ai/code).
- For skills that execute or analyze MATLAB code, a connected MATLAB session via the [MATLAB MCP Server](https://github.com/matlab/matlab-mcp-server), which requires MATLAB R2021a or later.
- Recommended: the [MATLAB Agentic Toolkit](https://github.com/matlab/matlab-agentic-toolkit), whose domain skills the `matlab-coach-programming` topic router hands off to; without it, routing targets resolve to nothing and the tutor falls back to its own knowledge.

Browsing the skills, generating policies, and reviewing the example reports require no MATLAB installation.

## Setup

1. **Clone this repo** if you haven't already:
   ```bash
   git clone https://github.com/matlab/agent-skills-playground.git
   ```
2. **Install the MATLAB MCP Server** if you want the tutor to run MATLAB code during sessions.
3. **Open the demo folder** in your agent. Two options:
   - **Claude Code**: from a terminal, `cd` into `demos/ai-tutoring/` and run `claude`. The agent will pick up the skills in this folder's `skills/` directory.
   - **Other agents**: point the agent at `demos/ai-tutoring/skills/` per the agent's instructions for user-defined skills.

## Walkthrough

### Instructor pilot

1. Start with the demo kit: [`assets/demo-kit/instructor-demo-kit-guide.md`](assets/demo-kit/instructor-demo-kit-guide.md) walks through a complete pilot on array indexing.
2. Generate a course setup guide:
   > *Generate an instructor setup guide for my introductory MATLAB course module on array indexing.*
3. Create the course AI-use policy before students touch graded work:
   > *Interview me as an instructor and generate an AI-POLICY.md file for MATLAB AI tutor use in my course.*
4. Pick one narrow pilot topic and have students use the tutor for prediction, debugging, revision, and transfer.
5. Review a sample of session reports or transcripts with the `matlab-evaluate-tutor-quality` skill before scaling.

### Learner session

Start a session and let the skills route:

> *I'm stuck on my MATLAB homework. My loop over a table keeps erroring and I don't understand why.*

The core tutoring skill sets the coaching behavior, the debugging coach asks for evidence (the error message, `size`, `class`) rather than handing over fixed code, and the assignment-guardrails skill applies the course policy when the work may be graded.
Ask for an MCQ set or a hands-on exercise to practice a concept, and for a session report when you're done.

## Example output

The [`assets/`](assets/) folder holds artifacts you can review before running anything:

- [`assets/demo-kit/`](assets/demo-kit/): instructor pilot guide, a sample tutoring transcript, an example MCQ set, a hands-on assessment script, and suggested syllabus AI-use language.
- [`assets/examples/`](assets/examples/): a sample LMS-ready AI policy, an example learner session report (HTML), and calibrated transcript-review and tutor-quality examples for the evaluation skill.

## Evals

[`evals/`](evals/) contains scenario-based checks for these skills: user prompts, scripted learner and instructor replies, and pass-criteria checklists.
The guardrail and honesty cases matter most; run them after any skill change.

## Credits

Based on the MATLAB AI Tutor Skills package by The MathWorks, Inc.

## Related products from MathWorks

- [MATLAB](https://www.mathworks.com/products/matlab.html): programming and numeric computing platform.
- [Simulink](https://www.mathworks.com/products/simulink.html): block-diagram environment for modeling, simulating, and analyzing dynamic systems.
- [MATLAB Grader](https://www.mathworks.com/products/matlab-grader.html): browser-based environment for authoring and autograding MATLAB coding assessments.
