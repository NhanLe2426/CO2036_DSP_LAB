// --------------------------------------------------
// Define signal x(n) from Figure P2.2
// --------------------------------------------------
xn      = [0, 0, 1, 1, 1, 1, 0.5, 0.5, 0, 0];
xorigin = 4;                    // n=0 is at index 4

// --------------------------------------------------
// FUNCTION: delay
// --------------------------------------------------
function [yn, yorigin] = delay(xn, xorigin, k)
    yn      = xn;                   // sample values unchanged
    yorigin = xorigin - k;          // origin index shifts left by k
endfunction

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

// ============================================================

// Step 1: Delay x(n) by 1 -> v(n) = x(n-1)
[vn_e, vorigin_e] = delay(xn, xorigin, 1);

// Step 2: Build delta(n-3) on same axis as v(n)
nv_axis  = (1:length(vn_e)) - vorigin_e; // time axis of v(n)
delta_n3 = double(nv_axis == 3);    // delta(n-3) = 1 only at n=3

// Step 3: Multiply v(n) . delta(n-3)
[yn_e, yorigin_e] = multi(vn_e, vorigin_e, delta_n3, vorigin_e);

// Build time axes for plotting
nx    = (1:length(xn))   - xorigin;
nv_e  = (1:length(vn_e)) - vorigin_e;
ny_e  = (1:length(yn_e)) - yorigin_e;

// Plot all signals in one figure
scf(); clf();
subplot(3,1,1);
plot2d3(nx, xn, style=2); gce().children.thickness = 2;
plot2d(nx, xn, style=-5); gce().children.mark_foreground = 2;
xgrid(); xlabel('n'); ylabel('x(n)'); title('Signal x(n)');

subplot(3,1,2);
plot2d3(nv_e, vn_e, style=3); gce().children.thickness = 2;
plot2d(nv_e, vn_e, style=-5); gce().children.mark_foreground = 3;
xgrid(); xlabel('n'); ylabel('x(n-1)'); title('x(n-1) - Delay 1');

subplot(3,1,3);
plot2d3(ny_e, yn_e, style=5); gce().children.thickness = 2;
plot2d(ny_e, yn_e, style=-5); gce().children.mark_foreground = 5;
xgrid(); xlabel('n'); ylabel('y(n)'); title('y(n) = x(n-1).delta(n-3)');

disp('yn_e =');    disp(yn_e);
disp('yorigin ='); disp(yorigin_e);
