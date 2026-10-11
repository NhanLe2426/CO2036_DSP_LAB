// --------------------------------------------------
// Define signal x(n) from Figure P2.2
// --------------------------------------------------
xn      = [0, 0, 1, 1, 1, 1, 0.5, 0.5, 0, 0];
xorigin = 4;                    // n=0 is at index 4

// --------------------------------------------------
// FUNCTION: advance
// --------------------------------------------------
function [yn, yorigin] = advance(xn, xorigin, k)
    yn      = xn;                 // sample values unchanged
    yorigin = xorigin + k;        // origin index shifts right by k
    L  = length(xn);
    nx = (1:L) - xorigin;         // time axis of x(n)
    ny = (1:L) - yorigin;         // time axis of y(n)
    scf(); clf();

    // Plot x(n) - original signal
    subplot(2,1,1);
    plot2d3(nx, xn, style=2); gce().children.thickness = 2;
    plot2d(nx, xn, style=-5); gce().children.mark_foreground = 2;
    xgrid(); xlabel('n'); ylabel('x(n)'); title('Signal x(n)');
    
    // Plot y(n) - advanced signal
    subplot(2,1,2);
    plot2d3(ny, yn, style=5); gce().children.thickness = 2;
    plot2d(ny, yn, style=-5); gce().children.mark_foreground = 5;
    xgrid(); xlabel('n'); ylabel('y(n)');
    title('x(n + 2) - Advance 2');
endfunction

[yn, yorigin] = advance(xn, xorigin, 2);
disp('yn =');    disp(yn);
disp('yorigin ='); disp(yorigin);
