function [yn, yorigin] = multi(x1n, x1origin, x2n, x2origin)
    n1 = (1:length(x1n)) - x1origin;   // time axis of x1(n)
    n2 = (1:length(x2n)) - x2origin;   // time axis of x2(n)

    n_min = min(min(n1), min(n2));     // union time axis start
    n_max = max(max(n1), max(n2));     // union time axis end
    ny = n_min:n_max;
    yorigin = 1 - n_min;

    y1 = zeros(1, length(ny));
    y2 = zeros(1, length(ny));
    y1(n1 - n_min + 1) = x1n;          // zero-pad x1(n)
    y2(n2 - n_min + 1) = x2n;          // zero-pad x2(n)
    yn = y1 .* y2;                     // element-wise multiplication

    scf(); clf();
    
    // Plot x1(n)
    subplot(3,1,1);
    plot2d3(n1, x1n, style=2); gce().children.thickness = 2;
    plot2d(n1, x1n, style=-5); gce().children.mark_foreground = 2;
    xgrid(); xlabel('n'); ylabel('x1(n)'); title('Signal x1(n)');
    
    // Plot x2(n)
    subplot(3,1,2);
    plot2d3(n2, x2n, style=3); gce().children.thickness = 2;
    plot2d(n2, x2n, style=-5); gce().children.mark_foreground = 3;
    xgrid(); xlabel('n'); ylabel('x2(n)'); title('Signal x2(n)');
    
    // Plot y(n) = x1(n) . x2(n)
    subplot(3,1,3);
    plot2d3(ny, yn, style=5); gce().children.thickness = 2;
    plot2d(ny, yn, style=-5); gce().children.mark_foreground = 5;
    xgrid(); xlabel('n'); ylabel('y(n)'); title('y(n) = x1(n) . x2(n)');
endfunction

// ------------------------------------------------------------
// Example: x1(n) = {0, 1, 3^, -1}, x1origin = 3
//          x2(n) = {-1, 1^, -2, 3}, x2origin = 2
// x1(n) spans n = -2,-1, 0, 1
// x2(n) spans n = -1, 0, 1, 2
// Result : yn = [0, -1, 3, 2, 0],  yorigin = 3
// ------------------------------------------------------------
[yn, yorigin] = multi([0,1,3,-1], 3, [-1,1,-2,3], 2);
disp('yn ='); disp(yn);
disp('yorigin ='); disp(yorigin);
