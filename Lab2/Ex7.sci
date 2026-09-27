clf();

// Define the common time vector n from -1 to 3
n = -1:3;

// Pad x1(n) and x2(n) with zeros to match the length of n
x1 = [0, 0, 1, 3, -2]; 
x2 = [0, 1, 2, 3, 0];

// Calculate the multiplication of two signals using element-wise operator (.*)
y = x1 .* x2;

// Plot signal x1(n)
subplot(3, 1, 1);
plot2d3(n, x1);
plot(n, x1, 'ro');
title("Original Signal x1(n)");
xlabel("n");
ylabel("x1(n)");

// Plot signal x2(n)
subplot(3, 1, 2);
plot2d3(n, x2);
plot(n, x2, 'bo');
title("Original Signal x2(n)");
xlabel("n");
ylabel("x2(n)");

// Plot the resulting signal y(n)
subplot(3, 1, 3);
plot2d3(n, y);
plot(n, y, 'go');
title("Multiplied Signal y(n) = x1(n) . x2(n)");
xlabel("n");
ylabel("y(n)");
