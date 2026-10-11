// ============================================================
// Problem 2.1 (c): Plot x(-n+4) directly
// Substitute m = -n+4 => n = 4-m
// x(-n+4) defined on same index range as x(n)
// ============================================================

// Compute x(-n+4) directly on time axis n = -5..5
n_c  = -2:10;
xn_c = zeros(1, length(n_c));

for i = 1:length(n_c)
    m = -n_c(i) + 4;               // substitute m = -n+4
    if m >= -3 & m <= -1 then
        xn_c(i) = 1 + m/3;
    elseif m >= 0 & m <= 3 then
        xn_c(i) = 1;
    else
        xn_c(i) = 0;
    end
end

// Plot x(-n+4)
scf(); clf();
plot2d3(n_c, xn_c, style=5); gce().children.thickness = 2;
plot2d(n_c, xn_c, style=-5); gce().children.mark_foreground = 5;
xgrid(); xlabel('n'); ylabel('x(-n+4)'); title('x(-n+4)');

disp('x(-n+4) ='); disp(xn_c);
