function [yn, yorigin] = fold(xn, xorigin)
    L       = length(xn);
    yn      = xn($:-1:1);          // reverse the sample vector
    yorigin = L - xorigin + 1;     // mirror the origin position

    nx = (1:L) - xorigin;          // time axis of x(n)
    ny = (1:L) - yorigin;          // time axis of y(n)

    scf(); clf();
    
    // Plot x(n) - original signal
    subplot(2,1,1);
    plot2d3(nx, xn, style=2); gce().children.thickness = 2;
    plot2d(nx, xn, style=-5); gce().children.mark_foreground = 2;
    xgrid(); xlabel('n'); ylabel('x(n)'); title('Signal x(n)');
    
    // Plot y(n) - folded signal
    subplot(2,1,2);
    plot2d3(ny, yn, style=5); gce().children.thickness = 2;
    plot2d(ny, yn, style=-5); gce().children.mark_foreground = 5;
    xgrid(); xlabel('n'); ylabel('y(n)'); title('Signal y(n) = x(-n)');
endfunction

// ------------------------------------------------------------
// Example: x(n) = {1, -2, 3^, 6, 4,-3}, xorigin = 3
// Result: yn = [-3, 4, 6, 3, -2, 1],  yorigin = 4
// ------------------------------------------------------------
[yn, yorigin] = fold([1,-2,3,6,4,-3], 3);
disp('yn ='); disp(yn);
disp('yorigin ='); disp(yorigin);
