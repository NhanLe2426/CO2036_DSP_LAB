// --------------------------------------------------
// Define signal x(n) from Figure P2.2
// --------------------------------------------------
xn      = [0, 0, 1, 1, 1, 1, 0.5, 0.5, 0, 0];
xorigin = 4;                    // n=0 is at index 4

// --------------------------------------------------
// FUNCTION: fold
// --------------------------------------------------
function [yn, yorigin] = fold(xn, xorigin)
    Nx      = length(xn);
    yn      = xn($:-1:1);           // reverse the sample vector
    yorigin = Nx - xorigin + 1;     // mirror the origin position
endfunction

// --------------------------------------------------
// FUNCTION:  add
// --------------------------------------------------
function [yn, yorigin] = add(x1n, x1origin, x2n, x2origin)
    n1 = (1:length(x1n)) - x1origin;
    n2 = (1:length(x2n)) - x2origin;
    nmin = min(min(n1), min(n2));
    nmax = max(max(n1), max(n2));
    ny   = nmin:nmax;
    yorigin = 1 - nmin;
    y1 = zeros(1, length(ny));
    y2 = zeros(1, length(ny));
    y1(n1 - nmin + 1) = x1n;
    y2(n2 - nmin + 1) = x2n;
    yn = y1 + y2;
endfunction

// ============================================================
// Even part xe(n) = [x(n) + x(-n)] / 2
// ============================================================

// Step 1: Fold x(n) -> xfold(n) = x(-n)
[xfold, xfold_origin] = fold(xn, xorigin);

// Step 2: Add x(n) + x(-n) on union time axis
[xsum, xsum_origin] = add(xn, xorigin, xfold, xfold_origin);

// Step 3: Divide by 2 -> even part
xe        = xsum / 2;
xe_origin = xsum_origin;

// Build time axes for plotting
nx = (1:length(xn))    - xorigin;
nf = (1:length(xfold)) - xfold_origin;
ne = (1:length(xe))    - xe_origin;

// Plot all signals in one figure
scf(); clf();
subplot(3,1,1);
plot2d3(nx, xn, style=2); gce().children.thickness = 2;
plot2d(nx, xn, style=-5); gce().children.mark_foreground = 2;
xgrid(); xlabel('n'); ylabel('x(n)'); title('Signal x(n)');

subplot(3,1,2);
plot2d3(nf, xfold, style=3); gce().children.thickness = 2;
plot2d(nf, xfold, style=-5); gce().children.mark_foreground = 3;
xgrid(); xlabel('n'); ylabel('x(-n)'); title('x(-n) - After Folding');

subplot(3,1,3);
plot2d3(ne, xe, style=5); gce().children.thickness = 2;
plot2d(ne, xe, style=-5); gce().children.mark_foreground = 5;
xgrid(); xlabel('n'); ylabel('xe(n)'); 
title('xe(n) = [x(n) + x(-n)] / 2');

disp('xe =');        disp(xe);
disp('xe_origin ='); disp(xe_origin);
