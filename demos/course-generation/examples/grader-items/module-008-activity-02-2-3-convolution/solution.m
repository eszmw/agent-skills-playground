% Instructor solution for 2-3 Convolution
% Generated for MATLAB Course Designer companion content.
sectionNumber = "2-3";
sectionTitle = "Convolution";

t = linspace(0,8,401);
h = exp(-0.8*t).*sin(2.5*t);
x = double(t >= 1 & t <= 3);
dt = t(2)-t(1);
y = conv(x,h,'same')*dt;
activityResult = struct();
activityResult.topic = sectionTitle;
activityResult.domain = "systems";
activityResult.time = t;
activityResult.signal = x;
activityResult.output = y;
activityResult.metricNames = ["impulseResponseEnergy","peakOutput","finalOutput"];
activityResult.metrics = [trapz(t,abs(h).^2), max(abs(y)), y(end)];
