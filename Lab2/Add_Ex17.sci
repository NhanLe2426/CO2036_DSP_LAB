// Define sampling parameters
Fs = 8000;            // Sampling frequency: 8 kHz
Ts = 1 / Fs;          // Sampling period
t = 0:0.00001:0.002;  // High-resolution time vector for continuous analog signals
n = 0:(0.002/Ts);     // Discrete sample indices
tn = n * Ts;          // Time vector for discrete sample points

// --- Part (b): F1 = 5 kHz aliasing to 3 kHz ---
F1 = 5000;
F1_alias = 3000;

// Generate continuous and discrete signals
x1_analog = cos(2 * %pi * F1 * t);
x1_alias_analog = cos(2 * %pi * F1_alias * t);
x1_discrete = cos(2 * %pi * F1 * tn);

scf(1);
subplot(2, 1, 1);
plot(t, x1_analog, 'k-');        // Original 5 kHz signal (Solid black)
plot(t, x1_alias_analog, 'b--'); // Aliased 3 kHz signal (Dashed blue)
plot(tn, x1_discrete, 'ro');     // Sample points (Red circles)
title("Aliasing: 5 kHz signal sampled at 8 kHz appears as 3 kHz");
xlabel("Time (s)");
ylabel("Amplitude");
legend(["Analog 5 kHz", "Aliased 3 kHz", "Discrete Samples at 8 kHz"]);

// --- Part (c): F2 = 9 kHz aliasing to 1 kHz ---
F2 = 9000;
F2_alias = 1000;

// Generate continuous and discrete signals
x2_analog = cos(2 * %pi * F2 * t);
x2_alias_analog = cos(2 * %pi * F2_alias * t);
x2_discrete = cos(2 * %pi * F2 * tn);

subplot(2, 1, 2);
plot(t, x2_analog, 'k-');        // Original 9 kHz signal (Solid black)
plot(t, x2_alias_analog, 'b--'); // Aliased 1 kHz signal (Dashed blue)
plot(tn, x2_discrete, 'ro');     // Sample points (Red circles)
title("Aliasing: 9 kHz signal sampled at 8 kHz appears as 1 kHz");
xlabel("Time (s)");
ylabel("Amplitude");
legend(["Analog 9 kHz", "Aliased 1 kHz", "Discrete Samples at 8 kHz"]);
