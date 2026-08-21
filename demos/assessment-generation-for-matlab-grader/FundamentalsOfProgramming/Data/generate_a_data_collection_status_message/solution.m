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
