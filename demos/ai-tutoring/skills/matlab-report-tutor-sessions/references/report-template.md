# HTML Session Report Template

Use this template when producing a learner-facing or instructor-shareable MATLAB
tutoring session report. The default output is a complete standalone HTML file.

## Filename

Use this filename pattern:

```text
matlab-ai-tutor-session-YYYY-MM-DD-HHMMSS.html
```

Examples:

```text
matlab-ai-tutor-session-2026-06-02-143015.html
matlab-ai-tutor-session-2026-10-18-091204.html
```

Use the local session start datetime when available (not the report-generation
time). If no session start was recorded, use the report-generation time and say
so in the report header. Use 24-hour time and remove colons from the time.

For aggregate reports across multiple session reports, use one of these
patterns:

```text
matlab-ai-tutor-aggregate-YYYY-MM-DD-to-YYYY-MM-DD.html
matlab-ai-tutor-aggregate-YYYY-MM-DD-HHMMSS-to-YYYY-MM-DD-HHMMSS.html
```

Use the precise datetime pattern when the user supplied start and end datetime
arguments. Use the date-only pattern when the range is based on the included
reports' dates.

For instructor dashboard artifacts, use one of these patterns:

```text
matlab-ai-tutor-dashboard-YYYY-MM-DD-to-YYYY-MM-DD.html
matlab-ai-tutor-dashboard-YYYY-MM-DD-HHMMSS-to-YYYY-MM-DD-HHMMSS.html
```

Dashboard artifacts use the same date range selection rules as aggregate
reports.

## HTML Requirements

- Create a complete HTML document with `<!doctype html>`, `<html>`, `<head>`,
  and `<body>`.
- Include UTF-8 metadata.
- Include a descriptive `<title>` that matches the report title.
- Use embedded CSS so the file is self-contained.
- Keep the visual design clean enough to share with an instructor.
- Escape user-provided text before placing it in HTML.
- Use semantic sections: `header`, `section`, `table`, `ul`, and `ol`.
- For dashboard drilldowns, use accessible controls such as buttons with
  `aria-controls` or native `<details>` sections. The dashboard must remain
  useful if JavaScript is unavailable.

## Complete HTML Skeleton

