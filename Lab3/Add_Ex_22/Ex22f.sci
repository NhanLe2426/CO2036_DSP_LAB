// --------------------------------------------------
// Define signal x(n) from Figure P2.2
// --------------------------------------------------
xn      = [0, 0, 1, 1, 1, 1, 0.5, 0.5, 0, 0];
xorigin = 4;                    // n=0 is at index 4

// ============================================================
// (f): x(n^2) — nonlinear time scaling
// Evaluate x(n) at positions n^2 for each n in range
// Valid only when n^2 falls within support of x(n): [-1, 4]
// => n in {-2, -1, 0, 1, 2}
// ============================================================
n_f    = -5:5;
yn_f   = zeros(1, length(n_f));
n_axis = (1:length(xn)) - xorigin;    // original time axis of x(n)

for i = 1:length(n_f)
    m   = n_f(i)^2;              // compute n^2
    idx = find(n_axis == m);     // find position of n^2 in x(n)
    if length(idx) > 0 then      // use length() instead of ~isempty
        yn_f(i) = xn(idx);       // assign x(n^2)
    else
        yn_f(i) = 0;             // zero if n^2 outside support
    end
end

// Build time axes for plotting
nx = (1:length(xn)) - xorigin;   // time axis of x(n)

// Plot both signals in one figure
scf(); clf();
subplot(2,1,1);
plot2d3(nx, xn, style=2); gce().children.thickness = 2;
plot2d(nx, xn, style=-5); gce().children.mark_foreground = 2;
xgrid(); xlabel('n'); ylabel('x(n)'); title('Signal x(n)');

subplot(2,1,2);
plot2d3(n_f, yn_f, style=5); gce().children.thickness = 2;
plot2d(n_f, yn_f, style=-5); gce().children.mark_foreground = 5;
xgrid(); xlabel('n'); ylabel('x(n^2)'); 
title('x(n^2) - Non-linear time scaling');

disp('n_f  ='); disp(n_f);
disp('yn_f ='); disp(yn_f);
