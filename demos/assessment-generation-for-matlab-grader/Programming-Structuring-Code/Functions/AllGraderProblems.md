# Functions MATLAB Grader problems

This collection contains five summative problems and one formative problem based on the Functions lesson. For every problem, paste the description, reference solution, learner template, function call block when present, and listed assessments into MATLAB Grader. Paste optional feedback only where it is shown.

***
# Problem 1

Title:
```Copy
Compute Calculator Expressions
```

Description and Instructions:
```Copy
Use MATLAB as a calculator to evaluate five mathematical expressions.

Create these variables:

1. `powerValues`, containing the result of 2 raised to the powers 1 through 5.
2. `imaginaryRoot`, containing the square root of -9.
3. `eValue`, containing e.
4. `radianCosine`, containing the cosine of pi/2 radians.
5. `degreeCosine`, containing the cosine of 30 degrees.

Use the mathematical functions and constants appropriate to each expression.
```

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

## Tests

### Test #1
```Copy
The five calculator results are correct
```

Test type: Variable equals reference solution

Test content:
```Copy
[powerValues imaginaryRoot eValue radianCosine degreeCosine]
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
# Problem 2

Title:
```Copy
Integrate with a Documented Option
```

Description and Instructions:
```Copy
Write a script that estimates the integral of a supplied function.

The variable `integrand` is provided. Create `integralEstimate` by integrating `integrand` from 0 to pi. Consult the documentation for `integral` to determine how to specify an absolute tolerance of `1e-9` using its optional inputs.

Before you submit, use the documentation to check that the option name and its value are accepted by `integral`.
```

Type: **Script**

Reference Solution:
```Copy
integrand = @(x) sin(3*x).^2;
integralEstimate = integral(integrand, 0, pi, AbsTol=1e-9);
```

Learner Template:
```Copy
integrand = @(x) sin(3*x).^2;

% Create integralEstimate with the required absolute tolerance.
% YOUR CODE HERE
```

## Tests

### Test #1
```Copy
The definite-integral estimate is correct
```

Test type: Variable equals reference solution

Test content:
```Copy
integralEstimate
```

### Test #2
```Copy
Use the required computation function
```

Test type: Function or Keyword is present

Test content:
```Copy
integral
```

### Test #3
```Copy
Apply the required tolerance setting
```

Test type: Function or Keyword is present

Test content:
```Copy
AbsTol
```

***
# Problem 3

Title:
```Copy
Greet a User
```

Description and Instructions:
```Copy
Write a function named `greetUser` with one input and one output:

greeting = greetUser(name)

`name` is a string scalar. Create the string `"Hello, "` followed by `name` followed by `"!"`. Return that string in `greeting` and display the same greeting in the Command Window.
```

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

Code to Call Your Function:
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
The function accepts a name and returns the requested greeting
```

Test type: Variable equals reference solution

Test content:
```Copy
greeting
```

### Test #2
```Copy
Displays returned greeting
```

Test type: MATLAB Code

Test content:
```Copy
studentDisplay = string(evalc("greetUser(name);"));
expectedGreeting = string(referenceVariables.greeting);
assert(contains(studentDisplay, expectedGreeting), ...
    "The function must display the greeting it returns.")
```

Optional Feedback on Incorrect Submission:
```Copy
The function must display the same greeting that it returns.
```

***
# Problem 4

Title:
```Copy
Mark a Midpoint
```

Description and Instructions:
```Copy
Write a function named `markMidpoint` with this signature:

midpoint = markMidpoint(endpoint1, endpoint2)

Each input is a two-element numeric vector representing a planar point. Return the midpoint as a two-element vector. Also add a filled yellow circle at that midpoint to the current axes. Preserve any existing plot so the marker can be added to it.
```

Type: **Function**

Reference Solution:
```Copy
function midpoint = markMidpoint(endpoint1, endpoint2)
%markMidpoint Return and mark the midpoint between two planar points.

    midpoint = (endpoint1 + endpoint2) / 2;
    hold on
    plot(midpoint(1), midpoint(2), "yo", MarkerFaceColor="y")
    hold off
end
```

Learner Template:
```Copy
function midpoint = markMidpoint(endpoint1, endpoint2) %#ok<INUSD>
%markMidpoint Return and mark the midpoint between two planar points.

    midpoint = [];
    % YOUR CODE HERE
end
```

