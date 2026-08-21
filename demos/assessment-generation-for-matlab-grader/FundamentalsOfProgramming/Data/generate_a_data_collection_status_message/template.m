% Given data-collection information (do not change)
tempDataSetName = "Temperature";
humidityDataSetName = "Humidity";
pressureDataSetName = "Pressure";
countValues = [1, randi([2, 9]), randi([100, 999])];
countOrder = randperm(3);
tempCount = countValues(countOrder(1));
humidityCount = countValues(countOrder(2));
pressureCount = countValues(countOrder(3));

% Select the appropriate wording and create the three status messages
% YOUR CODE HERE
