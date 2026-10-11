// ============================================================
// Problem 2.1 (b1): Fold x(n) then Delay by 4
// Step 1: v(n) = x(-n)
// Step 2: y(n) = v(n-4) = x(-n+4)
// ============================================================

// Step 1: Fold
xorigin = 6;                        // n=0 is at index 6 (n=-5..5)
vn      = xn($:-1:1);               // reverse sample vector
vorigin = length(xn) - xorigin + 1; // mirror origin

// Step 2: Delay by 4
yn_b1      = vn;
yorigin_b1 = vorigin - 4;          // delay: origin index shifts left by 4

nv = (1:length(vn)) - vorigin;
ny_b1 = (1:length(yn_b1)) - yorigin_b1;

// Plot
scf(); clf();
subplot(3,1,1);
plot2d3(n, xn, style=2); gce().children.thickness = 2;
plot2d(n, xn, style=-5); gce().children.mark_foreground = 2;
xgrid(); xlabel('n'); ylabel('x(n)'); title('Signal x(n)');

subplot(3,1,2);
plot2d3(nv, vn, style=3); gce().children.thickness = 2;
plot2d(nv, vn, style=-5); gce().children.mark_foreground = 3;
xgrid(); xlabel('n'); ylabel('v(n)'); 
title('v(n) = x(-n) - After Folding');

subplot(3,1,3);
plot2d3(ny_b1, yn_b1, style=5); gce().children.thickness = 2;
plot2d(ny_b1, yn_b1, style=-5); gce().children.mark_foreground = 5;
xgrid(); xlabel('n'); ylabel('y(n)'); 
title('y(n) = x(-n+4) - Fold then Delay by 4');
