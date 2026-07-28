% MATLAB Exercise tests for 2-3 Convolution
assert(exist("activityResult","var") == 1, "Define activityResult.");
assert(isstruct(activityResult), "activityResult must be a struct.");
requiredFields = ["topic","domain","metricNames","metrics"];
for k = 1:numel(requiredFields)
    assert(isfield(activityResult, requiredFields(k)), "Missing required field: " + requiredFields(k));
end
assert(numel(activityResult.metrics) >= 3, "Provide at least three metrics.");
assert(all(isfinite(activityResult.metrics)), "Metrics must be finite numeric values.");
assert(strlength(string(activityResult.topic)) > 0, "Topic must be populated.");
