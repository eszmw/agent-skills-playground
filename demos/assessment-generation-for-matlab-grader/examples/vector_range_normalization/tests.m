%% Test 1: xNorm is correct for a random positive vector
x = randperm(30, 6);
xNorm = vector_range_normalization(x);
assessVariableEqual('xNorm', (x - min(x)) / (max(x) - min(x)));

%% Test 2: minimum maps to 0 and maximum maps to 1 for signed values
x = randperm(19, 7) - 10;
xNorm = vector_range_normalization(x);
assessVariableEqual('[min(xNorm), max(xNorm)]', [0, 1]);

%% Test 3: hardcoding detection with a much larger value range
x = randperm(500, 8) + 100;
xNorm = vector_range_normalization(x);
assessVariableEqual('xNorm', (x - min(x)) / (max(x) - min(x)));

%% Test 4: row orientation is preserved for a longer vector
x = randperm(40, 12);
xNorm = vector_range_normalization(x);
assessVariableEqual('size(xNorm)', [1, 12]);
