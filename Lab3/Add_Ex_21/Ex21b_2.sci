// ============================================================
// Problem 2.1 (b2): Delay x(n) by 4 then Fold
// Step 1: v(n) = x(n-4)
// Step 2: y(n) = v(-n) = x(-n-4)
// ============================================================

// Step 1: Delay by 4
xorigin   = 6;
vn2       = xn;
vorigin2  = xorigin - 4;           // delay: origin index shifts left by 4

// Step 2: Fold
yn_b2      = vn2($:-1:1);          // reverse sample vector
yorigin_b2 = length(vn2) - vorigin2 + 1;

nv2   = (1:length(vn2))   - vorigin2;
ny_b2 = (1:length(yn_b2)) - yorigin_b2;

// Plot
scf(); clf();
subplot(3,1,1);
plot2d3(n, xn, style=2); gce().children.thickness = 2;
plot2d(n, xn, style=-5); gce().children.mark_foreground = 2;
xgrid(); xlabel('n'); ylabel('x(n)'); title('Signal x(n)');

subplot(3,1,2);
plot2d3(nv2, vn2, style=3); gce().children.thickness = 2;
plot2d(nv2, vn2, style=-5); gce().children.mark_foreground = 3;
xgrid(); xlabel('n'); ylabel('v(n)'); 
title('v(n) = x(n-4) - After Delay by 4');

subplot(3,1,3);
plot2d3(ny_b2, yn_b2, style=5); gce().children.thickness = 2;
plot2d(ny_b2, yn_b2, style=-5); gce().children.mark_foreground = 5;
xgrid(); xlabel('n'); ylabel('y(n)'); 
title('y(n) = x(-n-4) - Delay then Fold');
