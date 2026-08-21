function midpoint = markMidpoint(endpoint1, endpoint2)
%markMidpoint Return and mark the midpoint between two planar points.

    midpoint = (endpoint1 + endpoint2) / 2;
    hold on
    plot(midpoint(1), midpoint(2), "yo", MarkerFaceColor="y")
    hold off
end
