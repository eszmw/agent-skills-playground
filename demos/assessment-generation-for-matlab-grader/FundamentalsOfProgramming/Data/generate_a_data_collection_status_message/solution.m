% Given data-collection information
dataSetName = "Temperature";
measurementCount = randi([2, 9]);
singleDataSetName = "Humidity";
singleMeasurementCount = randi([1, 1]);
largeDataSetName = "Pressure";
largeMeasurementCount = randi([100, 999]);

% Select the appropriate wording for each count
if measurementCount == 1
    measurementWord = "measurement";
else
    measurementWord = "measurements";
end

if singleMeasurementCount == 1
    singleMeasurementWord = "measurement";
else
    singleMeasurementWord = "measurements";
end

if largeMeasurementCount == 1
    largeMeasurementWord = "measurement";
else
    largeMeasurementWord = "measurements";
end

% Create the status messages
statusMessage = dataSetName + ": " + string(measurementCount) + " " + measurementWord + " collected.";
singleStatusMessage = singleDataSetName + ": " + string(singleMeasurementCount) + " " + singleMeasurementWord + " collected.";
largeStatusMessage = largeDataSetName + ": " + string(largeMeasurementCount) + " " + largeMeasurementWord + " collected.";
