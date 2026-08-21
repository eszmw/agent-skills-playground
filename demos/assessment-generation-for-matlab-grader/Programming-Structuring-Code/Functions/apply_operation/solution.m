function transformedValues = applyOperation(operation, values)
%applyOperation Apply a supplied function handle to numeric values.

    transformedValues = operation(values);
end
