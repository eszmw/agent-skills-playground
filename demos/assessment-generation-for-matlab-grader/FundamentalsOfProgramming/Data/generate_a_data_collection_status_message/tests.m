%% Test 1: Create the primary status message
expectedMessage = dataSetName + ": " + string(measurementCount) + " measurements collected.";
assessVariableEqual('statusMessage', expectedMessage);

%% Test 2: Use singular wording for one measurement
expectedMessage = singleDataSetName + ": " + string(singleMeasurementCount) + " measurement collected.";
assessVariableEqual('singleStatusMessage', expectedMessage);

%% Test 3: Create the large-count status message
expectedMessage = largeDataSetName + ": " + string(largeMeasurementCount) + " measurements collected.";
assessVariableEqual('largeStatusMessage', expectedMessage);

%% Test 4: Store the primary status message as a string
assessVariableEqual('class(statusMessage)', 'string');
