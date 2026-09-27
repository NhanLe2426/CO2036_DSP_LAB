clf();

// Define the symmetric time vector 
n = -2:2;
// Define the discrete-time signal x(n)
x = [0, 1, 3, -2, 0];
// Perform signal folding to get x(-n) by reversing the array
x_fold = x($:-1:1);

// Calculate even and odd signal components
xe = 0.5 * (x + x_fold);
xo = 0.5 * (x - x_fold);

// Plot the original signal x(n)
subplot(3, 1, 1);
plot2d3(n, x, style=5);
plot(n, x, 'ro');
title("Original Signal x(n)");
xlabel("n");
ylabel("x(n)");

// Plot the even signal component xe(n)
subplot(3, 1, 2);
plot2d3(n, xe, style=3);
plot(n, xe, 'go');
title("Even Signal Component x_e(n)");
xlabel("n");
ylabel("x_e(n)");

// Plot the odd signal component xo(n)
subplot(3, 1, 3);
plot2d3(n, xo, style=2);
plot(n, xo, 'bo');
title("Odd Signal Component x_o(n)");
xlabel("n");
ylabel("x_o(n)");
