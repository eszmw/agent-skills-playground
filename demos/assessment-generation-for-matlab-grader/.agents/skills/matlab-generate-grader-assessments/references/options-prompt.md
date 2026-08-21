# Single recommendation prompt

After the suitability gate and profile lookup, propose exactly one item:

```text
Title: {TITLE} (describe the learning behavior; do not include a command or keyword checked by an assessment)
Submission type: Script or Function
Complexity: low, moderate, or high
Rationale: why the evidence is observable and why this submission type fits
Task statement: {TASK}
```

Use only complexity levels allowed by the course profile. Do not generate a menu of alternatives or increase complexity with unrelated concepts.
