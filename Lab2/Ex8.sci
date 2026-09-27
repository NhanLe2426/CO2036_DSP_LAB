// Define the original time vector and signal x(n)
n = -2:1;
x = [1, -2, 3, 6];

// --- Pair 1: y_1(n) = x(-n) ---
// Reverse the time index for y1
n1 = -n($:-1:1); 
y1 = x($:-1:1);

scf(1); clf();// Create window 1
subplot(2, 1, 1);
plot2d3(n, x);
plot(n, x, 'ro', 'MarkerFaceColor', 'r');
title("Original Signal x(n)"); xlabel("n"); ylabel("Amplitude");

subplot(2, 1, 2);
plot2d3(n1, y1);
plot(n1, y1, 'bo', 'MarkerFaceColor', 'b');
title("y_1(n) = x(-n)"); xlabel("n"); ylabel("Amplitude");

// --- Pair 2: y_2(n) = x(n+3) ---
// Advance the time index by 3
n2 = n - 3;
y2 = x;

scf(2); clf(); // Create window 2
subplot(2, 1, 1);
plot2d3(n, x);
plot(n, x, 'ro', 'MarkerFaceColor', 'r');
title("Original Signal x(n)"); xlabel("n"); ylabel("Amplitude");

subplot(2, 1, 2);
plot2d3(n2, y2);
plot(n2, y2, 'go', 'MarkerFaceColor', 'g');
title("y_2(n) = x(n+3)"); xlabel("n"); ylabel("Amplitude");

// --- Pair 3: y_3(n) = 2x(-n-2) ---
// Calculate new time index and amplitude
n3 = -n($:-1:1) - 2;
y3 = 2 * x($:-1:1);

scf(3); clf(); // Create window 3
subplot(2, 1, 1);
plot2d3(n, x);
plot(n, x, 'ro', 'MarkerFaceColor', 'r');
title("Original Signal x(n)"); xlabel("n"); ylabel("Amplitude");

subplot(2, 1, 2);
plot2d3(n3, y3);
plot(n3, y3, 'mo', 'MarkerFaceColor', 'm');
title("y_3(n) = 2x(-n-2)"); xlabel("n"); ylabel("Amplitude");
