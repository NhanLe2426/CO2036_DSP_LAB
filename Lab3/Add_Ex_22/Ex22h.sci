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
// Odd part xo(n) = [x(n) - x(-n)] / 2
// ============================================================

// Step 1: Fold x(n) -> xfold(n) = x(-n)
[xfold, xfold_origin] = fold(xn, xorigin);

// Step 2: x(n) - x(-n) = x(n) + (-x(-n))
[xdiff, xdiff_origin] = add(xn, xorigin, -xfold, xfold_origin);

// Step 3: Divide by 2 -> odd part
xo        = xdiff / 2;
xo_origin = xdiff_origin;

// Build time axes for plotting
nx = (1:length(xn))    - xorigin;
nf = (1:length(xfold)) - xfold_origin;
no = (1:length(xo))    - xo_origin;

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
plot2d3(no, xo, style=5); gce().children.thickness = 2;
plot2d(no, xo, style=-5); gce().children.mark_foreground = 5;
xgrid(); xlabel('n'); ylabel('xo(n)'); 
title('xo(n) = [x(n) - x(-n)] / 2');

disp('xo =');        disp(xo);
disp('xo_origin ='); disp(xo_origin);
