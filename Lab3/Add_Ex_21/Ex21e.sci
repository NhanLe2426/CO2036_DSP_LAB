// ============================================================
// Problem 2.1 (e): Express x(n) using delta(n) and u(n)
// Verify by reconstructing x(n) from impulse components
// ============================================================

n_e = -5:5;

// Unit impulse delta(n - n0)
function y = delta(n, n0)
    y = zeros(1, length(n));
    y(find(n == n0)) = 1;          // 1 only at n = n0
endfunction

// Unit step u(n - n0)
function y = ustep(n, n0)
    y = zeros(1, length(n));
    y(find(n >= n0)) = 1;          // 1 for n >= n0
endfunction

// Reconstruct x(n) using impulses
xn_e = (1/3)*delta(n_e,-2) + (2/3)*delta(n_e,-1) ...
     + delta(n_e,0) + delta(n_e,1) ...
     + delta(n_e,2) + delta(n_e,3);

// Alternatively using unit steps
xn_e2 = (1 + n_e/3).*(ustep(n_e,-3) - ustep(n_e,0)) ...
       + (ustep(n_e,0) - ustep(n_e,4));

// Plot
scf(); clf();
subplot(2,1,1);
plot2d3(n_e, xn_e, style=2); gce().children.thickness = 2;
plot2d(n_e, xn_e, style=-5); gce().children.mark_foreground = 2;
xgrid(); xlabel('n'); ylabel('x(n)');
title('Express x(n) in terms of signal delta(n)');

subplot(2,1,2);
plot2d3(n_e, xn_e2, style=5); gce().children.thickness = 2;
plot2d(n_e, xn_e2, style=-5); gce().children.mark_foreground = 5;
xgrid(); xlabel('n'); ylabel('x(n)');
title('Express x(n) in terms of signal u(n)');

disp('Kiem tra xn_e = xn_e2:'); disp(xn_e - xn_e2);
