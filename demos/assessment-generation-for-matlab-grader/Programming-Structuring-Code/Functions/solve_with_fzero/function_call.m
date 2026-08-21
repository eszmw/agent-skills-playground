% This block is used by students to run and test their function before submitting.
% A test scenario is provided by the instructor.
% Next: click on "+Add Assessment" below.
functionHandle = @(x) cos(x) - x*exp(-sin(x));
initialGuess = 0.5;
root = solveWithFzero(functionHandle, initialGuess);
