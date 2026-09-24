clf();

F = 50;         // Signal Frequency (Hz)
Fs = 300;       // Sampling Frequency (Hz)
T = 1 / F;      // Signal Period (s)
Ts = 1 / Fs;    // Sampling Period (s)
time = 5 * T;   // Total Time: 5 periods
delta = 0.1;    // Quantization Step

// 1. Analog Signal x_a(t)
t = linspace(0, time, 1000);
xa = 3 * sin(2 * %pi * F * t);

subplot(3, 1, 1);
plot(t, xa, "b");
plot(t, zeros(t), "k--");       // Zero reference line: y = 0
title("Analog Signal x_a(t) = 3·sin(100πt)");
xlabel("Time t (s)");
ylabel("Amplitude");

// 2. Discrete-Time Signal x(n)
// Sampling: x(n) = xa(n·Ts) = 3·sin(πn/3)
// Periodicity: f = F/Fs = 1/6  →  N0 = 6 samples/cycle
n = 0:29;
xn = 3 * sin(2 * %pi * F * n * Ts);

subplot(3, 1, 2);
plot2d3(n, xn);                 // Stem plot
plot(n, xn, "ro");              // Red dots for clarity
plot(n, zeros(n), "k--");       // Zero reference line: y = 0
title("Discrete-Time Signal  x(n) = 3·sin(πn/3),  N0 = 6");
xlabel("Sample index n");
ylabel("Amplitude");

// 3. Quantized Signal x_q(n)
// Method: Truncation -> x_q(n) = Δ · floor(x(n) / Δ)
// Quantization error: -Δ < eq(n) ≤ 0
xq = floor(xn / delta) * delta;

subplot(3, 1, 3);
plot2d3(n, xq);                 // Stem plot
plot(n, xq, "bo");              // Blue dots for clarity
plot(n, zeros(n), "k--");       // Zero reference line: y = 0
title("Quantized Signal x_q(n), Truncation, Δ = 0.1");
xlabel("Sample index n");
ylabel("Amplitude");