```html
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>MATLAB AI Tutor Session Report</title>
  <style>
    body {
      font-family: Arial, Helvetica, sans-serif;
      line-height: 1.5;
      color: #1f2933;
      max-width: 980px;
      margin: 32px auto;
      padding: 0 24px;
      background: #ffffff;
    }
    header {
      border-bottom: 3px solid #0076a8;
      margin-bottom: 24px;
      padding-bottom: 16px;
    }
    h1, h2, h3 {
      color: #1b4f72;
      line-height: 1.2;
    }
    .meta {
      color: #4b5563;
      margin: 4px 0;
    }
    .notice {
      background: #eef6fb;
      border-left: 4px solid #0076a8;
      padding: 12px 14px;
      margin: 16px 0;
    }
    table {
      border-collapse: collapse;
      width: 100%;
      margin: 12px 0 20px;
    }
    th, td {
      border: 1px solid #d7dde3;
      padding: 8px 10px;
      vertical-align: top;
    }
    th {
      background: #f3f6f8;
      text-align: left;
    }
    .metric {
      text-align: right;
      white-space: nowrap;
    }
    code {
      background: #f4f4f5;
      padding: 1px 4px;
      border-radius: 3px;
    }
    footer {
      border-top: 1px solid #d7dde3;
      color: #5b6470;
      font-size: 0.9em;
      margin-top: 32px;
      padding-top: 12px;
    }
  </style>
</head>
<body>
  <header>
    <h1>MATLAB AI Tutor Session Report</h1>
    <p class="meta"><strong>Session datetime:</strong> [datetime]</p>
    <p class="meta"><strong>Learner goal:</strong> [goal or Not stated]</p>
    <p class="meta"><strong>Session focus:</strong> [topics]</p>
    <p class="meta"><strong>Practice modes used:</strong> [modes]</p>
    <p class="meta"><strong>Evidence basis:</strong> [current visible session | provided transcript | partial notes]</p>
  </header>

  <section class="notice">
    This report summarizes the observed tutoring session. It is not a formal
    grade. Metrics reflect only activities completed in the session.
  </section>

  <section>
    <h2>Executive Summary</h2>
    <p>[3-5 sentence summary]</p>
  </section>

  <section>
    <h2>Topics Covered</h2>
    <table>
      <thead>
        <tr>
          <th>Topic</th>
          <th>Evidence Observed</th>
          <th>Strengths</th>
          <th>Growth Areas</th>
          <th>Next Step</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>[Topic]</td>
          <td>[Evidence]</td>
          <td>[Strength]</td>
          <td>[Growth area]</td>
          <td>[Next step]</td>
        </tr>
      </tbody>
    </table>
  </section>

  <section>
    <h2>Activity Metrics</h2>
    <table>
      <thead>
        <tr>
          <th>Activity Type</th>
          <th>Attempted</th>
          <th>Passed/Correct</th>
          <th>Revised</th>
          <th>Unresolved</th>
          <th>Notes</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>MCQs</td>
          <td class="metric">[count]</td>
          <td class="metric">[count]</td>
          <td class="metric">N/A</td>
          <td class="metric">[count]</td>
          <td>[notes]</td>
        </tr>
        <tr>
          <td>Hands-on scripts</td>
          <td class="metric">[count]</td>
          <td class="metric">[count]</td>
          <td class="metric">[count]</td>
          <td class="metric">[count]</td>
          <td>[notes]</td>
        </tr>
        <tr>
          <td>Debugging tasks</td>
          <td class="metric">[count]</td>
          <td class="metric">[count]</td>
          <td class="metric">[count]</td>
          <td class="metric">[count]</td>
          <td>[notes]</td>
        </tr>
      </tbody>
    </table>
  </section>

  <section>
    <h2>MATLAB Evidence</h2>
    <ul>
      <li>[Code Analyzer result]</li>
      <li>[Script execution result]</li>
      <li>[Output variable checks]</li>
      <li>[Error messages or tests]</li>
    </ul>
  </section>

  <section>
    <h2>Strengths</h2>
    <ul>
      <li>[Evidence-backed strength]</li>
    </ul>
  </section>

  <section>
    <h2>Growth Areas</h2>
    <ul>
      <li>[Actionable growth area]</li>
    </ul>
  </section>

  <section>
    <h2>Recommended Next Practice</h2>
    <ol>
      <li>[Practice task]</li>
      <li>[Debugging or assessment task]</li>
      <li>[Transfer task]</li>
    </ol>
  </section>

  <section>
    <h2>Instructor-Shareable Summary</h2>
    <p>[Concise instructor-facing summary]</p>
  </section>

  <footer>
    Generated by MATLAB AI Tutor Session Report.
  </footer>
</body>
</html>
```

## Aggregate Report Selection Rules

Aggregate reports and dashboard artifacts accept two optional arguments:

- `start_datetime`: earliest session report datetime to include.
- `end_datetime`: latest session report datetime to include.

If both arguments are provided, include reports whose session datetime falls
within the inclusive range. If no arguments are provided, include all available
single-session reports in the current working directory. Candidate reports should
match this filename pattern:

```text
matlab-ai-tutor-session-YYYY-MM-DD-HHMMSS.html
```

Exclude aggregate reports by default so an aggregate is not counted twice. If a
report is missing a parseable date, list it under "Excluded Reports" rather than
guessing.

## Aggregate HTML Sections

Use this structure for multi-session reports:

```html
<header>
  <h1>MATLAB AI Tutor Aggregate Session Report</h1>
  <p class="meta"><strong>Report range:</strong> [start] to [end]</p>
  <p class="meta"><strong>Reports included:</strong> [count]</p>
  <p class="meta"><strong>Evidence basis:</strong> [filenames or report set]</p>
</header>

<section class="notice">
  This aggregate report summarizes multiple observed tutoring session reports.
  It is not a formal grade. Metrics reflect only activities visible in the
  included reports.
</section>

<section>
  <h2>Executive Summary</h2>
  <p>[cross-session summary]</p>
</section>

<section>
  <h2>Included Reports</h2>
  <table>[date, report, session focus, evidence basis]</table>
</section>

<section>
  <h2>Aggregate Activity Metrics</h2>
  <table>[activity type, attempted, passed/correct, revised, unresolved, notes]</table>
</section>

<section>
  <h2>Topic Coverage</h2>
  <table>[topic, sessions observed, evidence, trend, next instructional action]</table>
</section>

<section>
  <h2>Recurring Misconceptions and Growth Areas</h2>
  <ul>[evidence-backed patterns]</ul>
</section>

<section>
  <h2>Revision Behavior</h2>
  <ul>[where learner revised, tested, or explained changes]</ul>
</section>

<section>
  <h2>Recommended Instructor Actions</h2>
  <ol>[2-5 actions]</ol>
</section>
```