Code to Call Your Function:
```Copy
% This block is used by students to run and test their function before submitting.
% A test scenario is provided by the instructor.
% Next: click on "+Add Assessment" below.
endpoint1 = [2 -1];
endpoint2 = [6 7];
midpoint = markMidpoint(endpoint1, endpoint2);
```

## Tests

### Test #1
```Copy
The function returns the midpoint of the two input points
```

Test type: Variable equals reference solution

Test content:
```Copy
midpoint
```

### Test #2
```Copy
Adds filled yellow midpoint marker
```

Test type: MATLAB Code

Test content:
```Copy
midpoint = referenceVariables.midpoint;
markerLines = findall(gca, Type="line", Marker="o");
assert(~isempty(markerLines), "The function must add a circular marker.")

markerX = [markerLines.XData];
markerY = [markerLines.YData];
isAtMidpoint = any(markerX == midpoint(1) & markerY == midpoint(2));
isFilledYellow = any(arrayfun(@(lineHandle) ...
    isequal(lineHandle.MarkerFaceColor, "y") || ...
    isequal(lineHandle.MarkerFaceColor, [1 1 0]), markerLines));
assert(isAtMidpoint && isFilledYellow, ...
    "The marker must be a filled yellow circle at the returned midpoint.")
```

Optional Feedback on Incorrect Submission:
```Copy
The midpoint marker must be present, yellow, filled, and located at the returned midpoint.
```

***
# Problem 5

Title:
```Copy
Apply an Operation
```

Description and Instructions:
```Copy
Write a function named `applyOperation` with this signature:

transformedValues = applyOperation(operation, values)

`operation` is a function handle and `values` is a numeric array. Evaluate the supplied function handle using `values` and return the result in `transformedValues`.
```

Type: **Function**

Reference Solution:
```Copy
function transformedValues = applyOperation(operation, values)
%applyOperation Apply a supplied function handle to numeric values.

    transformedValues = operation(values);
end
```

Learner Template:
```Copy
function transformedValues = applyOperation(operation, values) %#ok<INUSD>
%applyOperation Apply a supplied function handle to numeric values.

    transformedValues = [];
    % YOUR CODE HERE
end
```

Code to Call Your Function:
```Copy
% This block is used by students to run and test their function before submitting.
% A test scenario is provided by the instructor.
% Next: click on "+Add Assessment" below.
operation = @(x) 2*x + 1;
values = [-2 0 3];
transformedValues = applyOperation(operation, values);
```

## Tests

### Test #1
```Copy
The function applies the supplied function handle to the supplied array
```

Test type: Variable equals reference solution

Test content:
```Copy
transformedValues
```

Optional Feedback on Incorrect Submission:
```Copy
The returned values must come from evaluating the input function handle with `values`.
```

***
# Problem 6

Title:
```Copy
Find a Function Zero
```

Description and Instructions:
```Copy
Write a function named `solveWithFzero` with this signature:

root = solveWithFzero(functionHandle, initialGuess)

`functionHandle` is a function handle for a scalar-valued function, and `initialGuess` is a numeric scalar. Pass the supplied function handle and initial guess to `fzero`. Return the zero found by `fzero` in `root`.
```

Type: **Function**

Reference Solution:
```Copy
function root = solveWithFzero(functionHandle, initialGuess)
%solveWithFzero Find a zero of a supplied function handle.

    root = fzero(functionHandle, initialGuess);
end
```

Learner Template:
```Copy
function root = solveWithFzero(functionHandle, initialGuess) %#ok<INUSD>
%solveWithFzero Find a zero of a supplied function handle.

    root = 0;
    % YOUR CODE HERE
end
```

Code to Call Your Function:
```Copy
% This block is used by students to run and test their function before submitting.
% A test scenario is provided by the instructor.
% Next: click on "+Add Assessment" below.
functionHandle = @(x) cos(x) - x*exp(-sin(x));
initialGuess = 0.5;
root = solveWithFzero(functionHandle, initialGuess);
```

## Tests

### Test #1
```Copy
The function passes the supplied function handle and initial guess to a zero finder and returns the root
```

Test type: Variable equals reference solution

Test content:
```Copy
root
```

Optional Feedback on Incorrect Submission:
```Copy
The root must be computed from the supplied function handle and initial guess.
```

### Test #2
```Copy
Use the required zero-finding behavior
```

Test type: Function or Keyword is present

Test content:
```Copy
fzero
```
