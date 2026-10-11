// --------------------------------------------------
// Define signal x(n) from Figure P2.2
// --------------------------------------------------
xn      = [0, 0, 1, 1, 1, 1, 0.5, 0.5, 0, 0];
xorigin = 4;                    // n=0 is at index 4

// --------------------------------------------------
// FUNCTION: multi
// --------------------------------------------------
function [yn, yorigin] = multi(x1n, x1origin, x2n, x2origin)
    n1 = (1:length(x1n)) - x1origin;
    n2 = (1:length(x2n)) - x2origin;
    nmin = min(min(n1), min(n2));
    nmax = max(max(n1), max(n2));
    ny   = nmin:nmax;
    yorigin = 1 - nmin;
    y1 = zeros(1, length(ny));
    y2 = zeros(1, length(ny));
    y1(n1 - nmin + 1) = x1n;       // zero-pad x1(n)
    y2(n2 - nmin + 1) = x2n;       // zero-pad x2(n)
    yn = y1 .* y2;                 // element-wise multiplication
endfunction

// ------------------------------------------------------------
// Build u(2-n): equals 1 for n <= 2, 0 for n > 2
// Define on same range as xn: n = -3..6
// ------------------------------------------------------------
n_axis = (1:length(xn)) - xorigin;  // time axis: -3..6
u2n    = double(n_axis <= 2);       // u(2-n) = 1 when n <= 2

// Multiply x(n) . u(2-n)
[yn_d, yorigin_d] = multi(xn, xorigin, u2n, xorigin);

// Build time axes for plotting
nx   = (1:length(xn))   - xorigin;
ny_d = (1:length(yn_d)) - yorigin_d;

// Plot all signals in one figure
scf(); clf();
subplot(3,1,1);
plot2d3(nx, xn, style=2); gce().children.thickness = 2;
plot2d(nx, xn, style=-5); gce().children.mark_foreground = 2;
xgrid(); xlabel('n'); ylabel('x(n)'); title('Signal x(n)');

subplot(3,1,2);
plot2d3(nx, u2n, style=3); gce().children.thickness = 2;
plot2d(nx, u2n, style=-5); gce().children.mark_foreground = 3;
xgrid(); xlabel('n'); ylabel('u(2-n)'); title('Unit Step u(2-n)');

subplot(3,1,3);
plot2d3(ny_d, yn_d, style=5); gce().children.thickness = 2;
plot2d(ny_d, yn_d, style=-5); gce().children.mark_foreground = 5;
xgrid(); xlabel('n'); ylabel('y(n)'); title('y(n) = x(n).u(2-n)');

disp('yn_d =');    disp(yn_d);
disp('yorigin ='); disp(yorigin_d);
