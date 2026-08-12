# MATLAB Course Designer Artifacts

Use these rules for MATLAB Course Designer-ready Simulink Exercise output.

## Folder Structure

```text
simulink-activities/
└── module-NN-activity-MM-[slug]/
    ├── [model-slug]_starter.slx
    ├── [model-slug]_solution.slx
    ├── activity.md
    ├── instructor-notes.md
    ├── validation-report.md
    ├── course-designer-activity.json
    └── support/
        ├── init_[model-slug].m   (only when an init script is used)
        ├── data files
        └── optional validation files
```

`[slug]` in the folder name uses hyphens.
`[model-slug]` in file names is the same slug with underscores, because a
Simulink model name must be a valid MATLAB identifier and hyphens are illegal.
Prefer the model workspace over an init script so the models stay
self-contained; include `init_[model-slug].m` only when a script is genuinely
needed.
Before delivery, remove simulation build artifacts (`.slxc` files and `slprj/`
folders) from the activity folder and re-verify both models still open and
simulate.

Use `support/` only when extra files are needed.

## Activity Markdown

`activity.md` is learner-facing and should include:

- Title
- Background
- Learning objective
- Learner task
- Starter model file name
- Expected evidence or submission
- Required products and toolboxes
- Setup steps

## Instructor Notes

`instructor-notes.md` should include:

- Solution model file name
- Intended learner gaps in the starter model
- Expected behavior
- Validation method
- Rubric or review criteria
- Known limitations

## Course Designer Metadata

Write `course-designer-activity.json` with this shape:

```json
{
  "course": {
    "title": "",
    "id": ""
  },
  "module": {
    "title": "",
    "order": 1
  },
  "learningActivity": {
    "title": "",
    "order": 1,
    "type": "Simulink Exercise",
    "background": "",
    "objective": "",
    "estimatedTimeMinutes": 0,
    "assessmentPurpose": ""
  },
  "files": {
    "starterModel": "",
    "solutionModel": "",
    "activityMarkdown": "activity.md",
    "instructorNotes": "instructor-notes.md",
    "validationReport": "validation-report.md",
    "supportFiles": []
  },
  "products": {
    "required": ["MATLAB", "Simulink"],
    "toolboxes": []
  },
  "validation": {
    "status": "passed|partial|failed",
    "checks": [
      {
        "name": "",
        "status": "passed|failed|deferred|not_applicable",
        "detail": ""
      }
    ]
  },
  "persistence": {
    "commonCartridgePath": "",
    "courseDesignerApiReady": true
  }
}
```

Keep paths relative to the activity folder when possible. This sidecar is the
future Course Designer API bridge and should be complete even when Common
Cartridge packaging is also used.
