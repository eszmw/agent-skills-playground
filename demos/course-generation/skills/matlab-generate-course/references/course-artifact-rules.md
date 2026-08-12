# Course Artifact Rules

Use these rules for generated review folders and final reporting. All generated
source must preserve the MATLAB Course Designer organization model:

```text
Course
└── Module
    └── Learning activity
```

Courses contain ordered modules. Modules contain ordered learning activities.
This hierarchy is the stable intermediate structure for future direct MATLAB
Course Designer API creation. It follows the MATLAB Course Designer
documentation at
<https://www.mathworks.com/help/matlab-and-simulink-online-courses/matlab-course-designer.html>.

## Folder Structure

Preferred structure under the selected output directory:

```text
.
├── .idstack/
│   ├── project.json
│   └── course-content/
├── course-designer-structure.md
├── matlab-activities/
│   └── module-NN-activity-MM-[slug]/
│       ├── activity.md
│       ├── background.m
│       ├── task.m
│       ├── instructor-notes.md
│       ├── validation-report.md
│       ├── course-designer-activity.json
│       └── grader-source.md
├── simulink-activities/
│   └── module-NN-activity-MM-[slug]/
│       ├── [activity-slug]_starter.slx
│       ├── [activity-slug]_solution.slx
│       ├── activity.md
│       ├── instructor-notes.md
│       ├── validation-report.md
│       └── course-designer-activity.json
├── grader-items/
│   └── module-NN-activity-MM-[slug]/
├── export/
│   └── course-name.imscc
└── instructor-review-checklist.md
```

If IDStack writes a different export path, preserve that path and report it
clearly.

## Course Designer Structure

Write `course-designer-structure.md` as the human-readable source of truth for
the generated hierarchy:

```markdown
# [Course Title]

## Course Metadata
- Audience:
- Prerequisites:
- Required products:
- Persistence format: IMS Common Cartridge

## Modules

### Module 01: [Module Title]
- Objective:
- Estimated time:

#### Learning Activities
1. [Activity Title]
   - Type: MATLAB Exercise | Simulink Exercise | Video | Reading
   - Objective alignment:
   - Required products:
   - Source artifacts:
   - Grader component source:
     - description:
     - template:
     - solution:
     - tests:

For Reading and Video activities, write "not applicable" for Grader component
source; their content lives in `.idstack/course-content/` and needs no
component folders under `matlab-activities/` or `grader-items/`.
   - Course Designer-only fields:
     - background: background.m
     - task: task.m
     - estimated time:
     - setup notes:
   - Validation notes:
   - Common Cartridge representation:
```

Use this file to keep the future web application import path unambiguous.

## File Naming

- Use lowercase kebab-case for generated course support files.
- Prefix module artifacts with `module-NN-`.
- Keep `matlab-generate-grader-assessments` output folders named by the `matlab-generate-grader-assessments` skill.
- For MATLAB Exercise learning activities, keep the `matlab-generate-grader-assessments` folder as the
  first-pass component source and use `matlab-create-course-activity` to record MATLAB
  MCP validation results plus `background.m` and `task.m` copy/paste fields in
  the MATLAB activity folder.
- Do not rename IDStack-managed files unless the user asks for a cleanup pass.

## Activity Brief Format

Each MATLAB or Simulink learning activity brief should include:

```markdown
# Module NN Activity MM: [Activity Title]

## Course Designer Placement
- Module:
- Learning activity order:
- Learning activity type: MATLAB Exercise | Simulink Exercise

## Objective Alignment
- Course objective:
- Module objective:

## Learner Task
[What learners do.]

## MATLAB Exercise Component Source
[For MATLAB Exercises, reference the `matlab-generate-grader-assessments` output folder and map
description, template, solution, and tests.]

## Course Designer Authoring Fields
- Background file: background.m
- Task file: task.m
- Estimated time:
- Prerequisite context:
- Learner setup notes:

## Required Products
- MATLAB:
- Simulink:
- Toolboxes:

## Starter Artifacts
[Files, starter code, starter model, data, or links.]

## Instructor Validation
[Expected result, tests, model behavior, rubric criteria, or review notes.]

## Persistence Placement
[Where this appears in the Common Cartridge persistence package.]
```

## Instructor Review Checklist

Include this final checklist:

- [ ] Review the `.imscc` package as the persisted course representation.
- [ ] Confirm course metadata, module order, and learning activity order.
- [ ] Confirm page titles, links, and due-date placeholders.
- [ ] Confirm MATLAB and Simulink product requirements are visible to students.
- [ ] Open each MATLAB Exercise learning activity and verify the `matlab-generate-grader-assessments`
      component mapping, `background.m`, `task.m`, MATLAB MCP validation
      report, and Course Designer-only metadata.
- [ ] Open each Simulink Exercise learning activity and verify model
      requirements, starter `.slx`, solution `.slx`, validation report, and
      Course Designer activity metadata.
- [ ] Review all MATLAB Exercise validation reports from `matlab-create-course-activity`
      before final packaging.
- [ ] Confirm all assessments are implemented as native MATLAB Exercises or
      Simulink Exercises.
- [ ] Confirm no unsupported activity types such as discussions, generic
      assignments, projects, quizzes, standalone MATLAB Grader assessments, or
      QTI 3 items are present in the Course Designer structure.
- [ ] Check accessibility of pages, tables, alt text, and downloadable files.
- [ ] Revise the course shell before publishing to students.

## Final Response

End with:

- Common Cartridge path (or, when export could not run, an explicit statement of
  what is blocked and what unblocks it; never an invented path)
- Review folder path
- Course Designer structure path
- MATLAB/Simulink product assumptions
- MATLAB Exercise count, grader-sourced component count, and MATLAB MCP
  validation status
- Simulink Exercise count and validated starter/solution model count
- Reviews completed or deferred
- Next instructor validation step
