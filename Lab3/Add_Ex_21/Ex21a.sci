// ============================================================
// Problem 2.1 (a): Define and plot x(n)
// x(n) = 1 + n/3  for -3 <= n <= -1
//        1         for  0 <= n <= 3
//        0         otherwise
// ============================================================

// Define time axis
n = -5:5;
xn = zeros(1, length(n));

// Compute x(n) over each region
for i = 1:length(n)
    if n(i) >= -3 & n(i) <= -1 then
        xn(i) = 1 + n(i)/3;        // ramp region
    elseif n(i) >= 0 & n(i) <= 3 then
        xn(i) = 1;                 // flat region
    else
        xn(i) = 0;                 // zero elsewhere
    end
end

// Plot x(n)
scf(); clf();
plot2d3(n, xn, style=2); gce().children.thickness = 2;
plot2d(n, xn, style=-5); gce().children.mark_foreground = 2;
xgrid(); xlabel('n'); ylabel('x(n)'); title('Discrete Signal x(n)');

disp('x(n) ='); disp(xn);
disp('n     ='); disp(n);
