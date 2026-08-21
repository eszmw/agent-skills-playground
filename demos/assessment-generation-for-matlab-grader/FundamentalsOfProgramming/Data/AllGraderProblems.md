# Data MATLAB Grader problems

This collection contains the eight summative Script problems in the Data set. For every problem, paste the description, reference solution, learner template, and listed tests into MATLAB Grader. Paste an optional feedback block only where one is shown.

***
# Problem 1
Title:
```Copy
Compare Floating-Point Values with a Tolerance
```

Description and Instructions:
```Copy
Create a MATLAB script that compares two supplied floating-point values using a supplied tolerance.

1. Leave the provided values unchanged.
2. Create `absoluteDifference` as the absolute difference between `firstValue` and `secondValue`.
3. Create the logical scalar `areEquivalent` that is true when `absoluteDifference` is less than `tolerance`.
```

Type: **Script**

Reference Solution:
```Copy
% Given values
firstValue = 0.1 + 0.2;
secondValue = 0.3;
tolerance = 1e-12;

% Compare the values using the supplied tolerance
absoluteDifference = abs(firstValue - secondValue);
areEquivalent = absoluteDifference < tolerance;
```

Learner Template:
```Copy
% Given values (do not change)
firstValue = 0.1 + 0.2;
secondValue = 0.3;
tolerance = 1e-12;

% Compare the values using the supplied tolerance
% YOUR CODE HERE
```

Tests:

Test #1
```Copy
Compute the magnitude of the difference between the supplied values
```

Test type: Variable equals reference solution

Test content:
```Copy
absoluteDifference
```

Test #2
```Copy
Compare the magnitude with the supplied tolerance
```

Test type: Variable equals reference solution

Test content:
```Copy
areEquivalent
```

Optional Feedback on Incorrect Submission:
```Copy
Check the direction of the comparison between the difference and tolerance.
```

***
# Problem 2

Title:
```Copy
Demonstrate Floating-Point Operation Order
```

Description and Instructions:
```Copy
Create a MATLAB script that demonstrates how floating-point operation order can affect a result.

1. Leave the provided values unchanged.
2. Create `multiplyThenDivide` by evaluating `(largeValue * tinyValue / scaleFactor) * finalFactor`.
3. Create `divideThenMultiply` by evaluating `(tinyValue / scaleFactor * largeValue) * finalFactor`.
4. Create `resultDifference` as `multiplyThenDivide - divideThenMultiply`.
```

Type: **Script**

Reference Solution:
```Copy
% Given values
largeValue = 1e308;
tinyValue = 1e-321;
scaleFactor = 1000;
finalFactor = 1e16;

% Evaluate equivalent expressions in two operation orders
multiplyThenDivide = (largeValue * tinyValue / scaleFactor) * finalFactor;
divideThenMultiply = (tinyValue / scaleFactor * largeValue) * finalFactor;
resultDifference = multiplyThenDivide - divideThenMultiply;
```

Learner Template:
```Copy
% Given values (do not change)
largeValue = 1e308;
tinyValue = 1e-321;
scaleFactor = 1000;
finalFactor = 1e16;

% Evaluate equivalent expressions in two operation orders
% YOUR CODE HERE
```

Tests:

Test #1
```Copy
Evaluate the supplied multiplication-first expression
```

Test type: Variable equals reference solution

Test content:
```Copy
multiplyThenDivide
```

Test #2
```Copy
Evaluate the supplied division-first expression
```

Test type: Variable equals reference solution

Test content:
```Copy
divideThenMultiply
```

Test #3
```Copy
Report the effect of changing operation order
```

Test type: Variable equals reference solution

Test content:
```Copy
resultDifference
```

Optional Feedback on Incorrect Submission:
```Copy
Check that the difference compares results from two distinct operation orders.
```

***
# Problem 3

Title:
```Copy
Create a Student Welcome Message
```

Description and Instructions:
```Copy
Create a MATLAB script that stores student information as text and combines it into welcome messages. This low-complexity assessment checks that you can create string scalars, convert numeric identifiers to text, and combine values into clear messages.

1. Leave the provided variables unchanged.
2. Create the string scalar `welcomeMessage` using `studentName` and `studentId`.
3. Create the string scalar `alternateWelcomeMessage` using `alternateStudentName` and `alternateStudentId`.
4. Each message must read exactly: Welcome, Name! Your student ID is ID.
```

