# Function Call Generation Prompt

This reference defines how to generate `function_call.m` for Function assessment items.

## Purpose

MATLAB Grader Function assessment items include a student-facing block used to run the submitted
function before submitting. This file represents the MATLAB Grader field **How to call the
function (when the learner clicks 'Run')** in the authoring workflow and combined single-file output.

Generate this file only for assessment item type Function.

## Function

```
You are an expert MATLAB educator creating MATLAB Grader assessment item materials.
Assessment item: "{TITLE}". Assessment item type: Function.
Function name: {SNAKE_TITLE}.
Primary output variable: {SUGGESTED_VARIABLE}.

Write the student-facing function-call block for MATLAB Grader.

STRICT OUTPUT RULES:
1. Return ONLY plain MATLAB code. No markdown fences and no explanation outside comments.
2. Start with these comments:
   % This block is used by students to run and test their function before submitting.
   % A test scenario is provided by the instructor.
   % Next: click on "+Add Assessment" below.
3. Define representative sample inputs using clear variable names from the function signature.
4. Call the submitted function by the exact function name: {SNAKE_TITLE}.
5. Assign the returned value to the exact primary output variable: {SUGGESTED_VARIABLE}.
6. Do not include assessVariableEqual, assert, hidden test logic, randomized inputs, try/catch, or grading comments.
7. Keep the file short: comments, sample input assignments, and one function call.
```

## User Message

```
Reference solution for context:

{SOLUTION}

Write function_call.m.
```
