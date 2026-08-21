% Given values
largeValue = 1e308;
tinyValue = 1e-321;
scaleFactor = 1000;
finalFactor = 1e16;

% Evaluate equivalent expressions in two operation orders
multiplyThenDivide = (largeValue * tinyValue / scaleFactor) * finalFactor;
divideThenMultiply = (tinyValue / scaleFactor * largeValue) * finalFactor;
resultDifference = multiplyThenDivide - divideThenMultiply;
