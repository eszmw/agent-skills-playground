# MATLAB Agentic Toolkit Topic Map

Use this reference to choose existing MATLAB Agentic Toolkit skills during tutoring. Do not duplicate detailed toolbox guidance in tutoring skills; load the relevant toolkit skill.

For instructors, this map explains how the tutor stays technically grounded. The
AI tutor should teach the concept, but when the task depends on exact MATLAB
behavior, toolbox APIs, installed products, or code execution, it should route to
the appropriate MATLAB Agentic Toolkit skill or MATLAB tool call.

## Core MATLAB

| Learner need | Toolkit skill |
|---|---|
| Diagnose an error, wrong result, unexpected behavior | `matlab-debugging` |
| Write or run unit tests | `matlab-testing` |
| Review style, maintainability, coding standards | `matlab-review-code` |
| Create a Live Script lesson or worked notebook | `matlab-create-live-script` |
| Check installed MATLAB products | `matlab-list-products` |

## Data and Software Development

| Learner need | Toolkit skill |
|---|---|
| Import, clean, summarize, or visualize tabular data | `matlab-analyze-data` |
| Replace deprecated APIs or legacy MATLAB patterns | `matlab-modernize-code` |
| Measure or improve performance | `matlab-optimize-performance` |
| Create performance tests | `matlab-write-performance-tests` |

## Domain Workflows

| Domain | Toolkit skills to consider |
|---|---|
| Apps | `matlab-build-app` |
| Signal processing | `matlab-design-digital-filter` |
| Wireless communications | `matlab-add-awgn`, `matlab-generate-5g-waveform`, `matlab-generate-gnss-waveform` |
| RF and mixed signal | RF circuit, S-parameter, PCB, budget, amplifier, mixer, and matching-network skills |
| Image processing/computer vision | `matlab-display-image`, `matlab-display-volume`, `matlab-ocr` |
| Robotics/navigation/GNSS | `matlab-compute-gnss-position`, `matlab-fuse-inertial-sensors` |
| Databases/reporting | `matlab-read-database`, `matlab-write-database`, `matlab-use-duckdb`, `matlab-map-database-objects` |
| Computational biology | `matlab-build-simbiology-model`, `matlab-simulate-simbiology-model` |

## Tutor Integration Pattern

1. Use the tutor skill to frame the learning goal.
2. Load the toolkit skill for the technical workflow.
3. Convert the workflow into a learner-facing exercise.
4. Use MATLAB MCP tools only when execution helps the learner or verifies correctness.
5. Explain tool output as evidence, not magic.

## Instructor Example

If a learner asks why a table-import script fails, the tutor should:

1. Use `matlab-tutor-learners` to frame the learning goal.
2. Use `matlab-coach-programming` to identify the topic as data import
   and table indexing.
3. Route to `matlab-analyze-data` if reliable import workflow guidance is needed.
4. Run a small script when output or error behavior must be verified.
5. Explain the result in terms of MATLAB table behavior.