Type: **Script**

Reference Solution:
```Copy
% Given student information
studentName = "Avery Nguyen";
studentId = randi([1000, 9999]);
alternateStudentName = "Jordan Patel";
alternateStudentId = randi([100000, 999999]);

% Create readable welcome messages
welcomeMessage = "Welcome, " + studentName + "! Your student ID is " + string(studentId) + ".";
alternateWelcomeMessage = "Welcome, " + alternateStudentName + "! Your student ID is " + string(alternateStudentId) + ".";
```

Learner Template:
```Copy
% Given student information (do not change)
studentName = "Avery Nguyen";
studentId = randi([1000, 9999]);
alternateStudentName = "Jordan Patel";
alternateStudentId = randi([100000, 999999]);

% Create readable welcome messages
% YOUR CODE HERE
```

Tests:

Test #1
```Copy
Combine text, studentName, and numeric studentId into the required message
```

Test type: Variable equals reference solution

Test content:
```Copy
welcomeMessage
```

Optional Feedback on Incorrect Submission:
```Copy
Check the required punctuation and spaces in the primary message.
```

Test #2
```Copy
Transfer the same construction to different inputs and identifier range
```

Test type: Variable equals reference solution

Test content:
```Copy
alternateWelcomeMessage
```

***
# Problem 4

Title:
```Copy
Generate a Data-Collection Status Message
```

Description and Instructions:
```Copy
Create a MATLAB script that communicates the collection status for three data sets.

1. Leave all provided variables unchanged.
2. Create `tempStatusMessage` using `tempDataSetName` and `tempCount`.
3. Create `humidityStatusMessage` using `humidityDataSetName` and `humidityCount`.
4. Create `pressureStatusMessage` using `pressureDataSetName` and `pressureCount`.
5. Use conditional logic to select `measurement` when a data set has one measurement and `measurements` otherwise.
6. Each message must read as `Name: count measurement collected.` or `Name: count measurements collected.`, as appropriate for its supplied count.
```

Type: **Script**

Reference Solution:
```Copy
% Given data-collection information
tempDataSetName = "Temperature";
humidityDataSetName = "Humidity";
pressureDataSetName = "Pressure";
countValues = [1, randi([2, 9]), randi([100, 999])];
countOrder = randperm(3);
tempCount = countValues(countOrder(1));
humidityCount = countValues(countOrder(2));
pressureCount = countValues(countOrder(3));

% Select the appropriate wording for each data set
if tempCount == 1
    tempMeasurementWord = "measurement";
else
    tempMeasurementWord = "measurements";
end

if humidityCount == 1
    humidityMeasurementWord = "measurement";
else
    humidityMeasurementWord = "measurements";
end

if pressureCount == 1
    pressureMeasurementWord = "measurement";
else
    pressureMeasurementWord = "measurements";
end

% Create the status messages
tempStatusMessage = tempDataSetName + ": " + string(tempCount) + " " + tempMeasurementWord + " collected.";
humidityStatusMessage = humidityDataSetName + ": " + string(humidityCount) + " " + humidityMeasurementWord + " collected.";
pressureStatusMessage = pressureDataSetName + ": " + string(pressureCount) + " " + pressureMeasurementWord + " collected.";
```

Learner Template:
```Copy
% Given data-collection information (do not change)
tempDataSetName = "Temperature";
humidityDataSetName = "Humidity";
pressureDataSetName = "Pressure";
countValues = [1, randi([2, 9]), randi([100, 999])];
countOrder = randperm(3);
tempCount = countValues(countOrder(1));
humidityCount = countValues(countOrder(2));
pressureCount = countValues(countOrder(3));

% Select the appropriate wording and create the three status messages
% YOUR CODE HERE
```

Tests:

Test #1
```Copy
Build the temperature status message for its randomized count
```

Test type: Variable equals reference solution

Test content:
```Copy
tempStatusMessage
```

Test #2
```Copy
Build the humidity status message for its randomized count
```

