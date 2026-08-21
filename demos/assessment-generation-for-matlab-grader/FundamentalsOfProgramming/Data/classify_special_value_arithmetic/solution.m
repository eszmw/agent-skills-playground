% Evaluate special-value arithmetic
overflowResult = realmax * 2;
infinityDifference = Inf - Inf;
zeroTimesInfinity = 0 * Inf;

% Classify each result
overflowIsInfinite = isinf(overflowResult);
differenceIsNaN = isnan(infinityDifference);
productIsNaN = isnan(zeroTimesInfinity);
