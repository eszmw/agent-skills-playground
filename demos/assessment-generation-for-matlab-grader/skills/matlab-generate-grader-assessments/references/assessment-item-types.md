# Assessment Item Types Reference

## Assessment Item Types

| Type | What the student submits | How it's assessed | Key detail |
|------|--------------------------|-------------------|------------|
| Script | `.m` script | Variables in workspace | Direct state inspection |
| Function | `.m` function | Input/output values | Student call block + assertions |
| Class | `classdef ClassName.m` | Properties/methods via instantiation | Instantiation -> property checks -> method calls |
| Object usage | `.m` script (provided class) | Computed output variable | Supporting class generated; student writes script only |

## Class Assessment Types

When assessment item type is "Class", the user must also choose what to assess:

| Assessment | What gets blanked in template | Description |
|------------|-------------------------------|-------------|
| Constructor - property assignment | `obj.prop = arg` lines in constructor | Students fill in property assignment lines |
| Constructor - computed property | Derived property line(s) only | Students compute a property from other values |
| Instance method | Method body | Students implement a method |
| Constant property | Value inside `properties (Constant)` block | Students provide the correct constant value |
| Operator overloading | Overloaded operator method body | Students implement an operator (plus, minus, etc.) |

## Object Usage Solution Format

For "Object usage" assessment items, the solution file contains two sections separated by `%%%` delimiters:

```
%%% SUPPORTING FILE: ClassName.m %%%
classdef ClassName
...
end
%%% STUDENT SCRIPT SOLUTION %%%
...script code...
```

The supporting class file goes into MATLAB Grader "Supporting Files".
The script portion goes into "Reference Solution".
The template contains only the script portion with blanks.

## Output Files Per Assessment Item

Each assessment item generates one self-contained assessment item folder. Native MATLAB Grader files
live at the item folder root:

| File | Contents |
|------|----------|
| `description.txt` | Student-facing assessment item instructions |
| `solution.m` | Complete reference solution |
| `template.m` | Scaffolded learner template with `% YOUR CODE HERE` blanks |
| `function_call.m` | Student pre-submit code for calling a Function assessment item |
| `tests.m` | 3-5 MATLAB Grader `assessVariableEqual` test cases |
| `supporting_class.m` | (Object usage only) The classdef supporting file |

When QTI 3 export is enabled, the same assessment item folder also contains a nested QTI 3
interchange package with one manifest file and one item XML file.

## Naming Convention

Folder names use snake_case derived from the assessment item title.
