% Given values
firstAddend = 0.1;
secondAddend = 0.2;
expectedSum = 0.3;
tolerance = 1e-12;

% Compare exact and tolerance-based results
computedSum = firstAddend + secondAddend;
difference = computedSum - expectedSum;
exactMatch = isequal(computedSum, expectedSum);
isWithinTolerance = abs(difference) < tolerance;