## Dashboard HTML Requirements

Dashboard artifacts are instructor-facing HTML files that make cross-session
metrics easy to scan and inspect. They should not require separate CSV files.
Use separate CSV files only if the user explicitly asks for export files or if
CSV is an internal intermediate that is not required to use the dashboard.

Required dashboard metrics:

- MCQ accuracy by topic.
- Hands-on script pass rate.
- Common debugging patterns.
- Most frequent Code Analyzer issues.
- Unresolved topics needing instructor follow-up.

For tutor quality dashboards generated from transcript reviews or quality
reports, use these metrics instead:

- MATLAB accuracy issues.
- Active learning coverage.
- Assignment guardrail incidents.
- Feedback quality improvements.
- Debugging support patterns.
- Transfer prompt coverage.

Each metric should have a drilldown panel that includes:

- included sessions or reports;
- supporting evidence snippets;
- affected topics;
- interpretation cautions for missing or partial data;
- recommended instructor action.

Use this structure for instructor dashboard artifacts:

```html
<header>
  <h1>MATLAB AI Tutor Instructor Dashboard</h1>
  <p class="meta"><strong>Dashboard range:</strong> [start] to [end]</p>
  <p class="meta"><strong>Reports included:</strong> [count]</p>
  <p class="meta"><strong>Evidence basis:</strong> [filenames or report set]</p>
</header>

<section class="notice">
This dashboard summarizes multiple MATLAB tutoring session reports or transcript
review artifacts. Drilldown panels show the evidence behind each metric. It is
not a formal grade.
</section>

<section class="dashboard-grid">
  <article class="metric-card">
    <h2>[Metric Name]</h2>
    <p class="metric-value">[value]</p>
    <button type="button" data-panel="[panel-id]">Review evidence</button>
  </article>
  [more metric cards]
</section>

<section id="[panel-id]" class="drilldown-panel" hidden>
  <h2>[Metric Name]</h2>
  <table>[evidence, severity or count, interpretation, recommended action]</table>
  <p><strong>Instructor action:</strong> [action]</p>
</section>
```

For a simple no-JavaScript dashboard, use:

```html
<details>
  <summary>MCQ Accuracy by Topic</summary>
  <table>[drilldown evidence]</table>
</details>
```

If JavaScript is used for modal or side-panel behavior, keep the drilldown
content in the HTML document and toggle visibility only. Do not fetch external
data.

## Metric Definitions

- **Attempted**: learner engaged with the activity.
- **Passed/Correct**: answer or script met the stated criteria.
- **Revised**: learner made a meaningful correction after feedback.
- **Unresolved**: issue remained at the end of the session.
- **N/A**: metric does not apply to that activity.

When one incident fits two activity rows (for example an error hit inside a
hands-on exercise), count it once under the activity the learner was doing and
cross-reference it in the other row's notes instead of counting it twice.

For aggregate reports:

- Sum counts only when each included report exposes the count.
- Use "At least N" when the reports show evidence of activity but not a full
  count.
- Use "Not reported" when a metric is absent.
- Do not compute rates when either numerator or denominator is missing.

For dashboard artifacts:

- Prefer counts and simple rates over complex scoring.
- Link every displayed metric to its drilldown evidence.
- Include "No evidence reported" when a metric is absent from all included
  reports.
- Do not hide unresolved issues behind averages.
- For quality dashboards, show both risks and strengths. A dashboard should make
  it easy to see what to revise and what positive tutor behaviors to preserve.

## MATLAB Evidence Examples

Include relevant execution evidence:

- Code Analyzer result.
- Script pass/fail result.
- Key output variables, classes, sizes, or values.
- Error messages investigated.
- Tests or assertions used.

Example:

```html
<ul>
  <li><code>check_matlab_code</code>: no Code Analyzer issues reported.</li>
  <li><code>run_matlab_file</code>: script executed successfully.</li>
  <li>Output check: <code>result</code> matched expected class <code>double</code>, size <code>[1 4]</code>, and value <code>[1 4 9 16]</code>.</li>
</ul>
```

## Privacy and Tone

- Do not include private personal details unless requested.
- Do not diagnose motivation, ability, or effort.
- Prefer "not yet demonstrated" over "cannot."
- Prefer "needs more evidence" over "weak."
- Keep the tone factual, constructive, and useful for next steps.
