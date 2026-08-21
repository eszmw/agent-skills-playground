% Given values
firstValue = 0.1 + 0.2;
secondValue = 0.3;
tolerance = 1e-12;

% Compare the values using the supplied tolerance
absoluteDifference = abs(firstValue - secondValue);
areEquivalent = absoluteDifference < tolerance;
