# Example MATLAB Grader item summary

This file demonstrates the optional combined instructor-facing summary format.
The native item folders remain the authoritative MATLAB Grader artifact layout.
This example summary includes only the two packaged examples in this folder:
`compute_calculator_expressions` and `greet_user`.

***
# Item 1

Title:
```Copy
Compute Calculator Expressions
```

Description and Instructions:
Open [`compute_calculator_expressions/description.html`](compute_calculator_expressions/description.html) in a browser, click **Copy Description for MATLAB Grader**, and paste into the MATLAB Grader Description and Instructions field. If rich-text paste is unavailable, use `compute_calculator_expressions/description.txt` as a plain-text fallback.

Type: **Script**

Reference Solution:
```Copy
powerValues = 2.^(1:5);
imaginaryRoot = sqrt(-9);
eValue = exp(1);
radianCosine = cos(pi/2);
degreeCosine = cosd(30);
```

Learner Template:
```Copy
% Create powerValues.
% YOUR CODE HERE

% Create imaginaryRoot.
% YOUR CODE HERE

% Create eValue.
% YOUR CODE HERE

% Create radianCosine.
% YOUR CODE HERE

% Create degreeCosine.
% YOUR CODE HERE
```

Student Template Line Locks:
```Copy
| Line(s) | Lock? | Exact template text | Reason |
| --- | --- | --- | --- |
| 1 | Yes | `% Create powerValues.` | Keeps the scaffold task label visible. |
| 4 | Yes | `% Create imaginaryRoot.` | Keeps the scaffold task label visible. |
| 7 | Yes | `% Create eValue.` | Keeps the scaffold task label visible. |
| 10 | Yes | `% Create radianCosine.` | Keeps the scaffold task label visible. |
| 13 | Yes | `% Create degreeCosine.` | Keeps the scaffold task label visible. |
```

## Tests

### Test #1
```Copy
The five calculator results are correct
```

Test type: MATLAB Code

Test content:
```Copy
assert(isequaln(powerValues, referenceVariables.powerValues), ...
    "powerValues does not match the reference result.")
assert(isequaln(imaginaryRoot, referenceVariables.imaginaryRoot), ...
    "imaginaryRoot does not match the reference result.")
assert(isequaln(eValue, referenceVariables.eValue), ...
    "eValue does not match the reference result.")
assert(isequaln(radianCosine, referenceVariables.radianCosine), ...
    "radianCosine does not match the reference result.")
assert(isequaln(degreeCosine, referenceVariables.degreeCosine), ...
    "degreeCosine does not match the reference result.")
```

### Test #2
```Copy
Evaluate the square-root expression
```

Test type: Function or Keyword is present

Test content:
```Copy
sqrt
```

### Test #3
```Copy
Evaluate the exponential expression
```

Test type: Function or Keyword is present

Test content:
```Copy
exp
```

### Test #4
```Copy
Evaluate the radian-angle expression
```

Test type: Function or Keyword is present

Test content:
```Copy
cos
```

### Test #5
```Copy
Evaluate the degree-angle expression
```

Test type: Function or Keyword is present

Test content:
```Copy
cosd
```

Optional Feedback on Incorrect Submission:
```Copy
The degree-angle calculation must use MATLAB's degree cosine function.
```

***
# Item 2

Title:
```Copy
Greet a User
```

Description and Instructions:
Open [`greet_user/description.html`](greet_user/description.html) in a browser, click **Copy Description for MATLAB Grader**, and paste into the MATLAB Grader Description and Instructions field. If rich-text paste is unavailable, use `greet_user/description.txt` as a plain-text fallback.

Type: **Function**

Reference Solution:
```Copy
function greeting = greetUser(name)
%greetUser Create and display a greeting for one person.

    greeting = "Hello, " + name + "!";
    disp(greeting)
end
```

Learner Template:
```Copy
function greeting = greetUser(name) %#ok<INUSD>
%greetUser Create and display a greeting for one person.

    greeting = "";
    % YOUR CODE HERE
end
```

Student Template Line Locks:
```Copy
| Line(s) | Lock? | Exact template text | Reason |
| --- | --- | --- | --- |
| 1 | Yes | `function greeting = greetUser(name) %#ok<INUSD>` | Keeps the required function signature unchanged. |
| 2 | Yes | `%greetUser Create and display a greeting for one person.` | Keeps the function help summary visible. |
| 4 | Yes | `    greeting = "";` | Preserves the provided starter output assignment. |
| 6 | Yes | `end` | Preserves the required function structure. |
```

How to call the function (when the learner clicks 'Run'):
```Copy
% This block is used by students to run and test their function before submitting.
% A test scenario is provided by the instructor.
% Next: click on "+Add Assessment" below.
name = "Ava";
greeting = greetUser(name);
```

## Tests

### Test #1
```Copy
Return the requested greeting
```

Test type: MATLAB Code

Test content:
```Copy
name = "Ben F";
greeting = greetUser(name);
greetingReference = reference.greetUser(name);
assessVariableEqual('greeting', greetingReference);
```

### Test #2
```Copy
Displays returned greeting
```

Test type: MATLAB Code

Test content:
```Copy
name = "Ben F";
studentDisplay = string(evalc("greetUser(name);"));
greetingReference = reference.greetUser(name);
displaysGreeting = contains(studentDisplay, greetingReference);
assessVariableEqual('displaysGreeting', true);
```

Optional Feedback on Incorrect Submission:
```Copy
The function must display the same greeting that it returns.
```

***
