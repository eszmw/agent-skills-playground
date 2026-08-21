%% Assessment: The function adds a filled yellow midpoint marker.
midpoint = referenceVariables.midpoint;
markerLines = findall(gca, Type="line", Marker="o");
assert(~isempty(markerLines), "The function must add a circular marker.")

markerX = [markerLines.XData];
markerY = [markerLines.YData];
isAtMidpoint = any(markerX == midpoint(1) & markerY == midpoint(2));
isFilledYellow = any(arrayfun(@(lineHandle) ...
    isequal(lineHandle.MarkerFaceColor, "y") || ...
    isequal(lineHandle.MarkerFaceColor, [1 1 0]), markerLines));
assert(isAtMidpoint && isFilledYellow, ...
    "The marker must be a filled yellow circle at the returned midpoint.")
