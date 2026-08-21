integrand = @(x) sin(3*x).^2;
integralEstimate = integral(integrand, 0, pi, AbsTol=1e-9);
