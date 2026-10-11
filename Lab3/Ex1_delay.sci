function [yn, yorigin] = delay(xn, xorigin, k)
    yn      = xn;           // sample values unchanged
    yorigin = xorigin - k;  // origin index shifts left by k
    
    L = length(xn);
    nx = (1:L) - xorigin;   // time axis of x(n)
    ny = (1:L) - yorigin;   // time axis of y(n)
    
    scf(); clf();
    
    // Plot x(n) - original signal
    subplot(2,1,1);
    plot2d3(nx, xn, style=2); gce().children.thickness = 2;
    plot2d(nx, xn, style=-5); gce().children.mark_foreground = 2;
    xgrid(); xlabel('n'); ylabel('x(n)'); title('Signal x(n)');
    
    // Plot y(n) - delayed signal
    subplot(2,1,2);
    plot2d3(ny, yn, style=5); gce().children.thickness = 2;
    plot2d(ny, yn, style=-5); gce().children.mark_foreground = 5;
    xgrid(); xlabel('n'); ylabel('y(n)');
    title('Signal y(n) = x(n - ' + string(k) + ')');
endfunction

// ------------------------------------------------------------
// Example: x(n) = {1, -2^, 3, 6, 4}, xorigin = 2, k = 1
// x(n) spans n = -1, 0, 1, 2, 3
// y(n) spans n =  0, 1, 2, 3, 4  (shifted right by 1)
// Result: yn = [1, -2, 3, 6, 4],  yorigin = 1
// ------------------------------------------------------------
[yn, yorigin] = delay([1,-2,3,6,4], 2, 1);
disp('yn ='); disp(yn);
disp('yorigin ='); disp(yorigin);
