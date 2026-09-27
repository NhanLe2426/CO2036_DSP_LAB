// Define system parameters
R = 10000;
L = 1024;
b = log2(L);
Fs = R / b;
Ts = 1 / Fs;

// Define high-resolution time vector for continuous analog signals
t = 0:0.0001:0.02;

// Define discrete time vector and indices
n = 0:(0.02/Ts);
tn = n * Ts;

// Generate original analog signal xa(t)
xa = 3 * cos(600 * %pi * t) + 2 * cos(1800 * %pi * t);

// Generate sampled discrete signal x(n)
x_discrete = 3 * cos(600 * %pi * tn) + 2 * cos(1800 * %pi * tn);

// Perform quantization
Vmax = 5;
Vmin = -5;
delta = (Vmax - Vmin) / L;
x_quantized = delta * floor(x_discrete / delta) + (delta / 2);

// Plot original analog signal and sampled points
scf(1);
subplot(2, 1, 1);
plot(t, xa, 'k-');
plot2d3(tn, x_discrete);
plot(tn, x_discrete, 'ro');
title("Original Signal xa(t) and Sampled Points x(n) at Fs = 1000 Hz");
xlabel("Time (s)");
ylabel("Amplitude");

// Plot quantized signal to demonstrate resolution
subplot(2, 1, 2);
plot2d3(tn, x_quantized);
plot(tn, x_quantized, 'bo');
title("Quantized Signal xq(n) with L = 1024 levels");
xlabel("Time (s)");
ylabel("Amplitude");