Test type: Variable equals reference solution

Test content:
```Copy
humidityStatusMessage
```

Test #3
```Copy
Build the pressure status message for its randomized count
```

Test type: Variable equals reference solution

Test content:
```Copy
pressureStatusMessage
```

***
# Problem 5

Title:
```Copy
Concatenate Strings with Whitespace
```

Description and Instructions:
```Copy
Create a MATLAB script that joins supplied text values with one space between them.

1. Leave the provided string values unchanged.
2. Create `combinedText` from `firstText` and `secondText`.
3. Create `alternateCombinedText` from `alternateFirstText` and `alternateSecondText`.
4. Each result must contain exactly one space between its two supplied text values.
```

Type: **Script**

Reference Solution:
```Copy
% Given string values
firstText = "Turkeys are cute!";
secondText = "Do you like turkeys?";
alternateFirstText = "MATLAB";
alternateSecondText = "Grader";

% Join each pair with one space
combinedText = firstText + " " + secondText;
alternateCombinedText = alternateFirstText + " " + alternateSecondText;
```

Learner Template:
```Copy
% Given string values (do not change)
firstText = "Turkeys are cute!";
secondText = "Do you like turkeys?";
alternateFirstText = "MATLAB";
alternateSecondText = "Grader";

% Join each pair with one space
% YOUR CODE HERE
```

Tests:

Test #1
```Copy
Join the primary text pair with one space
```

Test type: Variable equals reference solution

Test content:
```Copy
combinedText
```

Optional Feedback on Incorrect Submission:
```Copy
Check the separator between the two supplied text values.
```

Test #2
```Copy
Apply the same whitespace rule to a second text pair
```

Test type: Variable equals reference solution

Test content:
```Copy
alternateCombinedText
```

***
# Problem 6

Title:
```Copy
Build a Multiline Joke
```

Description and Instructions:
```Copy
Create a MATLAB script that recreates a five-line joke from supplied string fragments.

1. Leave the provided string fragments unchanged.
2. Create the string scalar `joke` using the fragments, `" "`, and `newline`.
3. The value of `joke` must contain these five lines in order:
   `Knock Knock!`
   `Who's there?`
   `Who!`
   `Who Who?`
   `I didn't know you were an owl!`
```

Type: **Script**

Reference Solution:
```Copy
% Given string fragments
str1 = "Knock";
str2 = "Who";
str3 = "'s there";
str4 = "I didn't know you were an owl";
str5 = "!";
str6 = "?";

% Create the five-line joke
joke = str1 + " " + str1 + str5 + newline + str2 + str3 + str6 + newline + ...
    str2 + str5 + newline + str2 + " " + str2 + str6 + newline + str4 + str5;
```

Learner Template:
```Copy
% Given string fragments (do not change)
str1 = "Knock";
str2 = "Who";
str3 = "'s there";
str4 = "I didn't know you were an owl";
str5 = "!";
str6 = "?";

% Create the five-line joke
% YOUR CODE HERE
```

Tests:

Test #1
```Copy
Recreate the complete five-line text using the supplied fragments
```

Test type: Variable equals reference solution

Test content:
```Copy
joke
```

Optional Feedback on Incorrect Submission:
```Copy
Check the required line order and punctuation in the completed string.
```

Test #2
```Copy
Use newline to create the required line breaks
```

Test type: Function or Keyword is present

Test content:
```Copy
newline
```

Optional Feedback on Incorrect Submission:
```Copy
The required line-break construct is not present.
```

***
# Problem 7

Title:
```Copy
Generate and Identify Special Values
```

Description and Instructions:
```Copy
Create a MATLAB script that generates special numeric values and identifies them.

1. Create `overflowResult` by multiplying `realmax` by `2`.
2. Create `indeterminateResult` by dividing `0` by `0`.
3. Create the logical scalar `isOverflow` using `isinf` on `overflowResult`.
4. Create the logical scalar `isIndeterminate` using `isnan` on `indeterminateResult`.
```

Type: **Script**

Reference Solution:
```Copy
% Generate special numeric values
overflowResult = realmax * 2;
indeterminateResult = 0 / 0;

