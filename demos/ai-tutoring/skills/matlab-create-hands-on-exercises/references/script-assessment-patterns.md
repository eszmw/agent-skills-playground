# Script Assessment Patterns

Use this reference to create MATLAB Grader-style formative assessments for
hands-on tutoring without requiring MATLAB Grader.

The purpose is instructional, not punitive. The tutor should use assessment
evidence to help the learner revise: what ran, what failed, which MATLAB rule was
involved, and what to try next.

## Required Workflow

1. Define the learning objective and expected output.
2. Create a complete `.m` script with:
   - setup data;
   - learner section;
   - assessment section;
   - clear command-window pass/fail feedback.
3. Save the script to a temporary path in the workspace.
4. Apply the execution preflight in
   [execution-safety.md](execution-safety.md), which includes running
   `check_matlab_code`; do not run it a second time.
5. Run `run_matlab_file` on the script.
6. Evaluate both:
   - algorithm and style from the code and Code Analyzer output;
   - correctness from variables, classes, sizes, values, warnings, errors, and
     printed assessment results.
7. Give feedback that names the failing check and the next revision.

Do not assess an exercise from code reading alone when expected outputs are
available.

Instructors can treat this as a lightweight pattern for practice problems,
office-hour checks, pre-lab warmups, and post-lab remediation. For high-stakes
or course-management workflows, MATLAB Grader remains the dedicated assessment
environment.

## Assessment Categories

Use these checks to approximate MATLAB Grader script assessment behavior:

- **Variable equality**: expected variable exists and matches class, size, and
  value.
- **Numeric tolerance**: compare numeric values with explicit absolute or
  relative tolerance. Use `AbsTol = 1e-4` unless the exercise requires a tighter
  or looser tolerance.
- **Function or keyword presence**: check that a required function or keyword is
  present when the objective is to practice that construct.
- **Function or keyword absence**: check that a prohibited shortcut is absent
  when the learner must practice a specific algorithm.
- **Custom MATLAB code**: check tables, plots, warnings, errors, edge cases, or
  algorithmic constraints that simple equality cannot capture.

Choose checks that match the learning objective. If the objective is "use
logical indexing," a function-presence or keyword-absence check may be
appropriate. If the objective is "compute the correct summary," output
correctness should usually matter more than the exact implementation.

## Complete Script Template

```matlab
%% Exercise: [short name]
% Goal: [learning objective]
% Expected output: [describe variables and values]

clearvars
clc

%% Setup
inputData = [1 2 3 4];

%% Learner section
% The learner edits only this section.
result = inputData .^ 2;

%% Assessment section
expected.result = [1 4 9 16];
checks = strings(0, 1);
passed = true;

[ok, msg] = localAssessVariableEqual("result", result, expected.result, ...
    AbsTol=1e-4);
passed = passed && ok;
checks(end + 1) = msg;

disp("Assessment results:")
disp(checks)

if passed
    disp("PASS: Output matches the expected result.")
else
    error("Assessment:Failed", "One or more assessment checks failed.")
end

function [ok, msg] = localAssessVariableEqual(name, actual, expected, opts)
arguments
    name (1, 1) string
    actual
    expected
    opts.AbsTol (1, 1) double = 1e-4
    opts.RelTol (1, 1) double = 0
end

sameClass = strcmp(class(actual), class(expected));
sameSize = isequal(size(actual), size(expected));

if isnumeric(actual) && isnumeric(expected)
    diffValue = abs(actual - expected);
    tolerance = opts.AbsTol + opts.RelTol .* abs(expected);
    sameValue = all(diffValue <= tolerance, "all");
else
    sameValue = isequaln(actual, expected);
end

ok = sameClass && sameSize && sameValue;

if ok
    msg = "PASS: " + name + " matches expected class, size, and value.";
else
    msg = "FAIL: " + name + " mismatch. class=" + string(class(actual)) + ...
        ", size=" + mat2str(size(actual)) + ".";
end
end
```

## Presence and Absence Checks

For simple script exercises, inspect the script text before execution:

Run this check tutor-side (for example through `evaluate_matlab_code`) against
the actual saved path of the learner's script; do not embed it in the assessed
script itself, where `fileread` would read a different file than the one
executing.

```matlab
scriptText = fileread(learnerScriptPath);
usesMean = contains(scriptText, "mean(");
usesFor = contains(scriptText, "for ");
```

Use these checks sparingly. Prefer output correctness unless the learning
objective explicitly requires or forbids a construct.

## Function Exercise Harness

For function-writing exercises, put the learner function in its own file when
possible, then run a complete assessment script:

```matlab
%% Assessment for circleArea
clearvars
clc

area1 = circleArea(2);
area2 = circleArea([1 3]);

assert(abs(area1 - 4*pi) < 1e-10, "circleArea:badScalar")
assert(all(abs(area2 - [pi 9*pi]) < 1e-10), "circleArea:badVector")

try
    circleArea(-1);
    error("Assessment:ExpectedErrorNotThrown", ...
        "circleArea should reject negative radius values.")
catch ME
    if strcmp(ME.identifier, "Assessment:ExpectedErrorNotThrown")
        rethrow(ME)
    end
end

disp("PASS: circleArea meets the assessed behavior.")
```

Use `matlab.unittest` and `run_matlab_test_file` for larger or reusable test
suites. For short tutoring exercises, a complete script with explicit checks is
usually faster and easier for the learner to understand.

## Feedback Template

```text
MATLAB execution result: [passed/failed].
Output check: [variable/class/size/value/tolerance result].
Style check: [Code Analyzer or programming-guideline issue].
Algorithm note: [whether the method matches the intended concept].
Next revision: [one concrete edit or test].
```

## MATLAB Grader Alignment

MATLAB Grader script assessments can check whether a variable equals a reference
solution by testing existence, data type, size, and value, with tolerance
options; consult the MATLAB Grader documentation linked below for its current
defaults rather than asserting them to a learner. MATLAB Grader also supports
tests for required or absent functions and keywords, and custom MATLAB code
assessments. Mirror those categories in tutoring scripts while keeping feedback
formative and concise.

Relevant MathWorks documentation:

- https://www.mathworks.com/help/matlabgrader/ug/testing-learner-solutions.html
- https://www.mathworks.com/help/matlabgrader/ug/assessvariableequal.html
- https://www.mathworks.com/help/matlabgrader/ug/assessfunctionpresence.html
