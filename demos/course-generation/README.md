# Course Generation

A demo showing how an agent can interview an instructor and generate a complete MATLAB and Simulink enabled course, packaged as an IMS Common Cartridge `.imscc` file.

The generated course follows the [MATLAB Course Designer](https://www.mathworks.com/help/matlab-and-simulink-online-courses/matlab-course-designer.html) organizational model: a course contains ordered modules, and each module contains ordered learning activities of four native types (Reading, Video, MATLAB Exercise, Simulink Exercise).
MATLAB Exercises are authored by wrapping the `matlab-generate-grader-assessments` skill and validating the generated `.m` files against a live MATLAB session.
Simulink Exercises get real starter and solution `.slx` model files built and validated through the Simulink tooling.

## What you'll do

You'll open this folder in your agent and describe the course you want: title, audience, duration, and MATLAB or Simulink scope.
The `matlab-generate-course` skill interviews you, runs the IDStack instructional-design pipeline (needs analysis, objectives, assessment design, course building, reviews), creates validated MATLAB and Simulink activities, and exports the whole course as a Common Cartridge package plus a reviewable source folder.

## Skills included

| Skill | Role |
|---|---|
| [`matlab-generate-course`](skills/matlab-generate-course/SKILL.md) | Orchestrator: instructor interview, IDStack pipeline, activity creation, Common Cartridge export, review checklist. |
| [`matlab-create-course-activity`](skills/matlab-create-course-activity/SKILL.md) | Creates MATLAB Exercise folders: wraps `matlab-generate-grader-assessments`, validates `solution.m`, `template.m`, and `tests.m` via MATLAB MCP calls, splits the description into `background.m` and `task.m` copy/paste fields, and adds Course Designer metadata. |
| [`simulink-create-course-activity`](skills/simulink-create-course-activity/SKILL.md) | Creates Simulink Exercise folders with starter and solution `.slx` models, built and validated through MATLAB MCP tool calls. |
| [`matlab-plan-course-adoption`](skills/matlab-plan-course-adoption/SKILL.md) | Planning path: prerequisite check, interview plan, activity planning guidance, export notes, and a first-pilot plan. |
| [`matlab-generate-grader-assessments`](skills/matlab-generate-grader-assessments/SKILL.md) | MATLAB Grader assessment item generation, used as the first authoring step for MATLAB Exercise component parts. Shared with the [assessment-generation-for-matlab-grader](../assessment-generation-for-matlab-grader/) demo. |

## Prerequisites

| Prerequisite | Used for |
|---|---|
| [IDStack](https://idstack.org/) | Third-party open-source (MIT) instructional design pipeline: needs analysis, objectives, assessment design, course building, reviews, and Common Cartridge export. |
| [MATLAB MCP Server](https://github.com/matlab/matlab-mcp-server) | Validating generated MATLAB Exercise files and building Simulink Exercise models against a live MATLAB session. |
| [MATLAB Agentic Toolkit](https://github.com/matlab/matlab-agentic-toolkit) | MATLAB code examples, data workflows, and validation guidance. |
| [Simulink Agentic Toolkit](https://github.com/matlab/simulink-agentic-toolkit) | Simulink model creation, inspection, simulation, and testing. |

The planning skill and the instructor interview work without any of these.
A final `.imscc` export requires IDStack; validated MATLAB and Simulink activities require the MATLAB MCP Server and a MATLAB installation with the products your course design selects.

## Setup

1. **Clone this repo** if you haven't already:
   ```bash
   git clone https://github.com/matlab/agent-skills-playground.git
   ```
2. **Install the prerequisites** above that your workflow needs, following the instructions in their repositories.
3. **Open the demo folder** in your agent. Two options:
   - **Claude Code**: from a terminal, `cd` into `demos/course-generation/` and run `claude`. The agent will pick up the skills in this folder's `skills/` directory.
   - **Other agents**: point the agent at `demos/course-generation/skills/` per the agent's instructions for user-defined skills.

## Walkthrough

If you are planning adoption, start with the setup guide:

> *Generate an instructor setup guide for a 12-week undergraduate signals and systems course with weekly MATLAB labs.*

When you are ready to build, start the designer:

> *Create a MATLAB course for second-year engineering students on signals and systems, 12 weeks, online delivery, with hands-on MATLAB Exercises each week and Simulink Exercises for the systems modules.*

The `matlab-generate-course` skill then walks through its pipeline:

| Step | What happens |
|---|---|
| **Interview** | Course identity, audience, duration, delivery mode, MATLAB and Simulink scope, assessment plan, required toolboxes. |
| **Design** | IDStack needs analysis, learning objectives, assessment design, course building, plus quality, accessibility, and red-team reviews. |
| **MATLAB Exercises** | `matlab-create-course-activity` wraps `matlab-generate-grader-assessments` for each exercise, validates the `.m` files through MATLAB MCP calls, and writes Course Designer authoring fields. |
| **Simulink Exercises** | `simulink-create-course-activity` builds and validates starter and solution `.slx` models. |
| **Export** | IDStack exports the course as a Common Cartridge `.imscc` file, alongside a review folder and instructor checklist. |

Assessments stay native: every graded item is a MATLAB Exercise or Simulink Exercise, never a generic quiz, assignment, or external tool.
The `.imscc` file persists the course outside MATLAB Course Designer; generic cartridge readers do not execute MATLAB code or Simulink models.

## Example output

[`examples/`](examples/) holds one MATLAB Exercise from a full end-to-end validation run (a 121-exercise signals and systems course):

- [`examples/grader-items/module-008-activity-02-2-3-convolution/`](examples/grader-items/module-008-activity-02-2-3-convolution/): the first-pass `matlab-generate-grader-assessments` output (description, solution, template, tests).
- [`examples/matlab-activities/module-008-activity-02-2-3-convolution/`](examples/matlab-activities/module-008-activity-02-2-3-convolution/): the finished Course Designer activity built from it, with `background.m` and `task.m` copy/paste fields, placement metadata, instructor notes, and the MATLAB validation report.
- [`examples/instructor-review-checklist.md`](examples/instructor-review-checklist.md): the final checklist the designer writes for the instructor.

Together they show the transformation each MATLAB Exercise goes through: `matlab-generate-grader-assessments` components in, validated Course Designer activity out.

## Evals

[`evals/`](evals/) contains scenario-based checks for these skills, including honest-degradation cases that run without IDStack or Simulink installed.
Run them after modifying a skill, or read them as worked examples of expected behavior.

## Credits

Based on the MATLAB Course Designer Generator skill package by The MathWorks, Inc.
The MATLAB Exercise authoring path builds on the bundled `matlab-generate-grader-assessments` skill, whose concept of generating complete MATLAB Grader items from a learning objective comes from Andre Knoesen (UC Davis) and his [MATLAB Grader Problem Generator](https://github.com/VeriQAi/MatlabGraderProblemGenerator), a web application built on the Anthropic API.
IDStack is a third-party open-source project (MIT licensed, copyright idstack contributors), referenced as an external prerequisite and not included here.

## Related products from MathWorks

- [MATLAB](https://www.mathworks.com/products/matlab.html): programming and numeric computing platform.
- [Simulink](https://www.mathworks.com/products/simulink.html): block-diagram environment for modeling, simulating, and analyzing dynamic systems.
- [MATLAB Grader](https://www.mathworks.com/products/matlab-grader.html): browser-based environment for authoring and autograding MATLAB coding assessments.