% Identify the special values
isOverflow = isinf(overflowResult);
isIndeterminate = isnan(indeterminateResult);
```

Learner Template:
```Copy
% Generate special numeric values
% YOUR CODE HERE
```

Tests:

Test #1
```Copy
Generate an overflow value
```

Test type: Variable equals reference solution

Test content:
```Copy
overflowResult
```

Optional Feedback on Incorrect Submission:
```Copy
Check how MATLAB represents a value beyond the largest finite double.
```

Test #2
```Copy
Generate an indeterminate value
```

Test type: Variable equals reference solution

Test content:
```Copy
indeterminateResult
```

Optional Feedback on Incorrect Submission:
```Copy
Check how MATLAB represents the indeterminate expression.
```

Test #3
```Copy
Report the overflow classification
```

Test type: Variable equals reference solution

Test content:
```Copy
isOverflow
```

Optional Feedback on Incorrect Submission:
```Copy
Check the classification of the overflow result.
```

Test #4
```Copy
Report the indeterminate-value classification
```

Test type: Variable equals reference solution

Test content:
```Copy
isIndeterminate
```

Optional Feedback on Incorrect Submission:
```Copy
Check the classification of the indeterminate result.
```

Test #5
```Copy
Identify the overflow value with isinf
```

Test type: Function or Keyword is present

Test content:
```Copy
isinf
```

Test #6
```Copy
Identify the indeterminate value with isnan
```

Test type: Function or Keyword is present

Test content:
```Copy
isnan
```

***
# Problem 8 

Title:
```Copy
Classify Special-Value Arithmetic
```

Description and Instructions:
```Copy
Create a MATLAB script that evaluates special-value arithmetic and classifies each result.

1. Create `overflowResult` by multiplying `realmax` by `2`.
2. Create `infinityDifference` by subtracting `Inf` from `Inf`.
3. Create `zeroTimesInfinity` by multiplying `0` by `Inf`.
4. Create `overflowIsInfinite` using `isinf` on `overflowResult`.
5. Create `differenceIsNaN` using `isnan` on `infinityDifference`.
6. Create `productIsNaN` using `isnan` on `zeroTimesInfinity`.
```

Type: **Script**

Reference Solution:
```Copy
% Evaluate special-value arithmetic
overflowResult = realmax * 2;
infinityDifference = Inf - Inf;
zeroTimesInfinity = 0 * Inf;

% Classify each result
overflowIsInfinite = isinf(overflowResult);
differenceIsNaN = isnan(infinityDifference);
productIsNaN = isnan(zeroTimesInfinity);
```

Learner Template:
```Copy
% Evaluate special-value arithmetic
% YOUR CODE HERE
```

Tests:

Test #1
```Copy
Compute overflow from the largest finite double
```

Test type: Variable equals reference solution

Test content:
```Copy
overflowResult
```

Test #2
```Copy
Compute infinity subtraction
```

Test type: Variable equals reference solution

Test content:
```Copy
infinityDifference
```

Optional Feedback on Incorrect Submission:
```Copy
Check the special-value result of infinity subtraction.
```

Test #3
```Copy
Compute zero-times-infinity
```

Test type: Variable equals reference solution

Test content:
```Copy
zeroTimesInfinity
```

Optional Feedback on Incorrect Submission:
```Copy
Check the special-value result of zero-times-infinity.
```

Test #4
```Copy
Report the overflow classification
```

Test type: Variable equals reference solution

Test content:
```Copy
overflowIsInfinite
```

Optional Feedback on Incorrect Submission:
```Copy
Check the classification assigned to the overflow result.
```

Test #5
```Copy
Report the infinity-subtraction classification
```

Test type: Variable equals reference solution

Test content:
```Copy
differenceIsNaN
```

Test #6
```Copy
Report the zero-times-infinity classification
```

Test type: Variable equals reference solution

Test content:
```Copy
productIsNaN
```

Test #7
```Copy
Classify results with isinf
```

Test type: Function or Keyword is present

Test content:
```Copy
isinf
```

Test #8
```Copy
Classify results with isnan
```

Test type: Function or Keyword is present

Test content:
```Copy
isnan
```
