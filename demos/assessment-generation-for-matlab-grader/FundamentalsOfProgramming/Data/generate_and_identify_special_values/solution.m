% Generate special numeric values
overflowResult = realmax * 2;
indeterminateResult = 0 / 0;

% Identify the special values
isOverflow = isinf(overflowResult);
isIndeterminate = isnan(indeterminateResult);
